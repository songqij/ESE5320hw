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
#include <sys/mman.h>
#include "stopwatch.h"
#include "cdc.h"
#include "lzw.h"
#include "sha.h"
#include "Dedup.h"

#define NUM_PACKETS 8
#define pipe_depth 4
#define DONE_BIT_L (1 << 7)
#define DONE_BIT_H (1 << 15)


int offset = 0;
unsigned char* file;

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

bool process_packet(unsigned char* buffer, int& offset, unsigned char* file, 
                    std::unordered_map<std::string, std::vector<int>>& lzw_cache,
                    std::unordered_set<std::string>& hash_table) {
    unsigned char** chunks;
    unsigned int chunk_count;
    unsigned int* chunk_sizes;

    cdc(&buffer[HEADER], buffer[0] | (buffer[1] << 8), &chunks, &chunk_count, &chunk_sizes);
    std::cout << "cdc function called: chunk_count = " << chunk_count << std::endl;
    for (unsigned int i = 0; i < chunk_count; i++) {
        printf("Chunk %u (size %u): ", i, chunk_sizes[i]);
        for (unsigned int j = 0; j < chunk_sizes[i]; j++) {
            printf("%c", chunks[i][j]);
        }
        printf("\n");
        free(chunks[i]); // Free each chunk after printing
    }

    for (unsigned int i = 0; i < chunk_count; i++) {
        unsigned char* chunk = chunks[i];
        unsigned int chunk_size = chunk_sizes[i];

        std::string hash_value = sha256(chunk, chunk_size);

        if (deduplication(hash_table, hash_value)) {
            std::cout << "Hash found in table, reusing cached LZW data.\n";
            const std::vector<int>& cached_data = lzw_cache[hash_value];
            size_t cached_size = cached_data.size() * sizeof(int);

            if (offset + cached_size < 70000000) {
                memcpy(&file[offset], cached_data.data(), cached_size);
                offset += cached_size;
            } else {
                std::cerr << "File buffer overflow!" << std::endl;
                free(chunk);
                return false;
            }
        } else {
            std::cout << "Hash not found, performing LZW compression.\n";
            std::vector<int> compressed_data = encoding(chunk, chunk_size);
            size_t compressed_size = compressed_data.size() * sizeof(int);

            lzw_cache[hash_value] = compressed_data;

            if (offset + compressed_size < 70000000) {
                memcpy(&file[offset], compressed_data.data(), compressed_size);
                offset += compressed_size;
            } else {
                std::cerr << "File buffer overflow!" << std::endl;
                free(chunk);
                return false;
            }
        }
        free(chunk);
    }
    free(chunks);
    free(chunk_sizes);
    return true;
}

int main(int argc, char* argv[]) {
    stopwatch ethernet_timer;
    unsigned char* input[NUM_PACKETS];
    int writer = 0;
    int done = 0;
    int length = 0;
    //int count = 0;
    int blocksize = BLOCKSIZE;
    ESE532_Server server;

    handle_input(argc, argv, &blocksize);

    file = (unsigned char*) malloc(sizeof(unsigned char) * 70000000);
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


    std::unordered_map<std::string, std::vector<int>> lzw_cache;
    std::unordered_set<std::string> hash_table;

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

        if (!process_packet(buffer, offset, file, lzw_cache, hash_table)) {
            std::cerr << "Error processing packet!" << std::endl;
            break;
        }

        writer++;
    }

    FILE *outfd = fopen("output_cpu.bin", "wb");
    int bytes_written = fwrite(&file[0], 1, offset, outfd);
    std::cout << "File written with " << bytes_written << " bytes\n";
    fclose(outfd);

    for (int i = 0; i < NUM_PACKETS; i++) {
        free(input[i]);
    }
    free(file);

    std::cout << "--------------- Key Throughputs ---------------" << std::endl;
    float ethernet_latency = ethernet_timer.latency() / 1000.0;
    float input_throughput = (bytes_written * 8 / 1000000.0) / ethernet_latency;
    std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
              << " (Latency: " << ethernet_latency << "s)." << std::endl;

    return 0;
}
