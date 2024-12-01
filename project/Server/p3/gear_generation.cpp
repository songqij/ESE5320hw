#include <iostream>
#include <cstdlib>
#include <cstdint>
#include <ctime>

// 生成随机 GEAR 值的脚本
int main() {
    std::srand(10); // 固定种子，保证每次生成相同的结果
    for (int i = 0; i < 256; i++) {
        uint64_t value = ((uint64_t)std::rand() << 32) | std::rand();
        std::cout << value;
        if (i != 255) std::cout << ", ";
    }
    return 0;
}
