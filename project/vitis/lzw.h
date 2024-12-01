//#ifndef LZW_H
//#define LZW_H
//
//#include <stdint.h>
//#include <hls_stream.h>
//
//// 宏定义
//#define BUFFER_LEN 16384
//#define MAX_ITERATIONS 20
//#define INFO_LEN 4
//#define MAX_OUTPUT_CODE_SIZE 40960
//#define MAX_COMPRESSED_SIZE 40960
//#define ASSOCIATIVE_MEM_STORE 64
//
//// 类型定义
//typedef enum InfoParams {
//    INFO_START_IDX,
//    INFO_END_IDX,
//    INFO_OUT_PACKET_LENGTH,
//    INFO_FAILURE,
//} InfoParams;
//
//// 结构定义
//typedef struct {
//    unsigned long upper_key_mem[512];
//    unsigned long middle_key_mem[512];
//    unsigned long lower_key_mem[512];
//    unsigned long value[ASSOCIATIVE_MEM_STORE];
//    unsigned int fill;
//} assoc_mem;
//
//// 函数声明
//// void lzw(unsigned char input[BUFFER_LEN],
////          uint32_t *lzw_codes,
////          uint32_t chunk_indices[MAX_ITERATIONS],
////          uint32_t out_packet_lengths[MAX_ITERATIONS]);
//
//void lzw(unsigned char* chunk,
//         unsigned int* chunk_size,
//		 uint16_t* code_words,
//         unsigned int* code_word_count)  ;
//
//#endif // LZW_H




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

//
