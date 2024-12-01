#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <hls_stream.h>
#include "lzw.h"

#define CAPACITY 16384 // Hash output is 15 bits, so capacity is 2^15
#define SEED 524057
#define ASSOCIATIVE_MEM_STORE 64
#define INFO_LEN 4
#define MAX_OUTPUT_CODE_SIZE 40960

#define SEED_MURMUR 524057
#define SEED_CRAP 75768593

#define FNV_PRIME 16777619
#define FNV_OFFSET_BASIS 2166136261U

static inline uint32_t murmur_32_scramble(uint32_t k) {
    k *= 0xcc9e2d51;
    k = (k << 15) | (k >> 17);
    k *= 0x1b873593;
    return k;
}

unsigned int inline murmur_hash(unsigned long key) {
    uint32_t h = SEED;
    uint32_t k = key;

    h ^= murmur_32_scramble(k);
    h = (h << 13) | (h >> 19);
    h = h * 5 + 0xe6546b64;

    h ^= murmur_32_scramble(k);
    /* Finalize. */
    h ^= h >> 16;
    h *= 0x85ebca6b;
    h ^= h >> 13;
    h *= 0xc2b2ae35;
    h ^= h >> 16;
    return h;
}

unsigned int my_hash(unsigned long key) {
    unsigned int hash_1 = murmur_hash(~key);
    return hash_1 & (CAPACITY - 1);
}

void inline hash_lookup(unsigned long (*hash_table)[2], unsigned int key,
                        bool *hit, unsigned int *result) {

    key &= 0x1FFFFF; // Make sure key is only 21 bits

    unsigned int hash_val = my_hash(key);

    unsigned long lookup = hash_table[hash_val][0];

    // [valid][value][key]
    unsigned long stored_key = lookup & 0x1FFFFF;       // Stored key is 21 bits
    unsigned long value = (lookup >> 21) & 0x1FFF;      // Value is 13 bits
    unsigned long valid = (lookup >> (21 + 13)) & 0x1;  // Valid is 1 bit

    if (valid && (key == stored_key)) {
        *hit = 1;
        *result = value;
        return;
    }

    lookup = hash_table[hash_val][1];

    // [valid][value][key]
    stored_key = lookup & 0x1FFFFF;       // Stored key is 21 bits
    value = (lookup >> 21) & 0x1FFF;      // Value is 13 bits
    valid = (lookup >> (21 + 13)) & 0x1;  // Valid is 1 bit
    if (valid && (key == stored_key)) {
        *hit = 1;
        *result = value;
        return;
    }
    *hit = 0;
    *result = 0;
}

void inline hash_insert(unsigned long (*hash_table)[2], unsigned int key,
                        unsigned int value, bool *collision) {

    key &= 0x1FFFFF; // Make sure key is only 21 bits
    value &= 0x1FFF; // Value is only 13 bits

    unsigned int hash_val = my_hash(key);

    unsigned long lookup = hash_table[hash_val][0];
    unsigned long valid = (lookup >> (21 + 13)) & 0x1;

    if (!valid) {
        hash_table[hash_val][0] = (1UL << (21 + 13)) | ((unsigned long)(value) << 21) | key;
        *collision = 0;
        return;
    }

    lookup = hash_table[hash_val][1];
    valid = (lookup >> (21 + 13)) & 0x1;
    if (!valid) {
        hash_table[hash_val][1] = (1UL << (21 + 13)) | ((unsigned long)(value) << 21) | key;
        *collision = 0;
        return;
    }
    *collision = 1;
}

void inline assoc_insert(assoc_mem *mem, unsigned int key, unsigned int value,
                         bool *collision) {
    key &= 0x1FFFFF; // Make sure key is only 21 bits
    value &= 0x1FFF; // Value is only 13 bits

    unsigned int mem_fill = mem->fill;

    if (mem_fill < ASSOCIATIVE_MEM_STORE) {
        unsigned int key_high = (key >> 18) & 0x1FF;
        unsigned int key_middle = (key >> 9) & 0x1FF;
        unsigned int key_low = (key)&0x1FF;
        mem->upper_key_mem[key_high] |=
            (1UL << mem_fill); // Set the fill'th bit to 1
        mem->middle_key_mem[key_middle] |=
            (1UL << mem_fill); // Set the fill'th bit to 1
        mem->lower_key_mem[key_low] |=
            (1UL << mem_fill); // Set the fill'th bit to 1
        mem->value[mem_fill] = value;
        mem->fill = mem_fill + 1;
        *collision = 0;
        return;
    }
    *collision = 1;
}

void inline assoc_lookup(assoc_mem *mem, unsigned int key, bool *hit,
                         unsigned int *result) {
    key &= 0x1FFFFF; // Make sure key is only 21 bits
    unsigned int key_high = (key >> 18) & 0x1FF;
    unsigned int key_middle = (key >> 9) & 0x1FF;
    unsigned int key_low = (key)&0x1FF;

    unsigned long match_high = mem->upper_key_mem[key_high];
    unsigned long match_middle = mem->middle_key_mem[key_middle];
    unsigned long match_low = mem->lower_key_mem[key_low];

    unsigned long match = match_high & match_middle & match_low;

    if (match == 0) {
        *hit = 0;
        return;
    }

    unsigned int address = 0;

    // Find the first set bit
    address += ((match & 0xFFFFFFFFUL) == 0) ? 32 : 0;
    match >>= ((match & 0xFFFFFFFFUL) == 0) ? 32 : 0;

    address += ((match & 0xFFFFUL) == 0) ? 16 : 0;
    match >>= ((match & 0xFFFFUL) == 0) ? 16 : 0;

    address += ((match & 0xFFUL) == 0) ? 8 : 0;
    match >>= ((match & 0xFFUL) == 0) ? 8 : 0;

    address += ((match & 0xFUL) == 0) ? 4 : 0;
    match >>= ((match & 0xFUL) == 0) ? 4 : 0;

    address += ((match & 0x3UL) == 0) ? 2 : 0;
    match >>= ((match & 0x3UL) == 0) ? 2 : 0;

    address += ((match & 0x1UL) == 0) ? 1 : 0;
    match >>= ((match & 0x1UL) == 0) ? 1 : 0;

    if (address != ASSOCIATIVE_MEM_STORE) {
        *result = mem->value[address];
        *hit = 1;
        return;
    }
    *hit = 0;
}

void inline insert(unsigned long (*hash_table)[2], assoc_mem *mem,
                   unsigned int key, unsigned int value, bool *collision) {
    hash_insert(hash_table, key, value, collision);
    if (*collision) {
        assoc_insert(mem, key, value, collision);
    }
}

void inline lookup(unsigned long (*hash_table)[2], assoc_mem *mem,
                   unsigned int key, bool *hit, unsigned int *result) {
    hash_lookup(hash_table, key, hit, result);
    if (!*hit) {
        assoc_lookup(mem, key, hit, result);
    }
}

static void compute_lzw(hls::stream<unsigned char>& input_stream,
                        hls::stream<uint32_t>& out_stream) {

    // Create hash table and assoc mem
    unsigned long hash_table[CAPACITY][2];
    assoc_mem my_assoc_mem;

#pragma HLS array_partition variable=hash_table complete dim=2

    // Initialize hash table
    for (int i = 0; i < CAPACITY; i++) {
#pragma HLS UNROLL factor=512
        hash_table[i][0] = 0;
        hash_table[i][1] = 0;
    }
    my_assoc_mem.fill = 0;

    for (int i = 0; i < 512; i++) {
#pragma HLS UNROLL
        my_assoc_mem.upper_key_mem[i] = 0;
        my_assoc_mem.middle_key_mem[i] = 0;
        my_assoc_mem.lower_key_mem[i] = 0;
    }

    unsigned int next_code = 256;
    uint8_t failure = 0;

    // Read the first character
    unsigned int prefix_code;
    if (!input_stream.empty()) {
        prefix_code = input_stream.read();
    } else {
        // Empty input, nothing to do
        return;
    }

    unsigned int code = 0;
    unsigned char next_char = 0;

    while (!input_stream.empty()) {
        next_char = input_stream.read();
        bool hit = 0;
        lookup(hash_table, &my_assoc_mem, ((prefix_code << 8) + next_char), &hit, &code);
        if (!hit) {
            out_stream.write(prefix_code);
            bool collision = 0;
            insert(hash_table, &my_assoc_mem, ((prefix_code << 8) + next_char),
                   next_code, &collision);
            if (collision) {
                failure = 1;
            }
            next_code += 1;
            prefix_code = next_char;
        } else {
            prefix_code = code;
        }
    }

    // Write the last prefix_code
    out_stream.write(prefix_code);

    // Optionally, handle failure
    if (failure) {
        // Handle failure if necessary
    }
}

static void store_data(hls::stream<uint32_t>& out_stream,
                       unsigned char* compressed_data,
                       unsigned int* compressed_size_buffer) {
    unsigned int i = 0;

//    while (!out_stream.empty()) {
//        if (i < MAX_OUTPUT_CODE_SIZE * 4) {
//            uint32_t code = out_stream.read();
//            // Write the code as 4 bytes
//            compressed_data[i++] = (code >> 24) & 0xFF;
//            compressed_data[i++] = (code >> 16) & 0xFF;
//            compressed_data[i++] = (code >> 8) & 0xFF;
//            compressed_data[i++] = code & 0xFF;
//        } else {
//            // Output buffer is full
//            break;
//        }
//    }
    while (!out_stream.empty()) {
    	if (i < MAX_OUTPUT_CODE_SIZE * 4) {
    		uint32_t code = out_stream.read();
// Write the code as 4 bytes
    		compressed_data[i++] = (code >> 24) & 0xFF;
    		compressed_data[i++] = (code >> 16) & 0xFF;
    		compressed_data[i++] = (code >> 8) & 0xFF;
    		compressed_data[i++] = code & 0xFF;
    		} else {
    			// Output buffer is full
    			break;
    		}
    	}
    *compressed_size_buffer = i; // Total bytes written to compressed_data
}

static void load_data(unsigned char* input,
                      unsigned int input_size,
                      hls::stream<unsigned char>& input_stream) {
    for (unsigned int i = 0; i < input_size; i++) {
        input_stream.write(input[i]);
    }
}

static void compute_data(hls::stream<unsigned char>& input_stream,
                         hls::stream<uint32_t>& out_stream) {
    compute_lzw(input_stream, out_stream);
}

static void perform_lzw(unsigned char* input,
                        unsigned int input_size,
                        unsigned char* compressed_data,
                        unsigned int* compressed_size_buffer) {

    hls::stream<unsigned char> in_stream("chunk_in");
    hls::stream<uint32_t> out_stream("lzw_out");

#pragma HLS STREAM variable=in_stream depth=16384
#pragma HLS STREAM variable=out_stream depth=40960

    load_data(input, input_size, in_stream);
    compute_data(in_stream, out_stream);
    store_data(out_stream, compressed_data, compressed_size_buffer);
}

void lzw(unsigned char* chunk,
         unsigned int* chunk_size,
         unsigned char* compressed_data,
         unsigned int* compressed_size_buffer) {

#pragma HLS INTERFACE m_axi port=chunk depth=16384 bundle=p0
#pragma HLS INTERFACE m_axi port=compressed_data depth=40960 bundle=p1
#pragma HLS INTERFACE s_axilite port=chunk_size
#pragma HLS INTERFACE s_axilite port=compressed_size_buffer

    perform_lzw(chunk, *chunk_size, compressed_data, compressed_size_buffer);
}


//
////zheng ban
//#include <stdint.h>
//#include <stdio.h>
//#include <string.h>
//#include "lzw.h"
//
//// Initialize assoc_mem
//void assoc_init(assoc_mem_t* mem) {
//    for (int i = 0; i < 32; i++) {
//        mem->quarter_0[i] = 0;
//        mem->quarter_1[i] = 0;
//        mem->quarter_2[i] = 0;
//        mem->quarter_3[i] = 0;
//    }
//    for (int i = 0; i < 64; i++) {
//        mem->value[i] = 0;
//    }
//    mem->fill = 0;
//}
//
//// Insert into assoc_mem
//void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull) {
//    key &= 0xFFFFF; // 20 bits
//    val &= 0xFFF;   // 12 bits
//
//    int key_quarter_0 = key & 0x1f;
//    int key_quarter_1 = (key >> 5) & 0x1f;
//    int key_quarter_2 = (key >> 10) & 0x1f;
//    int key_quarter_3 = (key >> 15) & 0x1f;
//
//    if (mem->fill < 64) {
//        mem->quarter_0[key_quarter_0] = 1UL << mem->fill;
//        mem->quarter_1[key_quarter_1] = 1UL << mem->fill;
//        mem->quarter_2[key_quarter_2] = 1UL << mem->fill;
//        mem->quarter_3[key_quarter_3] = 1UL << mem->fill;
//        mem->value[mem->fill] = val;
//        mem->fill++;
//        *wfull = false;
//    } else {
//        *wfull = true;
//    }
//}
//
//// one_hot_decode function
//int one_hot_decode(unsigned long one_hot) {
//    if (one_hot == 0) return -1;
//
//    int upper_ptr = 64;
//    int lower_ptr = 0;
//    int ptr;
//
//    while (upper_ptr > lower_ptr) {
//        ptr = (upper_ptr + lower_ptr) / 2;
//        if ((one_hot >> ptr) != 0) lower_ptr = ptr + 1;
//        else upper_ptr = ptr;
//    }
//    return upper_ptr - 1;
//}
//
//void assoc_lookup(assoc_mem_t* mem, unsigned int key, unsigned int* result, bool* rhit) {
//    key &= 0xFFFFF; // 20 bits
//
//    int key_quarter_0 = key & 0x1f;
//    int key_quarter_1 = (key >> 5) & 0x1f;
//    int key_quarter_2 = (key >> 10) & 0x1f;
//    int key_quarter_3 = (key >> 15) & 0x1f;
//
//    unsigned long match_quarter_0 = mem->quarter_0[key_quarter_0];
//    unsigned long match_quarter_1 = mem->quarter_1[key_quarter_1];
//    unsigned long match_quarter_2 = mem->quarter_2[key_quarter_2];
//    unsigned long match_quarter_3 = mem->quarter_3[key_quarter_3];
//
//    unsigned long match = match_quarter_0 & match_quarter_1 & match_quarter_2 & match_quarter_3;
//
//    int addr = one_hot_decode(match);
//
//    if (addr == -1) {
//        *rhit = false;
//    } else {
//        *rhit = true;
//        *result = mem->value[addr];
//    }
//}
//
//// typedef struct {
////     int prefix_code;
////     unsigned char character;
//// } DictEntry;
//
//// // LZW version 2.9
//void lzw(unsigned char* chunk, unsigned int* chunk_size, unsigned char* compressed_data, unsigned int* compressed_size_buffer) {
//    assoc_mem_t assoc_mem;
//    assoc_init(&assoc_mem);
//
//    int nextCode = 256;
//    uint16_t code_words[MAX_CODE_WORDS];
//    int code_word_count = 0;
//
//    DictEntry dictionary[MAX_DICT_SIZE];
//    int dict_size = nextCode; // Initially 256
//
//    // Initialize the dictionary
//    for (int i = 0; i < 256; i++) {
//        dictionary[i].prefix_code = -1; // No prefix
//        dictionary[i].character = (unsigned char)i;
//    }
//
//    int P = chunk[0]; // P is the code of the first character
//
//    for (unsigned int i = 1; i < *chunk_size; ++i) {
//        unsigned char C = chunk[i];
//        int PC_code = -1;
//
//        // Search for PC in the dictionary
//        for (int j = 256; j < dict_size; j++) {
//            if (dictionary[j].prefix_code == P && dictionary[j].character == C) {
//                PC_code = j;
//                break;
//            }
//        }
//
//        if (PC_code != -1) {
//            // PC found in dictionary
//            P = PC_code;
//        } else {
//            // Output code for P
//            code_words[code_word_count++] = P;
//
//            // Add PC to the dictionary
//            if (dict_size < MAX_DICT_SIZE) {
//                dictionary[dict_size].prefix_code = P;
//                dictionary[dict_size].character = C;
//                dict_size++;
//                nextCode++;
//            } else {
//                //wfull = true;
//                printf("Dictionary is full. Stopping insertion.\n");
//                break;
//            }
//
//            P = C; // Set P to code of C
//        }
//    }
//
//    // Output code for P
//    code_words[code_word_count++] = P;
//
//    uint32_t bit_buffer = 0;
//    int bit_count = 0;
//    uint32_t compressed_size = 0;
//
//    for (int i = 0; i < code_word_count; i++) {
//    	printf("code_word is %d\n",code_words[i]);
//        uint16_t code = code_words[i] & CODE_MASK;
//        bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//        bit_count += CODE_LENGTH;
//
//        while (bit_count >= 8) {
//            uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//            compressed_data[compressed_size++] = byte;
//            bit_count -= 8;
//        }
//    }
//
//    if (bit_count > 0) {
//        uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//        compressed_data[compressed_size++] = byte;
//    }
//    // Write compressed size back to global memory
//    *compressed_size_buffer = compressed_size;
//}
//
//
//
//
//
//
