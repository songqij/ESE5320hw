#include "encoder.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <unordered_set>
#include <unordered_map>
#include "server.h"
#include <unistd.h>
#include <fcntl.h>
#include <cstring> 
#include <pthread.h>
#include <errno.h>
//#include <map>
#include <bitset>
#include <sys/mman.h>
#include "stopwatch.h"
#include "cdc.h"
#include "lzw.h"
#include "sha.h"
#include "Dedup.h"
#include "encoder.h"

#define NUM_PACKETS 8
#define pipe_depth 4
#define DONE_BIT_L (1 << 7)
#define DONE_BIT_H (1 << 15)

#define FILE_BUFFER_LIMIT 70000000
#define OUTPUT_BUFFER_LIMIT 70000000
#define MAX_CHUNKS 8192

void append_uint32_LE(std::vector<uint8_t> &buffer, uint32_t value)
{
    buffer.push_back(static_cast<uint8_t>(value & 0xFF));
    buffer.push_back(static_cast<uint8_t>(value>>8 & 0xFF));
    buffer.push_back(static_cast<uint8_t>(value>>16 & 0xFF));
    buffer.push_back(static_cast<uint8_t>(value>>24 & 0xFF));
}


void handle_input(int argc, char* argv[], int* blocksize) {
    int option;
    while ((option = getopt(argc, argv, ":b:")) != -1) {
        switch (option) {
            case 'b':
                *blocksize = atoi(optarg);
                printf("Blocksize is set to %d\n", *blocksize);
                break;
            case ':':
                fprintf(stderr, "-%c requires a parameter\n", optopt);
                break;
            default:
                fprintf(stderr, "Usage: %s [-b blocksize]\n", argv[0]);
        }
    }
}

bool process_packet(unsigned char* file, std::vector<unsigned char> &output_buffer, int& offset,
std::map<std::string, int>& lzw_cache,
std::unordered_set<std::string>& hash_table) 
{   //int output_offset=0;
    unsigned char*chunks[MAX_CHUNKS];
    unsigned int chunk_count;
    unsigned int chunk_sizes[MAX_CHUNKS];
    unsigned int lzw_index = 0;

    printf("kaishi cdc\n");
    stopwatch cdc_timer;
    cdc_timer.start();
    cdc(file, offset, chunks, chunk_sizes, &chunk_count,MAX_CHUNKS);
    cdc_timer.stop();
    std::cout << "CDC function time: " << cdc_timer.latency() / 1000.0 << " seconds" << std::endl;
    printf("jieshu cdc");
    //cdc(file, offset, &chunks, &chunk_count, &chunk_sizes);
    //std::cout << "cdc function called: chunk_count = " << chunk_count << std::endl;
    // for (unsigned int i = 0; i < chunk_count; i++) {
    //     printf("Chunk %u (size %u): ", i, chunk_sizes[i]);
    //     for (unsigned int j = 0; j < chunk_sizes[i]; j++) {
    //         printf("%c", chunks[i][j]);
    //     }
    //     printf("\n");
        
    // }
    //printf("finished cdc\n");

    for (unsigned int i = 0; i < chunk_count; i++) {
        unsigned char* chunk = chunks[i];
        unsigned int chunk_size = chunk_sizes[i];
        //printf("finished sha\n");

        // stopwatch sha_timer;
        // sha_timer.start();
        std::string hash_value = sha256(chunk, chunk_size);
        // sha_timer.stop();
        //std::cout << "SHA function time: " << sha_timer.latency() / 1000.0 << " seconds" << std::endl;


        //std::string hash_value = sha256(chunk, chunk_size);

        if (deduplication(hash_table, hash_value)) {
            
            //std::cout << "Hash found in table, reusing cached LZW data.\n";
            //const std::vector<int>& cached_data = lzw_cache[hash_value];
            int index = lzw_cache[hash_value];
            uint32_t header = (index << 1) | 1U; // Using the LZW index stored in cache
            //printf("cached_data is %ld\n",cached_data);
            //size_t cached_size = cached_data.size() * sizeof(int);
            //printf("cached_size is %ld\n",cached_size);

            // if (offset + cached_size < 70000000) {
            //     memcpy(&file[offset], cached_data.data(), cached_size);
            //     offset += cached_size;
            // } else {
            //     std::cerr << "File buffer overflow!" << std::endl;
            //     free(chunk);
            //     return false;
            // }
            // if (output_offset + sizeof(header) < FILE_BUFFER_LIMIT) {
            //     memcpy(&output_buffer[output_offset], &header, sizeof(header));
            //     output_offset += sizeof(header);
            std::cout << "Header (deduplicated): " << std::bitset<32>(header) << "\n";
            // } else {
            //     std::cerr << "File buffer overflow!" << std::endl;
            //     free(chunk);
            //     return false;
            // }
            append_uint32_LE(output_buffer,header);


        } else {
            //std::cout << "Hash not found, performing LZW compression.\n";
          
            //std::vector<uint8_t> compressed_data = encoding(chunk, chunk_size);
            // size_t compressed_size = compressed_data.size();
            // std::vector<uint8_t> compressed_data;
            // uint8_t compressed_data[MAX_COMPRESSED_SIZE];
            //compressed_data_t compressed_data;
            //lzw(chunk, chunk_size, compressed_data);
            //lzw(chunk, chunk_size, & compressed_data);
            // stopwatch lzw_timer;
            // lzw_timer.start();
            uint8_t compressed_data[MAX_COMPRESSED_SIZE];
            uint32_t compressed_size = 0;

            lzw(chunk, &chunk_size, compressed_data, &compressed_size);

            //compressed_data_t compressed_data;
            //lzw(chunk, chunk_size, &compressed_data);
            // lzw_timer.stop();
            //std::cout << "LZW compression time for chunk " << i << ": " << lzw_timer.latency() / 1000.0 << " seconds" << std::endl;

            //int compressed_size = compressed_data.size;


            lzw_cache[hash_value] = lzw_index;
            lzw_index++;
            //uint32_t header = (compressed_data.size() << 1) | 0U;
            uint32_t header = (compressed_size << 1) | 0U;
            printf("compressed size%d is %d\n",i,compressed_size);

            // if (offset + compressed_size < 70000000) {
            //     memcpy(&file[offset], compressed_data.data(), compressed_size);
            //     offset += compressed_size;
            // } else {
            //     std::cerr << "File buffer overflow!" << std::endl;
            //     free(chunk);
            //     return false;
            // }
            append_uint32_LE(output_buffer, header);

            std::cout << "Header (new): " << std::bitset<32>(header) << "\n";

            // output_buffer.insert(output_buffer.end(),compressed_data.begin(), compressed_data.end());
            output_buffer.insert(output_buffer.end(), compressed_data, compressed_data + compressed_size);



            // if (output_offset + sizeof(header) + compressed_size < FILE_BUFFER_LIMIT) {
            //     // Copy header
            //     memcpy(&output_buffer[output_offset], &header, sizeof(header));
            //     output_offset += sizeof(header);

            //     std::cout << "Header (new): " << std::bitset<32>(header) << "\n";



            //     // Copy compressed data immediately after the header
            //     memcpy(&output_buffer[output_offset], compressed_data.data(), compressed_size);
            //     output_offset += compressed_size;
            //     // std::cout << "Compressed data size: " << compressed_size << " bytes\n";
            //     // std::cout << "Compressed data: ";
            //     // for (const int& val : compressed_data) {
            //     //     std::cout << val << " ";
            //     // }
            //     // std::cout << "\n";

            // } else {
            //     std::cerr << "File buffer overflow!" << std::endl;
            //     free(chunk);
            //     return false;
            // }


        }


    }
    
    //free(chunks);

    return true;
}

int main(int argc, char* argv[]) {
    stopwatch ethernet_timer;
    unsigned char* input[NUM_PACKETS];
    int writer = 0;
    int done = 0;
    int length = 0;
    int count = 0;
    int blocksize = BLOCKSIZE;
    int output_offset=0;
    int offset = 0;
    unsigned char* file;
    std::vector<uint8_t> output_buffer;

    ESE532_Server server;

    handle_input(argc, argv, &blocksize);

    file = (unsigned char*) malloc(sizeof(unsigned char) * 70000000);
    if (file == NULL) {
        std::cerr << "Failed to allocate memory for file buffer.\n";
        return 1;
    }

    // output_buffer = (unsigned char*) malloc(sizeof(unsigned char) * OUTPUT_BUFFER_LIMIT);
    // if (output_buffer == NULL) {
    //     std::cerr << "Failed to allocate memory for output buffer.\n";
    //     return 1;
    // }


    for (int i = 0; i < NUM_PACKETS; i++) {
        input[i] = (unsigned char*) malloc(sizeof(unsigned char) * (NUM_ELEMENTS + HEADER));
        if (input[i] == NULL) {
            std::cerr << "Failed to allocate memory for input buffer " << i << std::endl;
            return 1;
        }
    }




    server.setup_server(blocksize);

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
        //printf("length is %d\n",length);
        //printf("writer is %d\n",writer);
        //printf("offset is %d",offset);
        memcpy(&file[offset], &buffer[HEADER], length);

		offset += length;

        
        //free(buffer);

        writer++;
    }

    std::map<std::string, int> lzw_cache;
    std::unordered_set<std::string> hash_table;

    printf("kaishi\n");

    if (!process_packet(file, output_buffer,offset,lzw_cache, hash_table)) {
            std::cerr << "Error processing packet!" << std::endl;
            
        }

    std::vector<unsigned char> &compressed_data = output_buffer;
    std::cout << "Compressed data size: " << compressed_data.size() << " bytes." << std::endl;

    FILE* out = fopen("output.bin", "wb");
    size_t bytes_output_written = fwrite(output_buffer.data(), 1, output_buffer.size(), out);
    std::cout << "Output written with " << bytes_output_written << " bytes\n";
    fclose(out);


    FILE *outfd = fopen("output_cpu.bin", "wb");
    int bytes_written = fwrite(&file[0], 1, offset, outfd);
    std::cout << "File written with " << bytes_written << " bytes\n";
    fclose(outfd);

    for (int i = 0; i < NUM_PACKETS; i++) {
        free(input[i]);
    }
    free(file);
    //free(output_buffer);

    std::cout << "--------------- Key Throughputs ---------------" << std::endl;
    float ethernet_latency = ethernet_timer.latency() / 1000.0;
    float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency;
    std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
              << " (Latency: " << ethernet_latency << "s)." << std::endl;

    return 0;
}



