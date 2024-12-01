#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
#include <fstream>
#include <vector>
#include "stopwatch.h"


#define MODULUS 1024
#define TARGET 0
#define MAX_BOUNDARY 256

#define WIN_SIZE 8
#define PRIME 3

#define MAX_BOUNDARY 256
#define MAX_CHUNK 8192
#define MIN_CHUNK 64






#define BUFFER_SIZE 

//void cdc(const unsigned char *buff, unsigned int buff_size,unsigned char **chunks, unsigned int *chunk_sizes,unsigned int *chunk_count, unsigned int max_chunks); 
void fast_cdc(unsigned char *buff, unsigned int buff_size,unsigned char **chunks, unsigned int *chunk_sizes, unsigned int *chunk_count, unsigned int max_chunks);
void cdc(const unsigned char* buff, unsigned int buff_size, unsigned char* chunk,
         unsigned int* chunk_size, unsigned int* offset_buff, unsigned char* pipeline_drained,
         stopwatch& stopwatch);