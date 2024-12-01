// //success

// #define CL_HPP_CL_1_2_DEFAULT_BUILD
// #define CL_HPP_TARGET_OPENCL_VERSION 120
// #define CL_HPP_MINIMUM_OPENCL_VERSION 120
// #define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
// #define CL_USE_DEPRECATED_OPENCL_1_2_APIS

// #include <stdio.h>
// #include <stdint.h>
// #include <stdlib.h>
// #include <string.h>
// #include <iostream>
// #include <CL/cl2.hpp>
// #include "server.h"
// #include <unistd.h>
// #include <math.h>
// #include <fcntl.h>
// #include <pthread.h>
// #include <errno.h>
// #include <fcntl.h>
// #include <sys/mman.h>
// #include <fstream>
// #include <bitset>


// #include <unordered_map>
// #include <cstdint>
// #include <cstdlib>
// #include <vector>
// #include "Common/Utilities.h"
// #include "stopwatch.h"
// #include "Common/EventTimer.h"



// #define NUM_PACKETS 8
// #define PIPE_DEPTH 4
// #define DONE_BIT_L (1 << 7)
// #define DONE_BIT_H (1 << 15)
// #define NUM_ELEMENTS 16384
// #define HEADER 2

// #define MAX_NUM 256
// #define FILE_BUFFER_LIMIT 70000000
// #define OUTPUT_BUFFER_LIMIT 70000000
// #define MAX_COMPRESSED_SIZE 20000


// using namespace std;
// int offset = 0;
// unsigned char* file;

// void handle_input(int argc, char* argv[], int* blocksize) {
// 	int x;
// 	extern char *optarg;

// 	while ((x = getopt(argc, argv, ":b:")) != -1) {
// 		switch (x) {
// 		case 'b':
// 			*blocksize = atoi(optarg);
// 			printf("blocksize is set to %d optarg\n", *blocksize);
// 			break;
// 		case ':':
// 			printf("-%c without parameter\n", optopt);
// 			break;
// 		}
// 	}
// }

// void append_uint32_LE(std::vector<uint8_t> &buffer, uint32_t value)
// {
//     buffer.push_back(static_cast<uint8_t>(value & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>8 & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>16 & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>24 & 0xFF));
// }



// int main(int argc, char** argv)
// {
// // Initialize an event timer we'll use for monitoring the application
//     EventTimer timer;
// // ------------------------------------------------------------------------------------
// // Step 1: Initialize the OpenCL environment 
// // ------------------------------------------------------------------------------------ 
//     timer.add("OpenCL Initialization");
//     cl_int err;
//     std::string binaryFile = argv[1];
//     unsigned fileBufSize;    
//     std::vector<cl::Device> devices = get_xilinx_devices();
//     devices.resize(1);
//     cl::Device device = devices[0];
//     cl::Context context(device, NULL, NULL, NULL, &err);


//     char* fileBuf = read_binary_file(binaryFile, fileBufSize);
//     cl::Program::Binaries bins{{fileBuf, fileBufSize}};
//     cl::Program program(context, devices, bins, NULL, &err);

//     cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);

// 	cl::Kernel LZW_fpga(program,"lzw",&err);

// 	//implement multi-kernels
// 	// std::vector<cl::Kernel> multi_kernels(NUM_KERNELS);

// 	// for(int i = 0; i < NUM_KERNELS; i++){
// 	// 	multi_kernels[i] = cl::Kernel(program,"lzw_multi_chunks", &err);
// 	// }

// // ------------------------------------------------------------------------------------
// // Step 2: Create buffers and initialize test values
// // ------------------------------------------------------------------------------------
//     timer.add("Allocate contiguous OpenCL buffers");
//     // Create the buffers and allocate memory   
//     // cl::Buffer lzw_chunks_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_CHUNK_SIZE, NULL, &err);
// 	// cl::Buffer lzw_chunks_length_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
//     // cl::Buffer lzw_file_buffer_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_FILE_BUFFER_SIZE, NULL, &err);
//     // cl::Buffer lzw_total_bytes_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);


// 	// cl::Buffer Chunk_buffer;
//     // cl::Buffer Chunk_size_buffer;
// 	// cl::Buffer Compressed_data_buffer;
// 	// cl::Buffer Compressed_size_buffer;

// 	// // for (int i=0; i<NUM_KRN; i++)
// 	// // {
// 	// // 	Chunk_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_CHUNK_SIZE, NULL, &err);
// 	// // 	Chunk_size_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
// 	// // 	Compressed_data_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
// 	// // 	Compressed_size_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
// 	// // }	
// 	// Chunk_buffer = cl::Buffer(context,  CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY,  200000, NULL, &err);
// 	// Chunk_size_buffer = cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY, 200000, NULL, &err);
// 	// Compressed_data_buffer = cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_WRITE_ONLY,  200000, NULL, &err);
// 	// Compressed_size_buffer = cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_WRITE_ONLY,  200000, NULL, &err);
	
// 	cl::Buffer Chunk_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY, 200000, NULL, &err);
//     cl::Buffer Chunk_size_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY, 200000, NULL, &err);
//     cl::Buffer Compressed_data_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_WRITE_ONLY, 10000, NULL, &err);
//     // cl::Buffer Compressed_size_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_WRITE_ONLY, 10000, NULL, &err);
// 	cl::Buffer Compressed_size_buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned int), nullptr, &err);
// 	// if (err != CL_SUCCESS) {
//     // 	std::cerr << "Failed to allocate Compressed_size_buffer. Error: " << err << std::endl;
//     // 	return EXIT_FAILURE;
// 	// }
	
// 	// unsigned char* Chunk[NUM_KRN];
// 	// size_t *Chunk_size[NUM_KRN];
//     // uint8_t *Compressed_data[NUM_KRN];
// 	// int *Compressed_size[NUM_KRN];

// 	// for(int i = 0; i < NUM_KRN; i++){
// 	// 	Chunk[i] = (unsigned char *)q.enqueueMapBuffer(lzw_chunks_bufs[i], CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_CHUNK_SIZE);
// 	// 	Chunk_size[i] = (size_t*)q.enqueueMapBuffer(lzw_chunks_length_bufs[i], CL_TRUE, CL_MAP_WRITE, 0, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL);
// 	// 	Compressed_data[i] = (uint8_t*)q.enqueueMapBuffer(lzw_file_buffer_bufs[i], CL_TRUE, CL_MAP_READ, 0, sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_FILE_BUFFER_SIZE);
// 	// 	Compressed_size[i] = (int*)q.enqueueMapBuffer(lzw_total_bytes_bufs[i], CL_TRUE, CL_MAP_READ, 0, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL);
// 	// }


// 	unsigned char* Chunk;
// 	unsigned int *Chunk_size;
//    	uint8_t* Compressed_data;
// 	unsigned int*Compressed_size;

// 	// Chunk = (unsigned char *)q.enqueueMapBuffer(Chunk_buffer, CL_TRUE, CL_MAP_WRITE, 0,8192);
// 	// Chunk_size = (unsigned int*)q.enqueueMapBuffer(Chunk_size_buffer, CL_TRUE, CL_MAP_WRITE, 0, 8192);
// 	// Compressed_data = (uint8_t*)q.enqueueMapBuffer(Compressed_data_buffer, CL_TRUE, CL_MAP_READ, 0, MAX_COMPRESSED_SIZE);
// 	// //memset(Compressed_data, 0, MAX_COMPRESSED_SIZE);
// 	// Compressed_size = (int*)q.enqueueMapBuffer(Compressed_size_buffer, CL_TRUE, CL_MAP_READ, 0, sizeof(int));		
// 	//q.finish();

// 	// q.enqueueFillBuffer(Chunk_buffer, 0, 0, 200000);
// 	// q.enqueueFillBuffer(Chunk_size_buffer, 0, 0, 200000);
// 	// q.enqueueFillBuffer(Compressed_data_buffer, 0, 0, 200000);
// 	// q.enqueueFillBuffer(Compressed_size_buffer, 0, 0, 200000);
// 	// q.finish();
		

// 	// if (!Chunk || !Chunk_size || !Compressed_data || !Compressed_size) {
//     //     std::cerr << "Failed to map OpenCL buffers." << std::endl;
//     //     delete[] fileBuf;
//     //     return EXIT_FAILURE;
//     // }


//     timer.add("Populating buffer inputs");

// // ------------------------------------------------------------------------------------
// // Step 3: Run the kernel
// // ------------------------------------------------------------------------------------
// 	std::cout << "dec 9 0105" << std::endl;
// 	std::cout << argv[1] << std::endl;
// 	stopwatch ethernet_timer;
// 	unsigned char* input[NUM_PACKETS];
// 	int writer = 0;
// 	int done = 0;
// 	int length = 0;
// 	int count = 0;
// 	int blocksize = BLOCKSIZE;
//     int offset = 0;
//     unsigned char* file;
//     std::vector<uint8_t> output_buffer;
// 	ESE532_Server server;

// 	// std::vector<cl::Event> read_events[NUM_KERNELS];



// 	// set blocksize if decalred through command line
// 	handle_input(argc, argv, &blocksize);

// 	file = (unsigned char*) malloc(sizeof(unsigned char) * FILE_BUFFER_LIMIT);
// 	if (file == NULL) {
//         std::cerr << "Failed to allocate memory for file buffer.\n";
//         return 1;
//     }

// 	for (int i = 0; i < NUM_PACKETS; i++) {
//         input[i] = (unsigned char*) malloc(sizeof(unsigned char) * (NUM_ELEMENTS + HEADER));
//         if (input[i] == NULL) {
//             std::cerr << "Failed to allocate memory for input buffer " << i << std::endl;
//             return 1;
//         }
//     }

// 	server.setup_server(blocksize);

//     writer = PIPE_DEPTH;
//     server.get_packet(input[writer]);
//     count++;

//     // Get initial packet
//     unsigned char* buffer = input[writer];

//     // Decode
//     done = buffer[1] & DONE_BIT_L;
//     length = buffer[0] | (buffer[1] << 8);
//     length &= ~DONE_BIT_H;

//     // Copy data into file_buffer
//     memcpy(&file[offset], &buffer[HEADER], length);
//     offset += length;
//     writer++;




// 	stopwatch total_time;
// 	stopwatch cdc_time;
// 	stopwatch sha_time;
// 	stopwatch dedup_time;

// 	//last message
//     while (!done) {
//         if (writer == NUM_PACKETS) {
//             writer = 0;
//         }

//         ethernet_timer.start();
//         server.get_packet(input[writer]);
//         ethernet_timer.stop();

//         unsigned char* buffer = input[writer];


//         done = buffer[1] & DONE_BIT_L;
//         length = buffer[0] | (buffer[1] << 8);
//         length &= ~DONE_BIT_H;

//         memcpy(&file[offset], &buffer[HEADER], length);

// 		offset += length;

        
//         //free(buffer);

//         writer++;
//     }
// 		// encode the obtained information in buffer

// 		// initialize the vector to store the obtained chunks
//     std::map<std::string, int> lzw_cache;
//     std::unordered_set<std::string> hash_table;


//     // int count1=0;
//     // int count2=0;
//     unsigned char* chunks[MAX_CHUNK];
//     unsigned int chunk_count;
//     unsigned int chunk_sizes[MAX_CHUNK];
// 	unsigned int lzw_index = 0;


// 	// stopwatch cdc_timer;
//     // cdc_timer.start();
//     cdc(file, offset, chunks, chunk_sizes, &chunk_count, MAX_CHUNK);
//     // cdc_timer.stop();
//     // std::cout << "CDC function time: " << cdc_timer.latency() / 1000.0 << " seconds" << std::endl;
// 	// for (unsigned int i = 0; i < chunk_count; i++) {
// 	// 	printf("chunk_sizes is %d\n",chunk_sizes[i]);
// 	// }
// 	// for (unsigned int i = 0; i < chunk_count; i++) {
//     //     printf("Chunk %u (size %u): ", i, chunk_sizes[i]);
//     //     for (unsigned int j = 0; j < chunk_sizes[i]; j++) {
//     //         printf("%c", chunks[i][j]);
//     //     }
//     //     printf("\n");
//     //     free(chunks[i]);
//     // }


// 	// unsigned char* chunk_content = (unsigned char*)malloc(sizeof(unsigned char) * MAX_CHUNK_SIZE); 


	
//  	// size_t chunk_offset0 = 0;

// // // Loop over each chunk and copy data into the Chunk buffer
// 	// for (unsigned int i = 0; i < chunk_count; ++i) {
    	
//     // 	// Copy the chunk data into the Chunk buffer at the current offset
//  		// memcpy(Chunk, chunks[i], chunk_sizes[i]);
    
//     // 	// Record the size of this chunk in Chunk_size
//     // 	Chunk_size[i] = chunk_sizes[i];
    
//     // 	// Update the offset
//     // 	chunk_offset0 += chunk_sizes[i];
// 	// }
// 	// printf("finished buffering\n");
	
// 	// size_t offset_forprint = 0; 
// 	// for (unsigned int i = 0; i < chunk_count; ++i) {
//     // 	printf("Chunk %u (size %zu): ", i, Chunk_size[i]);
//     // 	for (unsigned int j = 0; j < Chunk_size[i]; ++j) {
//     //     	printf("%c", Chunk[offset_forprint + j]);
//     // 	}
//     // 	printf("\n");

//     // 	offset_forprint += Chunk_size[i];
// 	// }

// 	size_t chunk_offset = 0;

//     std::vector<cl::Event> w_wl;	


// // // software
// // 	for (unsigned int i = 0; i <chunk_count; i++) {


// //         unsigned char* chunk = chunks[i];
// //         unsigned int chunk_size_sha = chunk_sizes[i];

// // 		std::string hash_value = sha256(chunk, chunk_size_sha);
// // 		memcpy(Chunk, chunks[i], chunk_sizes[i]);
// // 		// printf("Chunk_buffer size is %d\n",compressed_size);

// //         // stopwatch sha_timer;
// //         // sha_timer.start();
        
// //         // sha_timer.stop();
// //         // std::cout << "SHA function time: " << sha_timer.latency() / 1000.0 << " seconds" << std::endl;



// //         if (deduplication(hash_table, hash_value)) {

// // 			*Chunk_size = chunk_sizes[i];
// // 			chunk_offset+=chunk_sizes[i];



// //             int index = lzw_cache[hash_value];
// //             uint32_t header = (index << 1) | 1U; // Using the LZW index stored in cache


// //             append_uint32_LE(output_buffer,header);
			


// //         } else {


// // 			*Chunk_size = chunk_sizes[i];
// // 			chunk_offset += chunk_sizes[i];

// // 			//printf("start!!!!\n");
// // 			uint8_t compressed_data[MAX_COMPRESSED_SIZE];
// //             int compressed_size;
// // 			lzw(Chunk, Chunk_size, Compressed_data, Compressed_size);

// //             lzw_cache[hash_value] = lzw_index;
// //             lzw_index++;

// // 			// std::cout << "Contents of lzw_cache:" << std::endl;
// //     		// for (const auto& entry : lzw_cache) {
// //         	// 	std::cout << "Hash Value: " << entry.first << ", LZW Index: " << entry.second << std::endl;
// //     		// }

// // 			compressed_size=*Compressed_size;
// // 			memcpy(compressed_data, Compressed_data, compressed_size);
// // 			//compressed_data = Compressed_data;

// // 		    std::cout << "The compressed output stream is: ";
// //     		for (int i = 0; i < compressed_size; i++) {
// //         		printf("%02X ", compressed_data[i]);

// //     		}

// // 			printf("compressed_size%d is %d\n",i,compressed_size);
// //             uint32_t header = (compressed_size << 1) | 0U;
// //             append_uint32_LE(output_buffer, header);
// // 			std::cout << "Header software (new): " << std::bitset<32>(header) << "\n";

// //             // output_buffer.insert(output_buffer.end(),compressed_data.begin(), compressed_data.end());
// //             output_buffer.insert(output_buffer.end(), compressed_data, compressed_data + compressed_size);

// // 			}
	       
	
// //     }
    
// //hardware
// 	for (unsigned int i = 0; i < chunk_count; i++) {
// 		cl::Event w_ev, x_ev, r_ev;
//     	std::vector<cl::Event> x_wl, r_wl;	
		
		
// 		//size_t chunk_offset = 0;
		 
//         unsigned char* chunk = chunks[i];
//         unsigned int chunk_size_sha = chunk_sizes[i];
// 		//printf("-----------------------%d\n",chunk_sizes[i]);
// 		//printf("-----------------------%d\n",i);

// 		std::string hash_value = sha256(chunk, chunk_size_sha);
// 		//memcpy(Chunk, chunks[i], chunk_sizes[i]);
// 		// printf("Chunk_buffer size is %d\n",compressed_size);

//         // stopwatch sha_timer;
//         // sha_timer.start();
        
//         // sha_timer.stop();
//         // std::cout << "SHA function time: " << sha_timer.latency() / 1000.0 << " seconds" << std::endl;



//         if (deduplication(hash_table, hash_value)) {
// 			//printf("find deduplicated chunk\n");
//             //count1++;
//             //std::cout << "Hash found in table, reusing cached LZW data.\n";
//             //const std::vector<int>& cached_data = lzw_cache[hash_value];
// 			// memcpy(Chunk[i], chunks[i], chunk_sizes[i]);
    
//     		// // Record the size of this chunk in Chunk_size
//     		// Chunk_size[i] = chunk_sizes[i];
    
//     		// // Update the offset
//     		// chunk_offset += chunk_sizes[i];
// 			//memcpy(Chunk+chunk_offset, chunks[i], chunk_sizes[i]);
//     		// Record the size of this chunk in Chunk_size
// 			*Chunk_size = chunk_sizes[i];
// 			chunk_offset+=chunk_sizes[i];
// 			// for (unsigned int j = 0; j < *Chunk_size; ++j) {
//         	// 	printf("%c", Chunk[chunk_offset+j]);
//     		// }


//             int index = lzw_cache[hash_value];
//             uint32_t header = (index << 1) | 0x1; // Using the LZW index stored in cache
// 			//std::cout << "Header (dedup): " << std::bitset<32>(header) << "\n";

//             append_uint32_LE(output_buffer,header);
			

// 			// w[i] = cl::Event();
// 			// x[i] = cl::Event();
// 			// r[i] = cl::Event();
// 			// if (i + 1 < chunk_count) {
//         	// 	w_wl[i + 1].push_back(w[i]);
//         	// 	x_wl[i + 1].push_back(x[i]);
//         	// 	r_wl[i + 1].push_back(r[i]);
//     		// }


//         } else {
//             //std::cout << "Hash not found, performing LZW compression.\n";
//             // stopwatch lzw_timer;
// 			// lzw_timer.start();
// 			// unsigned char* Chunk;
// 			// size_t *Chunk_size;
//     		// uint8_t *Compressed_data;
// 			// int *Compressed_size;
// 			unsigned int compressed_size=0;
// 			q.enqueueWriteBuffer(Compressed_size_buffer, CL_TRUE, 0, sizeof(unsigned int), &compressed_size);
//             q.finish();


// 			Chunk = (unsigned char *)q.enqueueMapBuffer(Chunk_buffer, CL_TRUE, CL_MAP_WRITE, 0,1000);
// 			Chunk_size = (unsigned int*)q.enqueueMapBuffer(Chunk_size_buffer, CL_TRUE, CL_MAP_WRITE, 0, 100000);
// 			//Compressed_data = (uint8_t*)q.enqueueMapBuffer(Compressed_data_buffer, CL_TRUE, CL_MAP_READ, 0, 10000);
// 			//Compressed_size = (int*)q.enqueueMapBuffer(Compressed_size_buffer, CL_TRUE, CL_MAP_READ, 0, 10000);	




// 			//printf("finished\n");


// 			memcpy(Chunk, chunks[i], chunk_sizes[i]);
// 			//memcpy(Chunk, chunks[i], chunk_sizes[i]);
//     		// Record the size of this chunk in Chunk_size
// 			//printf("chunk_sizes id %d\n",chunk_sizes[i]);
// 			q.enqueueUnmapMemObject(Chunk_buffer, Chunk);
// 			q.finish();
// 			// memcpy(Chunk_size+i*sizeof(int),chunk_sizes,sizeof(int));
// 			*Chunk_size = chunk_sizes[i];
// 			q.enqueueUnmapMemObject(Chunk_size_buffer, Chunk_size);
// 			q.finish();
//     		//Chunk_size[i] = chunk_sizes[i];
// 			//printf("Chunk_size[%d]=%d,chunk_size[%d]=%d\n",i,*Chunk_size,i,chunk_sizes[i]);
    
//     		// Update the offset
    		
// 			// printf("finished mapping");
// 			// printf("---------%d\n",i);
// 			// for (unsigned int j = 0; j < chunk_sizes[i]; ++j) {
//         	// 	printf("%c", Chunk[j]);
// 			// 	// printf("Chunk sizes is %d",*Chunk_size);
//     		// }
// 			// printf("\n");
// 			// printf("Chunk sizes is %d\n",*Chunk_size);


// 			//chunk_offset += chunk_sizes[i];
			
// 			LZW_fpga.setArg(0,Chunk_buffer);
// 			LZW_fpga.setArg(1,Chunk_size_buffer);
// 			LZW_fpga.setArg(2,Compressed_data_buffer);
// 			LZW_fpga.setArg(3,Compressed_size_buffer);



// 			//printf("start!!!!\n");


// 			// uint8_t compressed_data[MAX_COMPRESSED_SIZE];
//             //int compressed_size;
// 			// for (unsigned int j = 0; j < chunk_sizes[i]; ++j) {
//         	// 	printf("%c", Chunk[j]);
// 			// 	//printf("Chunk sizes is %d",*Chunk_size);
//     		// }



// 			// if (i == 0) {
//             // q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer,Compressed_size_buffer}, 0, NULL, &w_ev);  
//         	// } 
// 			// else {
//             // q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer,Compressed_size_buffer}, 0, &w_wl, &w_ev);			
			
//     		// w_wl.pop_back();

// 			// }
			

			
// 			// x_wl.push_back(w_ev);
// 			// q.enqueueTask(LZW_fpga, &x_wl, &x_ev);
// 			// clWaitForEvents(1, (const cl_event*)&x_ev);
// 			// r_wl.push_back(x_ev);

// 			// q.enqueueReadBuffer(Compressed_size_buffer, CL_TRUE, 0, sizeof(int), &compressed_size);
// 			// uint8_t* compressed_data = new uint8_t[compressed_size];
// 			// q.enqueueReadBuffer(Compressed_data_buffer, CL_TRUE, 0, compressed_size, compressed_data);


// 			// q.enqueueMigrateMemObjects({Compressed_data_buffer,Compressed_size_buffer}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl, &r_ev);
// 			// // q.enqueueMigrateMemObjects({Compressed_size_buffer}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl, &r_ev);
//             // w_wl.push_back(r_ev);
			

// 			// q.finish();
			
			
// 			// r_ev.wait();
// 			cl::Event event_sp;
//             q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer,Compressed_size_buffer}, 0);  
// 			q.finish();


// 			q.enqueueTask(LZW_fpga, NULL, &event_sp);
// 			clWaitForEvents(1, (const cl_event*)&event_sp); 
// 			q.finish();
// 			// q.enqueueMigrateMemObjects({Compressed_size_buffer}, CL_MIGRATE_MEM_OBJECT_HOST, NULL,NULL);
// 			// q.finish();
// 			// q.enqueueMigrateMemObjects({Compressed_data_buffer}, CL_MIGRATE_MEM_OBJECT_HOST,NULL,NULL);
			
// 			// q.finish();
// 			q.enqueueReadBuffer(Compressed_size_buffer, CL_TRUE, 0, sizeof(unsigned int), &compressed_size);
// 			uint8_t* compressed_data = new uint8_t[compressed_size];
// 			q.enqueueReadBuffer(Compressed_data_buffer, CL_TRUE, 0, compressed_size, compressed_data);
            
            
			
			
// 			// std::cout << "LZW compression time for chunk " << i << ": " << lzw_timer.latency() / 1000.0 << " seconds" << std::endl;


// 			// printf("finished!!!!!!!!!\n");

            

// 			// std::cout << "Contents of lzw_cache:" << std::endl;
//     		// for (const auto& entry : lzw_cache) {
//         	// 	std::cout << "Hash Value: " << entry.first << ", LZW Index: " << entry.second << std::endl;
//     		// }

			
// 			lzw_cache[hash_value] = lzw_index;
//             //printf("----%d\n",lzw_index);
// 			lzw_index++;
			
// 			//compressed_size=*Compressed_size;
// 			//memcpy(compressed_data,Compressed_data,compressed_size);
// 	    	std::cout << "The compressed output stream is: ";
//    			for (int i = 0; i < compressed_size; i++) {
//        			printf("%02X ", compressed_data[i]);
//    			}
// 			// if(i==60){
					
// 			// }
// 			printf("compressed_size%d is %d\n",i,compressed_size);
//            	uint32_t header = (compressed_size << 1) | 0;
//            	append_uint32_LE(output_buffer, header);
// 			//std::cout << "Header (new): " << std::bitset<32>(header) << "\n";
//             // output_buffer.insert(output_buffer.end(),compressed_data.begin(), compressed_data.end());
//            	output_buffer.insert(output_buffer.end(), compressed_data, compressed_data + compressed_size);
// 			//wait();
			
			
// 			//printf("%c", *Chunk);
			

// 			// q.enqueueUnmapMemObject(Chunk_buffer, Chunk);
//     		// q.enqueueUnmapMemObject(Chunk_size_buffer, Chunk_size);
//     		// q.enqueueUnmapMemObject(Compressed_data_buffer, Compressed_data);
// 			// q.enqueueUnmapMemObject(Compressed_size_buffer, Compressed_size);
// 			//memset(Compressed_data, 0, MAX_COMPRESSED_SIZE);
// 			// q.finish();
// 		delete[] compressed_data;
	

// 		}
// 		q.finish();
		
//     }


// 	total_time.stop();
// 	FILE *outfd = fopen("output_cpu.bin", "wb");
// 	int bytes_written = fwrite(&file[0], 1, offset, outfd);
// 	printf("write file with %d\n", bytes_written);
// 	fclose(outfd);


//     FILE* out = fopen("output.bin", "wb");
//     size_t bytes_output_written = fwrite(output_buffer.data(), 1, output_buffer.size(), out);
//     std::cout << "Output written with " << bytes_output_written << " bytes\n";
//     fclose(out);




// 	for (int i = 0; i < NUM_PACKETS; i++) {
// 		free(input[i]);
// 	}

// 	free(file);
// 	// q.enqueueUnmapMemObject(Chunk_buffer, Chunk);
// 	// q.enqueueUnmapMemObject(Chunk_size_buffer, Chunk_size);
//     // q.enqueueUnmapMemObject(Compressed_data_buffer, Compressed_data);
// 	// q.enqueueUnmapMemObject(Compressed_size_buffer, Compressed_size);
	

// 	q.finish();
// 	// std::cout << "--------------- Key Throughputs ---------------" << std::endl;
// 	// float ethernet_latency = ethernet_timer.latency() / 1000.0;
// 	// float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency; // Mb/s
// 	// std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
// 	// 		<< " (Latency: " << ethernet_latency << "s)." << std::endl;

// 	// float cdc_latency = cdc_time.latency() / 1000.0;
// 	// float cdc_throughput = (bytes_written * 8 / 1000000.0) / cdc_latency; // Mb/s
// 	// std::cout << "cdc Throughput to Encoder: " << cdc_throughput << " Mb/s."
// 	// 		<< " (Latency: " << cdc_latency << "s)." << std::endl;

// 	// float sha_latency = sha_time.latency() / 1000.0;
// 	// float sha_throughput = (bytes_written * 8 / 1000000.0) / sha_latency; // Mb/s
// 	// std::cout << "sha Throughput to Encoder: " << sha_throughput << " Mb/s."
// 	// 		<< " (Latency: " << sha_latency << "s)." << std::endl;

// 	// float dedup_latency = dedup_time.latency() / 1000.0;
// 	// float dedup_throughput = (dedup_chars * 8 / 1000000.0) / dedup_latency; // Mb/s
// 	// std::cout << "dedup Throughput to Encoder: " << dedup_throughput << " Mb/s."
// 	// 		<< " (Latency: " << dedup_latency << "s)." << std::endl;

// 	// float output_latency = total_time.latency() / 1000.0;
// 	// float output_throughput = (total_inputBits * 8 / 1000000.0) / output_latency; // Mb/s
// 	// std::cout << "output Throughput to Encoder: " << output_throughput << " Mb/s."
// 	// 		<< " (Latency: " << output_latency << "s)." << std::endl;

// // ------------------------------------------------------------------------------------
// // Step 4: Check Results and Release Allocated Resources
// // ------------------------------------------------------------------------------------
//     // multiply_gold(in1, in2, out_sw);
//     // bool match = Compare_matrices(out_sw, out_hw);
//     // Destroy_matrix(out_sw);
//     delete[] fileBuf;



// 	// for(int k = 0; k < NUM_KERNELS; k++){
// 	// 	q.enqueueUnmapMemObject(lzw_chunks_bufs[k], lzw_chunks[k]);
// 	// 	q.enqueueUnmapMemObject(lzw_chunks_length_bufs[k], lzw_chunks_length[k]);
// 	// 	q.enqueueUnmapMemObject(lzw_file_buffer_bufs[k], lzw_file_buffer[k]);
// 	// 	q.enqueueUnmapMemObject(lzw_total_bytes_bufs[k], lzw_total_bytes[k]);
// 	// }
    

//     // std::cout << "--------------- Key execution times ---------------" << std::endl;
//     // timer.print();

//     // std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl; 
//     // return (match ? EXIT_SUCCESS : EXIT_FAILURE);
//     // return 0;
// }








































// // // 2.0
// #define CL_HPP_CL_1_2_DEFAULT_BUILD
// #define CL_HPP_TARGET_OPENCL_VERSION 120
// #define CL_HPP_MINIMUM_OPENCL_VERSION 120
// #define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
// #define CL_USE_DEPRECATED_OPENCL_1_2_APIS

// #include <stdio.h>
// #include <stdint.h>
// #include <stdlib.h>
// #include <string.h>
// #include <iostream>
// #include <CL/cl2.hpp>
// #include "server.h"
// #include <unistd.h>
// #include <math.h>
// #include <fcntl.h>
// #include <pthread.h>
// #include <errno.h>
// #include <fcntl.h>
// #include <sys/mman.h>
// #include <fstream>
// #include <bitset>


// #include <unordered_map>
// #include <cstdint>
// #include <cstdlib>
// #include <vector>
// #include "Common/Utilities.h"
// #include "stopwatch.h"
// #include "Common/EventTimer.h"



// #define NUM_PACKETS 8
// #define PIPE_DEPTH 4
// #define DONE_BIT_L (1 << 7)
// #define DONE_BIT_H (1 << 15)
// #define NUM_ELEMENTS 16384
// #define HEADER 2

// #define MAX_NUM 256
// #define FILE_BUFFER_LIMIT 70000000
// #define OUTPUT_BUFFER_LIMIT 70000000
// #define MAX_COMPRESSED_SIZE 20000


// using namespace std;
// int offset = 0;
// unsigned char* file;

// void handle_input(int argc, char* argv[], int* blocksize) {
// 	int x;
// 	extern char *optarg;

// 	while ((x = getopt(argc, argv, ":b:")) != -1) {
// 		switch (x) {
// 		case 'b':
// 			*blocksize = atoi(optarg);
// 			printf("blocksize is set to %d optarg\n", *blocksize);
// 			break;
// 		case ':':
// 			printf("-%c without parameter\n", optopt);
// 			break;
// 		}
// 	}
// }

// void append_uint32_LE(std::vector<uint8_t> &buffer, uint32_t value)
// {
//     buffer.push_back(static_cast<uint8_t>(value & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>8 & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>16 & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>24 & 0xFF));
// }



// int main(int argc, char** argv)
// {
// // Initialize an event timer we'll use for monitoring the application
//     EventTimer timer;
// // ------------------------------------------------------------------------------------
// // Step 1: Initialize the OpenCL environment 
// // ------------------------------------------------------------------------------------ 
//     timer.add("OpenCL Initialization");
//     cl_int err;
//     std::string binaryFile = argv[1];
//     unsigned fileBufSize;    
//     std::vector<cl::Device> devices = get_xilinx_devices();
//     devices.resize(1);
//     cl::Device device = devices[0];
//     cl::Context context(device, NULL, NULL, NULL, &err);


//     char* fileBuf = read_binary_file(binaryFile, fileBufSize);
//     cl::Program::Binaries bins{{fileBuf, fileBufSize}};
//     cl::Program program(context, devices, bins, NULL, &err);

//     cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);

// 	cl::Kernel LZW_fpga(program,"lzw",&err);

// 	//implement multi-kernels
// 	// std::vector<cl::Kernel> multi_kernels(NUM_KERNELS);

// 	// for(int i = 0; i < NUM_KERNELS; i++){
// 	// 	multi_kernels[i] = cl::Kernel(program,"lzw_multi_chunks", &err);
// 	// }

// // ------------------------------------------------------------------------------------
// // Step 2: Create buffers and initialize test values
// // ------------------------------------------------------------------------------------
//     timer.add("Allocate contiguous OpenCL buffers");

	
// 	cl::Buffer Chunk_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY, 20000, NULL, &err);
//     cl::Buffer Chunk_size_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY, 20000, NULL, &err);
//     cl::Buffer Compressed_data_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_WRITE_ONLY, 10000, NULL, &err);
// 	cl::Buffer Compressed_size_buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned int), nullptr, &err);

// 	unsigned char* Chunk;
// 	unsigned int *Chunk_size;
//    	uint8_t* Compressed_data;
// 	unsigned int*Compressed_size;


//     timer.add("Populating buffer inputs");

// // ------------------------------------------------------------------------------------
// // Step 3: Run the kernel
// // ------------------------------------------------------------------------------------
// 	std::cout << "dec 9 0105" << std::endl;
// 	std::cout << argv[1] << std::endl;
// 	stopwatch ethernet_timer;
// 	unsigned char* input[NUM_PACKETS];
// 	int writer = 0;
// 	int done = 0;
// 	int length = 0;
// 	int count = 0;
// 	int blocksize = BLOCKSIZE;
//     int offset = 0;
//     unsigned char* file;
//     std::vector<uint8_t> output_buffer;
// 	ESE532_Server server;




// 	// set blocksize if decalred through command line
// 	handle_input(argc, argv, &blocksize);

// 	file = (unsigned char*) malloc(sizeof(unsigned char) * FILE_BUFFER_LIMIT);
// 	if (file == NULL) {
//         std::cerr << "Failed to allocate memory for file buffer.\n";
//         return 1;
//     }

// 	for (int i = 0; i < NUM_PACKETS; i++) {
//         input[i] = (unsigned char*) malloc(sizeof(unsigned char) * (NUM_ELEMENTS + HEADER));
//         if (input[i] == NULL) {
//             std::cerr << "Failed to allocate memory for input buffer " << i << std::endl;
//             return 1;
//         }
//     }

// 	server.setup_server(blocksize);

//     writer = PIPE_DEPTH;
//     server.get_packet(input[writer]);
//     count++;

//     // Get initial packet
//     unsigned char* buffer = input[writer];

//     // Decode
//     done = buffer[1] & DONE_BIT_L;
//     length = buffer[0] | (buffer[1] << 8);
//     length &= ~DONE_BIT_H;

//     // Copy data into file_buffer
//     memcpy(&file[offset], &buffer[HEADER], length);
//     offset += length;
//     writer++;



// 	stopwatch total_time;
// 	stopwatch lzw_time;
// 	stopwatch cdc_time;
// 	stopwatch sha_time;
// 	stopwatch dedup_time;

// 	//last message
//     while (!done) {
//         if (writer == NUM_PACKETS) {
//             writer = 0;
//         }

//         ethernet_timer.start();
//         server.get_packet(input[writer]);
//         ethernet_timer.stop();

//         unsigned char* buffer = input[writer];


//         done = buffer[1] & DONE_BIT_L;
//         length = buffer[0] | (buffer[1] << 8);
//         length &= ~DONE_BIT_H;

//         memcpy(&file[offset], &buffer[HEADER], length);

// 		offset += length;

        
//         //free(buffer);

//         writer++;
//     }
// 		// encode the obtained information in buffer

// 		// initialize the vector to store the obtained chunks
//     std::map<std::string, int> lzw_cache;
//     std::unordered_set<std::string> hash_table;

//     unsigned char* chunks[MAX_CHUNK];
//     unsigned int chunk_count;
//     unsigned int chunk_sizes[MAX_CHUNK];
// 	unsigned int lzw_index = 0;

// 	total_time.start();

// 	cdc_time.start();
//     fast_cdc(file, offset, chunks, chunk_sizes, &chunk_count, MAX_CHUNK);
// 	cdc_time.stop();

// 	size_t chunk_offset = 0;

//     std::vector<cl::Event> w_wl;
// 	std::string hash_value[chunk_count];	

// 	for (unsigned int i = 0; i < chunk_count; i++) {
// 		unsigned char* chunk = chunks[i];
//         unsigned int chunk_size_sha = chunk_sizes[i];
// 		sha_time.start();
// 		hash_value[i] = sha256(chunk, chunk_size_sha);
// 		sha_time.stop();
// 	}

    
// //hardware
	
// 	for (unsigned int i = 0; i < chunk_count; i++) {
		
// 		cl::Event w_ev, x_ev, r1_ev, r2_ev;
//     	std::vector<cl::Event> x_wl, r1_wl,r2_wl;	

		 
//         // unsigned char* chunk = chunks[i];
//         // unsigned int chunk_size_sha = chunk_sizes[i];
// 		// sha_time.start();
// 		// std::string hash_value = sha256(chunk, chunk_size_sha);
// 		// sha_time.stop();

// 		dedup_time.start();
// 		bool dedup = deduplication(hash_table, hash_value[i]);
// 		dedup_time.stop();

//         if (dedup) {

// 			//*Chunk_size = chunk_sizes[i];
// 			//chunk_offset+=chunk_sizes[i];

//             int index = lzw_cache[hash_value[i]];
//             uint32_t header = (index << 1) | 0x1; // Using the LZW index stored in cache


//             append_uint32_LE(output_buffer,header);


//         } else {

// 			unsigned int compressed_size=0;
// 			q.enqueueWriteBuffer(Compressed_size_buffer, CL_TRUE, 0, sizeof(unsigned int), &compressed_size);
//             q.finish();


// 			Chunk = (unsigned char *)q.enqueueMapBuffer(Chunk_buffer, CL_TRUE, CL_MAP_WRITE, 0,1000);
// 			Chunk_size = (unsigned int*)q.enqueueMapBuffer(Chunk_size_buffer, CL_TRUE, CL_MAP_WRITE, 0, 1000);
// 			//Compressed_data = (uint8_t*)q.enqueueMapBuffer(Compressed_data_buffer, CL_TRUE, CL_MAP_READ, 0, 10000);
// 			//Compressed_size = (int*)q.enqueueMapBuffer(Compressed_size_buffer, CL_TRUE, CL_MAP_READ, 0, 10000);	






// 			memcpy(Chunk, chunks[i], chunk_sizes[i]);
// 			q.enqueueUnmapMemObject(Chunk_buffer, Chunk);
// 			q.finish();
// 			*Chunk_size = chunk_sizes[i];
// 			q.enqueueUnmapMemObject(Chunk_size_buffer, Chunk_size);
// 			q.finish();


// 			//chunk_offset += chunk_sizes[i];
			
// 			LZW_fpga.setArg(0,Chunk_buffer);
// 			LZW_fpga.setArg(1,Chunk_size_buffer);
// 			LZW_fpga.setArg(2,Compressed_data_buffer);
// 			LZW_fpga.setArg(3,Compressed_size_buffer);






// 			if (i == 0) {
//             q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer,Compressed_size_buffer}, 0, NULL, &w_ev);  
//         	} 
// 			else {
//             q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer,Compressed_size_buffer}, 0, &w_wl, &w_ev);			
			
//     		w_wl.pop_back();

// 			}
			

			
// 			x_wl.push_back(w_ev);
// 			lzw_time.start();
// 			q.enqueueTask(LZW_fpga, &x_wl, &x_ev);
// 			clWaitForEvents(1, (const cl_event*)&x_ev);
// 			lzw_time.stop();
// 			r1_wl.push_back(x_ev);

// 			q.enqueueReadBuffer(Compressed_size_buffer, CL_TRUE, 0, sizeof(int), &compressed_size,&r1_wl,&r1_ev);
// 			r2_wl.push_back(x_ev);
// 			uint8_t* compressed_data = new uint8_t[compressed_size];
// 			q.enqueueReadBuffer(Compressed_data_buffer, CL_TRUE, 0, compressed_size, compressed_data,&r2_wl,&r2_ev);

//             w_wl.push_back(r2_ev);
			

// 			q.finish();
			
			

			
// 			lzw_cache[hash_value[i]] = lzw_index;
// 			lzw_index++;
// 			// std::cout << "The compressed output stream is: ";
//    			// for (int i = 0; i < compressed_size; i++) {
//        		// 	printf("%02X ", compressed_data[i]);
//    			// }

//            	uint32_t header = (compressed_size << 1) | 0;
//            	append_uint32_LE(output_buffer, header);

//            	output_buffer.insert(output_buffer.end(), compressed_data, compressed_data + compressed_size);


// 		delete[] compressed_data;
	

// 		}
// 		q.finish();

//     }
    
	

// 	total_time.stop();
// 	FILE *outfd = fopen("output_cpu.bin", "wb");
// 	int bytes_written = fwrite(&file[0], 1, offset, outfd);
// 	printf("write file with %d\n", bytes_written);
// 	fclose(outfd);


//     FILE* out = fopen("output.bin", "wb");
//     size_t bytes_output_written = fwrite(output_buffer.data(), 1, output_buffer.size(), out);
//     std::cout << "Output written with " << bytes_output_written << " bytes\n";
//     fclose(out);




// 	for (int i = 0; i < NUM_PACKETS; i++) {
// 		free(input[i]);
// 	}

// 	free(file);


// 	q.finish();
// 	// std::cout << "--------------- Key Throughputs ---------------" << std::endl;
// 	// float ethernet_latency = ethernet_timer.latency() / 1000.0;
// 	// float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency; // Mb/s
// 	// std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
// 	// 		<< " (Latency: " << ethernet_latency << "s)." << std::endl;

// 	float cdc_latency = cdc_time.latency() / 1000.0;
// 	float cdc_throughput = (bytes_written * 8 / 1000000.0) / cdc_latency; // Mb/s
// 	std::cout << "Cdc Throughput to Encoder: " << cdc_throughput << " Mb/s."
// 			<< " (Latency: " << cdc_latency << "s)." << std::endl;

// 	float sha_latency = sha_time.latency() / 1000.0;
// 	float sha_throughput = (bytes_written * 8 / 1000000.0) / sha_latency; // Mb/s
// 	std::cout << "Sha Throughput to Encoder: " << sha_throughput << " Mb/s."
// 			<< " (Latency: " << sha_latency << "s)." << std::endl;

// 	float lzw_latency = lzw_time.latency() / 1000.0;
// 	float lzw_throughput = (bytes_written * 8 / 1000000.0) / lzw_latency; // Mb/s
// 	std::cout << "Lzw Throughput to Encoder: " << lzw_throughput << " Mb/s."
// 			<< " (Latency: " << lzw_latency << "s)." << std::endl;


// 	float dedup_latency = dedup_time.latency() / 1000.0;
// 	float dedup_throughput = (bytes_written * 8 / 1000000.0) / dedup_latency; // Mb/s
// 	std::cout << "dedup Throughput to Encoder: " << dedup_throughput << " Mb/s."
// 			<< " (Latency: " << dedup_latency << "s)." << std::endl;

// 	float output_latency = total_time.latency() / 1000.0;
// 	float output_throughput = (bytes_written * 8 / 1000000.0) / output_latency; // Mb/s
// 	std::cout << "Output Throughput to Encoder: " << output_throughput << " Mb/s."
// 			<< " (Latency: " << output_latency << "s)." << std::endl;

// // ------------------------------------------------------------------------------------
// // Step 4: Check Results and Release Allocated Resources
// // ------------------------------------------------------------------------------------

//     delete[] fileBuf;




    

//     // std::cout << "--------------- Key execution times ---------------" << std::endl;
//     // timer.print();

//     // std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl; 
//     // return (match ? EXIT_SUCCESS : EXIT_FAILURE);
//     // return 0;
// }

































// // out of order
// #define CL_HPP_CL_1_2_DEFAULT_BUILD
// #define CL_HPP_TARGET_OPENCL_VERSION 120
// #define CL_HPP_MINIMUM_OPENCL_VERSION 120
// #define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
// #define CL_USE_DEPRECATED_OPENCL_1_2_APIS

// #include <stdio.h>
// #include <stdint.h>
// #include <stdlib.h>
// #include <string.h>
// #include <iostream>
// #include <CL/cl2.hpp>
// #include "server.h"
// #include <unistd.h>
// #include <math.h>
// #include <fcntl.h>
// #include <pthread.h>
// #include <errno.h>
// #include <fcntl.h>
// #include <sys/mman.h>
// #include <fstream>
// #include <bitset>


// #include <unordered_map>
// #include <cstdint>
// #include <cstdlib>
// #include <vector>
// #include "Common/Utilities.h"
// #include "stopwatch.h"
// #include "Common/EventTimer.h"



// #define NUM_PACKETS 8
// #define PIPE_DEPTH 4
// #define DONE_BIT_L (1 << 7)
// #define DONE_BIT_H (1 << 15)



// #define NUM_ELEMENTS 16384
// #define HEADER 2
// #define MAX_NUM 256
// #define FILE_BUFFER_LIMIT 70000000
// #define OUTPUT_BUFFER_LIMIT 70000000
// #define MAX_COMPRESSED_SIZE 20000
// #define MAX_BOUNDARY 512
// //#define BATCH_SIZE 100
// using namespace std;



// int offset = 0;
// unsigned char* file;

// void handle_input(int argc, char* argv[], int* blocksize) {
// 	int x;
// 	extern char *optarg;

// 	while ((x = getopt(argc, argv, ":b:")) != -1) {
// 		switch (x) {
// 		case 'b':
// 			*blocksize = atoi(optarg);
// 			printf("blocksize is set to %d optarg\n", *blocksize);
// 			break;
// 		case ':':
// 			printf("-%c without parameter\n", optopt);
// 			break;
// 		}
// 	}
// }

// void append_uint32_LE(std::vector<uint8_t> &buffer, uint32_t value)
// {
//     buffer.push_back(static_cast<uint8_t>(value & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>8 & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>16 & 0xFF));
//     buffer.push_back(static_cast<uint8_t>(value>>24 & 0xFF));
// }



// int main(int argc, char** argv)
// {
// // Initialize an event timer we'll use for monitoring the application
//     EventTimer timer;
// // ------------------------------------------------------------------------------------
// // Step 1: Initialize the OpenCL environment 
// // ------------------------------------------------------------------------------------ 
//     timer.add("OpenCL Initialization");
//     cl_int err;
//     std::string binaryFile = argv[1];
//     unsigned fileBufSize;
//     auto constexpr krnl_num = 4;    
//     std::vector<cl::Device> devices = get_xilinx_devices();
//     devices.resize(1);
//     cl::Device device = devices[0];
//     cl::Context context(device, NULL, NULL, NULL, &err);
//     char* fileBuf = read_binary_file(binaryFile, fileBufSize);
//     cl::Program::Binaries bins{{fileBuf, fileBufSize}};
//     cl::Program program(context, devices, bins, NULL, &err);

//     // cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);
// 	std::vector<cl::Kernel> krnls(krnl_num);
// 	for (int i = 0; i < krnl_num; i++) {
// 		OCL_CHECK(err, LZW_fpga[i] = cl::Kernel(program, "lzw", &err));
//         CL_CHECK(err, q[i] = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err));
//     }
// 	//cl::Kernel LZW_fpga(program,"lzw",&err);

// 	//implement multi-kernels
// 	// std::vector<cl::Kernel> multi_kernels(NUM_KERNELS);

// 	// for(int i = 0; i < NUM_KERNELS; i++){
// 	// 	multi_kernels[i] = cl::Kernel(program,"lzw_multi_chunks", &err);
// 	// }

// // ------------------------------------------------------------------------------------
// // Step 2: Create buffers and initialize test values
// // ------------------------------------------------------------------------------------
//     timer.add("Allocate contiguous OpenCL buffers");


// 	unsigned char *Chunk[krnl_num];
// 	unsigned int *Chunk_size[krnl_num];
//     unsigned char*Compressed_data[krnl_num];   
// 	unsigned int *Compressed_size[krnl_num]



//     std::vector<cl::Buffer> Chunk_buffer(krnl_num);
// 	std::vector<cl::Buffer> Chunk_size_buffer(krnl_num);
// 	std::vector<cl::Buffer> Compressed_data_buffer(krnl_num);
// 	std::vector<cl::Buffer> Compressed_size_buffer(krnl_num);


//     // dont know what is MAX_BOUNDARY???


//     std::vector<cl::Event> write_done(MAX_BOUNDARY);
// 	// std::vector<cl::Event> write_waitlist;
// 	std::vector<std::vector<cl::Event>> write_waitlist(krnl_num);
// 	std::vector<std::vector<cl::Event>> execute_waitlist(MAX_BOUNDARY);
// 	std::vector<cl::Event> execute_done(MAX_BOUNDARY);
// 	// std::vector<cl::Event> read_waitlist;
// 	std::vector<std::vector<cl::Event>> read_waitlist(krnl_num);
// 	std::vector<cl::Event> read_done(MAX_BOUNDARY);

//     for (int j = 0; j < krnl_num; j++){
// 		OCL_CHECK(err,
// 				Chunk_buffer[j] = cl::Buffer(context, CL_MEM_READ_ONLY, MAX_CHUNK_SIZE, NULL, &err));
// 		OCL_CHECK(err,
// 				Chunk_size_buffer[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned int), NULL, &err));
// 		OCL_CHECK(err,
// 				Compressed_data_buffer[j] = cl::Buffer(context, CL_MEM_READ_ONLY, MAX_COMPRESSED_SIZE, NULL, &err));
// 		OCL_CHECK(err,
// 				Compressed_size_buffer[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned int), NULL, &err));
		
// 		Compressed_data[j] = (unsigned char*)q[j].enqueueMapBuffer(Compressed_data_buffer[j], CL_TRUE, CL_MAP_READ, 0, Output_buf_size, NULL, NULL, &err);
// 		if (err != CL_SUCCESS) 
// 			printf("map Compressed data failed\n");
// 		Compressed_size[j] = (unsigned int*)q[j].enqueueMapBuffer(Compressed_size_buffer[j], CL_TRUE, CL_MAP_WRITE, 0, sizeof(uint16_t), NULL, NULL, &err);
// 		if (err != CL_SUCCESS) 
// 			printf("map Compressed size failed failed\n");
// 		Chunk_size[j] = (unsigned int*)q[j].enqueueMapBuffer(Chunk_size_buffer[j], CL_TRUE, CL_MAP_READ, 0, sizeof(uint16_t), NULL, NULL, &err);
// 		if (err != CL_SUCCESS) 
// 			printf("map Chunk size  failed\n");
// 	}
	


// 	// cl::Buffer Chunk_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY, MAX_CHUNK * 10000,nullptr, &err);
//     // cl::Buffer Chunk_size_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY,  MAX_CHUNK * sizeof(unsigned int),nullptr, &err);
//     // cl::Buffer Compressed_data_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_WRITE_ONLY, MAX_CHUNK * MAX_COMPRESSED_SIZE, nullptr, &err);
// 	// cl::Buffer Compressed_size_buffer(context, CL_MEM_WRITE_ONLY, MAX_CHUNK * sizeof(unsigned int), nullptr, &err);

// 	// unsigned char* Chunk;
// 	// unsigned int *Chunk_size;
//    	// uint8_t* Compressed_data;
// 	// unsigned int*Compressed_size;


//     timer.add("Populating buffer inputs");

// // ------------------------------------------------------------------------------------
// // Step 3: Run the kernel
// // ------------------------------------------------------------------------------------
// 	stopwatch ethernet_timer;
// 	unsigned char* input[NUM_PACKETS];
// 	int writer = 0;
// 	int done = 0;
// 	int length = 0;
// 	int count = 0;
// 	int blocksize = BLOCKSIZE;
//     int offset = 0;
//     unsigned char* file;
//     std::vector<uint8_t> output_buffer;
// 	ESE532_Server server;




// 	// set blocksize if decalred through command line
// 	handle_input(argc, argv, &blocksize);

// 	file = (unsigned char*) malloc(sizeof(unsigned char) * FILE_BUFFER_LIMIT);
// 	if (file == NULL) {
//         std::cerr << "Failed to allocate memory for file buffer.\n";
//         return 1;
//     }

// 	for (int i = 0; i < NUM_PACKETS; i++) {
//         input[i] = (unsigned char*) malloc(sizeof(unsigned char) * (NUM_ELEMENTS + HEADER));
//         if (input[i] == NULL) {
//             std::cerr << "Failed to allocate memory for input buffer " << i << std::endl;
//             return 1;
//         }
//     }

// 	server.setup_server(blocksize);

//     writer = PIPE_DEPTH;
//     server.get_packet(input[writer]);
//     count++;

//     // Get initial packet
//     unsigned char* buffer = input[writer];

//     // Decode
//     done = buffer[1] & DONE_BIT_L;
//     length = buffer[0] | (buffer[1] << 8);
//     length &= ~DONE_BIT_H;

//     // Copy data into file_buffer
//     memcpy(&file[offset], &buffer[HEADER], length);
//     offset += length;
//     writer++;



// 	stopwatch total_time;
// 	stopwatch lzw_time;
// 	stopwatch cdc_time;
// 	stopwatch sha_time;
// 	stopwatch dedup_time;

// 	//last message
//     while (!done) {
//         if (writer == NUM_PACKETS) {
//             writer = 0;
//         }

//         ethernet_timer.start();
//         server.get_packet(input[writer]);
//         ethernet_timer.stop();

//         unsigned char* buffer = input[writer];


//         done = buffer[1] & DONE_BIT_L;
//         length = buffer[0] | (buffer[1] << 8);
//         length &= ~DONE_BIT_H;

//         memcpy(&file[offset], &buffer[HEADER], length);

// 		offset += length;

        
//         //free(buffer);

//         writer++;
//     }
// 		// encode the obtained information in buffer

// 		// initialize the vector to store the obtained chunks

//     unsigned char* chunks[MAX_CHUNK];
//     unsigned int chunk_count;
//     unsigned int chunk_sizes[MAX_CHUNK];
// 	unsigned int lzw_index = 0;

// 	total_time.start();

// 	cdc_time.start();
//     fast_cdc(file, offset, chunks, chunk_sizes, &chunk_count, MAX_CHUNK);
// 	cdc_time.stop();

//     std::unordered_set<std::string> hash_table;
//     std::map<std::string, int> lzw_cache;
//     std::vector<std::string> hash_value(chunk_count);
//     std::vector<bool> is_duplicate(chunk_count, false);
//     std::vector<int> dedup_indices(chunk_count, -1);	

//     for (unsigned int i = 0; i < chunk_count; i++) {
//         // unsigned char* chunk = chunks[i];
//         // unsigned int chunk_size_sha = chunk_sizes[i];
//         sha_time.start();
//         hash_value[i] = sha256(chunks[i],  chunk_sizes[i]);
//         sha_time.stop();

//         dedup_time.start();
//         is_duplicate[i] = deduplication(hash_table, hash_value[i]);
//         dedup_time.stop();
//         if (is_duplicate[i]) {
//             // lzw_cache[hash_value[i]]=lzw_index;
//             // lzw_index++;
//             dedup_indices[i] = lzw_cache[hash_value[i]];
//         }
//         else{
//             lzw_cache[hash_value[i]]=i;
//             //lzw_index++;
//         }
        
//     }

//     for (unsigned int batch_start = 0; batch_start < chunk_count; batch_start += BATCH_SIZE) {
        
//         unsigned int batch_end = std::min(batch_start + BATCH_SIZE, chunk_count);
//         unsigned int batch_size = batch_end - batch_start;

//         std::vector<uint8_t> compressed_window(batch_size * MAX_COMPRESSED_SIZE);
//         std::vector<unsigned int> chunk_offsets(batch_size, 0);
//         std::vector<unsigned int> chunk_lengths(batch_size, 0);

//         unsigned int compressed_size=0;
//         q.enqueueWriteBuffer(Compressed_size_buffer, CL_TRUE, 0, sizeof(unsigned int), &compressed_size);
//         q.finish();


// 	    unsigned char* Chunk = (unsigned char*)q.enqueueMapBuffer(Chunk_buffer, CL_TRUE, CL_MAP_WRITE, 0, batch_size * MAX_COMPRESSED_SIZE);
//         unsigned int* Chunk_sizes = (unsigned int*)q.enqueueMapBuffer(Chunk_size_buffer, CL_TRUE, CL_MAP_WRITE, 0,batch_size * sizeof(unsigned int));


//         unsigned int current_offset = 0; 

// 	    for (unsigned int i = batch_start; i < batch_end; i++) {
//             unsigned int local_index = i - batch_start;
//             if (!is_duplicate[i]) {
//                 if (chunk_sizes[i] == 0) {
//                     std::cerr << "Error: Chunk size is 0 for chunk " << i << std::endl;
//                     exit(EXIT_FAILURE);
//                 }
//                 memcpy(Chunk + current_offset, chunks[i], chunk_sizes[i]);
//                 Chunk_sizes[local_index] = chunk_sizes[i];
//                 chunk_offsets[local_index] = current_offset;
//                 chunk_lengths[local_index] = chunk_sizes[i];
//                 current_offset += chunk_sizes[i];
//             } else {
//                 Chunk_sizes[local_index] = 0; 
//             }
//         }

// 	    q.enqueueUnmapMemObject(Chunk_buffer, Chunk);
//         q.enqueueUnmapMemObject(Chunk_size_buffer, Chunk_sizes);
//         q.finish();

//         std::vector<cl::Event> w_wl;
//         for (unsigned int i = batch_start; i < batch_end; i++) {
//             cl::Event w_ev, x_ev, r1_ev, r2_ev;
//             std::vector<cl::Event> x_wl, r1_wl,r2_wl;	
//             unsigned int local_index = i - batch_start;
//             if (is_duplicate[i]) {
//                 uint32_t header = (dedup_indices[i] << 1) | 0x1;
//                 append_uint32_LE(output_buffer, header);
//             } else {
//                 unsigned int compressed_size = 0;


//                 LZW_fpga.setArg(0, Chunk_buffer);
//                 LZW_fpga.setArg(1, Chunk_size_buffer);
//                 LZW_fpga.setArg(2, Compressed_data_buffer);
//                 LZW_fpga.setArg(3, Compressed_size_buffer);

//                 if (current_offset == 0) {
//                     std::cerr << "Error: No data to migrate for this batch. Skipping migration." << std::endl;
//                     continue;
//                 }

//                 if (batch_start == 0) {
//                 q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer,Compressed_size_buffer}, 0, NULL, &w_ev);  
//                 } 
//                 else {
//                 q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer,Compressed_size_buffer}, 0, &w_wl, &w_ev);			
                
//                 w_wl.pop_back();

//                 }
//                 x_wl.push_back(w_ev);

//                 lzw_time.start();
//                 q.enqueueTask(LZW_fpga, &x_wl, &x_ev);
//                 clWaitForEvents(1, (const cl_event*)&x_ev);
//                 lzw_time.stop();
//                 r1_wl.push_back(x_ev);

//                 q.enqueueReadBuffer(Compressed_size_buffer, CL_TRUE, local_index * sizeof(unsigned int), sizeof(unsigned int), &compressed_size,&r1_wl,&r1_ev);
//                 r2_wl.push_back(x_ev);
//                 //uint8_t* compressed_data = new uint8_t[compressed_size];
//                 q.enqueueReadBuffer(Compressed_data_buffer, CL_TRUE, local_index * MAX_COMPRESSED_SIZE, compressed_size, compressed_window.data() + chunk_offsets[local_index],&r2_wl,&r2_ev);
//                 w_wl.push_back(r2_ev);
//                 q.finish();

//                 uint32_t header = (compressed_size << 1) | 0;
//                 append_uint32_LE(output_buffer, header);
//                 output_buffer.insert(output_buffer.end(), compressed_window.begin() + chunk_offsets[local_index], compressed_window.begin() + chunk_offsets[local_index] + compressed_size);
//             }
//         }




//         total_time.stop();    
        
//         FILE *outfd = fopen("output_cpu.bin", "wb");
//         int bytes_written = fwrite(&file[0], 1, offset, outfd);
//         printf("write file with %d\n", bytes_written);
//         fclose(outfd);


//         FILE* out = fopen("output.bin", "wb");
//         size_t bytes_output_written = fwrite(output_buffer.data(), 1, output_buffer.size(), out);
//         std::cout << "Output written with " << bytes_output_written << " bytes\n";
//         fclose(out);




//         for (int i = 0; i < NUM_PACKETS; i++) {
//             free(input[i]);
//         }

//         free(file);

//         // std::cout << "--------------- Key Throughputs ---------------" << std::endl;
//         // float ethernet_latency = ethernet_timer.latency() / 1000.0;
//         // float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency; // Mb/s
//         // std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
//         // 		<< " (Latency: " << ethernet_latency << "s)." << std::endl;

//         float cdc_latency = cdc_time.latency() / 1000.0;
//         float cdc_throughput = (bytes_written * 8 / 1000000.0) / cdc_latency; // Mb/s
//         std::cout << "Cdc Throughput to Encoder: " << cdc_throughput << " Mb/s."
//                 << " (Latency: " << cdc_latency << "s)." << std::endl;

//         float sha_latency = sha_time.latency() / 1000.0;
//         float sha_throughput = (bytes_written * 8 / 1000000.0) / sha_latency; // Mb/s
//         std::cout << "Sha Throughput to Encoder: " << sha_throughput << " Mb/s."
//                 << " (Latency: " << sha_latency << "s)." << std::endl;

//         float lzw_latency = lzw_time.latency() / 1000.0;
//         float lzw_throughput = (bytes_written * 8 / 1000000.0) / lzw_latency; // Mb/s
//         std::cout << "Lzw Throughput to Encoder: " << lzw_throughput << " Mb/s."
//                 << " (Latency: " << lzw_latency << "s)." << std::endl;


//         float dedup_latency = dedup_time.latency() / 1000.0;
//         float dedup_throughput = (bytes_written * 8 / 1000000.0) / dedup_latency; // Mb/s
//         std::cout << "dedup Throughput to Encoder: " << dedup_throughput << " Mb/s."
//                 << " (Latency: " << dedup_latency << "s)." << std::endl;

//         float output_latency = total_time.latency() / 1000.0;
//         float output_throughput = (bytes_written * 8 / 1000000.0) / output_latency; // Mb/s
//         std::cout << "Output Throughput to Encoder: " << output_throughput << " Mb/s."
//                 << " (Latency: " << output_latency << "s)." << std::endl;

// // ------------------------------------------------------------------------------------
// // Step 4: Check Results and Release Allocated Resources
// // ------------------------------------------------------------------------------------

//         delete[] fileBuf;

//         // std::cout << "--------------- Key execution times ---------------" << std::endl;
//         // timer.print();

//         // std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl; 
//         // return (match ? EXIT_SUCCESS : EXIT_FAILURE);
//         // return 0;
//     }
// }












//final

#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <CL/cl2.hpp>
#include "server.h"
#include <unistd.h>
#include <thread>
#include <math.h>
#include <fcntl.h>
#include <pthread.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <fstream>
#include <bitset>


#include <unordered_map>
#include <cstdint>
#include <cstdlib>
#include <vector>
#include "Common/Utilities.h"
#include "stopwatch.h"
#include "Common/EventTimer.h"
#include "cdc.h"
#include "sha.h"
#include "Dedup.h"




#define NUM_PACKETS 8
#define PIPE_DEPTH 4
#define DONE_BIT_L (1 << 7)
#define DONE_BIT_H (1 << 15)
#define num_chunks_krnl (4)



#define NUM_ELEMENTS 16384
#define HEADER 2
#define MAX_NUM 256
#define FILE_BUFFER_LIMIT 70000000
#define OUTPUT_BUFFER_LIMIT 70000000
#define MAX_COMPRESSED_SIZE 20000
#define MAX_BOUNDARY 512
//#define BATCH_SIZE 100
using namespace std;
#define Max_Chunk_Size 20000000



int offset = 0;
unsigned char* file;

void handle_input(int argc, char* argv[], int* blocksize) {
	int x;
	extern char *optarg;

	while ((x = getopt(argc, argv, ":b:")) != -1) {
		switch (x) {
		case 'b':
			*blocksize = atoi(optarg);
			printf("blocksize is set to %d optarg\n", *blocksize);
			break;
		case ':':
			printf("-%c without parameter\n", optopt);
			break;
		}
	}
}

void append_uint32_LE(std::vector<uint8_t> &buffer, uint32_t value)
{
    buffer.push_back(static_cast<uint8_t>(value & 0xFF));
    buffer.push_back(static_cast<uint8_t>(value>>8 & 0xFF));
    buffer.push_back(static_cast<uint8_t>(value>>16 & 0xFF));
    buffer.push_back(static_cast<uint8_t>(value>>24 & 0xFF));
}



int main(int argc, char** argv)
{
// Initialize an event timer we'll use for monitoring the application
    EventTimer timer;
    pin_main_thread_to_cpu0();
    if (argc < 2)
	{
		std::cout << "No compressed file defined\n";
		return 1;
	}

	stopwatch ethernet_timer;
	unsigned char* input[NUM_PACKETS];
	int writer = 0;
	int done = 0;
	int length = 0;
	int count = 0;
	int blocksize = BLOCKSIZE;
    int offset = 0;
    unsigned char* file;
    std::vector<uint8_t> output_buffer;
	ESE532_Server server;















// ------------------------------------------------------------------------------------
// Step 1: Initialize the OpenCL environment 
// ------------------------------------------------------------------------------------ 
    timer.add("OpenCL Initialization");
    cl_int err;
    std::string binaryFile = argv[1];
    unsigned fileBufSize;
    auto constexpr krnl_num = 4;    
    

    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char* fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);

    cl_ulong maxAllocSize = device.getInfo<CL_DEVICE_MAX_MEM_ALLOC_SIZE>();
	std::cout << "Max CL::buffer size: " << maxAllocSize << " bytes" << std::endl;

    // cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);
	std::vector<cl::CommandQueue> q(krnl_num);
    std::vector<cl::Kernel> LZW_fpga(krnl_num);
	for (int i = 0; i < krnl_num; i++) {
		OCL_CHECK(err, LZW_fpga[i] = cl::Kernel(program, "lzw", &err));
        OCL_CHECK(err, q[i] = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err));
    }


// ------------------------------------------------------------------------------------
// Step 2: Create buffers and initialize test values
// ------------------------------------------------------------------------------------
    timer.add("Allocate contiguous OpenCL buffers");


    unsigned char *Chunks_LZW[krnl_num];
	uint32_t *cdc_offset;   //cdc chunks offset: should be cdc_offset += chunks' size 
	uint16_t *chunk_size = (uint16_t *)malloc(sizeof(uint16_t));     //input chunk size to cdc
	uint16_t *chunk_size_dedup = (uint16_t *)malloc(sizeof(uint16_t));     //input chunk size to dedup
	uint16_t *chunk_size_LZW = (uint16_t *)malloc(sizeof(uint16_t));       //input chunk size to LZW
	unsigned char *cdc_pipeline_index;         //flag whether cdc has finished: it's the output "pipeline_drained" of cdc
	unsigned char *pipeline_drained;     //determine the stage in draining pipeline: 2 -> the last stage of pipeline: only execute LZW or not
	uint16_t *ArrayOfCode[MAX_BOUNDARY];     //Array to store all the codes need to be written to file
											//the first 16bits determine whether the chunk is deduplicated or not: 1 -> dedup; 0 -> LZW
	uint16_t ArrayOfOutputLength_LZW[MAX_BOUNDARY];     //Array to store the output codes length of each chunk
    std::unordered_map<string, uint32_t> chunkTable;     //hash table in dedup
    uint32_t deDup_header;     //output of deDup function    //header from dedup
	uint32_t deDup_header_LZW;      //header propagated to LZW
	uint16_t *LZW_input_length[krnl_num];     //the input chunks bytes size of each compute unit
    uint16_t *LZW_output_length[krnl_num];    //the output code bytes size of each compute unit
	uint16_t *LZW_send_data[krnl_num];        //the output code of each compute unit
	unsigned char LZW_chunks_cnt = 0;                //indicates the chunk index in current kernel: 0 -> num_chunks_krnl (the number of chunks each kernel receives)
	unsigned char LZW_chunks_idx[krnl_num][num_chunks_krnl];            //store the chunk index of the LZW chunks (needed when writing output code to file)
	unsigned char num_used_krnls = 0;                //the number of actual used kernels
    // uint16_t *LZW_send_data = (uint16_t *)calloc(Max_Chunk_Size + 2, sizeof(uint16_t));     //Max_Chunk_Size + 32bits header -> unit is 16bits

	*chunk_size = 0;    //initialize input chunk size
	*chunk_size_dedup = 0;
	*chunk_size_LZW = 0;

	cdc_offset = (uint32_t *)malloc(sizeof(uint32_t));
	cdc_pipeline_index = (unsigned char *)malloc(sizeof(unsigned char));
	pipeline_drained = (unsigned char *)malloc(sizeof(unsigned char));

	unsigned char *chunk_cdc = (unsigned char *)malloc(Max_Chunk_Size);    //output chunk from cdc
	unsigned char *chunk_dedup = (unsigned char *)malloc(Max_Chunk_Size); //output chunk propagated to dedup
	unsigned char *chunk_LZW = (unsigned char *)malloc(Max_Chunk_Size);     //output chunk propagated to LZW
	unsigned char *chunk_temp = (unsigned char *)malloc(Max_Chunk_Size);     //used for pointer exchange for these chunk pointers

	for (int i = 0; i < MAX_BOUNDARY; i++){
		ArrayOfCode[i] = (uint16_t *)calloc(Max_Chunk_Size + 1, sizeof(uint16_t));    //malloc and initialize ArrayOfCode to 0's

	}


    FILE *File = fopen(argv[1], "wb");




	// unsigned char *Chunks_LZW[krnl_num];
	// unsigned int *Chunks_LZW_size[krnl_num];
    // unsigned char*LZW_Compressed_data[krnl_num];   
	// unsigned int *LZW_Compressed_size[krnl_num]

    // std::vector<cl::Buffer> Chunks_LZW_buffer(krnl_num);
	// std::vector<cl::Buffer> Chunks_LZW_size_buffer(krnl_num);
	// std::vector<cl::Buffer> LZW_Compressed_data_buffer(krnl_num);
	// std::vector<cl::Buffer> LZW_Compressed_size_buffer(krnl_num);

	std::vector<cl::Buffer> Input_buf(krnl_num);   
	std::vector<cl::Buffer> Output_buf(krnl_num);
	std::vector<cl::Buffer> In_length_buf(krnl_num);
	std::vector<cl::Buffer> Output_length_buf(krnl_num);



	uint32_t Input_buf_size = Max_Chunk_Size * num_chunks_krnl;
	uint32_t Output_buf_size = (Max_Chunk_Size + 2) * num_chunks_krnl * sizeof(uint16_t);
	char In_length_buf_size = sizeof(uint16_t) * num_chunks_krnl;
	char Output_length_buf_size = sizeof(uint16_t) * num_chunks_krnl;

    // dont know what is MAX_BOUNDARY???


    // std::vector<cl::Event> write_done(MAX_BOUNDARY);
	// // std::vector<cl::Event> write_waitlist;
	// std::vector<std::vector<cl::Event>> write_waitlist(krnl_num);
	// std::vector<std::vector<cl::Event>> execute_waitlist(MAX_BOUNDARY);
	// std::vector<cl::Event> execute_done(MAX_BOUNDARY);
	// // std::vector<cl::Event> read_waitlist;
	// std::vector<std::vector<cl::Event>> read_waitlist(krnl_num);
	// std::vector<cl::Event> read_done(MAX_BOUNDARY);

    // for (int j = 0; j < krnl_num; j++){
	// 	OCL_CHECK(err,
	// 			ChunkS_LZW_buffer[j] = cl::Buffer(context, CL_MEM_READ_ONLY, MAX_CHUNK_SIZE, NULL, &err));
	// 	OCL_CHECK(err,
	// 			ChunkS_LZW_size_buffer[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned int), NULL, &err));
	// 	OCL_CHECK(err,
	// 			LZW_Compressed_data_buffer[j] = cl::Buffer(context, CL_MEM_READ_ONLY, MAX_COMPRESSED_SIZE, NULL, &err));
	// 	OCL_CHECK(err,
	// 			LZW_Compressed_size_buffer[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned int), NULL, &err));
		
    //     Chunks_LZW[j] = (char*)q[j].enqueueMapBuffer(Chunk_LZW_buffer[j], CL_TRUE, CL_MAP_WRITE, 0, (Max_Chunk_Size * num_chunks_krnl), NULL, NULL, &err);
	// 	if (err != CL_SUCCESS) 
	// 		printf("map Chunks_LZW failed\n");
	// 	LZW_Compressed_data[j] = (unsigned char*)q[j].enqueueMapBuffer(LZW_Compressed_data_buffer[j], CL_TRUE, CL_MAP_READ, 0, Output_buf_size, NULL, NULL, &err);
	// 	if (err != CL_SUCCESS) 
	// 		printf("map Compressed data failed\n");
	// 	LZW_Compressed_size[j] = (unsigned int*)q[j].enqueueMapBuffer(LZW_Compressed_size_buffer[j], CL_TRUE, CL_MAP_WRITE, 0, sizeof(uint16_t), NULL, NULL, &err);
	// 	if (err != CL_SUCCESS) 
	// 		printf("map Compressed size failed failed\n");
	// 	Chunks_LZW_size[j] = (unsigned int*)q[j].enqueueMapBuffer(Chunk_size_buffer[j], CL_TRUE, CL_MAP_READ, 0, sizeof(uint16_t), NULL, NULL, &err);
	// 	if (err != CL_SUCCESS) 
	// 		printf("map Chunk size  failed\n");
	// }



		for (int j = 0; j < krnl_num; j++){
		//---: stimeet buffers' properties
		OCL_CHECK(err,
				Input_buf[j] = cl::Buffer(context, CL_MEM_READ_ONLY, Input_buf_size, NULL, &err));
		OCL_CHECK(err,
				Output_buf[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_buf_size, NULL, &err));
		OCL_CHECK(err,
				In_length_buf[j] = cl::Buffer(context, CL_MEM_READ_ONLY, In_length_buf_size, NULL, &err));
		OCL_CHECK(err,
				Output_length_buf[j] = cl::Buffer(context, CL_MEM_WRITE_ONLY, Output_length_buf_size, NULL, &err));
		
		//--- : map buffers to local variables
		LZW_send_data[j] = (uint16_t*)q[j].enqueueMapBuffer(Output_buf[j], CL_TRUE, CL_MAP_READ, 0, Output_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_send_data failed\n");
		LZW_input_length[j] = (uint16_t*)q[j].enqueueMapBuffer(In_length_buf[j], CL_TRUE, CL_MAP_WRITE, 0, In_length_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_input_length failed\n");
		LZW_output_length[j] = (uint16_t*)q[j].enqueueMapBuffer(Output_length_buf[j], CL_TRUE, CL_MAP_READ, 0, Output_length_buf_size, NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map LZW_output_length failed\n");
	}

	for (int j = 0; j < krnl_num; j++){
		Chunks_LZW[j] = (unsigned char*)q[j].enqueueMapBuffer(Input_buf[j], CL_TRUE, CL_MAP_WRITE, 0, (Max_Chunk_Size * num_chunks_krnl), NULL, NULL, &err);
		if (err != CL_SUCCESS) 
			printf("map ArrayOfChunks_LZW failed\n");
	}
	


	// cl::Buffer Chunk_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY, MAX_CHUNK * 10000,nullptr, &err);
    // cl::Buffer Chunk_size_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_READ_ONLY,  MAX_CHUNK * sizeof(unsigned int),nullptr, &err);
    // cl::Buffer Compressed_data_buffer(context, CL_MEM_ALLOC_HOST_PTR |CL_MEM_WRITE_ONLY, MAX_CHUNK * MAX_COMPRESSED_SIZE, nullptr, &err);
	// cl::Buffer Compressed_size_buffer(context, CL_MEM_WRITE_ONLY, MAX_CHUNK * sizeof(unsigned int), nullptr, &err);

	// unsigned char* Chunk;
	// unsigned int *Chunk_size;
   	// uint8_t* Compressed_data;
	// unsigned int*Compressed_size;


    timer.add("Populating buffer inputs");

// ------------------------------------------------------------------------------------
// Step 3: Run the kernel
// ------------------------------------------------------------------------------------
	stopwatch total_timer;
	stopwatch cdc_timer;
	stopwatch sha_timer;
	stopwatch dedup_timer;
    stopwatch lzw_timer;
	
	int deDup_final_bytes = 0; //total bytes of dedup headers
	int LZW_final_bytes = 0;   //total bytes of LZW compressed data
	int LZW_total_input_bytes = 0;   //total bytes of all LZW input chunks  (used for compression ratio & contribution of dedup and LZW)
	std::thread core_1_thread;   //thread 1 in core 1 (for CDC)
	std::thread core_2_thread;   // thread 2 in core 2 (for sha and dedup)



	// set blocksize if decalred through command line
	handle_input(argc, argv, &blocksize);

	file = (unsigned char*) malloc(sizeof(unsigned char) * FILE_BUFFER_LIMIT);
	if (file == NULL) {
        std::cerr << "Failed to allocate memory for file buffer.\n";
        return 1;
    }

	for (int i = 0; i < NUM_PACKETS; i++) {
        input[i] = (unsigned char*) malloc(sizeof(unsigned char) * (NUM_ELEMENTS + HEADER));
        if (input[i] == NULL) {
            std::cerr << "Failed to allocate memory for input buffer " << i << std::endl;
            return 1;
        }
    }

	server.setup_server(blocksize);

    writer = PIPE_DEPTH;
    server.get_packet(input[writer]);
    count++;

    // Get initial packet
    unsigned char* buffer = input[writer];

    // Decode
    done = buffer[1] & DONE_BIT_L;
    length = buffer[0] | (buffer[1] << 8);
    length &= ~DONE_BIT_H;

    // Copy data into file_buffer
    memcpy(&file[offset], &buffer[HEADER], length);
    
    offset += length;
    writer++;

	//last message
    while (!done) {
        if (writer == NUM_PACKETS) {
            writer = 0;
        }

        ethernet_timer.start();
        server.get_packet(input[writer]);
        ethernet_timer.stop();
        
        count++;

        unsigned char* buffer = input[writer];


        done = buffer[1] & DONE_BIT_L;
        length = buffer[0] | (buffer[1] << 8);
        length &= ~DONE_BIT_H;
        // 不知道为什么不memcpy？？
        // memcpy(&file[offset], &buffer[HEADER], length);

		// offset += length;

        
        //free(buffer);

        writer++;
    
		// encode the obtained information in buffer

		// initialize the vector to store the obtained chunks
		int boundary_index = 0;      //used to record boundary number of a packet: 0, 1, 2, ...
		int loop_cnt = 0;          //pipeline while loop's loop index
		
        *cdc_offset = 0;         //refresh value before encoding the next packet   
		*cdc_pipeline_index = 0;
		*pipeline_drained = 0;   //refresh pipeline_drained flag to 0
		
        uint32_t krnl_in_offset[krnl_num] = {0};    //offset for chunk size of a single kernel: used when store input chunks of one kernel
		char krnl_index = 0;              //index for each kernel
		char krnl_chunks_cnt[krnl_num] = {0};      //count how many chunk a kernel has
		char num_krnl_loop_wr = 0;      //the number of iteration when writing the codes to file of one kernel
		uint32_t krnl_wr_offset = 0;    //offset for output code size of a single kernel: used when writing output codes to file
// printf("after define variable\n");

        if (count == 2) {
			//--- 2 packet:
			memcpy(&file[offset], &buffer[HEADER], length);
			offset += length;
		}else{
			//--- 1 packet:
			offset += length;
		}

        while (*pipeline_drained < 3){
            for (int i = 0; i < MAX_CHUNK; i++){
	            chunk_cdc[i] = 0;
            }

            if(!(*cdc_pipeline_index)){   //if cdc hasn't finished
				if (count == 2) {   //the first two packet enter this situation
					// printf("enter cdc, loop: %d\n", loop_cnt);
					//--- 2 packet:
					/* if (fread(buffer, 1, offset, &file[0]) != offset)
						Exit_with_error("fread for first two packets failed"); */
					// printf("before cdc, loop: %d\n", loop_cnt);
					//core_1_thread = std::thread(&cdc, file, offset, chunk_cdc, chunk_size, cdc_offset, cdc_pipeline_index, std::ref(cdc_timer));
					// printf("after cdc, loop: %d\n", loop_cnt);
					pin_thread_to_cpu(core_1_thread, 1);
					// cdc(file, offset, chunk, chunk_size, cdc_offset, cdc_finished);   //boundary_num should use char?
					/* FILE *outfd = fopen("test_chunks.bin", "wb");
					int bytes_written = fwrite(&file[0], 1, offset, outfd); */
				}else{    //other packets go into here
					//--- 1 packet:

printf("buffer:%p\n", &buffer[2]);
printf("length: %d\n", length);
printf("chunk_cdc:\n%s\n\n", chunk_cdc);
printf("chunk_size: %d\n", *chunk_size);
printf("cdc_offset: %d\n", *cdc_offset);
printf("cdc_finished: %d\n", *cdc_pipeline_index);

					//core_1_thread = std::thread(&cdc, &buffer[2], length, chunk_cdc, chunk_size, cdc_offset, cdc_pipeline_index, std::ref(cdc_timer));
					pin_thread_to_cpu(core_1_thread, 1);
					// cdc(&buffer[2], length, chunk, chunk_size, cdc_offset, cdc_finished);   //boundary_num should use char?
				}
			}  
            if ((loop_cnt > 0) && (*pipeline_drained < 2)){    //dedup start from the second iteration and stop when *pipeline_drain == 1
				// printf("enter deDup, loop: %d\n", loop_cnt);
				// printf("dedup chunk_size: %d, loop: %d\n", *chunk_size_dedup, loop_cnt);
				// printf("chunk dedup:\n%s\n", chunk_cdc);
                core_2_thread = std::thread([&]() {
                        // dedup_timer.start(); 

                        // // Step 1: 计算哈希值
                        // sha_timer.start();
                        // std::string hash_value = sha(reinterpret_cast<unsigned char*>(chunk_dedup), *chunk_size_dedup);
                        // sha_timer.stop();
                        // // Step 2: 去重处理
                        // deduplication(chunkTable, hash_value, deDup_header)
                        // dedup_timer.stop();
                });


				// printf(" deDup header: %x\n", deDup_header);
				pin_thread_to_cpu(core_2_thread, 2);
				// deDup_header = deDup(chunk_dedup, chunk_size, chunkTable, std::ref(SHA_timer));
				/* if ((deDup_header & 1u)){dd
					// std::cout << "deDup_header - boundary: " << (loop_cnt - 1) << std::endl;
					// printf("-----------------------------------------------\n"); 
					// if (fwrite(&deDup_header, 1, sizeof(deDup_header), File) != sizeof(deDup_header))
					// 	Exit_with_error("fwrite dedup header to compressed_data.bin failed");
					memcpy(ArrayOfCode[loop_cnt - 1] + 1, &deDup_header, sizeof(deDup_header));
					*ArrayOfCode[loop_cnt - 1] = 1;
					deDup_final_bytes += sizeof(deDup_header);
				} */
			}

            if ((!(deDup_header_LZW & 1u) || (*pipeline_drained == 2)) && (loop_cnt > 1)){
				//-----------------------map Input Buffer-----------------------------------
				if (!(deDup_header_LZW & 1u)){
					memcpy(Chunks_LZW[krnl_index] + krnl_in_offset[krnl_index], chunk_cdc, *chunk_size_LZW);   //store chunk to LZW in ArrayOfChunks_LZW
																										//krnl_idx declare which kernel the chunk should be sent to
					krnl_in_offset[krnl_index] += *chunk_size_LZW;      //used to move the pointer of ArrayOfChunks_LZW[krnl_idx]
					LZW_input_length[krnl_index][LZW_chunks_cnt] = *chunk_size_LZW;       //store LZW input chunk length for all kernels
					LZW_chunks_idx[krnl_index][LZW_chunks_cnt] = loop_cnt - 2;            //store the LZW chunk index among all chunks
					/* printf("\nLZW_header - boundary:%d\n", LZW_chunks_idx[krnl_idx][LZW_chunks_cnt]);
					printf("-----------------------------------------------\n"); */
					// printf("LZW chunk size: %d\n", *chunk_size_LZW);
					// std::cout << "\n" << "LZW_header - boundary: " << LZW_chunks_idx[LZW_chunks_cnt] << "" << std::endl;
				}
				//------------------------------------------------------------------------------
// printf("enter LZW loop\n");
// printf("debug----------pipeline_drained:\t%d\n", *pipeline_drained);

// printf("debug: kernel idx: %d\n", krnl_idx);
				if (((LZW_chunks_cnt < (num_chunks_krnl - 1)) || (krnl_index < (krnl_num - 1))) && (*pipeline_drained < 2)){
					krnl_chunks_cnt[krnl_index]++;
					krnl_index++;
					if (krnl_index == krnl_num){
						LZW_chunks_cnt++;
						krnl_index = 0;
// printf("pipeline drain = %d\n", *pipeline_drained);
// printf("kernel ++\n");
					}
				}else{
					if (!LZW_chunks_cnt){
						if (deDup_header_LZW & 1u){
							num_used_krnls = krnl_index;
						}else{
							num_used_krnls = krnl_index + 1;
							krnl_chunks_cnt[krnl_index]++;
						}
					}else{
						num_used_krnls = krnl_num;
						if (!(deDup_header_LZW & 1u)){
							krnl_chunks_cnt[krnl_index]++;
						}
					}

					for (int i = 0; i < num_used_krnls; i++){
						for (int j = krnl_chunks_cnt[i]; j < num_chunks_krnl; j++){
							LZW_input_length[i][j] = 0;
						}
					}

					// LZW_timer.start();
					// LZW_output_length = LZW_hybrid_hash_HW(ArrayOfChunks[i], in_length, LZW_send_data);
					//--------------------------------kernel computation --------------------------------
					for (int j = 0; j < num_used_krnls; j++){
						// krnl_LZW(ArrayOfChunks_LZW[j], LZW_input_length[j], LZW_send_data[j], LZW_output_length[j]);}
					
						// OCL_CHECK(err, err = krnls[j].setArg(0, Chunks_LZW_buffer[j]));
						// OCL_CHECK(err, err = krnls[j].setArg(1, Chunks_LZW_size_buffer[j]));
						// OCL_CHECK(err, err = krnls[j].setArg(2, LZW_Compressed_data_buffer[j]));
						// OCL_CHECK(err, err = krnls[j].setArg(3,LZW_Compressed_size_buffer[j]));

						// OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({Chunks_LZW_buffer[j]}, 0));
						// OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({Chunks_LZW_size_buffer[j]}, 0));
					
						OCL_CHECK(err, err = LZW_fpga[j].setArg(0, Input_buf[j]));
						OCL_CHECK(err, err = LZW_fpga[j].setArg(1, In_length_buf[j]));
						OCL_CHECK(err, err = LZW_fpga[j].setArg(2, Output_buf[j]));
						OCL_CHECK(err, err = LZW_fpga[j].setArg(3,Output_length_buf[j]));

						OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({In_length_buf[j]}, 0));
						OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({Input_buf[j]}, 0));
					
					
					
					
					}

					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = q[j].finish());
						OCL_CHECK(err, err = q[j].enqueueTask(LZW_fpga[j]));
					}

					for (int j = 0; j < num_used_krnls; j++){
						OCL_CHECK(err, err = q[j].finish());
						OCL_CHECK(err, err = q[j].enqueueMigrateMemObjects({Output_buf[j], Output_length_buf[j]}, CL_MIGRATE_MEM_OBJECT_HOST));
					}

					for (int j = 0; j < krnl_num; j++){
						OCL_CHECK(err, err = q[j].finish());
					}    
					 
					/* for (int j = 0; j < num_used_krnls; j++){
						read_done[j].wait();
					} */
					// LZW_timer.stop();
// printf("debug------------num_used_krnls:\t%d\n", num_used_krnls);
					for (int j = 0; j < num_used_krnls; j++){
						num_krnl_loop_wr = krnl_chunks_cnt[j];
// printf("debug------------krnl_chunks_cnt[%d]:\t%d\n", j, krnl_chunks_cnt[j]);
						for (int i = 0; i < num_krnl_loop_wr; i++){
							memcpy(ArrayOfCode[LZW_chunks_idx[j][i]] + 1, (LZW_send_data[j] + krnl_wr_offset), 
								LZW_output_length[j][i]);
							krnl_wr_offset += ((LZW_output_length[j][i] + sizeof(uint16_t) - 1) / sizeof(uint16_t));
// printf("LZW_chunks_idx[%d][%d]: %d\n", j, i, LZW_chunks_idx[j][i]);
							ArrayOfOutputLength_LZW[LZW_chunks_idx[j][i]] = LZW_output_length[j][i];
// printf("LZW_output_length[%d][%d]: %d\n", j, i, LZW_output_length[j][i]);
							/* q.enqueueUnmapMemObject(Input_buf[j], ArrayOfChunks_LZW[j]); */
							LZW_total_input_bytes += LZW_input_length[j][i];
							LZW_final_bytes += LZW_output_length[j][i];
						}
						krnl_wr_offset = 0;
					}

					for (int i = 0; i < krnl_num; i++){
						krnl_in_offset[i] = 0;
						krnl_chunks_cnt[i] = 0;
					}

					LZW_chunks_cnt = 0;
					krnl_index = 0;
					// LZW_timer.stop();
				}
// printf("after LZW\n");
			}
            
            
            
            if (!loop_cnt){
				core_1_thread.join();
			}else if((*pipeline_drained < 1) && (loop_cnt >0)){
				// printf("pipeline_drain: %d\n", *pipeline_drained);
				// printf("cdc_finished: %d\n", *cdc_finished);
				// printf("before join pipeline < 1, loop: %d\n", loop_cnt);
				core_1_thread.join();
				// printf("before join pipeline < 1 core2, loop: %d\n", loop_cnt);
				core_2_thread.join();
				// printf("after join pipeline < 1, loop: %d\n", loop_cnt);
			}else if((*pipeline_drained < 2) && (*cdc_pipeline_index)){
				// printf("before join pipeline < 2, loop: %d\n", loop_cnt);
				core_2_thread.join();
				// printf("after join pipeline < 2, loop: %d\n", loop_cnt);

			}

            if ((deDup_header & 1u) && (loop_cnt > 0) && (*pipeline_drained < 2)){
				// std::cout << "deDup_header - boundary: " << (loop_cnt - 1) << std::endl;
				memcpy(ArrayOfCode[loop_cnt - 1] + 1, &deDup_header, sizeof(deDup_header));
				*ArrayOfCode[loop_cnt - 1] = 1;
				deDup_final_bytes += sizeof(deDup_header);
			}


			*chunk_size_LZW = *chunk_size_dedup;
			*chunk_size_dedup = *chunk_size;
			
			chunk_temp = chunk_dedup;
			chunk_dedup = chunk_LZW;
			chunk_LZW = chunk_temp;

			chunk_temp = chunk_cdc;
			chunk_cdc = chunk_dedup;
			chunk_dedup = chunk_temp;

			deDup_header_LZW = deDup_header;
			
			loop_cnt++;
			if (!(*cdc_pipeline_index)){
				boundary_index++;
			}
			
			if (*cdc_pipeline_index){
				(*pipeline_drained)++;
			}
		}
        
//         for (int i = 0; i <= boundary_index; i++){
			
// 			if (*ArrayOfCode[i] && 1){
// 				if (fwrite(ArrayOfCode[i] + 1, 1, sizeof(uint32_t), File) != sizeof(uint32_t))
// 					//Exit_with_error("fwrite dedup header to compressed_data.bin failed");
// 			}else{
// 				if (fwrite(ArrayOfCode[i] + 1, 1, ArrayOfOutputLength_LZW[i], File) != ArrayOfOutputLength_LZW[i])
// 					//Exit_with_error("fwrite LZW output to compressed_data.bin failed");
// // printf("ArrayOfOutputLength_LZW[%d]: %d\n", i, ArrayOfOutputLength_LZW[i]);
// 			}			
// 		}		
		total_timer.stop();
// printf("after a packet\n");
// printf("done: %d\n", done);
	}	

	//---------------------------------------end encoding----------------------------------------------
	// total_timer.stop();
// printf("outside while loop\n");
		// for (int j = 0; j < krnl_num; j++){
		// 	q[j].enqueueUnmapMemObject(Input_buf[j], Chunks_LZW[j]);
		// 	q[j].enqueueUnmapMemObject(Output_buf[j], LZW_send_data[j]);
		// 	q[j].enqueueUnmapMemObject(In_length_buf[j], LZW_input_length[j]);
		// 	q[j].enqueueUnmapMemObject(Output_length_buf[j], LZW_output_length[j]);
		// }
		for (int j = 0; j < krnl_num; j++){
			OCL_CHECK(err, err = q[j].finish());
		}
		printf("q finished\n");

		//----------------------------------File of codes-------------------------------------------
		//fseek(File, 0, SEEK_END); // seek to end of file
		//int file_size = ftell(File); // get current file pointer
		//fseek(File, 0, SEEK_SET); // seek back to beginning of file

		//if (fclose(File) != 0)
			// Exit_with_error("fclose for send_data failed");

			// std::cout << "--------------- Key Throughputs ---------------" << std::endl;
			// float ethernet_latency = ethernet_timer.latency() / 1000.0;
			// float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency; // Mb/s
			// std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
			// 		<< " (Latency: " << ethernet_latency << "s)." << std::endl;
		for (int i = 0; i < NUM_PACKETS; i++) {
			free(input[i]);
		}
			// printf("after free input\n");
		free(file);
		free(cdc_offset);	
		free(cdc_pipeline_index);
		free(pipeline_drained);
		// free(chunk_cdc);
		// free(chunk_dedup);
		// free(chunk_LZW);
		// free(chunk_temp);
		for (int i = 0; i < MAX_BOUNDARY; i++){
			// free(ArrayOfChunks[i]);
			free(ArrayOfCode[i]);
		}

        // float cdc_latency = cdc_time.latency() / 1000.0;
        // float cdc_throughput = (bytes_written * 8 / 1000000.0) / cdc_latency; // Mb/s
        // std::cout << "Cdc Throughput to Encoder: " << cdc_throughput << " Mb/s."
        //         << " (Latency: " << cdc_latency << "s)." << std::endl;

        // float sha_latency = sha_time.latency() / 1000.0;
        // float sha_throughput = (bytes_written * 8 / 1000000.0) / sha_latency; // Mb/s
        // std::cout << "Sha Throughput to Encoder: " << sha_throughput << " Mb/s."
        //         << " (Latency: " << sha_latency << "s)." << std::endl;

        // float lzw_latency = lzw_time.latency() / 1000.0;
        // float lzw_throughput = (bytes_written * 8 / 1000000.0) / lzw_latency; // Mb/s
        // std::cout << "Lzw Throughput to Encoder: " << lzw_throughput << " Mb/s."
        //         << " (Latency: " << lzw_latency << "s)." << std::endl;


        // float dedup_latency = dedup_time.latency() / 1000.0;
        // float dedup_throughput = (bytes_written * 8 / 1000000.0) / dedup_latency; // Mb/s
        // std::cout << "dedup Throughput to Encoder: " << dedup_throughput << " Mb/s."
        //         << " (Latency: " << dedup_latency << "s)." << std::endl;

        // float output_latency = total_time.latency() / 1000.0;
        // float output_throughput = (bytes_written * 8 / 1000000.0) / output_latency; // Mb/s
        // std::cout << "Output Throughput to Encoder: " << output_throughput << " Mb/s."
        //         << " (Latency: " << output_latency << "s)." << std::endl;

// ------------------------------------------------------------------------------------
// Step 4: Check Results and Release Allocated Resources
// ------------------------------------------------------------------------------------

        delete[] fileBuf;

        // std::cout << "--------------- Key execution times ---------------" << std::endl;
        // timer.print();

        // std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl; 
        // return (match ? EXIT_SUCCESS : EXIT_FAILURE);
        // return 0;
    }




