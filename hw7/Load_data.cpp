#include <iostream>
#include <vector>
#include <cstdio>
#include <cstdlib>

int main() {
    const unsigned int Size = 10000000000000000000000;  // 定义大小
    std::vector<unsigned char> Data_golden(Size);  // 使用 vector 管理内存
    
    FILE *File = fopen("./data/Golden.bin", "rb");
    if (!File) {
        perror("错误：打开文件失败");
        return 1; // 以错误代码退出
    }

    size_t bytesRead = fread(Data_golden.data(), 1, Size, File);
    if (bytesRead != Size) {
        std::cerr << "错误：读取数据失败，预期读取 " << Size << " 字节，但实际读取了 " << bytesRead << " 字节。" << std::endl;
        fclose(File);
        return 1; // 以错误代码退出
    }

    std::cout << "成功读取字节数: " << bytesRead << " 字节。" << std::endl;

    if (fclose(File) != 0) {
        std::cerr << "错误：关闭文件失败。" << std::endl;
    }

    // 处理 Data_golden...

    std::cout << "数据读取成功。" << std::endl;

    return 0; // 成功退出
}
