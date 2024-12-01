#ifndef SHA256_H
#define SHA256_H

#include <cstdint>
#include <string>
#include <vector>
#include <arm_neon.h>

#define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))
#define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
#define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))

extern const uint32_t k[64];

std::vector<uint8_t> pad(const uint8_t* input, size_t len);

void sha256_transform(uint32_t state[8], const uint8_t data[64]);
void sha256_transform_neon(uint32_t state[8], const uint8_t data[64]);
std::string sha256(const unsigned char* input, size_t length);

#endif
