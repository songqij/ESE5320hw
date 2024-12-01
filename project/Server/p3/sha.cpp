// #include <iostream>
// #include <iomanip>
// #include <string>
// #include <vector>
// #include <sstream>  

// // #include <arm_neon.h>

// // SHA-256 logic computation
// #define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))
// #define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
// #define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
// #define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
// #define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
// #define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
// #define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))

// // SHA-256 content table
// const uint32_t k[64] = {
//     0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
//     0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
//     0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
//     0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
//     0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
//     0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
//     0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
//     0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
// };

// std::vector<uint8_t> pad(const uint8_t* input, size_t len) {
//     std::vector<uint8_t> padded(input, input + len);
//     padded.push_back(0x80);

//     while ((padded.size() * 8) % 512 != 448) {
//         padded.push_back(0x00);
//     }

//     uint64_t bit_length = len * 8;
//     for (int i = 7; i >= 0; --i) {
//         padded.push_back((bit_length >> (i * 8)) & 0xff); 
//     }
//     return padded;
// }

// //standard SHA-256 computing function
// void sha256_transform(uint32_t state[8], const uint8_t data[64]) {
//     uint32_t a, b, c, d, e, f, g, h, t1, t2;
//     uint32_t w[64];


//     for (int i = 0; i < 16; ++i) {
//         w[i] = (data[i * 4] << 24) | (data[i * 4 + 1] << 16) | (data[i * 4 + 2] << 8) | (data[i * 4 + 3]);
//     }
//     for (int i = 16; i < 64; ++i) {
//         w[i] = SIG1(w[i - 2]) + w[i - 7] + SIG0(w[i - 15]) + w[i - 16];
//     }


//     a = state[0];
//     b = state[1];
//     c = state[2];
//     d = state[3];
//     e = state[4];
//     f = state[5];
//     g = state[6];
//     h = state[7];


//     for (int i = 0; i < 64; ++i) {
//         t1 = h + EP1(e) + CH(e, f, g) + k[i] + w[i];
//         t2 = EP0(a) + MAJ(a, b, c);
//         h = g;
//         g = f;
//         f = e;
//         e = d + t1;
//         d = c;
//         c = b;
//         b = a;
//         a = t1 + t2;
//     }

//     state[0] += a;
//     state[1] += b;
//     state[2] += c;
//     state[3] += d;
//     state[4] += e;
//     state[5] += f;
//     state[6] += g;
//     state[7] += h;
// }
// // SHA-256 top function
// std::string sha256(const unsigned char* input, size_t length) {
// // uint64_t sha256(const unsigned char* input, size_t length) {
//     uint32_t state[8] = {
//         0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
//         0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
//     };

//     std::vector<uint8_t> padded = pad(input,length);

//     for (size_t i = 0; i < padded.size(); i += 64) {
//         sha256_transform(state, &padded[i]);
//         // sha256_transform_neon(state, &padded[i]);
//     }

//     std::stringstream ss;
//     for (int i = 0; i < 8; i++) {
//         ss << std::hex << std::setw(8) << std::setfill('0') << state[i];
//     }
//     return ss.str();
//     // uint64_t hash_value = (static_cast<uint64_t>(state[0]) << 32) | state[1];
//     // return hash_value;
// }




#include <iostream>
#include <iomanip>
#include <string>
#include <vector>
#include <sstream>  
#include <arm_neon.h>

// SHA-256 logic computation
#define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))
#define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
#define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))

// SHA-256 content table
const uint32_t k[64] = {
    0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
    0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
    0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
    0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
    0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
    0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
    0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
    0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
};

std::vector<uint8_t> pad(const uint8_t* input, size_t len) {
    std::vector<uint8_t> padded(input, input + len);
    padded.push_back(0x80);

    while ((padded.size() * 8) % 512 != 448) {
        padded.push_back(0x00);
    }

    uint64_t bit_length = len * 8;
    for (int i = 7; i >= 0; --i) {
        padded.push_back((bit_length >> (i * 8)) & 0xff); // 添加64位长度信息
    }
    return padded;
}

// NEON sha256_transform
void sha256_transform_neon(uint32_t state[8], const uint8_t data[64]) {
    //using NEON process data in parallel 
    uint32x4_t a = vld1q_u32(&state[0]);
    uint32x4_t b = vld1q_u32(&state[1]);
    uint32x4_t c = vld1q_u32(&state[2]);
    uint32x4_t d = vld1q_u32(&state[3]);

    uint32x4_t e = vld1q_u32(&state[4]);
    uint32x4_t f = vld1q_u32(&state[5]);
    uint32x4_t g = vld1q_u32(&state[6]);
    uint32x4_t h = vld1q_u32(&state[7]);

    uint32x4_t w[64] = {0};


    for (int i = 0; i < 16; i+=4) {
        w[i] = vld1q_dup_u32(reinterpret_cast<const uint32_t*>(&data[i * 4]));
    }

    for (int i = 16; i < 64; ++i) {
        w[i] = vaddq_u32(vaddq_u32(SIG1(w[i - 2]), w[i - 7]), vaddq_u32(SIG0(w[i - 15]), w[i - 16]));
    }

 
    for (int i = 0; i < 64; ++i) {
        uint32x4_t t1 = vaddq_u32(vaddq_u32(h, EP1(e)), vaddq_u32(CH(e, f, g), vld1q_dup_u32(&k[i])));
        uint32x4_t t2 = vaddq_u32(EP0(a), MAJ(a, b, c));

        h = g;
        g = f;
        f = e;
        e = vaddq_u32(d, t1);
        d = c;
        c = b;
        b = a;
        a = vaddq_u32(t1, t2);
    }


    vst1q_u32(&state[0], vaddq_u32(a, vld1q_u32(&state[0])));
    vst1q_u32(&state[1], vaddq_u32(b, vld1q_u32(&state[1])));
    vst1q_u32(&state[2], vaddq_u32(c, vld1q_u32(&state[2])));
    vst1q_u32(&state[3], vaddq_u32(d, vld1q_u32(&state[3])));
    vst1q_u32(&state[4], vaddq_u32(e, vld1q_u32(&state[4])));
    vst1q_u32(&state[5], vaddq_u32(f, vld1q_u32(&state[5])));
    vst1q_u32(&state[6], vaddq_u32(g, vld1q_u32(&state[6])));
    vst1q_u32(&state[7], vaddq_u32(h, vld1q_u32(&state[7])));
}

// SHA-256 top function
std::string sha256(const unsigned char* input, size_t length) {
// uint64_t sha256(const unsigned char* input, size_t length) {
    uint32_t state[8] = {
        0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
        0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
    };

    std::vector<uint8_t> padded = pad(input,length);

    for (size_t i = 0; i < padded.size(); i += 64) {
        //sha256_transform(state, &padded[i]);
        sha256_transform_neon(state, &padded[i]);
    }

    std::stringstream ss;
    for (int i = 0; i < 8; i++) {
        ss << std::hex << std::setw(8) << std::setfill('0') << state[i];
    }
    return ss.str();

}