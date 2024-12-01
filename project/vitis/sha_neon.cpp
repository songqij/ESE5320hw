#include <cstdint>
#include <cstring>
#include <vector>
#include <arm_neon.h>
#include <string>
#include <iostream>
#include <iomanip>

using BYTE = uint8_t;
using WORD = uint32_t;

struct SHA256_CTX {
    BYTE data[64];
    WORD datalen;
    uint64_t bitlen;
    WORD state[8];
};


static const WORD k[64] = {
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
};


void sha256_transform(SHA256_CTX& ctx, const BYTE data[]) {
    WORD i;
    uint32x4_t sched[16], round_input;
    uint32x4_t abcd = vld1q_u32(ctx.state);
    uint32x4_t efgh = vld1q_u32(ctx.state + 4);
    uint32x4_t abcd_old, efgh_old;


    for (i = 0; i < 4; ++i) {
        sched[i] = vreinterpretq_u32_u8(vrev32q_u8(vld1q_u8(data + 16 * i)));
    }
    for (i = 4; i < 16; ++i) {
        sched[i] = vsha256su1q_u32(vsha256su0q_u32(sched[i - 4], sched[i - 3]), sched[i - 2], sched[i - 1]);
    }


    for (i = 0; i < 16; ++i) {
        round_input = vaddq_u32(sched[i], vld1q_u32(k + i * 4));
        abcd_old = abcd;
        efgh_old = efgh;
        abcd = vsha256hq_u32(abcd_old, efgh_old, round_input);
        efgh = vsha256h2q_u32(efgh_old, abcd_old, round_input);
    }


    vst1q_u32(ctx.state, vaddq_u32(abcd, vld1q_u32(ctx.state)));
    vst1q_u32(ctx.state + 4, vaddq_u32(efgh, vld1q_u32(ctx.state + 4)));
}


void sha256_init(SHA256_CTX& ctx) {
    ctx.datalen = 0;
    ctx.bitlen = 0;
    ctx.state[0] = 0x6a09e667;
    ctx.state[1] = 0xbb67ae85;
    ctx.state[2] = 0x3c6ef372;
    ctx.state[3] = 0xa54ff53a;
    ctx.state[4] = 0x510e527f;
    ctx.state[5] = 0x9b05688c;
    ctx.state[6] = 0x1f83d9ab;
    ctx.state[7] = 0x5be0cd19;
}


void sha256_update(SHA256_CTX& ctx, const BYTE data[], size_t len) {
    for (size_t i = 0; i < len; ++i) {
        ctx.data[ctx.datalen] = data[i];
        ctx.datalen++;
        if (ctx.datalen == 64) {
            sha256_transform(ctx, ctx.data);
            ctx.bitlen += 512;
            ctx.datalen = 0;
        }
    }
}


void sha256_final(SHA256_CTX& ctx, BYTE hash[]) {
    size_t i = ctx.datalen;


    ctx.data[i++] = 0x80;
    while (i < (ctx.datalen < 56 ? 56 : 64)) {
        ctx.data[i++] = 0x00;
    }

    if (ctx.datalen >= 56) {
        sha256_transform(ctx, ctx.data);
        std::memset(ctx.data, 0, 56);
    }


    ctx.bitlen += ctx.datalen * 8;
    ctx.data[63] = ctx.bitlen;
    ctx.data[62] = ctx.bitlen >> 8;
    ctx.data[61] = ctx.bitlen >> 16;
    ctx.data[60] = ctx.bitlen >> 24;
    ctx.data[59] = ctx.bitlen >> 32;
    ctx.data[58] = ctx.bitlen >> 40;
    ctx.data[57] = ctx.bitlen >> 48;
    ctx.data[56] = ctx.bitlen >> 56;
    sha256_transform(ctx, ctx.data);


    for (i = 0; i < 8; ++i) {
        vst1q_u8(hash + i * 4, vrev32q_u8(vld1q_u8(reinterpret_cast<BYTE*>(&ctx.state[i]))));
    }
}


std::vector<BYTE> sha256_hash(const BYTE* data, size_t len) {
    SHA256_CTX ctx;
    sha256_init(ctx);
    sha256_update(ctx, data, len);

    std::vector<BYTE> hash(32); 
    sha256_final(ctx, hash.data());
    return hash;
}


int main() {
    std::string input = "zw";
    const BYTE* input_data = reinterpret_cast<const BYTE*>(input.data());
    size_t input_length = input.size();

    
    SHA256_CTX ctx;
    sha256_init(ctx); 

    
    sha256_update(ctx, input_data, input_length);

    
    BYTE hash[32]; 
    sha256_final(ctx, hash);

    
    std::cout << "SHA-256: ";
    for (int i = 0; i < 32; ++i) {
        std::cout << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(hash[i]);
    }
    std::cout << std::endl;

    return 0;
}
