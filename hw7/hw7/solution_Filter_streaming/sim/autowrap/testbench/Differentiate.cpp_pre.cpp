# 1 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Differentiate.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Differentiate.cpp"
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
# 2 "/mnt/castor/seas_home/s/songqij/ese532_code/hw7/Differentiate.cpp" 2

void Differentiate_SW(const unsigned char * Input, unsigned char * Output)
{
  for (int Y = 0; Y < (((540) / 2) - ((7) - 1)); Y++)
    for (int X = 0; X < (((960) / 2) - ((7) - 1)); X++)
    {
      int Average = 0;
      if (Y > 0 && X > 0)
        Average = (Input[(((960) / 2) - ((7) - 1)) * (Y - 1) + X] + Input[(((960) / 2) - ((7) - 1)) * Y + X - 1]) / 2;
      else if (Y > 0)
        Average = Input[(((960) / 2) - ((7) - 1)) * (Y - 1) + X];
      else if (X > 0)
        Average = Input[(((960) / 2) - ((7) - 1)) * Y + X - 1];

      unsigned char Diff = Input[(((960) / 2) - ((7) - 1)) * Y + X] - Average;

      Output[Y * (((960) / 2) - ((7) - 1)) + X] = Diff;
    }
}
