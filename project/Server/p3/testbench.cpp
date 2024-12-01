// #include "lzw.h"
// #include <iostream>
// #include <vector>
// #include <string>
// #include <cstring>

// int main() {
//     // Input string
//     std::string s = "WYS*WYGWYS*WYSWYSG";
//     std::cout << "Our message is: " << s << std::endl << std::endl;

//     // Prepare input data
//     const unsigned char* data = reinterpret_cast<const unsigned char*>(s.c_str());
//     unsigned int chunk_size = s.size(); // Size of input data
//     unsigned char compressed_data[1024]; // Buffer for compressed data
//     int compressed_size = 0;

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

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cstdlib>
#include <cstring>
#include <iomanip>
#include "lzw.h"

#define BUFFER_LEN 16384
#define MAX_OUTPUT_CODE_SIZE 40960

int main() {
    // 1. 准备测试数据
    std::string input_string = "WYS*WYGWYS*WYSWYSG";
    size_t input_size = input_string.size();

    // 检查输入数据大小是否超过缓冲区限制
    if (input_size > BUFFER_LEN) {
        std::cerr << "Input data is too large." << std::endl;
        return 1;
    }

    // 将输入字符串复制到输入缓冲区
    unsigned char input_data[BUFFER_LEN] = {0};
    memcpy(input_data, input_string.c_str(), input_size);

    // 定义输入数据大小
    unsigned int chunk_size = static_cast<unsigned int>(input_size);

    // 定义输出缓冲区和压缩后数据的大小
    unsigned char compressed_data[MAX_OUTPUT_CODE_SIZE] = {0};
    unsigned int compressed_size = 0;

    // 2. 调用 LZW 压缩函数
    lzw(input_data, &chunk_size, compressed_data, &compressed_size);

    // 3. 打印压缩结果
    std::cout << "Original size: " << chunk_size << " bytes" << std::endl;
    std::cout << "Compressed size: " << compressed_size << " bytes" << std::endl;

    // 打印压缩后的数据（以十六进制显示）
    std::cout << "Compressed data before codewords: ";
    for (unsigned int i = 0; i < compressed_size; i++) {
        std::cout << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(compressed_data[i]) << " ";
    }
    std::cout << std::dec << std::endl;

    // 打印压缩后的 codewords
    std::cout << "Compressed codewords: ";
    for (unsigned int i = 0; i < compressed_size; i += 4) {
        uint32_t codeword = 0;
        codeword |= ((uint32_t)compressed_data[i]) << 24;
        codeword |= ((uint32_t)compressed_data[i+1]) << 16;
        codeword |= ((uint32_t)compressed_data[i+2]) << 8;
        codeword |= ((uint32_t)compressed_data[i+3]);
        std::cout << codeword << " ";
    }
    std::cout << std::endl;

    // 结束测试
    std::cout << "Test completed." << std::endl;
    return 0;
}