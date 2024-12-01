// #include <iostream>
// #include <vector>
// #include <unordered_map>
// #include <stdlib.h>
// //****************************************************************************************************************
// #define CAPACITY 32768 // hash output is 15 bits, and we have 1 entry per bucket, so capacity is 2^15
// //#define CAPACITY 4096
// // try  uncommenting the line above and commenting line 6 to make the hash table smaller 
// // and see what happens to the number of entries in the assoc mem 
// // (make sure to also comment line 27 and uncomment line 28)

// unsigned int my_hash(unsigned long key)
// {
//     key &= 0xFFFFF; // make sure the key is only 20 bits

//     unsigned int hashed = 0;

//     for(int i = 0; i < 20; i++)
//     {
//         hashed += (key >> i)&0x01;
//         hashed += hashed << 10;
//         hashed ^= hashed >> 6;
//     }
//     hashed += hashed << 3;
//     hashed ^= hashed >> 11;
//     hashed += hashed << 15;
//     return hashed & 0x7FFF;          // hash output is 15 bits
//     //return hashed & 0xFFF;   
// }

// void hash_lookup(unsigned long* hash_table, unsigned int key, bool* hit, unsigned int* result)
// {
//     //std::cout << "hash_lookup():" << std::endl;
//     key &= 0xFFFFF; // make sure key is only 20 bits 

//     unsigned long lookup = hash_table[my_hash(key)];

//     // [valid][value][key]
//     unsigned int stored_key = lookup&0xFFFFF;       // stored key is 20 bits
//     unsigned int value = (lookup >> 20)&0xFFF;      // value is 12 bits
//     unsigned int valid = (lookup >> (20 + 12))&0x1; // valid is 1 bit
    
//     if(valid && (key == stored_key))
//     {
//         *hit = 1;
//         *result = value;
//         //std::cout << "\thit the hash" << std::endl;
//         //std::cout << "\t(k,v,h) = " << key << " " << value << " " << my_hash(key) << std::endl;
//     }
//     else
//     {
//         *hit = 0;
//         *result = 0;
//         //std::cout << "\tmissed the hash" << std::endl;
//     }
// }

// void hash_insert(unsigned long* hash_table, unsigned int key, unsigned int value, bool* collision)
// {
//     //std::cout << "hash_insert():" << std::endl;
//     key &= 0xFFFFF;   // make sure key is only 20 bits
//     value &= 0xFFF;   // value is only 12 bits

//     unsigned long lookup = hash_table[my_hash(key)];
//     unsigned int valid = (lookup >> (20 + 12))&0x1;

//     if(valid)
//     {
//         *collision = 1;
//         //std::cout << "\tcollision in the hash" << std::endl;
//     }
//     else
//     {
//         hash_table[my_hash(key)] = (1UL << (20 + 12)) | (value << 20) | key;
//         *collision = 0;
//         //std::cout << "\tinserted into the hash table" << std::endl;
//         //std::cout << "\t(k,v,h) = " << key << " " << value << " " << my_hash(key) << std::endl;
//     }
// }
// //****************************************************************************************************************
// typedef struct
// {   
//     // Each key_mem has a 9 bit address (so capacity = 2^9 = 512)
//     // and the key is 20 bits, so we need to use 3 key_mems to cover all the key bits.
//     // The output width of each of these memories is 64 bits, so we can only store 64 key
//     // value pairs in our associative memory map.

//     unsigned long upper_key_mem[512]; // the output of these  will be 64 bits wide (size of unsigned long).
//     unsigned long middle_key_mem[512];
//     unsigned long lower_key_mem[512]; 
//     unsigned int value[64];    // value store is 64 deep, because the lookup mems are 64 bits wide
//     unsigned int fill;         // tells us how many entries we've currently stored 
// } assoc_mem;

// // cast to struct and use ap types to pull out various feilds.

// void assoc_insert(assoc_mem* mem,  unsigned int key, unsigned int value, bool* collision)
// {
//     //std::cout << "assoc_insert():" << std::endl;
//     key &= 0xFFFFF; // make sure key is only 20 bits
//     value &= 0xFFF;   // value is only 12 bits

//     if(mem->fill < 64)
//     {
//         mem->upper_key_mem[(key >> 18)%512] |= (1 << mem->fill);  // set the fill'th bit to 1, while preserving everything else
//         mem->middle_key_mem[(key >> 9)%512] |= (1 << mem->fill);  // set the fill'th bit to 1, while preserving everything else
//         mem->lower_key_mem[(key >> 0)%512] |= (1 << mem->fill);   // set the fill'th bit to 1, while preserving everything else
//         mem->value[mem->fill] = value;
//         mem->fill++;
//         *collision = 0;
//         //std::cout << "\tinserted into the assoc mem" << std::endl;
//         //std::cout << "\t(k,v) = " << key << " " << value << std::endl;
//     }
//     else
//     {
//         *collision = 1;
//         //std::cout << "\tcollision in the assoc mem" << std::endl;
//     }
// }

// void assoc_lookup(assoc_mem* mem, unsigned int key, bool* hit, unsigned int* result)
// {
//     //std::cout << "assoc_lookup():" << std::endl;
//     key &= 0xFFFFF; // make sure key is only 20 bits

//     unsigned int match_high = mem->upper_key_mem[(key >> 18)%512];
//     unsigned int match_middle = mem->middle_key_mem[(key >> 9)%512];
//     unsigned int match_low  = mem->lower_key_mem[(key >> 0)%512];

//     unsigned int match = match_high & match_middle & match_low;

//     unsigned int address = 0;
//     for(; address < 64; address++)
//     {
//         if((match >> address) & 0x1)
//         {   
//             break;
//         }
//     }
//     if(address != 64)
//     {
//         *result = mem->value[address];
//         *hit = 1;
//         //std::cout << "\thit the assoc" << std::endl;
//         //std::cout << "\t(k,v) = " << key << " " << *result << std::endl;
//     }
//     else
//     {
//         *hit = 0;
//         //std::cout << "\tmissed the assoc" << std::endl;
//     }
// }
// //****************************************************************************************************************
// void insert(unsigned long* hash_table, assoc_mem* mem, unsigned int key, unsigned int value, bool* collision)
// {
//     hash_insert(hash_table, key, value, collision);
//     if(*collision)
//     {
//         assoc_insert(mem, key, value, collision);
//     }
// }

// void lookup(unsigned long* hash_table, assoc_mem* mem, unsigned int key, bool* hit, unsigned int* result)
// {
//     hash_lookup(hash_table, key, hit, result);
//     if(!*hit)
//     {
//         assoc_lookup(mem, key, hit, result);
//     }
// }
// //****************************************************************************************************************





// #include <cstdint>
// #include <vector>
// #include <unordered_map>
// #include <iostream>

// // Constants
// #define CODE_LENGTH 13                     // Code length in bits
// #define CODE_MASK ((1 << CODE_LENGTH) - 1) // Mask to extract CODE_LENGTH bits

// void lzw(const unsigned char* input_data, size_t input_size, std::vector<uint8_t>& compressed_data) {
//     if (input_size == 0) {
//         return;
//     }


//     size_t dict_size = 256;
//     const size_t max_dict_size = (size_t)1 << CODE_LENGTH;

//     std::unordered_map<std::string, uint16_t> dictionary;
//     for (uint16_t i = 0; i < 256; ++i) {
//         dictionary[std::string(1, static_cast<char>(i))] = i;
//     }

//     std::string current_str;
//     current_str += input_data[0];
//     std::vector<uint16_t> code_words;

//     for (size_t i = 1; i < input_size; ++i) {
//         char next_char = input_data[i];
//         std::string combined_str = current_str + next_char;

//         if (dictionary.find(combined_str) != dictionary.end()) {
//             current_str = combined_str;
//         } else {

//             code_words.push_back(dictionary[current_str]);


//             if (dict_size < max_dict_size) {
//                 dictionary[combined_str] = dict_size++;
//             }


//             current_str = std::string(1, next_char);
//         }
//     }

//     code_words.push_back(dictionary[current_str]);
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;
//     compressed_data.clear();

//     for (uint16_t code : code_words) {
//         code &= CODE_MASK;

//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         while (bit_count >= 8) {
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             compressed_data.push_back(byte);
//             bit_count -= 8;
//         }
//     }

//     if (bit_count > 0) {
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         compressed_data.push_back(byte);
//     }
// }





// void decoding(std::vector<int> op)
// {
//     std::cout << "\nDecoding\n";
//     std::unordered_map<int, std::string> table;
//     for (int i = 0; i <= 255; i++) {
//         std::string ch = "";
//         ch += char(i);
//         table[i] = ch;
//     }
//     int old = op[0], n;
//     std::string s = table[old];
//     std::string c = "";
//     c += s[0];
//     std::cout << s;
//     int count = 256;
//     for (int i = 0; i < op.size() - 1; i++) {
//         n = op[i + 1];
//         if (table.find(n) == table.end()) {
//             s = table[old];
//             s = s + c;
//         }
//         else {
//             s = table[n];
//         }
//         std::cout << s;
//         c = "";
//         c += s[0];
//         table[count] = table[old] + c;
//         count++;
//         old = n;
//     }
// }
// //****************************************************************************************************************
// int main()
// {

//     std::string s = "WYS*WYGWYS*WYSWYSG";

//     std::cout << "Our message is: " << s << std::endl << std::endl;
//     std::cout << "Running the software compression we get: " << std::endl;
//     const unsigned char* data = reinterpret_cast<const unsigned char*>(s.c_str());

//     std::vector<int> output_code = encoding(data, s.size());
//     //std::vector<unsigned char> output_code = encoding(data, s.size());
    
//     std::cout << "The compressed output stream is: ";
//     for (int i = 0; i < output_code.size(); i++) {
//         std::cout << output_code[i];
        
//     }
//     std::cout << "\n";
//     std::cout << output_code.size()*sizeof(int);
//     std::cout << std::endl << std::endl;

// }

// #include <cstdint>
// #include <vector>
// #include <unordered_map>
// #include <iostream>

// // Constants
// #define CODE_LENGTH 13                     // Code length in bits
// #define CODE_MASK ((1 << CODE_LENGTH) - 1) // Mask to extract CODE_LENGTH bits

// void lzw_encode(const unsigned char *input_data, size_t input_size, std::vector<uint8_t> &compressed_data)
// {
//     if (input_size == 0)
//     {
//         // Handle empty input
//         return;
//     }

//     // Initialize dictionary with single-character strings (codes 0 to 255)
//     size_t dict_size = 256;                                // Next available code in the dictionary
//     const size_t max_dict_size = (size_t)1 << CODE_LENGTH; // Maximum dictionary size based on code length

//     // Dictionary mapping strings to codes
//     std::unordered_map<std::string, uint16_t> dictionary;
//     for (uint16_t i = 0; i < 256; ++i)
//     {
//         dictionary[std::string(1, static_cast<char>(i))] = i;
//     }

//     std::string current_str;
//     current_str += input_data[0];
//     std::vector<uint16_t> code_words;

//     // LZW Compression Algorithm
//     for (size_t i = 1; i < input_size; ++i)
//     {
//         char next_char = input_data[i];
//         std::string combined_str = current_str + next_char;

//         if (dictionary.find(combined_str) != dictionary.end())
//         {
//             current_str = combined_str;
//         }
//         else
//         {
//             // Output the code for current_str
//             code_words.push_back(dictionary[current_str]);

//             // Add new string to the dictionary if there's space
//             if (dict_size < max_dict_size)
//             {
//                 dictionary[combined_str] = dict_size++;
//             }

//             current_str = std::string(1, next_char);
//         }
//     }

//     // Output the code for the last string
//     code_words.push_back(dictionary[current_str]);

//     // Now pack the code words into bytes as per the decoder's expectations
//     // We need to pack bits starting from the most significant bit in each byte
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;

//     // Prepare compressed_data vector
//     compressed_data.clear();

//     for (uint16_t code : code_words)
//     {
//         // Ensure code is within CODE_LENGTH bits
//         code &= CODE_MASK;

//         // Shift code into the bit buffer (MSB-first)
//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         // Extract bytes from the bit buffer
//         while (bit_count >= 8)
//         {
//             // Extract the top 8 bits
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             compressed_data.push_back(byte);
//             bit_count -= 8;
//         }
//     }

//     // Handle remaining bits (if any)
//     if (bit_count > 0)
//     {
//         // Left-align the remaining bits in the final byte (MSB-first)
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         compressed_data.push_back(byte);
//     }
// }


// #include <cstdint>
// #include <vector>
// #include <unordered_map>
// #include <iostream>

// // Constants
// #define CODE_LENGTH 13                     // Code length in bits
// #define CODE_MASK ((1 << CODE_LENGTH) - 1) // Mask to extract CODE_LENGTH bits

// void lzw(const unsigned char* input_data, size_t input_size, std::vector<uint8_t>& compressed_data) {
//     if (input_size == 0) {
//         return;
//     }


//     size_t dict_size = 256;
//     const size_t max_dict_size = (size_t)1 << CODE_LENGTH;

//     std::unordered_map<std::string, uint16_t> dictionary;
//     for (uint16_t i = 0; i < 256; ++i) {
//         dictionary[std::string(1, static_cast<char>(i))] = i;
//     }

//     std::string current_str;
//     current_str += input_data[0];
//     std::vector<uint16_t> code_words;

//     for (size_t i = 1; i < input_size; ++i) {
//         char next_char = input_data[i];
//         std::string combined_str = current_str + next_char;

//         if (dictionary.find(combined_str) != dictionary.end()) {
//             current_str = combined_str;
//         } else {

//             code_words.push_back(dictionary[current_str]);


//             if (dict_size < max_dict_size) {
//                 dictionary[combined_str] = dict_size++;
//             }


//             current_str = std::string(1, next_char);
//         }
//     }

//     code_words.push_back(dictionary[current_str]);
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;
//     compressed_data.clear();

//     for (uint16_t code : code_words) {
//         code &= CODE_MASK;

//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         while (bit_count >= 8) {
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             compressed_data.push_back(byte);
//             bit_count -= 8;
//         }
//     }

//     if (bit_count > 0) {
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         compressed_data.push_back(byte);
//     }
// }



// //LZW HARDWARE pragma
// #include <iostream>
// #include <vector>
// #include <cstdint>
// #include <string>
// #include <map>
// #include <stdio.h>
// #include "lzw.h"


// #define CODE_LENGTH 13
// #define CODE_MASK ((1 << CODE_LENGTH) - 1)

// // typedef struct {
// //     unsigned long quarter_0[32];
// //     unsigned long quarter_1[32];
// //     unsigned long quarter_2[32];
// //     unsigned long quarter_3[32];
// //     unsigned int value[64];
// //     unsigned int fill;
// // } assoc_mem_t;

// // Initialize assoc_mem
// //#pragma HLS INLINE
// void assoc_init(assoc_mem_t* mem) {
//     for (int i = 0; i < 32; i++) {
// //        #pragma HLS UNROLL
//         mem->quarter_0[i] = 0;
//         mem->quarter_1[i] = 0;
//         mem->quarter_2[i] = 0;
//         mem->quarter_3[i] = 0;
//     }
//     for (int i = 0; i < 64; i++) {
// //        #pragma HLS UNROLL
//         mem->value[i] = 0;
//     }
//     mem->fill = 0;
// }

// // Insert into assoc_mem
// //#pragma HLS INLINE
// void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull) {
//     key &= 0xFFFFF; // 20 bits
//     val &= 0xFFF;   // 12 bits

//     int key_quarter_0 = key & 0x1f;
//     int key_quarter_1 = (key >> 5) & 0x1f;
//     int key_quarter_2 = (key >> 10) & 0x1f;
//     int key_quarter_3 = (key >> 15) & 0x1f;

//     if (mem->fill < 512) {
//         mem->quarter_0[key_quarter_0] = 1UL << mem->fill;
//         mem->quarter_1[key_quarter_1] = 1UL << mem->fill;
//         mem->quarter_2[key_quarter_2] = 1UL << mem->fill;
//         mem->quarter_3[key_quarter_3] = 1UL << mem->fill;
//         mem->value[mem->fill] = val;
//         mem->fill++;
//         *wfull = false;
//     } else {
//         *wfull = true;
//     }
// }

// //#pragma HLS INLINE
// // one_hot_decode function
// int one_hot_decode(unsigned long one_hot) {
//     if (one_hot == 0) return -1;

//     int upper_ptr = 64;
//     int lower_ptr = 0;
//     int ptr;

//     while (upper_ptr > lower_ptr) {
//         #pragma HLS UNROLL
//         ptr = (upper_ptr + lower_ptr) / 2;
//         if ((one_hot >> ptr) != 0) lower_ptr = ptr + 1;
//         else upper_ptr = ptr;
//     }
//     return upper_ptr - 1;
// }

// //#pragma HLS INLINE
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

// void lzw(unsigned char* chunk, size_t chunk_size, std::vector<uint8_t>& compressed_data) {

// //    #pragma HLS INTERFACE m_axi port=chunk=p0
// //    #pragma HLS INTERFACE m_axi port=chunk_size=p1
// //    #pragma HLS INTERFACE m_axi port=compressed_data=p2

//     assoc_mem_t assoc_mem;
//     assoc_init(&assoc_mem);

//     bool wfull = false, rhit = false;
//     unsigned int result = 0;
//     int nextCode = 256; 
//     std::vector<uint16_t> code_words;

//    // #pragma HLS RESOURCE variable=dictionary core=RAM_2P
//     std::map<std::string, int> dictionary;
    
//     for (int i = 0; i < 256; i++) {
//         //#pragma HLS UNROLL
//         dictionary[std::string(1, char(i))] = i;
//     }

//     std::string P = ""; 
//     P += chunk[0];      

//     for (unsigned int i = 1; i < chunk_size; ++i) {
//         //#pragma HLS UNROLL
//         char C = chunk[i];
//         std::string PC = P + C;

//         assoc_lookup(&assoc_mem, dictionary[P], &result, &rhit);

//         if (dictionary.find(PC) != dictionary.end()) {
//             P = PC; 
//         } else {
//             code_words.push_back(dictionary[P]);

//             if (!rhit) {
//                 assoc_insert(&assoc_mem, dictionary[P], nextCode, &wfull);
//             }
//             dictionary[PC] = nextCode++;

//             if (wfull) {
//                 std::cout << "Assoc memory is full. Stopping insertion." << std::endl;
//                 break;
//             }
//             P = C;
//         }
//     }

//     code_words.push_back(dictionary[P]);

//     // Convert code words to byte stream
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;
//     compressed_data.clear();

//     for (uint16_t code : code_words) {
//         code &= CODE_MASK;

//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         while (bit_count >= 8) {
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             compressed_data.push_back(byte);
//             bit_count -= 8;
//         }
//     }

//     if (bit_count > 0) {
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         compressed_data.push_back(byte);
//     }
// }



// // // Insert into assoc_mem version 2.5
// #include <stdint.h>
// #include <stdio.h>
// #include <string.h>
// #include "lzw.h"

// #define CODE_LENGTH 13
// #define CODE_MASK ((1 << CODE_LENGTH) - 1)



// // Initialize assoc_mem
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

// // Insert into assoc_mem
// void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull) {
//     key &= 0xFFFFF; // 20 bits
//     val &= 0xFFF;   // 12 bits

//     int key_quarter_0 = key & 0x1f;
//     int key_quarter_1 = (key >> 5) & 0x1f;
//     int key_quarter_2 = (key >> 10) & 0x1f;
//     int key_quarter_3 = (key >> 15) & 0x1f;

//     if (mem->fill < 64) {
//         mem->quarter_0[key_quarter_0] = 1UL << mem->fill;
//         mem->quarter_1[key_quarter_1] = 1UL << mem->fill;
//         mem->quarter_2[key_quarter_2] = 1UL << mem->fill;
//         mem->quarter_3[key_quarter_3] = 1UL << mem->fill;
//         mem->value[mem->fill] = val;
//         mem->fill++;
//         *wfull = false;
//     } else {
//         *wfull = true;
//     }
// }

// // one_hot_decode function
// int one_hot_decode(unsigned long one_hot) {
//     if (one_hot == 0) return -1;

//     int upper_ptr = 64;
//     int lower_ptr = 0;
//     int ptr;

//     while (upper_ptr > lower_ptr) {
//         ptr = (upper_ptr + lower_ptr) / 2;
//         if ((one_hot >> ptr) != 0) lower_ptr = ptr + 1;
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



// int lzw(unsigned char* chunk, size_t chunk_size, uint8_t compressed_data[MAX_COMPRESSED_SIZE]) {
//     assoc_mem_t assoc_mem;
//     assoc_init(&assoc_mem);

//     bool wfull = false, rhit = false;
//     unsigned int result = 0;
//     int nextCode = 256; 
//     uint16_t code_words[MAX_CODE_WORDS];
//     int code_word_count = 0;

//     DictEntry dictionary[MAX_DICT_SIZE];
//     int dict_size = nextCode; // Initially 256

//     // Initialize the dictionary
//     for (int i = 0; i < 256; i++) {
//         dictionary[i].prefix_code = -1; // No prefix
//         dictionary[i].character = (unsigned char)i;
//     }

//     unsigned int P = chunk[0]; // P is the code of the first character

//     for (unsigned int i = 1; i < chunk_size; ++i) {
//         unsigned char C = chunk[i];
//         int PC_code = -1;

//         // Search for PC in the dictionary
//         for (int j = 256; j < dict_size; j++) {
//             if (dictionary[j].prefix_code == P && dictionary[j].character == C) {
//                 PC_code = j;
//                 break;
//             }
//         }

//         if (PC_code != -1) {
//             // PC found in dictionary
//             P = PC_code;
//         } else {
//             // Output code for P
//             code_words[code_word_count++] = P;

//             // Add PC to the dictionary
//             if (dict_size < MAX_DICT_SIZE) {
//                 dictionary[dict_size].prefix_code = P;
//                 dictionary[dict_size].character = C;
//                 dict_size++;
//                 nextCode++;
//             } else {
//                 wfull = true;
//                 printf("Dictionary is full. Stopping insertion.\n");
//                 break;
//             }

//             P = C; // Set P to code of C
//         }
//     }

//     // Output code for P
//     code_words[code_word_count++] = P;

//     // 输出码字（在编码为字节流之前）
//     printf("The code words are: ");
//     for (int i = 0; i < code_word_count; i++) {
//         printf("%d ", code_words[i]);
//     }
//     printf("\n");

//     // Convert code words to byte stream
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;
//     int compressed_size = 0;

//     for (int i = 0; i < code_word_count; i++) {
//         uint16_t code = code_words[i];
//         code &= CODE_MASK;
//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         while (bit_count >= 8) {
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             compressed_data[compressed_size++] = byte;
//             bit_count -= 8;
//         }
//     }

//     if (bit_count > 0) {
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         compressed_data[compressed_size++] = byte;
//     }

//     return compressed_size;
// }

// #include <iostream>
// #include <cstdint>
// #include <stdio.h>
// #include "lzw.h"

// #define CODE_LENGTH 13
// #define CODE_MASK ((1 << CODE_LENGTH) - 1)

// #define MAX_DICTIONARY_SIZE 8192
// #define MAX_SEQUENCE_LENGTH 16
// #define MAX_CODE_WORDS 10000
// #define MAX_COMPRESSED_SIZE 10000

// //typedef struct {
// //    unsigned long quarter_0[32];
// //    unsigned long quarter_1[32];
// //    unsigned long quarter_2[32];
// //    unsigned long quarter_3[32];
// //    unsigned int value[64];
// //    unsigned int fill;
// //} assoc_mem_t;

// // Initialize assoc_mem
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

// // Insert into assoc_mem
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

// // one_hot_decode function
// int one_hot_decode(unsigned long one_hot) {
//     if (one_hot == 0) return -1;

//     int position = 0;
//     while ((one_hot & 1) == 0) {
//         one_hot >>= 1;
//         position++;
//     }
//     return position;
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

// // Define a fixed-size structure to hold compressed data
// //typedef struct {
// //    uint8_t data[MAX_COMPRESSED_SIZE];
// //    int size;
// //} compressed_data_t;

// void lzw(unsigned char* chunk, size_t chunk_size, compressed_data_t* compressed_data) {

//     assoc_mem_t assoc_mem;
//     assoc_init(&assoc_mem);

//     bool wfull = false, rhit = false;
//     unsigned int result = 0;
//     int nextCode = 256;

//     uint16_t code_words[MAX_CODE_WORDS];
//     int code_words_size = 0;

// //    typedef struct {
// //        char sequence[MAX_SEQUENCE_LENGTH];
// //        int length;
// //        int code;
// //    } dict_entry_t;

//     dict_entry_t dictionary[MAX_DICTIONARY_SIZE];
//     int dict_size = 0;

//     // Initialize dictionary with single-character strings
//     for (int i = 0; i < 256; i++) {
//         dictionary[i].sequence[0] = (char)i;
//         dictionary[i].length = 1;
//         dictionary[i].code = i;
//     }
//     dict_size = 256;

//     char P[MAX_SEQUENCE_LENGTH];
//     int P_length = 1;
//     P[0] = chunk[0];

//     for (unsigned int i = 1; i < chunk_size; ++i) {
//         char C = chunk[i];
//         char PC[MAX_SEQUENCE_LENGTH];
//         int PC_length = P_length + 1;

//         // Copy P into PC
//         for (int j = 0; j < P_length; j++) {
//             PC[j] = P[j];
//         }
//         // Add C to PC
//         PC[P_length] = C;

//         // Search for PC in the dictionary
//         int dict_index = -1;
//         for (int k = 0; k < dict_size; k++) {
//             if (dictionary[k].length == PC_length) {
//                 bool match = true;
//                 for (int l = 0; l < PC_length; l++) {
//                     if (dictionary[k].sequence[l] != PC[l]) {
//                         match = false;
//                         break;
//                     }
//                 }
//                 if (match) {
//                     dict_index = k;
//                     break;
//                 }
//             }
//         }

//         if (dict_index != -1) {
//             // PC is in the dictionary
//             // P = PC
//             for (int j = 0; j < PC_length; j++) {
//                 P[j] = PC[j];
//             }
//             P_length = PC_length;
//         } else {
//             // Output code for P
//             int code_P = -1;
//             // Find code for P
//             for (int k = 0; k < dict_size; k++) {
//                 if (dictionary[k].length == P_length) {
//                     bool match = true;
//                     for (int l = 0; l < P_length; l++) {
//                         if (dictionary[k].sequence[l] != P[l]) {
//                             match = false;
//                             break;
//                         }
//                     }
//                     if (match) {
//                         code_P = dictionary[k].code;
//                         break;
//                     }
//                 }
//             }
//             if (code_P != -1) {
//                 code_words[code_words_size++] = code_P;
//             }

//             // If dictionary not full, add PC to dictionary
//             if (dict_size < MAX_DICTIONARY_SIZE) {
//                 for (int j = 0; j < PC_length; j++) {
//                     dictionary[dict_size].sequence[j] = PC[j];
//                 }
//                 dictionary[dict_size].length = PC_length;
//                 dictionary[dict_size].code = nextCode++;
//                 dict_size++;
//             }

//             // Set P = C
//             P[0] = C;
//             P_length = 1;
//         }
//     }

//     // Output code for P
//     int code_P = -1;
//     // Find code for P
//     for (int k = 0; k < dict_size; k++) {
//         if (dictionary[k].length == P_length) {
//             bool match = true;
//             for (int l = 0; l < P_length; l++) {
//                 if (dictionary[k].sequence[l] != P[l]) {
//                     match = false;
//                     break;
//                 }
//             }
//             if (match) {
//                 code_P = dictionary[k].code;
//                 break;
//             }
//         }
//     }
//     if (code_P != -1) {
//         code_words[code_words_size++] = code_P;
//     }

//     // Convert code words to byte stream
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;

//     compressed_data->size = 0;

//     for (int i = 0; i < code_words_size; i++) {
//         uint16_t code = code_words[i];
//         code &= CODE_MASK;

//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         while (bit_count >= 8) {
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             compressed_data->data[compressed_data->size++] = byte;
//             bit_count -= 8;
//         }
//     }

//     if (bit_count > 0) {
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         compressed_data->data[compressed_data->size++] = byte;
//     }
// }

// //without streaming
// #include <stdint.h>
// #include <stdio.h>
// #include <string.h>
// #include "lzw.h"

// // Initialize assoc_mem
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

// // Insert into assoc_mem
// void assoc_insert(assoc_mem_t* mem, unsigned int key, unsigned int val, bool* wfull) {
//     key &= 0xFFFFF; // 20 bits
//     val &= 0xFFF;   // 12 bits

//     int key_quarter_0 = key & 0x1f;
//     int key_quarter_1 = (key >> 5) & 0x1f;
//     int key_quarter_2 = (key >> 10) & 0x1f;
//     int key_quarter_3 = (key >> 15) & 0x1f;

//     if (mem->fill < 64) {
//         mem->quarter_0[key_quarter_0] = 1UL << mem->fill;
//         mem->quarter_1[key_quarter_1] = 1UL << mem->fill;
//         mem->quarter_2[key_quarter_2] = 1UL << mem->fill;
//         mem->quarter_3[key_quarter_3] = 1UL << mem->fill;
//         mem->value[mem->fill] = val;
//         mem->fill++;
//         *wfull = false;
//     } else {
//         *wfull = true;
//     }
// }

// // one_hot_decode function
// int one_hot_decode(unsigned long one_hot) {
//     if (one_hot == 0) return -1;

//     int upper_ptr = 64;
//     int lower_ptr = 0;
//     int ptr;

//     while (upper_ptr > lower_ptr) {
//         ptr = (upper_ptr + lower_ptr) / 2;
//         if ((one_hot >> ptr) != 0) lower_ptr = ptr + 1;
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

// // typedef struct {
// //     int prefix_code;
// //     unsigned char character;
// // } DictEntry;

// // // LZW version 2.9
// void lzw(unsigned char* chunk, unsigned int* chunk_size, uint8_t compressed_data[MAX_COMPRESSED_SIZE], uint32_t* compressed_size_buffer) {
//     assoc_mem_t assoc_mem;
//     assoc_init(&assoc_mem);

//     //bool wfull = false, rhit = false;
//     //unsigned int result = 0;
//     int nextCode = 256; 
//     uint16_t code_words[MAX_CODE_WORDS];
//     int code_word_count = 0;

//     DictEntry dictionary[MAX_DICT_SIZE];
//     int dict_size = nextCode; // Initially 256

//     // Initialize the dictionary
//     for (int i = 0; i < 256; i++) {
//         dictionary[i].prefix_code = -1; // No prefix
//         dictionary[i].character = (unsigned char)i;
//     }

//     int P = chunk[0]; // P is the code of the first character

//     for (unsigned int i = 1; i < *chunk_size; ++i) {
//         unsigned char C = chunk[i];
//         int PC_code = -1;

//         // Search for PC in the dictionary
//         for (int j = 256; j < dict_size; ++j) {
//             if (dictionary[j].prefix_code == P && dictionary[j].character == C) {
//                 PC_code = j;
//                 break;
//             }
//         }

//         if (PC_code != -1) {
//             // PC found in dictionary
//             P = PC_code;
//         } else {
//             // Output code for P
//             code_words[code_word_count++] = P;

//             // Add PC to the dictionary
//             if (dict_size < MAX_DICT_SIZE) {
//                 dictionary[dict_size].prefix_code = P;
//                 dictionary[dict_size].character = C;
//                 dict_size++;
//                 nextCode++;
//             } else {
//                 //wfull = true;
//                 printf("Dictionary is full. Stopping insertion.\n");
//                 break;
//             }

//             P = C; // Set P to code of C
//         }
//     }

//     // Output code for P
//     code_words[code_word_count++] = P;

//     // print codewards
//     // printf("The code words are: ");
//     // for (int i = 0; i < code_word_count; i++) {
//     //     printf("%d ", code_words[i]);
//     // }
//     // printf("\n");

//     // Convert code words to byte stream
//     uint32_t bit_buffer = 0;
//     int bit_count = 0;
//     uint32_t compressed_size = 0;

//     for (int i = 0; i < code_word_count; i++) {
//         uint16_t code = code_words[i] & CODE_MASK;
//         bit_buffer = (bit_buffer << CODE_LENGTH) | code;
//         bit_count += CODE_LENGTH;

//         while (bit_count >= 8) {
//             uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
//             compressed_data[compressed_size++] = byte;
//             bit_count -= 8;
//         }
//     }

//     if (bit_count > 0) {
//         uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
//         compressed_data[compressed_size++] = byte;
//     }
//     // Write compressed size back to global memory
//     *compressed_size_buffer = compressed_size;
// }















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
// #include "cdc.h"
// #include "lzw.h"
// #include <iostream>
// #include <vector>
// #include <string>
// #include <cstring>


#include "lzw.h"
uint16_t hw_dictionary[MAX_DICT_SIZE][2] = {0};  // Global dictionary

void hw_initialize_dictionary() {
#pragma HLS INLINE
    static bool initialized = false;  // Static flag to ensure one-time initialization
    if (!initialized) {
        for (uint16_t i = 0; i < 256; ++i) {
#pragma HLS UNROLL
            hw_dictionary[i][0] = 0xFFFF;  // No prefix for single characters
            hw_dictionary[i][1] = i;       // Character itself
        }
        initialized = true;  // Set flag to true after initialization
    }
}

void lzw(unsigned char *input_data, unsigned int *input_size, unsigned char* compressed_data,
                   unsigned int *compressed_size_buffer) {
    // if (input_size == 0) {
    //     // Handle empty input
    //     *compressed_size_buf = 0;
    //     return;
    // }
    // Ensure the dictionary is initialized before using
    hw_initialize_dictionary();

#pragma HLS ARRAY_PARTITION variable = hw_dictionary dim = 1 block factor = 8
#pragma HLS BIND_STORAGE variable = hw_dictionary type = ram_1p impl = bram

    uint16_t dict_size = 256;               // Next available code in the dictionary
    uint16_t current_code = input_data[0];  // Current prefix code
    uint16_t code_words[INPUT_SIZE];        // Store the encoded code words
    uint16_t code_word_count = 0;

    // LZW Compression Algorithm
    for (uint16_t i = 1; i < *input_size; ++i) {
        //#pragma HLS PIPELINE II = 1
        uint8_t next_char = input_data[i];
        bool found = false;

        // Search for the combined string in the dictionary
        for (uint16_t j = 256; j < dict_size; ++j) {
            if (hw_dictionary[j][0] == current_code && hw_dictionary[j][1] == next_char) {
                current_code = j;
                found = true;
                break;
            }
        }

        if (!found) {
            // Output the current_code
            code_words[code_word_count++] = current_code;

            // Add new string to the dictionary if there's space
            if (dict_size < MAX_DICT_SIZE) {
                hw_dictionary[dict_size][0] = current_code;
                hw_dictionary[dict_size][1] = next_char;
                ++dict_size;
            }

            current_code = next_char;  // Start new string with next_char
        }
    }

    // Output the code for the last string
    code_words[code_word_count++] = current_code;

    // Pack code words into bytes (MSB-first)
    uint32_t bit_buffer = 0;
    int bit_count = 0;
    uint32_t compressed_size = 0;

    for (uint16_t i = 0; i < code_word_count; ++i) {
        uint16_t code = code_words[i] & CODE_MASK;
        bit_buffer = (bit_buffer << CODE_LENGTH) | code;
        bit_count += CODE_LENGTH;

        // Extract bytes from the bit buffer
        while (bit_count >= 8) {
            uint8_t byte = (bit_buffer >> (bit_count - 8)) & 0xFF;
            compressed_data[compressed_size++] = byte;
            bit_count -= 8;
        }
    }

    // Handle remaining bits (if any)
    if (bit_count > 0) {
        uint8_t byte = (bit_buffer << (8 - bit_count)) & 0xFF;
        compressed_data[compressed_size++] = byte;
    }
    // Write compressed size back to global memory
    *compressed_size_buffer = compressed_size;
}
#include "lzw.h"
#include <iostream>
#include <vector>
#include <string>
#include <cstring>

// int main() {
//     // Input string
//     std::string s = "WYS*WYGWYS*WYSWYSG";
//     std::cout << "Our message is: " << s << std::endl << std::endl;

//     // Prepare input data
//     const unsigned char* data = reinterpret_cast<const unsigned char*>(s.c_str());
//     unsigned int chunk_size = s.size(); // Size of input data
//     unsigned char compressed_data[1024]; // Buffer for compressed data
//     uint32_t compressed_size = 0;

//     // Call LZW compression
//     lzw(const_cast<unsigned char*>(data), &chunk_size, compressed_data, &compressed_size);

//     // Print compressed output
//     std::cout << "The compressed output stream is: ";
//     for (int i = 0; i < compressed_size; i++) {
//         printf("%d ", compressed_data[i]);

//     }
//     std::cout << std::endl;

//     // Print size information
//     std::cout << "Compressed size: " << compressed_size << " bytes" << std::endl;
//     std::cout << "Original size: " << s.size() << " bytes" << std::endl;
//     std::cout << "Compression ratio: " << static_cast<float>(compressed_size) / s.size() << std::endl;

//     return 0;
// }