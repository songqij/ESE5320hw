#define HEIGHT (540)
#define WIDTH (960)
#include <stdio.h>


#ifdef VECTORIZED
#include <arm_neon.h>
void Scale(const unsigned char *Input, unsigned char *Output)
{
  // Write your NEON accelerated version of Scale here.

for (int Y = 0; Y < HEIGHT; Y += 2)
  {
    for (int X = 0; X < WIDTH; X += 16)
    {
      uint8x16_t row0 = vld1q_u8(&Input[Y * WIDTH + X]);
      uint8x16_t row1 = vld1q_u8(&Input[(Y + 1) * WIDTH + X]);

      uint8x8_t selected_row0 = vuzp1_u8(vget_low_u8(row0), vget_high_u8(row0));
      //uint8x8_t selected_row1 = vuzp1_u8(vget_low_u8(row1), vget_high_u8(row1));

      vst1_u8(&Output[(Y / 2) * (WIDTH / 2) + (X / 2)], selected_row0);
    }
  }






}
#else
void Scale(const unsigned char *Input, unsigned char *Output)
{
  for(int Y = 0; Y < HEIGHT; Y += 2)
  {
    for(int X = 0; X < WIDTH; X += 2)
    {
      Output[(Y / 2) * (WIDTH / 2) + (X / 2)] = Input[(Y * WIDTH) + X];
    }
  }
}
#endif