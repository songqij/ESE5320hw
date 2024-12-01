#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
#include <fstream>
#include <vector>
#define WIN_SIZE 16
#define PRIME 3
#define MODULUS 256
#define TARGET 10

#define BUFFER_SIZE 

//void cdc(const unsigned char *buff, unsigned int buff_size, unsigned char ***chunks, unsigned int *chunk_count, unsigned int **chunk_sizes);
void cdc(const unsigned char *buff, unsigned int buff_size,unsigned char **chunks, unsigned int *chunk_sizes,unsigned int *chunk_count, unsigned int max_chunks); 
void fast_cdc(unsigned char *buff, unsigned int buff_size,unsigned char **chunks, unsigned int *chunk_sizes, unsigned int *chunk_count, unsigned int max_chunks);