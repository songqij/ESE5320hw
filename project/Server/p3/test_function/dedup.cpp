#include "stopwatch.h"
#include <iomanip>
#include <sstream>
#include <vector>
#include <iostream>
#include <unordered_map>
#include <string>
#include "stopwatch.h"
using namespace std;

/*************************** HEADER FILES ***************************/
#include <stdlib.h>
#include <memory.h>
#define MAX_DICT_SIZE (8192)    //can start from 256, then extend based on need in LZW for loop
#define CODE_LEN 13
#define Max_Chunk_Size (1 << CODE_LEN)

#define WIN_SIZE 8
#define PRIME 3
#define MODULUS 1024
#define TARGET 0
#define MAX_BOUNDARY 512
#define MAX_CHUNK 4096
#define MIN_CHUNK 8

#define HASH_BIT_NUM 15
#define CAPACITY (1 << HASH_BIT_NUM) // hash output is 15 bits, and we have 1 entry per bucket, so capacity is 2^15
#define KEY_LEN (CODE_LEN + 8)
#define BUCKETS_NUM 1
#define BUCKET_LEN (KEY_LEN + CODE_LEN + 1)

#define SHA256_BLOCK_SIZE 32            // SHA256 outputs a 32 byte digest

/**************************** DATA TYPES ****************************/
typedef unsigned char BYTE;             // 8-bit byte
typedef unsigned int  WORD;             // 32-bit word, change to "long" for 16-bit machines

typedef struct {
	BYTE data[64];
	WORD datalen;
	unsigned long long bitlen;
	WORD state[8];
} SHA256_CTX;


/****************************** MACROS ******************************/
#define ROTLEFT(a,b) (((a) << (b)) | ((a) >> (32-(b))))
#define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))

#define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
#define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))

/**************************** VARIABLES *****************************/

static const WORD k[64] = {
	0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
	0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
	0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
	0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
	0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
	0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
	0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
	0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
};

/*********************** FUNCTION DEFINITIONS ***********************/
void sha256_transform(SHA256_CTX *ctx, const BYTE data[])
{
	WORD a, b, c, d, e, f, g, h, i, j, t1, t2, m[64];

	for (i = 0, j = 0; i < 16; ++i, j += 4)
		m[i] = (data[j] << 24) | (data[j + 1] << 16) | (data[j + 2] << 8) | (data[j + 3]);
	for ( ; i < 64; ++i)
		m[i] = SIG1(m[i - 2]) + m[i - 7] + SIG0(m[i - 15]) + m[i - 16];

	a = ctx->state[0];
	b = ctx->state[1];
	c = ctx->state[2];
	d = ctx->state[3];
	e = ctx->state[4];
	f = ctx->state[5];
	g = ctx->state[6];
	h = ctx->state[7];

	for (i = 0; i < 64; ++i) {
		t1 = h + EP1(e) + CH(e,f,g) + k[i] + m[i];
		t2 = EP0(a) + MAJ(a,b,c);
		h = g;
		g = f;
		f = e;
		e = d + t1;
		d = c;
		c = b;
		b = a;
		a = t1 + t2;
	}

	ctx->state[0] += a;
	ctx->state[1] += b;
	ctx->state[2] += c;
	ctx->state[3] += d;
	ctx->state[4] += e;
	ctx->state[5] += f;
	ctx->state[6] += g;
	ctx->state[7] += h;
}

void sha256_init(SHA256_CTX *ctx)
{
	ctx->datalen = 0;
	ctx->bitlen = 0;
	ctx->state[0] = 0x6a09e667;
	ctx->state[1] = 0xbb67ae85;
	ctx->state[2] = 0x3c6ef372;
	ctx->state[3] = 0xa54ff53a;
	ctx->state[4] = 0x510e527f;
	ctx->state[5] = 0x9b05688c;
	ctx->state[6] = 0x1f83d9ab;
	ctx->state[7] = 0x5be0cd19;
}

void sha256_update(SHA256_CTX *ctx, const BYTE data[], size_t len)
{
	WORD i;

	for (i = 0; i < len; ++i) {
		ctx->data[ctx->datalen] = data[i];
		ctx->datalen++;
		if (ctx->datalen == 64) {
			sha256_transform(ctx, ctx->data);
			ctx->bitlen += 512;
			ctx->datalen = 0;
		}
	}
}

void sha256_final(SHA256_CTX *ctx, BYTE hash[])
{
	WORD i;

	i = ctx->datalen;

	// Pad whatever data is left in the buffer.
	if (ctx->datalen < 56) {
		ctx->data[i++] = 0x80;
		while (i < 56)
			ctx->data[i++] = 0x00;
	}
	else {
		ctx->data[i++] = 0x80;
		while (i < 64)
			ctx->data[i++] = 0x00;
		sha256_transform(ctx, ctx->data);
		memset(ctx->data, 0, 56);
	}

	// Append to the padding the total message's length in bits and transform.
	ctx->bitlen += ctx->datalen * 8;
	ctx->data[63] = ctx->bitlen;
	ctx->data[62] = ctx->bitlen >> 8;
	ctx->data[61] = ctx->bitlen >> 16;
	ctx->data[60] = ctx->bitlen >> 24;
	ctx->data[59] = ctx->bitlen >> 32;
	ctx->data[58] = ctx->bitlen >> 40;
	ctx->data[57] = ctx->bitlen >> 48;
	ctx->data[56] = ctx->bitlen >> 56;
	sha256_transform(ctx, ctx->data);

	// Since this implementation uses little endian byte ordering and SHA uses big endian,
	// reverse all the bytes when copying the final state to the output hash.
	for (i = 0; i < 4; ++i) {
		hash[i]      = (ctx->state[0] >> (24 - i * 8)) & 0x000000ff;
		hash[i + 4]  = (ctx->state[1] >> (24 - i * 8)) & 0x000000ff;
		hash[i + 8]  = (ctx->state[2] >> (24 - i * 8)) & 0x000000ff;
		hash[i + 12] = (ctx->state[3] >> (24 - i * 8)) & 0x000000ff;
		hash[i + 16] = (ctx->state[4] >> (24 - i * 8)) & 0x000000ff;
		hash[i + 20] = (ctx->state[5] >> (24 - i * 8)) & 0x000000ff;
		hash[i + 24] = (ctx->state[6] >> (24 - i * 8)) & 0x000000ff;
		hash[i + 28] = (ctx->state[7] >> (24 - i * 8)) & 0x000000ff;
	}
}

void sha256_hash(SHA256_CTX* ctx, const BYTE data[], BYTE hash[], size_t runLen, uint16_t data_len)
{
	size_t idx;
	// size_t len = strlen((char *)data);
	sha256_init(ctx);
	for (idx = 0; idx < runLen; ++idx)
		sha256_update(ctx, data, data_len);
    sha256_final(ctx, hash);
}


void sha256_hash_file(SHA256_CTX* ctx, const BYTE data[], BYTE hash[], size_t dataLen)
{
	size_t idx;
	sha256_init(ctx);
	sha256_update(ctx, data, dataLen);
    sha256_final(ctx, hash);
}


string hexconvert(unsigned char* bytes, int size) {
    stringstream ss;
    ss << hex << setfill('0');
    for (int i = 0; i < size; i++) {
        ss << setw(2) << static_cast<int>(bytes[i]);
    }
    return ss.str();
}

void deDup(char* inputChunk, uint16_t chunk_size,
    std::unordered_map<string, uint32_t>& chunkTable,
    stopwatch& sha_timer, stopwatch& dedup_timer, uint32_t &deDup_header) {
	
	dedup_timer.start();
    unsigned char uinputChunk[static_cast<int>(chunk_size)];
    for (size_t i = 0; i < chunk_size; i++) {
            uinputChunk[i] = static_cast<unsigned char>(inputChunk[i]);
        }
    
        //size_t length = sizeof(inputChunk)/sizeof(char);
        //size_t length = chunk_size;
    BYTE buf[SHA256_BLOCK_SIZE];
    SHA256_CTX ctx;
        sha_timer.start();
    sha256_hash(&ctx, uinputChunk, buf, 1, chunk_size);
    string hash = hexconvert(buf, SHA256_BLOCK_SIZE);
        sha_timer.stop();
        auto it = chunkTable.find(hash);

        if (it == chunkTable.end()) {
            uint32_t newIndex = static_cast<uint32_t>(chunkTable.size());
            chunkTable[hash] = newIndex;
			// deDup_header.set_value(newIndex << 1);
			deDup_header = (newIndex << 1);
            // return (newIndex << 1);
        } else {
			deDup_header = (it->second << 1) | 1u;
			// deDup_header.set_value((it->second << 1) | 1u);
            // return (it->second << 1) | 1u;
        }
		dedup_timer.stop();
		return;
		// printf("deDup_header inside: %x\n", deDup_header);

}



using namespace std;

// 测试用的输入数据
const char* TEST_DATA[] = {
    "This is the first chunk of data.",
    "This is the second chunk of data.",
    "This is the first chunk of data.", // 重复的数据
    "Completely different chunk here.",
    "This is the second chunk of data." // 重复的数据
};

// 测试用的分块大小
const uint16_t TEST_SIZES[] = {
    31,  // 第一个分块长度
    32,  // 第二个分块长度
    31,  // 第三个分块长度（与第一个相同）
    28,  // 第四个分块长度
    32   // 第五个分块长度（与第二个相同）
};

// 测试函数
void test_dedup() {
    // 初始化去重哈希表和计时器
    unordered_map<string, uint32_t> chunkTable;
    stopwatch sha_timer;
    stopwatch dedup_timer;

    // 遍历测试数据
    for (int i = 0; i < 5; i++) {
        const char* chunk = TEST_DATA[i];
        uint16_t chunk_size = TEST_SIZES[i];
        uint32_t deDup_header = 0;

        // 调用去重函数
        deDup(const_cast<char*>(chunk), chunk_size, chunkTable, sha_timer, dedup_timer, deDup_header);

        // 输出结果
        cout << "Chunk " << i + 1 << ": \"" << string(chunk, chunk_size) << "\"" << endl;
        cout << "DeDup header: " << hex << deDup_header << endl;
        cout << "Current chunkTable size: " << chunkTable.size() << endl;
        cout << "--------------------------" << endl;
    }

    // 输出计时器结果
    cout << "SHA256 total time: " << sha_timer.latency() << " ms" << endl;
    cout << "DeDup total time: " << dedup_timer.latency() << " ms" << endl;
}

int main() {
    // 运行测试函数
    test_dedup();
    return 0;
}
