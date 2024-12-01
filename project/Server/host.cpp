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
#include "../Server/server.h"
#include <unistd.h>
#include <math.h>
#include <fcntl.h>
#include <pthread.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <fstream>
#include "utility.h"
#include <unordered_map>
#include <cstdint>
#include <cstdlib>
#include <vector>
#include "../Common/Utilities.h"
#include "stopwatch.h"
#include "../Common/EventTimer.h"


#define NUM_KRN 4

#define NUM_PACKETS 8
#define pipe_depth 4
#define DONE_BIT_L (1 << 7)
#define DONE_BIT_H (1 << 15)
#define NUM_ELEMENTS 16384
#define HEADER 2

#define MAX_CHUNK 8192
#define MAX_NUM 256


using namespace std;
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


int main(int argc, char** argv)
{
// Initialize an event timer we'll use for monitoring the application
    EventTimer timer;
// ------------------------------------------------------------------------------------
// Step 1: Initialize the OpenCL environment 
// ------------------------------------------------------------------------------------ 
    timer.add("OpenCL Initialization");
    cl_int err;
    std::string binaryFile = argv[1];
    unsigned fileBufSize;    
    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char* fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
	
	
	cl::Kernel LZW_fpga(program,"lzw",&err);

	//implement multi-kernels
	// std::vector<cl::Kernel> multi_kernels(NUM_KERNELS);

	// for(int i = 0; i < NUM_KERNELS; i++){
	// 	multi_kernels[i] = cl::Kernel(program,"lzw_multi_chunks", &err);
	// }

// ------------------------------------------------------------------------------------
// Step 2: Create buffers and initialize test values
// ------------------------------------------------------------------------------------
    timer.add("Allocate contiguous OpenCL buffers");
    // Create the buffers and allocate memory   
    // cl::Buffer lzw_chunks_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_CHUNK_SIZE, NULL, &err);
	// cl::Buffer lzw_chunks_length_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
    // cl::Buffer lzw_file_buffer_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_FILE_BUFFER_SIZE, NULL, &err);
    // cl::Buffer lzw_total_bytes_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);

    // cl::Buffer Chunk_buffer[NUM_KRN];
    // cl::Buffer Chunk_size_buffer[NUM_KRN];
	// cl::Buffer Compressed_data_buffer[NUM_KRN];
	// cl::Buffer Compressed_size_buffer[NUM_KRN];
	cl::Buffer Chunk_buffer;
    cl::Buffer Chunk_size_buffer;
	cl::Buffer Compressed_data_buffer;
	cl::Buffer Compressed_size_buffer;

	// for (int i=0; i<NUM_KRN; i++)
	// {
	// 	Chunk_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_CHUNK_SIZE, NULL, &err);
	// 	Chunk_size_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
	// 	Compressed_data_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
	// 	Compressed_size_buffer[i]= cl::Buffer(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY,  sizeof(int) * CHUNKS_IN_SINGLE_KERNEL, NULL, &err);
	// }	
	Chunk_buffer = cl::Buffer(context,  CL_MEM_READ_ONLY,  sizeof(unsigned char)*8192, NULL, &err);
	Chunk_size_buffer = cl::Buffer(context, CL_MEM_READ_ONLY, 8192, NULL, &err);
	Compressed_data_buffer = cl::Buffer(context, CL_MEM_WRITE_ONLY,  10000, NULL, &err);
	Compressed_size_buffer = cl::Buffer(context, CL_MEM_WRITE_ONLY,  10000, NULL, &err);



	// unsigned char* Chunk[NUM_KRN];
	// size_t *Chunk_size[NUM_KRN];
    // uint8_t *Compressed_data[NUM_KRN];
	// int *Compressed_size[NUM_KRN];

	// for(int i = 0; i < NUM_KRN; i++){
	// 	Chunk[i] = (unsigned char *)q.enqueueMapBuffer(lzw_chunks_bufs[i], CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_CHUNK_SIZE);
	// 	Chunk_size[i] = (size_t*)q.enqueueMapBuffer(lzw_chunks_length_bufs[i], CL_TRUE, CL_MAP_WRITE, 0, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL);
	// 	Compressed_data[i] = (uint8_t*)q.enqueueMapBuffer(lzw_file_buffer_bufs[i], CL_TRUE, CL_MAP_READ, 0, sizeof(unsigned char) * CHUNKS_IN_SINGLE_KERNEL * MAX_FILE_BUFFER_SIZE);
	// 	Compressed_size[i] = (int*)q.enqueueMapBuffer(lzw_total_bytes_bufs[i], CL_TRUE, CL_MAP_READ, 0, sizeof(int) * CHUNKS_IN_SINGLE_KERNEL);
	// }


	unsigned char* Chunk;
	size_t *Chunk_size;
    uint8_t *Compressed_data;
	int *Compressed_size;


	Chunk = (unsigned char *)q.enqueueMapBuffer(Chunk_buffer, CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char)*8192);
	Chunk_size = (size_t*)q.enqueueMapBuffer(Chunk_size_buffer, CL_TRUE, CL_MAP_WRITE, 0, 8192);
	Compressed_data = (uint8_t*)q.enqueueMapBuffer(Compressed_data_buffer, CL_TRUE, CL_MAP_READ, 0, 10000);
	Compressed_size = (int*)q.enqueueMapBuffer(Compressed_size_buffer, CL_TRUE, CL_MAP_READ, 0, 10000);


    timer.add("Populating buffer inputs");

// ------------------------------------------------------------------------------------
// Step 3: Run the kernel
// ------------------------------------------------------------------------------------
	std::cout << "dec 9 0105" << std::endl;
	std::cout << argv[1] << std::endl;
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

	// std::vector<cl::Event> read_events[NUM_KERNELS];



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

	writer = 0;

	// initialize the map for deduplication
	std::unordered_map<std::string, int> chunks_map;
	//float sum_lzw_raw_length = 0, sum_lzw_cmprs_len = 0, sum_dedup_raw_length = 0, sum_dedup_cmprs_len = 0;

	int base = 0;


	stopwatch total_time;
	stopwatch cdc_time;
	stopwatch sha_time;
	stopwatch dedup_time;

	// int total_inputBits=0;
	// int dedup_chars = 0;

	//last message
    while (!done) {
        if (writer == NUM_PACKETS) {
            writer = 0;
        }

        ethernet_timer.start();
        server.get_packet(input[writer]);
        ethernet_timer.stop();

        unsigned char* buffer = input[writer];


        done = buffer[1] & DONE_BIT_L;
        length = buffer[0] | (buffer[1] << 8);
        length &= ~DONE_BIT_H;

        memcpy(&file[offset], &buffer[HEADER], length);

		offset += length;

        
        //free(buffer);

        writer++;
    }
		// encode the obtained information in buffer

		// initialize the vector to store the obtained chunks
    std::map<std::string, int> lzw_cache;
    std::unordered_set<std::string> hash_table;


    int count1=0;
    int count2=0;
    unsigned char** chunks;
    unsigned int chunk_count;
    unsigned int* chunk_sizes;
	unsigned int lzw_index = 0;


	stopwatch cdc_timer;
    cdc_timer.start();
    cdc(file, offset, &chunks, &chunk_count, &chunk_sizes);
    cdc_timer.stop();
    std::cout << "CDC function time: " << cdc_timer.latency() / 1000.0 << " seconds" << std::endl;

    cl::Event w[chunk_count], x[chunk_count], r[chunk_count];
    std::vector<cl::Event> w_wl[chunk_count],x_wl[chunk_count], r_wl[chunk_count];


	for (unsigned int i = 0; i < chunk_count; i++) {

		LZW_fpga.setArg(0,Chunk_buffer);
		LZW_fpga.setArg(1,Chunk_size_buffer);
		LZW_fpga.setArg(2,Compressed_data_buffer);
		LZW_fpga.setArg(3,Compressed_size_buffer);
		 
        unsigned char* chunk = chunks[i];
        unsigned int chunk_size = chunk_sizes[i];

        stopwatch sha_timer;
        sha_timer.start();
        std::string hash_value = sha256(chunk, chunk_size);
        sha_timer.stop();
        std::cout << "SHA function time: " << sha_timer.latency() / 1000.0 << " seconds" << std::endl;



        if (deduplication(hash_table, hash_value)) {
            count1++;
            //std::cout << "Hash found in table, reusing cached LZW data.\n";
            //const std::vector<int>& cached_data = lzw_cache[hash_value];
            int index = lzw_cache[hash_value];
            uint32_t header = (index << 1) | 1U; // Using the LZW index stored in cache

            append_uint32_LE(output_buffer,header);
			i++;


        } else {
            //std::cout << "Hash not found, performing LZW compression.\n";
            stopwatch lzw_timer;
			lzw_timer.start();
			uint8_t compressed_data[MAX_COMPRESSED_SIZE];
            int compressed_size = 0;
			if (i == 0) {
            q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer}, 0, NULL, &w[i]);
            

            
        	} 
			else {
            q.enqueueMigrateMemObjects({Chunk_buffer,Chunk_size_buffer}, 0, &w_wl[i], &w[i]);
			
			}
			
			if (i+1<chunk_count)
            {
                w_wl[i+1].push_back(w[i]);  
            }
			

			x_wl[i].push_back(w[i]);

			q.enqueueTask(LZW_fpga, &x_wl[i], &x[i]);

			r_wl[i].push_back(x[i]);

			q.enqueueMigrateMemObjects({Compressed_data_buffer,Compressed_size_buffer}, CL_MIGRATE_MEM_OBJECT_HOST, &r_wl[i], &r[i]);

            r[i].wait();

            //compressed_data_t compressed_data;
            //lzw(chunk, chunk_size, &compressed_data);
            lzw_timer.stop();
            std::cout << "LZW compression time for chunk " << i << ": " << lzw_timer.latency() / 1000.0 << " seconds" << std::endl;

            //int compressed_size = compressed_data.size;


            lzw_cache[hash_value] = lzw_index;
            lzw_index++;
            // uint32_t header = (compressed_data.size() << 1) | 0U;
            uint32_t header = (compressed_size << 1) | 0U;


            append_uint32_LE(output_buffer, header);

            std::cout << "Header (new): " << std::bitset<32>(header) << "\n";

            // output_buffer.insert(output_buffer.end(),compressed_data.begin(), compressed_data.end());
            output_buffer.insert(output_buffer.end(), compressed_data, compressed_data + compressed_size);

			}




        

    }
    
    free(chunks);
    free(chunk_sizes);



		

	total_time.stop();
	FILE *outfd = fopen("output_cpu.bin", "wb");
	int bytes_written = fwrite(&file[0], 1, offset, outfd);
	printf("write file with %d\n", bytes_written);
	fclose(outfd);


    FILE* out = fopen("output.bin", "wb");
    size_t bytes_output_written = fwrite(output_buffer.data(), 1, output_buffer.size(), out);
    std::cout << "Output written with " << bytes_output_written << " bytes\n";
    fclose(out);




	for (int i = 0; i < NUM_PACKETS; i++) {
		free(input[i]);
	}

	free(file);

	q.finish();
	// std::cout << "--------------- Key Throughputs ---------------" << std::endl;
	// float ethernet_latency = ethernet_timer.latency() / 1000.0;
	// float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency; // Mb/s
	// std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
	// 		<< " (Latency: " << ethernet_latency << "s)." << std::endl;

	// float cdc_latency = cdc_time.latency() / 1000.0;
	// float cdc_throughput = (bytes_written * 8 / 1000000.0) / cdc_latency; // Mb/s
	// std::cout << "cdc Throughput to Encoder: " << cdc_throughput << " Mb/s."
	// 		<< " (Latency: " << cdc_latency << "s)." << std::endl;

	// float sha_latency = sha_time.latency() / 1000.0;
	// float sha_throughput = (bytes_written * 8 / 1000000.0) / sha_latency; // Mb/s
	// std::cout << "sha Throughput to Encoder: " << sha_throughput << " Mb/s."
	// 		<< " (Latency: " << sha_latency << "s)." << std::endl;

	// float dedup_latency = dedup_time.latency() / 1000.0;
	// float dedup_throughput = (dedup_chars * 8 / 1000000.0) / dedup_latency; // Mb/s
	// std::cout << "dedup Throughput to Encoder: " << dedup_throughput << " Mb/s."
	// 		<< " (Latency: " << dedup_latency << "s)." << std::endl;

	// float output_latency = total_time.latency() / 1000.0;
	// float output_throughput = (total_inputBits * 8 / 1000000.0) / output_latency; // Mb/s
	// std::cout << "output Throughput to Encoder: " << output_throughput << " Mb/s."
	// 		<< " (Latency: " << output_latency << "s)." << std::endl;

// ------------------------------------------------------------------------------------
// Step 4: Check Results and Release Allocated Resources
// ------------------------------------------------------------------------------------
    // multiply_gold(in1, in2, out_sw);
    // bool match = Compare_matrices(out_sw, out_hw);
    // Destroy_matrix(out_sw);
    delete[] fileBuf;

	q.enqueueUnmapMemObject(Chunk_buffer, Chunk);
    q.enqueueUnmapMemObject(Chunk_size_buffer, Chunk_size);
    q.enqueueUnmapMemObject(Compressed_data_buffer, Compressed_data);
    q.enqueueUnmapMemObject(Compressed_size_buffer, Compressed_size);

	// for(int k = 0; k < NUM_KERNELS; k++){
	// 	q.enqueueUnmapMemObject(lzw_chunks_bufs[k], lzw_chunks[k]);
	// 	q.enqueueUnmapMemObject(lzw_chunks_length_bufs[k], lzw_chunks_length[k]);
	// 	q.enqueueUnmapMemObject(lzw_file_buffer_bufs[k], lzw_file_buffer[k]);
	// 	q.enqueueUnmapMemObject(lzw_total_bytes_bufs[k], lzw_total_bytes[k]);
	// }
    

    std::cout << "--------------- Key execution times ---------------" << std::endl;
    timer.print();

    std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl; 
    return (match ? EXIT_SUCCESS : EXIT_FAILURE);
    return 0;
}