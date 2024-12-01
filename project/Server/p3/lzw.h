
// #ifndef LZW_H
// #define LZW_H

// #include <cstdint>
// #include <hls_stream.h>
// #include <cstddef>
// #include <ap_int.h>

// // 常量定义
// #define CODE_LENGTH 13
// #define CODE_MASK ((1 << CODE_LENGTH) - 1)
// #define CAPACITY 32768 
// #define MAX_CODE_WORDS 8192
// #define MAX_COMPRESSED_SIZE 20000
// #define MAX_DICT_SIZE 8192


// typedef struct {
//     unsigned long quarter_0[32];
//     unsigned long quarter_1[32];
//     unsigned long quarter_2[32];
//     unsigned long quarter_3[32];
//     unsigned int value[64];
//     unsigned int fill;
// } assoc_mem_t;


// unsigned int my_hash(unsigned long key);
// void hash_insert(unsigned long* hash_table, unsigned int key, unsigned int value, bool* collision);
// void hash_lookup(unsigned long* hash_table, unsigned int key, bool* hit, unsigned int* result);
// void assoc_init(assoc_mem_t* mem);
// void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull);
// int one_hot_decode(unsigned long one_hot);
// void assoc_lookup(assoc_mem_t* mem, unsigned int key, unsigned int* result, bool* rhit);
// void load_input(unsigned char* in, hls::stream<ap_uint<8>>& inStream, unsigned int *chunk_size);
// void lookup_and_insert(unsigned long* hash_table, assoc_mem_t& assoc_mem, unsigned int key, int nextCode, unsigned int* result, bool* hit) ;
// void compress_stream(hls::stream<ap_uint<8>>& chunk_arr_stream, unsigned int *chunk_size,
//                      hls::stream<ap_uint<16>>& codeword_stream);
// void write_output_stream(hls::stream<ap_uint<16>>& codeword_stream,
//                          hls::stream<ap_uint<8>>& output_hw_stream,
//                          hls::stream<ap_uint<32>>& compressed_size_stream);
// void store_result(hls::stream<ap_uint<32>>& compressed_size_stream,
//                   hls::stream<ap_uint<8>>& output_hw_stream,
//                   uint8_t* compressed_data, int* compressed_size);

// void lzw(unsigned char* in, unsigned int* chunk_size, uint8_t* compressed_data, int* compressed_size);

// #endif // LZW_H


//without stream
#ifndef LZW_H
#define LZW_H

#include "lzw.h"
#include <stdint.h>
#include <vector>

#define CODE_LENGTH 13
#define CODE_MASK ((1 << CODE_LENGTH) - 1)
#define MAX_CODE_WORDS 8192
#define MAX_COMPRESSED_SIZE 20000
#define MAX_DICT_SIZE 8192

// dictionary content
typedef struct {
    int prefix_code;           // prefix
    unsigned char character;    // current character
} DictEntry;


typedef struct {
    unsigned long quarter_0[32];
    unsigned long quarter_1[32];
    unsigned long quarter_2[32];
    unsigned long quarter_3[32];
    unsigned int value[64];
    unsigned int fill;
} assoc_mem_t;


void assoc_init(assoc_mem_t* mem);


void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull);

int one_hot_decode(unsigned long one_hot);

void assoc_lookup(assoc_mem_t* mem, unsigned int key, unsigned int* result, bool* rhit);

//void lzw(unsigned char* chunk, size_t chunk_size, uint8_t compressed_data[MAX_COMPRESSED_SIZE], int* compressed_size);
//int lzw(unsigned char* chunk, size_t chunk_size, uint8_t compressed_data[MAX_COMPRESSED_SIZE]);
//void lzw(unsigned char* chunk, size_t chunk_size, uint8_t compressed_data[MAX_COMPRESSED_SIZE], int* compressed_size);
void lzw(unsigned char* chunk, unsigned int* chunk_size, unsigned char* compressed_data, unsigned int* compressed_size_buffer);

#endif // LZW_H




// //wangkun 

// #ifndef LZW_HW_H
// #define LZW_HW_H

// #include <cstdint>
// #include <stdint.h>
// #include <stddef.h>
// //#include <hls_stream.h>

// // Constants for hardware
// #define CODE_LENGTH 13                     // Code length in bits
// #define CODE_MASK ((1 << CODE_LENGTH) - 1) // Mask to extract CODE_LENGTH bits
// #define MAX_DICT_SIZE (1 << CODE_LENGTH)   // Maximum dictionary size
// #define INPUT_SIZE 8192                    // Maximum input size
// #define OUTPUT_SIZE 40960                  // Maximum output size
// #define MAX_COMPRESSED_SIZE 20000

// // Dictionary Entry Structure
// struct DictEntry {
//     uint16_t prefix;
//     uint8_t character;
// };

// // Hardware-optimized LZW Encoding Function
// void hw_initialize_dictionary();
// void lzw(unsigned char *input_data, unsigned int *input_size, unsigned char* compressed_data, unsigned int *compressed_size_buffer);

// #endif // LZW_HW_H