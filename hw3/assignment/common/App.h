#ifndef SRC_APP_H_
#define SRC_APP_H_

#include "Stopwatch.h"
#include "Utilities.h"

void Scale(const unsigned char *Input, unsigned char *Output);
void Filter(const unsigned char *Input, unsigned char *Output,stopwatch* time_hFilter, stopwatch* time_vFilter);
void Differentiate(const unsigned char *Input, unsigned char *Output);
int Compress(const unsigned char *Input, unsigned char *Output);

void Scale_coarse(const unsigned char *Input, unsigned char *Output, int Y_Start_Idx, int Y_End_Idx);
void Filter_coarse(const unsigned char *Input, unsigned char *Output,stopwatch* time_hFilter, stopwatch* time_vFilter);
void Differentiate_coarse(const unsigned char *Input, unsigned char *Output, int Y_Start_Idx, int Y_End_Idx);


void Filter_core_1(const unsigned char *Input, unsigned char *Output);
void Filter_core_0(const unsigned char *Input, unsigned char *Output);

void Filter_horizontal(const unsigned char *Input, unsigned char *Output);
void Filter_vertical(const unsigned char *Input, unsigned char *Output);

void Filter_horizontal_coarse(const unsigned char *Input, unsigned char *Output, int Y_Start_Idx, int Y_End_Idx);
void Filter_vertical_coarse(const unsigned char *Input, unsigned char *Output, int X_Start_Idx, int X_End_Idx);
#endif
