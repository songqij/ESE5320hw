// #include <stdio.h>
// #include <stdlib.h>
// #include <stdint.h>
// #include <math.h>
// //#include"stopwatch.h"
// #include <iostream>
// #include <cstring>
// #include <cstdlib>

// #include <stdio.h>
// #include <stdlib.h>
// #include <stdint.h>
// #include <string.h>

// #define WIN_SIZE 16
// #define PRIME 3
// #define MODULUS 256
// #define TARGET 0

// // Initial hash function to calculate full hash for a given window
// uint64_t initial_hash_func(const unsigned char *input, unsigned int pos)
// {
//     uint64_t hash = 0;
//     for (int i = 0; i < WIN_SIZE; i++)
//     {
//         hash += input[pos + WIN_SIZE - 1 - i] * (uint64_t)pow(PRIME, i + 1);
//     }
//     return hash;
// }

// // Rolling hash function to update hash from previous position
// uint64_t rolling_hash(uint64_t previous_hash, unsigned char old_char, unsigned char new_char)
// {
//     previous_hash = (previous_hash * PRIME) 
//                     - (old_char * (uint64_t)pow(PRIME, WIN_SIZE + 1))
//                     + (new_char * PRIME);
//     return previous_hash;
// }

// // CDC function to split file into chunks based on hash condition
// void cdc(const unsigned char *buff, unsigned int buff_size, unsigned char ***chunks, unsigned int *chunk_count, unsigned int **chunk_sizes)
// {
//     if (buff_size < WIN_SIZE) return;

//     unsigned int start = 0;
//     *chunk_count = 0;
//     *chunks = (unsigned char **)malloc(sizeof(unsigned char *) * (buff_size / WIN_SIZE + 1));
//     *chunk_sizes = (unsigned int *)malloc(sizeof(unsigned int) * (buff_size / WIN_SIZE + 1));

//     // Calculate initial hash for the first window
//     uint64_t current_hash = initial_hash_func(buff, 0);

//     for (unsigned int i = 1; i <= buff_size - WIN_SIZE; i++)
//     {
//         current_hash = rolling_hash(current_hash, buff[i - 1], buff[i + WIN_SIZE - 1]);

//         // Check if the hash meets the target condition
//         if (current_hash % MODULUS == TARGET) {
//             unsigned int chunk_size = i - start + WIN_SIZE;
//             (*chunks)[*chunk_count] = (unsigned char *)malloc(chunk_size);
//             memcpy((*chunks)[*chunk_count], buff + start, chunk_size);
//             (*chunk_sizes)[*chunk_count] = chunk_size;

//             (*chunk_count)++;
//             start = i + WIN_SIZE;
//         }
//     }

//     // Handle remaining data as the last chunk
//     if (start < buff_size) {
//         unsigned int chunk_size = buff_size - start;
//         (*chunks)[*chunk_count] = (unsigned char *)malloc(chunk_size);
//         memcpy((*chunks)[*chunk_count], buff + start, chunk_size);
//         (*chunk_sizes)[*chunk_count] = chunk_size;
//         //std::cout << "Final chunk " << *chunk_count << ": size = " << chunk_size << ", start = " << start << ", end = " << (start + chunk_size - 1) << std::endl;
//         (*chunk_count)++;
//         //std::cout << "Total chunks created: " << *chunk_count << std::endl;
//     }
// }

// //Function to test the CDC with a given file
// void test_cdc(const char* file)
// {
//     FILE* infile = fopen(file, "rb");
//     if (!infile)
//     {
//         perror("Error opening file");
//         return;
//     }

//     // Get the file size
//     fseek(infile, 0, SEEK_END);
//     long file_size = ftell(infile);
//     fseek(infile, 0, SEEK_SET);

//     // Allocate buffer to hold the file contents
//     unsigned char* buff = (unsigned char*)malloc(file_size);
//     if (!buff)
//     {
//         perror("Error allocating memory");
//         fclose(infile);
//         return;
//     }

//     // Read the file into the buffer
//     if (fread(buff, 1, file_size, infile) != file_size)
//     {
//         perror("Error reading file");
//         free(buff);
//         fclose(infile);
//         return;
//     }

//     // Variables to store chunks and sizes
//     unsigned char **chunks;
//     unsigned int chunk_count;
//     unsigned int *chunk_sizes;

//     // Call the CDC function to perform chunking
//     cdc(buff, file_size, &chunks, &chunk_count, &chunk_sizes);

    

//     // Output chunk information
//     printf("Total chunks created: %u\n", chunk_count);
//     for (unsigned int i = 0; i < chunk_count; i++) {
//         printf("Chunk %u (size %u): ", i, chunk_sizes[i]);
//         for (unsigned int j = 0; j < chunk_sizes[i]; j++) {
//             printf("%c", chunks[i][j]);
//         }
//         printf("\n");
//         free(chunks[i]); // Free each chunk after printing
//     }

//     // Free allocated memory
//     free(chunks);
//     free(chunk_sizes);
//     free(buff);
//     fclose(infile);
// }

// int main()
// {
//     test_cdc("LittlePrince.txt");
//     return 0;
// }

// #include <stdio.h>
// #include <stdlib.h>
// #include <stdint.h>
// #include <math.h>
// #include <string.h>
// #include "cdc.h"

// #define WIN_SIZE 16
// #define PRIME 3
// #define MODULUS 256
// #define TARGET 128

// uint64_t initial_hash_func(const unsigned char *input, unsigned int pos) {
//     uint64_t hash = 0;
//     for (int i = 0; i < WIN_SIZE; i++) {
//         hash += input[pos + WIN_SIZE - 1 - i] * (uint64_t)pow(PRIME, i + 1);
//     }
//     return hash;
// }

// uint64_t rolling_hash(uint64_t previous_hash, unsigned char old_char, unsigned char new_char) {
//     previous_hash -= old_char * (uint64_t)pow(PRIME, WIN_SIZE);
//     previous_hash = previous_hash * PRIME + new_char * PRIME;
//     return previous_hash;
// }

// void cdc(const unsigned char *buff, unsigned int buff_size,
//          unsigned char **chunks, unsigned int *chunk_sizes,
//          unsigned int *chunk_count, unsigned int max_chunks) {
//     if (buff_size < WIN_SIZE) {
//         *chunk_count = 0;
//         return;
//     }

//     unsigned int start = 0;
//     *chunk_count = 0;

//     uint64_t current_hash = initial_hash_func(buff, 0);

//     for (unsigned int i = 1; i <= buff_size - WIN_SIZE; i++) {
//         current_hash = rolling_hash(current_hash, buff[i - 1], buff[i + WIN_SIZE - 1]);

//         if (current_hash % MODULUS == TARGET) {
//             if (*chunk_count >= max_chunks) {
//                 fprintf(stderr, "Error: Maximum chunk limit exceeded\n");
//                 break;
//             }

//             unsigned int chunk_size = i - start + WIN_SIZE;
//             chunks[*chunk_count] = (unsigned char *)malloc(chunk_size);
//             if (!chunks[*chunk_count]) {
//                 perror("Memory allocation for chunk failed");
//                 break;
//             }
//             memcpy(chunks[*chunk_count], buff + start, chunk_size);
//             chunk_sizes[*chunk_count] = chunk_size;

//             (*chunk_count)++;
//             start = i + WIN_SIZE;
//         }
//     }

//     if (start < buff_size) {
//         if (*chunk_count < max_chunks) {
//             unsigned int chunk_size = buff_size - start;
//             chunks[*chunk_count] = (unsigned char *)malloc(chunk_size);
//             if (!chunks[*chunk_count]) {
//                 perror("Memory allocation for last chunk failed");
//             } else {
//                 memcpy(chunks[*chunk_count], buff + start, chunk_size);
//                 chunk_sizes[*chunk_count] = chunk_size;

//                 (*chunk_count)++;
//             }
//         } else {
//             fprintf(stderr, "Error: Maximum chunk limit exceeded for the last chunk\n");
//         }
//     }
// }

// void test_cdc(const char *file) {
//     FILE *infile = fopen(file, "rb");
//     if (!infile) {
//         perror("Error opening file");
//         return;
//     }

//     fseek(infile, 0, SEEK_END);
//     long file_size = ftell(infile);
//     fseek(infile, 0, SEEK_SET);

//     unsigned char *buff = (unsigned char *)malloc(file_size);
//     if (!buff) {
//         perror("Error allocating memory");
//         fclose(infile);
//         return;
//     }

//     if (fread(buff, 1, file_size, infile) != file_size) {
//         perror("Error reading file");
//         free(buff);
//         fclose(infile);
//         return;
//     }

//     fclose(infile);

//     // 假设文件不会超过 1000 个块
//     unsigned int max_chunks = 1000;
//     unsigned char *chunks[max_chunks];
//     unsigned int chunk_sizes[max_chunks];
//     unsigned int chunk_count = 0;

//     // 调用 CDC 函数
//     cdc(buff, file_size, chunks, chunk_sizes, &chunk_count, max_chunks);

//     // 输出块信息
//     printf("Total chunks created: %u\n", chunk_count);
//     for (unsigned int i = 0; i < chunk_count; i++) {
//         printf("Chunk %u (size %u): ", i, chunk_sizes[i]);
//         for (unsigned int j = 0; j < chunk_sizes[i]; j++) {
//             printf("%c", chunks[i][j]);
//         }
//         printf("\n");
//         free(chunks[i]);
//     }

//     free(buff);
// }

// int main() {
//     test_cdc("LittlePrince.txt");
//     return 0;
// }



//fast cdc

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <vector>

using namespace std;

#define CHUNK_SIZE 4096
#define MODULUS_MASK (CHUNK_SIZE - 1)
#define MODULUS_MASK_S ((CHUNK_SIZE * 2) - 1)
#define MODULUS_MASK_L ((CHUNK_SIZE / 2) - 1)
#define TARGET 0
#define BITS 12
#define MINSIZE 1024
#define BUFFER_LEN 16384

uint64_t GEAR[256] = {
    1553318008,574654857,759734804,310648967,1393527547,1195718329,694400241,1154184075,1319583805,1298164590,122602963,989043992,
    1918895050,933636724,1369634190,1963341198,1565176104,1296753019,1105746212,1191982839,1195494369,29065008,1635524067,722221599,
    1355059059,564669751,1620421856,1100048288,1018120624,1087284781,1723604070,1415454125,737834957,1854265892,1605418437,1697446953,
    973791659,674750707,1669838606,320299026,1130545851,1725494449,939321396,748475270,554975894,1651665064,1695413559,671470969,992078781,
    1935142196,1062778243,1901125066,    1935811166,    1644847216,    744420649,    2068980838,    1988851904,
    1263854878,
    1979320293,
    111370182,
    817303588,
    478553825,
    694867320,
    685227566,
    345022554,
    2095989693,
    1770739427,
    165413158,
    1322704750,
    46251975,
    710520147,
    700507188,
    2104251000,
    1350123687,
    1593227923,
    1756802846,
    1179873910,
    1629210470,
    358373501,
    807118919,
    751426983,
    172199468,
    174707988,
    1951167187,
    1328704411,
    2129871494,
    1242495143,
    1793093310,
    1721521010,
    306195915,
    1609230749,
    1992815783,
    1790818204,
    234528824,
    551692332,
    1930351755,
    110996527,
    378457918,
    638641695,
    743517326,
    368806918,
    1583529078,
    1767199029,
    182158924,
    1114175764,
    882553770,
    552467890,
    1366456705,
    934589400,
    1574008098,
    1798094820,
    1548210079,
    821697741,
    601807702,
    332526858,
    1693310695,
    136360183,
    1189114632,
    506273277,
    397438002,
    620771032,
    676183860,
    1747529440,
    909035644,
    142389739,
    1991534368,
    272707803,
    1905681287,
    1210958911,
    596176677,
    1380009185,
    1153270606,
    1150188963,
    1067903737,
    1020928348,
    978324723,
    962376754,
    1368724127,
    1133797255,
    1367747748,
    1458212849,
    537933020,
    1295159285,
    2104731913,
    1647629177,
    1691336604,
    922114202,
    170715530,
    1608833393,
    62657989,
    1140989235,
    381784875,
    928003604,
    449509021,
    1057208185,
    1239816707,
    525522922,
    476962140,
    102897870,
    132620570,
    419788154,
    2095057491,
    1240747817,
    1271689397,
    973007445,
    1380110056,
    1021668229,
    12064370,
    1186917580,
    1017163094,
    597085928,
    2018803520,
    1795688603,
    1722115921,
    2015264326,
    506263638,
    1002517905,
    1229603330,
    1376031959,
    763839898,
    1970623926,
    1109937345,
    524780807,
    1976131071,
    905940439,
    1313298413,
    772929676,
    1578848328,
    1108240025,
    577439381,
    1293318580,
    1512203375,
    371003697,
    308046041,
    320070446,
    1252546340,
    568098497,
    1341794814,
    1922466690,
    480833267,
    1060838440,
    969079660,
    1836468543,
    2049091118,
    2023431210,
    383830867,
    2112679659,
    231203270,
    1551220541,
    1377927987,
    275637462,
    2110145570,
    1700335604,
    738389040,
    1688841319,
    1506456297,
    1243730675,
    258043479,
    599084776,
    41093802,
    792486733,
    1897397356,
    28077829,
    1520357900,
    361516586,
    1119263216,
    209458355,
    45979201,
    363681532,
    477245280,
    2107748241,
    601938891,
    244572459,
    1689418013,
    1141711990,
    1485744349,
    1181066840,
    1950794776,
    410494836,
    1445347454,
    2137242950,
    852679640,
    1014566730,
    1999335993,
    1871390758,
    1736439305,
    231222289,
    603972436,
    783045542,
    370384393,
    184356284,
    709706295,
    1453549767,
    591603172,
    768512391,
    854125182,
};
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <vector>
#include <cstring>

using namespace std;

#define CHUNK_SIZE 4096
#define MODULUS_MASK (CHUNK_SIZE - 1)
#define MODULUS_MASK_S ((CHUNK_SIZE * 2) - 1)
#define TARGET 0
#define MINSIZE 1024
#define BUFFER_LEN 16384

void fast_cdc(unsigned char *buff, unsigned int buff_size,
              unsigned char **chunks, unsigned int *chunk_sizes,
              unsigned int *chunk_count, unsigned int max_chunks) {
    unsigned int hash = 0;
    unsigned int i = MINSIZE;  // 起始位置，跳过最小块大小
    unsigned int prev = 0;    // 上一个分块点

    *chunk_count = 0; // 初始化块计数

    while (i < buff_size) {
        hash = (hash >> 1) + GEAR[buff[i]]; // 滚动哈希计算

        // 如果满足分块条件
        if (((hash & MODULUS_MASK) == TARGET) || ((i - prev) == CHUNK_SIZE)) {
            if (*chunk_count >= max_chunks) {
                fprintf(stderr, "Error: Maximum chunk limit exceeded\n");
                break;
            }

            unsigned int chunk_size = i - prev; // 当前块的大小
            chunks[*chunk_count] = (unsigned char *)malloc(chunk_size);
            if (!chunks[*chunk_count]) {
                perror("Memory allocation for chunk failed");
                break;
            }

            // 复制数据到当前块
            memcpy(chunks[*chunk_count], buff + prev, chunk_size);
            chunk_sizes[*chunk_count] = chunk_size; // 记录块大小
            (*chunk_count)++;                       // 块计数增加

            prev = i;  // 更新起点
            i += MINSIZE; // 跳过 MINSIZE，避免生成过小块
            hash = 0;  // 重置哈希值
        }
        i += 1; // 移动到下一个字节
    }

    // 最后一个块补充到文件末尾
    if (prev < buff_size && *chunk_count < max_chunks) {
        unsigned int chunk_size = buff_size - prev;
        chunks[*chunk_count] = (unsigned char *)malloc(chunk_size);
        if (!chunks[*chunk_count]) {
            perror("Memory allocation for last chunk failed");
        } else {
            memcpy(chunks[*chunk_count], buff + prev, chunk_size);
            chunk_sizes[*chunk_count] = chunk_size;
            (*chunk_count)++;
        }
    }
}

void test_cdc(const char *file) {
    // 打开文件
    FILE *fp = fopen(file, "r");
    if (fp == NULL) {
        perror("fopen error");
        return;
    }

    // 读取文件大小
    fseek(fp, 0, SEEK_END); // 定位到文件末尾
    int file_size = ftell(fp); // 获取文件大小
    fseek(fp, 0, SEEK_SET); // 回到文件开头

    // 限制读取大小
    file_size = BUFFER_LEN <= file_size ? BUFFER_LEN : file_size;

    // 分配缓冲区
    unsigned char *buff = (unsigned char *)malloc(sizeof(unsigned char) * file_size);
    if (buff == NULL) {
        perror("not enough space");
        fclose(fp);
        return;
    }

    int bytes_read = fread(buff, sizeof(unsigned char), file_size, fp);
    if (bytes_read == 0) {
        printf("Error reading file\n");
        free(buff);
        fclose(fp);
        return;
    }

    // 设置分块存储
    unsigned int max_chunks = 1000; // 最大块数量
    unsigned char *chunks[max_chunks]; // 双重指针存储每个分块
    unsigned int chunk_sizes[max_chunks]; // 存储每个块的大小
    unsigned int chunk_count = 0; // 分块计数

    // 调用 CDC 函数
    fast_cdc(buff, file_size, chunks, chunk_sizes, &chunk_count, max_chunks);

    // 输出分块结果
    printf("Total chunks created: %u\n", chunk_count);
    for (unsigned int i = 0; i < chunk_count; i++) {
        printf("Chunk %u (size %u): ", i, chunk_sizes[i]);
        for (unsigned int j = 0; j < chunk_sizes[i]; j++) {
            printf("%c", chunks[i][j]);
        }
        printf("\n");
        free(chunks[i]); // 释放每个分块内存
    }

    free(buff); // 释放缓冲区
    fclose(fp); // 关闭文件
}

int main(int argc, char *argv[]) {
    if (argc == 1) {
        test_cdc("LittlePrince.txt");
    } else {
        test_cdc(argv[1]);
    }
    return 0;
}