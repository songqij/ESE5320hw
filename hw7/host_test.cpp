#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#include "Common/EventTimer.h"
#include <CL/cl2.hpp>
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include <vector>

#include "Pipeline_final.h"
#include "Common/Utilities.h"

#define NUM_MAT 4





int main(int argc, char *argv[])
{
    EventTimer timer1, timer2;
    timer1.add("Main program");


    // ------------------------------------------------------------------------------------
    // Step 1: Initialize the OpenCL environment
     // ------------------------------------------------------------------------------------
    timer2.add("OpenCL Initialization");
    cl_int err;
    std::string binaryFile = argv[1];
    unsigned fileBufSize;
    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char *fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::CommandQueue q1(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::CommandQueue q2(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::CommandQueue q3(context, device, CL_QUEUE_PROFILING_ENABLE, &err);

    cl::Kernel krnl_Filter(program, "Filter_HW", &err);
    // cl::Kernel krnl_Filter_1(program, "Filter_HW", &err);
    // cl::Kernel krnl_Filter_2(program, "Filter_HW", &err);
    // cl::Kernel krnl_Filter_3(program, "Filter_HW", &err);

    // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
    timer2.add("Allocate contiguous OpenCL buffers");


    size_t Input_bytes_per_iteration = (SCALED_FRAME_SIZE * sizeof(unsigned char));
    size_t Output_bytes_per_iteration = (OUTPUT_FRAME_SIZE * sizeof(unsigned char));

    cl::Buffer Filter_Input_buffer[NUM_MAT];
    cl::Buffer Filter_Output_buffer[NUM_MAT];

    for(int i = 0; i < NUM_MAT; i++)
    {
        Filter_Input_buffer[i] = cl::Buffer(context, CL_MEM_READ_ONLY, Input_bytes_per_iteration, NULL, &err);
        Filter_Output_buffer[i] = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_bytes_per_iteration, NULL, &err);

    }

    unsigned char * Filter_Input[NUM_MAT];
    unsigned char * Filter_Output[NUM_MAT];

    for(int i = 0; i < NUM_MAT; i++)
    {
        Filter_Input[i] = (unsigned char *)q.enqueueMapBuffer(Filter_Input_buffer[i], CL_TRUE, CL_MAP_WRITE, 0, Input_bytes_per_iteration);
        Filter_Output[i] = (unsigned char*)q.enqueueMapBuffer(Filter_Output_buffer[i], CL_TRUE, CL_MAP_READ, 0, Output_bytes_per_iteration);

    }

    unsigned char *Scale_Input = (unsigned char *)malloc(FRAMES * INPUT_FRAME_SIZE);
    unsigned char *Differentiate_Output = (unsigned char *)malloc(FRAMES * OUTPUT_FRAME_SIZE);
    unsigned char *Compress_Output = (unsigned char *)malloc(FRAMES * MAX_OUTPUT_SIZE);
    


    timer2.add("Populating buffer inputs");
    // init_arrays(a);
    Load_data(Scale_Input);


    int Result_size=0;
    // ------------------------------------------------------------------------------------
    // Step 3: Run the kernel
    // ------------------------------------------------------------------------------------

    timer2.add("Running kernel");

    cl::Event w[FRAMES], x[FRAMES], r[FRAMES];
    std::vector<cl::Event> w_wl[FRAMES], x_wl[FRAMES], r_wl[FRAMES];
    
    
    for (int i = 0; i < FRAMES; i+=4) {

        Scale_SW(Scale_Input + i * INPUT_FRAME_SIZE,Filter_Input[i%NUM_MAT]);
        Scale_SW(Scale_Input + (i+1) * INPUT_FRAME_SIZE,Filter_Input[(i+1)%NUM_MAT]);
        Scale_SW(Scale_Input + (i+2) * INPUT_FRAME_SIZE,Filter_Input[(i+2)%NUM_MAT]);
        Scale_SW(Scale_Input + (i+3) * INPUT_FRAME_SIZE,Filter_Input[(i+3)%NUM_MAT]);



        krnl_Filter.setArg(0, Filter_Input_buffer[i%NUM_MAT]);
        krnl_Filter.setArg(1, Filter_Output_buffer[i%NUM_MAT]);


        if (i == 0) {
            q.enqueueMigrateMemObjects({Filter_Input_buffer[i%NUM_MAT]}, 0, NULL, &w[i]);
        } else {
            q.enqueueMigrateMemObjects({Filter_Input_buffer[i%NUM_MAT]}, 0, &w_wl[i], &w[i]);
        } 

        x_wl[i].push_back(w[i]);
        if (i + 1 < FRAMES) {
            w_wl[i+1].push_back(w[i]);
        }

        q.enqueueTask(krnl_Filter, &x_wl[i], &x[i]);
        r_wl[i].push_back(x[i]);

        krnl_Filter.setArg(0, Filter_Input_buffer[(i+1)%NUM_MAT]);
        krnl_Filter.setArg(1, Filter_Output_buffer[(i+1)%NUM_MAT]);

         
        q1.enqueueMigrateMemObjects({Filter_Input_buffer[(i+1)%NUM_MAT]}, 0, &w_wl[i+1], &w[i+1]);
        x_wl[i+1].push_back(w[i+1]);
        if (i + 2 < FRAMES) {
            w_wl[i+2].push_back(w[i+1]);
        }

        q.enqueueMigrateMemObjects({Filter_Output_buffer[i%NUM_MAT]}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl[i], &r[i]);
        if (i + 4 < FRAMES) {
            w_wl[i+4].push_back(r[i]);
        }
        if (i + 1 < FRAMES) {
            r_wl[i+1].push_back(r[i]);
        }
        // r[i].wait();

        q1.enqueueTask(krnl_Filter, &x_wl[i+1], &x[i+1]);
        r_wl[i+1].push_back(x[i+1]);

        krnl_Filter.setArg(0, Filter_Input_buffer[(i+2)%NUM_MAT]);
        krnl_Filter.setArg(1, Filter_Output_buffer[(i+2)%NUM_MAT]);

        q2.enqueueMigrateMemObjects({Filter_Input_buffer[(i+2)%NUM_MAT]}, 0, &w_wl[i+2], &w[i+2]);

        x_wl[i+2].push_back(w[i+2]);
        if (i + 3 < FRAMES) {
            w_wl[i+3].push_back(w[i+2]);
        }

        q1.enqueueMigrateMemObjects({Filter_Output_buffer[(i+1)%NUM_MAT]}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl[i+1], &r[i+1]);
        if (i + 5 < FRAMES) {
            w_wl[i+5].push_back(r[i+1]);
        }
        if (i + 2 < FRAMES) {
            r_wl[i+2].push_back(r[i+1]);
        }
        // r[i+1].wait();

        q2.enqueueTask(krnl_Filter, &x_wl[i+2], &x[i+2]);
        r_wl[i+2].push_back(x[i+2]);

        krnl_Filter.setArg(0, Filter_Input_buffer[(i+3)%NUM_MAT]);
        krnl_Filter.setArg(1, Filter_Output_buffer[(i+3)%NUM_MAT]);

        q3.enqueueMigrateMemObjects({Filter_Input_buffer[(i+3)%NUM_MAT]}, 0, &w_wl[i+3], &w[i+3]);
        x_wl[i+3].push_back(w[i+3]);
        if (i + 4 < FRAMES) {
            w_wl[i+4].push_back(w[i+3]);
        }

        q2.enqueueMigrateMemObjects({Filter_Output_buffer[(i+2)%NUM_MAT]}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl[i+2], &r[i+2]);
        if (i + 6 < FRAMES) {
            w_wl[i+6].push_back(r[i+2]);
        }
        if (i + 3 < FRAMES) {
            r_wl[i+3].push_back(r[i+2]);
        }
        // r[i+2].wait();

        q3.enqueueTask(krnl_Filter, &x_wl[i+3], &x[i+3]);
        r_wl[i+3].push_back(x[i+3]);

        q3.enqueueMigrateMemObjects({Filter_Output_buffer[(i+3)%NUM_MAT]}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl[i+3], &r[i+3]);
        if (i + 7 < FRAMES) {
            w_wl[i+7].push_back(r[i+3]);
        }
        if (i + 4 < FRAMES) {
            r_wl[i+4].push_back(r[i+3]);
        }
        // r[i+3].wait();

        Differentiate_SW(Filter_Output[i%NUM_MAT],Differentiate_Output + (i)*OUTPUT_FRAME_SIZE);
        Differentiate_SW(Filter_Output[(i+1)%NUM_MAT],Differentiate_Output + (i+1)*OUTPUT_FRAME_SIZE);
        Differentiate_SW(Filter_Output[(i+2)%NUM_MAT],Differentiate_Output + (i+2)*OUTPUT_FRAME_SIZE);
        Differentiate_SW(Filter_Output[(i+3)%NUM_MAT],Differentiate_Output + (i+3)*OUTPUT_FRAME_SIZE);
      
        // Compress_SW(Differentiate_Output + (i) * OUTPUT_FRAME_SIZE, Compress_Output + (i) * OUTPUT_FRAME_SIZE);
        // Compress_SW(Differentiate_Output + (i+1) * OUTPUT_FRAME_SIZE, Compress_Output + (i+1) * OUTPUT_FRAME_SIZE);
        // Compress_SW(Differentiate_Output + (i+2) * OUTPUT_FRAME_SIZE, Compress_Output + (i+2) * OUTPUT_FRAME_SIZE);
        // Result_size = Compress_SW(Differentiate_Output + (i+3) * OUTPUT_FRAME_SIZE, Compress_Output + (i+3) * OUTPUT_FRAME_SIZE);
        Compress_SW(Differentiate_Output + (i) * OUTPUT_FRAME_SIZE, Compress_Output);
        Compress_SW(Differentiate_Output + (i+1) * OUTPUT_FRAME_SIZE, Compress_Output);
        Compress_SW(Differentiate_Output + (i+2) * OUTPUT_FRAME_SIZE, Compress_Output);
        Result_size = Compress_SW(Differentiate_Output + (i+3) * OUTPUT_FRAME_SIZE, Compress_Output);





    }
    q.finish();
    q1.finish();
    q2.finish();
    q3.finish();


    // ------------------------------------------------------------------------------------
    // Step 4: Release Allocated Resources
    // ------------------------------------------------------------------------------------

    timer2.add("Writing output to output_fpga.bin");
    
    Store_data("Output_new.bin", Compress_Output, Result_size);
    // printf("storing data done fr size = %d\n",Size);
    Check_data(Compress_Output, Result_size);

    free(Scale_Input);
    free(Compress_Output);
    free(Differentiate_Output);






    delete[] fileBuf;

    timer2.finish();
    std::cout << "--------------- Key execution times ---------------"
    << std::endl;
    timer2.print();

    timer1.finish();
    std::cout << "--------------- Total time ---------------"
    << std::endl;
    timer1.print();
    return 0;
}



// #define CL_HPP_CL_1_2_DEFAULT_BUILD
// #define CL_HPP_TARGET_OPENCL_VERSION 120
// #define CL_HPP_MINIMUM_OPENCL_VERSION 120
// #define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
// #define CL_USE_DEPRECATED_OPENCL_1_2_APIS

// #include "Common/EventTimer.h"
// #include <CL/cl2.hpp>
// #include <cstdint>
// #include <cstdlib>
// #include <fstream>
// #include <iostream>
// #include <unistd.h>
// #include <vector>

// #include "Pipeline_final.h"
// #include "Common/Utilities.h"

// #define NUM_MAT 1





// int main(int argc, char *argv[])
// {
//     EventTimer timer1, timer2;
//     timer1.add("Main program");


//     // ------------------------------------------------------------------------------------
//     // Step 1: Initialize the OpenCL environment
//      // ------------------------------------------------------------------------------------
//     timer2.add("OpenCL Initialization");
//     cl_int err;
//     std::string binaryFile = argv[1];
//     unsigned fileBufSize;
//     std::vector<cl::Device> devices = get_xilinx_devices();
//     devices.resize(1);
//     cl::Device device = devices[0];
//     cl::Context context(device, NULL, NULL, NULL, &err);
//     char *fileBuf = read_binary_file(binaryFile, fileBufSize);
//     cl::Program::Binaries bins{{fileBuf, fileBufSize}};
//     cl::Program program(context, devices, bins, NULL, &err);
//     cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);

//     cl::Kernel krnl_Filter(program, "Filter_HW", &err);

//     // ------------------------------------------------------------------------------------
//     // Step 2: Create buffers and initialize test values
//     // ------------------------------------------------------------------------------------
//     timer2.add("Allocate contiguous OpenCL buffers");


//     size_t Input_bytes_per_iteration = (SCALED_FRAME_SIZE * sizeof(unsigned char));
//     size_t Output_bytes_per_iteration = (OUTPUT_FRAME_SIZE * sizeof(unsigned char));

//     cl::Buffer Filter_Input_buffer;
//     cl::Buffer Filter_Output_buffer;

//     Filter_Input_buffer = cl::Buffer(context, CL_MEM_READ_ONLY, Input_bytes_per_iteration, NULL, &err);
//     Filter_Output_buffer = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_bytes_per_iteration, NULL, &err);



//     unsigned char * Filter_Input;
//     unsigned char * Filter_Output;


//     Filter_Input = (unsigned char *)q.enqueueMapBuffer(Filter_Input_buffer, CL_TRUE, CL_MAP_WRITE, 0, Input_bytes_per_iteration);
//     Filter_Output = (unsigned char*)q.enqueueMapBuffer(Filter_Output_buffer, CL_TRUE, CL_MAP_READ, 0, Output_bytes_per_iteration);




//     // unsigned char *Differentiate_Output = (unsigned char *)malloc(OUTPUT_FRAME_SIZE);
//     // unsigned char *Compress_Output = (unsigned char *)malloc(MAX_OUTPUT_SIZE);
    


//     timer2.add("Populating buffer inputs");
//     // init_arrays(a);
//     unsigned char *Scale_Input = (unsigned char *)malloc(FRAMES * INPUT_FRAME_SIZE);
//     Load_data(Scale_Input);
//     unsigned char *Differentiate_Output = (unsigned char *)malloc(FRAMES * OUTPUT_FRAME_SIZE);
//     unsigned char *Compress_Output = (unsigned char *)malloc(FRAMES * MAX_OUTPUT_SIZE);


//     int Result_size=0;

//     // ------------------------------------------------------------------------------------
//     // Step 3: Run the kernel
//     // ------------------------------------------------------------------------------------

//     timer2.add("Running kernel");

//     cl::Event w[FRAMES], x[FRAMES], r[FRAMES];
//     std::vector<cl::Event> w_wl[FRAMES],x_wl[FRAMES], r_wl[FRAMES];
    
    
//     for (int i = 0; i < FRAMES; i++) {

//         Scale_SW(Scale_Input + i * INPUT_FRAME_SIZE,Filter_Input);


//         krnl_Filter.setArg(0, Filter_Input_buffer);
//         krnl_Filter.setArg(1, Filter_Output_buffer);


//         if (i == 0) {
//             q.enqueueMigrateMemObjects({Filter_Input_buffer}, 0, NULL, &w[i]);
            
//             w_wl[i+1].push_back(w[i]);  
            
            
            
//         } else {
//             q.enqueueMigrateMemObjects({Filter_Input_buffer}, 0, &w_wl[i], &w[i]);
//             if (i+1<FRAMES)
//             {
//                 w_wl[i+1].push_back(w[i]);  
//             }
            
            
//         } 

//         x_wl[i].push_back(w[i]);
        
        

//         q.enqueueTask(krnl_Filter, &x_wl[i], &x[i]);

//         r_wl[i].push_back(x[i]);


//         q.enqueueMigrateMemObjects({Filter_Output_buffer}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl[i], &r[i]);

//         // if(i+1<FRAMES)
//         // {
//         //     w_wl.push_back(r[i]);
       
//         // }
//         r[i].wait();
        

//         //q.enqueueUnmapMemObject(Filter_Output_buffer,Filter_Output);
        
//         Differentiate_SW(Filter_Output,Differentiate_Output + (i)*OUTPUT_FRAME_SIZE);
//         // Differentiate_SW(Filter_Output,Differentiate_Output);
        
//         Result_size= Compress_SW(Differentiate_Output + (i) * OUTPUT_FRAME_SIZE, Compress_Output);
//         // Result_size= Compress_SW(Differentiate_Output, Compress_Output);
//         std::cout << "--------------------------------" << Result_size << "---------" << i << std::endl;






//      }



//     // ------------------------------------------------------------------------------------
//     // Step 4: Release Allocated Resources
//     // ------------------------------------------------------------------------------------

//     timer2.add("Writing output to output_fpga.bin");

//     Store_data("./data/Output_new.bin", Compress_Output, Result_size);
//     std::cout << "storing data done for size ="<< Result_size << std::endl;
//     Check_data(Compress_Output, Result_size);

//     free(Scale_Input);
//     free(Compress_Output);
//     free(Differentiate_Output);






//     delete[] fileBuf;

//     timer2.finish();
//     std::cout << "--------------- Key execution times ---------------"
//     << std::endl;
//     timer2.print();

//     timer1.finish();
//     std::cout << "--------------- Total time ---------------"
//     << std::endl;
//     timer1.print();
//     return 0;
// }


