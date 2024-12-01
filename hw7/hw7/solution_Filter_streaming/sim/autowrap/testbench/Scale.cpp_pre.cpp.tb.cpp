// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Scale.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Scale.cpp"
# 1 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Pipeline.h" 1
# 25 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Pipeline.h"
void Scale_SW(const unsigned char * Input, unsigned char * Output);
void Filter_SW(const unsigned char * Input, unsigned char * Output);
void Filter_HW(const unsigned char * Input,unsigned char * Output);
void Filter_horizontal_SW(const unsigned char * Input,unsigned char * Output);
void Filter_horizontal_HW(const unsigned char * Input,unsigned char * Output);
void Filter_vertical_HW(const unsigned char * Input, unsigned char * Output);
void Filter_vertical_SW(const unsigned char * Input, unsigned char * Output);
void Differentiate_SW(const unsigned char * Input, unsigned char * Output);
int Compress_SW(const unsigned char * Input, unsigned char * Output);
# 2 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Scale.cpp" 2

void Scale_SW(const unsigned char * Input,
           unsigned char * Output)
{
  for (int Y = 0; Y < (540); Y += 2)
    for (int X = 0; X < (960); X += 2)
      Output[(Y / 2) * ((960) / 2) + (X / 2)] = Input[Y * (960) + X];
}
