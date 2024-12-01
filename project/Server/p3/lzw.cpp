// #include "lzw.h"
// #include <hls_stream.h>
// #include <stdio.h>
// #include <string.h>
// #include <ap_int.h>

// #define CAPACITY 32768  // hash table capacity

// unsigned int my_hash(unsigned long key) {
//     key &= 0xFFFFF;  // 20 bits key
//     unsigned int hashed = 0;
//     for (int i = 0; i < 20; i++) {
//         hashed += (key >> i) & 0x01;
//         hashed += hashed << 10;
//         hashed ^= hashed >> 6;
//     }
//     hashed += hashed << 3;
//     hashed ^= hashed >> 11;
//     hashed += hashed << 15;
//     return hashed & 0x7FFF;  // 15 bits hash
// }

// void hash_insert(unsigned long* hash_table, unsigned int key, unsigned int value, bool* collision) {
//     key &= 0xFFFFF;  // 20 bits
//     value &= 0xFFF;  // 12 bits

//     unsigned int hash_val = my_hash(key);
//     unsigned long lookup = hash_table[hash_val];
//     unsigned int valid = (lookup >> (20 + 12)) & 0x1;

//     if (valid) {
//         *collision = true;
//     } else {
//         hash_table[hash_val] = (1UL << (20 + 12)) | (value << 20) | key;
//         *collision = false;
//     }
// }

// void hash_lookup(unsigned long* hash_table, unsigned int key, bool* hit, unsigned int* result) {
//     key &= 0xFFFFF;
//     unsigned int hash_val = my_hash(key);
//     unsigned long lookup = hash_table[hash_val];
//     unsigned int stored_key = lookup & 0xFFFFF;
//     unsigned int value = (lookup >> 20) & 0xFFF;
//     unsigned int valid = (lookup >> (20 + 12)) & 0x1;

//     if (valid && (key == stored_key)) {
//         *hit = true;
//         *result = value;
//     } else {
//         *hit = false;
//         *result = 0;
//     }
// }

// // Initialize associative memory
// void assoc_init(assoc_mem_t* mem) {
//     for (int i = 0; i < 32; i++) {
//         mem->quarter_0[i] = 0;
//         mem->quarter_1[i] = 0;
//         mem->quarter_2[i] = 0;
//         mem->quarter_3[i] = 0;
//     }
//     for (int i = 0; i < 64; i++) {
//         mem->value[i] = 0;
//     }
//     mem->fill = 0;
// }

// void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull) {
//     key &= 0xFFFFF; // 20 bits
//     val &= 0xFFF;   // 12 bits

//     int key_quarter_0 = key & 0x1f;
//     int key_quarter_1 = (key >> 5) & 0x1f;
//     int key_quarter_2 = (key >> 10) & 0x1f;
//     int key_quarter_3 = (key >> 15) & 0x1f;

//     if (mem->fill < 64) {
//         mem->quarter_0[key_quarter_0] |= 1UL << mem->fill;
//         mem->quarter_1[key_quarter_1] |= 1UL << mem->fill;
//         mem->quarter_2[key_quarter_2] |= 1UL << mem->fill;
//         mem->quarter_3[key_quarter_3] |= 1UL << mem->fill;
//         mem->value[mem->fill] = val;
//         mem->fill++;
//         *wfull = false;
//     } else {
//         *wfull = true;
//     }
// }

// int one_hot_decode(unsigned long one_hot) {
//     if (one_hot == 0) return -1;

//     int upper_ptr = 64;
//     int lower_ptr = 0;
//     int ptr;

//     while (upper_ptr > lower_ptr) {
//         #pragma HLS PIPELINE II=1
//         ptr = (upper_ptr + lower_ptr) / 2;
//         if ((one_hot >> ptr) & 1) lower_ptr = ptr + 1;
//         else upper_ptr = ptr;
//     }
//     return upper_ptr - 1;
// }

// void assoc_lookup(assoc_mem_t* mem, unsigned int key, unsigned int* result, bool* rhit) {
//     key &= 0xFFFFF; // 20 bits

//     int key_quarter_0 = key & 0x1f;
//     int key_quarter_1 = (key >> 5) & 0x1f;
//     int key_quarter_2 = (key >> 10) & 0x1f;
//     int key_quarter_3 = (key >> 15) & 0x1f;

//     unsigned long match_quarter_0 = mem->quarter_0[key_quarter_0];
//     unsigned long match_quarter_1 = mem->quarter_1[key_quarter_1];
//     unsigned long match_quarter_2 = mem->quarter_2[key_quarter_2];
//     unsigned long match_quarter_3 = mem->quarter_3[key_quarter_3];

//     unsigned long match = match_quarter_0 & match_quarter_1 & match_quarter_2 & match_quarter_3;
//     int addr = one_hot_decode(match);

//     if (addr == -1) {
//         *rhit = false;
//     } else {
//         *rhit = true;
//         *result = mem->value[addr];
//     }
// }

// void load_input(unsigned char* in, hls::stream<ap_uint<8>>& inStream, unsigned int chunk_size) {
//     for (unsigned int i = 0; i < chunk_size; i++) {
//         #pragma HLS PIPELINE II=1
//         inStream.write(in[i]);
//     }
// }







// void lookup_and_insert(unsigned long* hash_table, assoc_mem_t& assoc_mem, unsigned int key, int nextCode, unsigned int* result, bool* hit) {
//     *hit = false;
//     hash_lookup(hash_table, key, hit, result);
//     if (!(*hit)) {
//         assoc_lookup(&assoc_mem, key, result, hit);
//     }
//     if (!(*hit)) {
//         bool collision = false;
//         hash_insert(hash_table, key, nextCode, &collision);
//         if (collision) {
//             assoc_insert(&assoc_mem, key, nextCode, &collision);
//         }
//     }
// }

// // Compress function using streams
// void compress_stream(hls::stream<ap_uint<8>>& chunk_arr_stream, unsigned int chunk_size,
//                      hls::stream<ap_uint<16>>& codeword_stream)
// {
//     assoc_mem_t assoc_mem;
//     unsigned long hash_table[CAPACITY] = {0};
//     assoc_init(&assoc_mem);

//     bool collision = false, hit = false;
//     unsigned int result = 0;
//     int nextCode = 256;

//     int P;
//     if (!chunk_arr_stream.empty()) {
//         P = chunk_arr_stream.read();
//     } else {
//         return;
//     }

//     for (unsigned int i = 1; i < chunk_size; ++i) {
//         if (chunk_arr_stream.empty()) break;

//         unsigned char C = chunk_arr_stream.read();
//         unsigned int key = (P << 8) | C;

//         lookup_and_insert(hash_table, assoc_mem, key, nextCode, &result, &hit);

//         if (hit) {
//             P = result;
//         } else {
//             codeword_stream.write(P);
//             nextCode++;
//             P = C;
//         }
//     }

//     codeword_stream.write(P);
// }

// // Write output stream and compute compressed size
// void write_output_stream(hls::stream<ap_uint<16>>& codeword_stream,
//                          hls::stream<ap_uint<8>>& output_hw_stream,
//                          hls::stream<ap_uint<32>>& compressed_size_stream)
// {
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;
//     int size = 0;

//     while (!codeword_stream.empty()) {
//         uint16_t code = codeword_stream.read();
//         code &= CODE_MASK;
//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         while (bit_count >= 8) {
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             output_hw_stream.write(byte);
//             size++;
//             bit_count -= 8;
//         }
//     }

//     if (bit_count > 0) {
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         output_hw_stream.write(byte);
//         size++;
//     }

//     compressed_size_stream.write(size);
// }

// // Store result from output stream to output buffer
// void store_result(hls::stream<ap_uint<32>>& compressed_size_stream,
//                   hls::stream<ap_uint<8>>& output_hw_stream,
//                   uint8_t* compressed_data, int* compressed_size)
// {
//     int size = compressed_size_stream.read();
//     *compressed_size = size;

//     for (int i = 0; i < size; i++) {
//         #pragma HLS PIPELINE II=1
//         compressed_data[i] = output_hw_stream.read();
//     }
// }

// // Top-level function
// void lzw(unsigned char* in, unsigned int* chunk_size, uint8_t* compressed_data, int* compressed_size)
// {
//     #pragma HLS INTERFACE m_axi port=in offset=slave bundle=aximm1 depth=1024
//     #pragma HLS INTERFACE m_axi port=compressed_data offset=slave bundle=aximm2 depth=1024

//     #pragma HLS INTERFACE s_axilite port=in bundle=control
//     #pragma HLS INTERFACE s_axilite port=compressed_data bundle=control
//     #pragma HLS INTERFACE s_axilite port=chunk_size bundle=control
//     #pragma HLS INTERFACE s_axilite port=compressed_size bundle=control
//     #pragma HLS INTERFACE s_axilite port=return bundle=control

//     #pragma HLS DATAFLOW

//     hls::stream<ap_uint<8> > chunk_arr_stream("chunk_arr_stream");
//     hls::stream<ap_uint<16> > codeword_stream("codeword_stream");
//     hls::stream<ap_uint<8> > output_hw_stream("output_hw_stream");
//     hls::stream<ap_uint<32> > compressed_size_stream("compressed_size_stream");

//     #pragma HLS STREAM variable=chunk_arr_stream depth=1024
//     #pragma HLS STREAM variable=codeword_stream depth=1024
//     #pragma HLS STREAM variable=output_hw_stream depth=1024
//     #pragma HLS STREAM variable=compressed_size_stream depth=1024

//     load_input(in, chunk_arr_stream, *chunk_size);
//     compress_stream(chunk_arr_stream, *chunk_size, codeword_stream);
//     write_output_stream(codeword_stream, output_hw_stream, compressed_size_stream);
//     store_result(compressed_size_stream, output_hw_stream, compressed_data, compressed_size);
// }


//without streaming
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "lzw.h"

// Initialize assoc_mem
void assoc_init(assoc_mem_t* mem) {
    for (int i = 0; i < 32; i++) {
        mem->quarter_0[i] = 0;
        mem->quarter_1[i] = 0;
        mem->quarter_2[i] = 0;
        mem->quarter_3[i] = 0;
    }
    for (int i = 0; i < 64; i++) {
        mem->value[i] = 0;
    }
    mem->fill = 0;
}

// Insert into assoc_mem
void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull) {
    key &= 0xFFFFF; // 20 bits
    val &= 0xFFF;   // 12 bits

    int key_quarter_0 = key & 0x1f;
    int key_quarter_1 = (key >> 5) & 0x1f;
    int key_quarter_2 = (key >> 10) & 0x1f;
    int key_quarter_3 = (key >> 15) & 0x1f;

    if (mem->fill < 64) {
        mem->quarter_0[key_quarter_0] = 1UL << mem->fill;
        mem->quarter_1[key_quarter_1] = 1UL << mem->fill;
        mem->quarter_2[key_quarter_2] = 1UL << mem->fill;
        mem->quarter_3[key_quarter_3] = 1UL << mem->fill;
        mem->value[mem->fill] = val;
        mem->fill++;
        *wfull = false;
    } else {
        *wfull = true;
    }
}

// one_hot_decode function
int one_hot_decode(unsigned long one_hot) {
    if (one_hot == 0) return -1;

    int upper_ptr = 64;
    int lower_ptr = 0;
    int ptr;

    while (upper_ptr > lower_ptr) {
        ptr = (upper_ptr + lower_ptr) / 2;
        if ((one_hot >> ptr) != 0) lower_ptr = ptr + 1;
        else upper_ptr = ptr;
    }
    return upper_ptr - 1;
}

void assoc_lookup(assoc_mem_t* mem, unsigned int key, unsigned int* result, bool* rhit) {
    key &= 0xFFFFF; // 20 bits

    int key_quarter_0 = key & 0x1f;
    int key_quarter_1 = (key >> 5) & 0x1f;
    int key_quarter_2 = (key >> 10) & 0x1f;
    int key_quarter_3 = (key >> 15) & 0x1f;

    unsigned long match_quarter_0 = mem->quarter_0[key_quarter_0];
    unsigned long match_quarter_1 = mem->quarter_1[key_quarter_1];
    unsigned long match_quarter_2 = mem->quarter_2[key_quarter_2];
    unsigned long match_quarter_3 = mem->quarter_3[key_quarter_3];

    unsigned long match = match_quarter_0 & match_quarter_1 & match_quarter_2 & match_quarter_3;

    int addr = one_hot_decode(match);

    if (addr == -1) {
        *rhit = false;
    } else {
        *rhit = true;
        *result = mem->value[addr];
    }
}

// typedef struct {
//     int prefix_code;
//     unsigned char character;
// } DictEntry;

// // LZW version 2.9
void lzw(unsigned char* chunk, unsigned int* chunk_size, unsigned char* compressed_data, unsigned int* compressed_size_buffer) {
    assoc_mem_t assoc_mem;
    assoc_init(&assoc_mem);

    //bool wfull = false, rhit = false;
    //unsigned int result = 0;
    int nextCode = 256; 
    uint16_t code_words[MAX_CODE_WORDS];
    int code_word_count = 0;

    DictEntry dictionary[MAX_DICT_SIZE];
    int dict_size = nextCode; // Initially 256

    // Initialize the dictionary
    for (int i = 0; i < 256; i++) {
        dictionary[i].prefix_code = -1; // No prefix
        dictionary[i].character = (unsigned char)i;
    }

    int P = chunk[0]; // P is the code of the first character

    for (unsigned int i = 1; i < *chunk_size; ++i) {
        unsigned char C = chunk[i];
        int PC_code = -1;

        // Search for PC in the dictionary
        for (int j = 256; j < dict_size; j++) {
            if (dictionary[j].prefix_code == P && dictionary[j].character == C) {
                PC_code = j;
                break;
            }
        }

        if (PC_code != -1) {
            // PC found in dictionary
            P = PC_code;
        } else {
            // Output code for P
            code_words[code_word_count++] = P;

            // Add PC to the dictionary
            if (dict_size < MAX_DICT_SIZE) {
                dictionary[dict_size].prefix_code = P;
                dictionary[dict_size].character = C;
                dict_size++;
                nextCode++;
            } else {
                //wfull = true;
                printf("Dictionary is full. Stopping insertion.\n");
                break;
            }

            P = C; // Set P to code of C
        }
    }

    // Output code for P
    code_words[code_word_count++] = P;

    uint32_t bit_buffer = 0;
    int bit_count = 0;
    uint32_t compressed_size = 0;

    for (int i = 0; i < code_word_count; i++) {
        uint16_t code = code_words[i] & CODE_MASK;
        bit_buffer = (bit_buffer << CODE_LENGTH) | code;
        bit_count += CODE_LENGTH;

        while (bit_count >= 8) {
            uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
            compressed_data[compressed_size++] = byte;
            bit_count -= 8;
        }
    }

    if (bit_count > 0) {
        uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
        compressed_data[compressed_size++] = byte;
    }
    // Write compressed size back to global memory
    *compressed_size_buffer = compressed_size;
}



