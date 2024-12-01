#include "Pipeline.h"
#include <stdlib.h>
#include <iostream>
//#define NO_SYNTH

static unsigned Coefficients[] = {2, 15, 62, 98, 62, 15, 2};

void Filter_horizontal_SW(const unsigned char * Input,unsigned char * Output)
{
  int X, Y, i;
  for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[Y * SCALED_FRAME_WIDTH + X + i];
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    }
}

void Filter_horizontal_HW(const unsigned char * Input, unsigned char * Output)
{
    int X, Y, i;
//    unsigned char buffer[FILTER_LENGTH];
//    unsigned char Coefficient_buffer[FILTER_LENGTH];

    unsigned char Input_buffer[FILTER_LENGTH];
    unsigned char Coefficient_buffer[FILTER_LENGTH];


#pragma HLS ARRAY_PARTITION variable=Coefficient_buffer complete
#pragma HLS ARRAY_PARTITION variable=Input_buffer complete

    for (int i=0;i<7;i++)
    {
    	Coefficient_buffer[i] = Coefficients[i];
    }

    for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++) {

    	for (i = 1; i < FILTER_LENGTH; i++)
    	{
    		Input_buffer[i] = Input[(Y * SCALED_FRAME_WIDTH) + i - 1];
    	}

        for (X = 0; X < OUTPUT_FRAME_WIDTH; X++) {

//        	if (X==0){
//        		for (i = 0; i < FILTER_LENGTH; i++) {
//        			Input_buffer[i] = Input[Y * SCALED_FRAME_WIDTH + i];
//        		}
//        	}
//        	else
//        	{
        	for (i = 0; i < FILTER_LENGTH - 1; i++)
        	{
        		Input_buffer[i] = Input_buffer[i + 1];
        	}
        	Input_buffer[FILTER_LENGTH - 1] = Input[Y * SCALED_FRAME_WIDTH + X + FILTER_LENGTH - 1];
        	unsigned int Sum = 0;

            for (i = 0; i < FILTER_LENGTH; i++) {
                Sum += Coefficient_buffer[i] * Input_buffer[i];
            }
            Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
        }
    }
}


void Filter_vertical_SW(const unsigned char * Input, unsigned char * Output)
{
  int X, Y, i;
  for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[(Y + i) * OUTPUT_FRAME_WIDTH + X];
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    }
}

//shi bai ping
//void Filter_vertical_HW(const unsigned char * Input, unsigned char * Output){
//    int X, Y, i;
////    unsigned int Sum = 0;
//
//	#ifdef NO_SYNTH
//		unsigned char *Input_buffer=(unsigned char*)malloc(FILTER_LENGTH*OUTPUT_FRAME_WIDTH *sizeof(unsigned char));
//    	unsigned char *Coefficient_buffer = (unsigned char*)malloc(FILTER_LENGTH *sizeof(unsigned char));
//	#else
//        unsigned char Input_buffer[OUTPUT_FRAME_WIDTH][FILTER_LENGTH];
//        unsigned char Coefficient_buffer[FILTER_LENGTH];
//	#endif
//
//#pragma HLS ARRAY_PARTITION variable=Coefficient_buffer complete
//#pragma HLS ARRAY_PARTITION variable=INput_buffer cyclic factor=7 dim=2
//
//        for (int i=0;i<7;i++)
//        {
//        	Coefficient_buffer[i] = Coefficients[i];
//        }
//
//        for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++){
//        	for (int i = 1; i < FILTER_LENGTH; i++) {
//        	            for (int j = 0; j < OUTPUT_FRAME_WIDTH; j++) {
//        	                Input_buffer[j][i] = Input[(Y + i - 1) * OUTPUT_FRAME_WIDTH + j];
//        	            }
//        	        }
//
//        	for (int i = 0; i < (FILTER_LENGTH - 1); i++) {
//        	    //yi wei jia shang bu zuihouyihang
//        		for (int j = 0; j < OUTPUT_FRAME_WIDTH; j++) {
//        			Input_buffer[j][i] = Input_buffer[j][i+1];
//
//        		}
//        	}
//        	for(int j=0;j < OUTPUT_FRAME_WIDTH;j++){
//        		Input_buffer[j][(Y + FILTER_LENGTH - 1)] = Input[j + OUTPUT_FRAME_WIDTH * (Y + FILTER_LENGTH - 1)];;
//        	}
//
//
//        	for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
//        	{
//        		unsigned int Sum = 0;
//        		for (i = 0; i < FILTER_LENGTH; i++){
//        			Sum += Coefficient_buffer[i] * Input_buffer[X][i];
//        		}
//        		Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
//        		//std::cout << "output = " << static_cast<int>(Output[Y * OUTPUT_FRAME_WIDTH + X]) << std::endl;
//        	}
//
//        }
//}
void Filter_vertical_HW(const unsigned char * Input,unsigned char * Output)
{
  int X, Y, i;

  unsigned char Input_buffer[FILTER_LENGTH];
  unsigned char Coefficient_buffer[FILTER_LENGTH];


#pragma HLS ARRAY_PARTITION variable=Coefficient_buffer complete
#pragma HLS ARRAY_PARTITION variable=Input_buffer complete

  for (i = 0; i < FILTER_LENGTH; i++)
  {
	  Coefficient_buffer[i] = Coefficients[i];
  }

  for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
  {
	  for (i = 1; i < FILTER_LENGTH; i++)
	  	      {
	  	      	Input_buffer[i] = Input[X + OUTPUT_FRAME_WIDTH * (i-1)];
	  	      }
	  for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
	  {
//	      for (i = 1; i < FILTER_LENGTH; i++)
//	      {
//	      	Input_buffer[i] = Input[X + OUTPUT_FRAME_WIDTH * (Y+i-1)];
//	      }
	      unsigned int Sum = 0;

	      for (i = 0; i < (FILTER_LENGTH - 1); i++)
	      {
	    	  Input_buffer[i] = Input_buffer[i+1];
	      }
	      Input_buffer[FILTER_LENGTH - 1] = Input[X + OUTPUT_FRAME_WIDTH * (Y + FILTER_LENGTH-1)];
	      for (i = 0; i < FILTER_LENGTH; i++){
	    	  Sum += Coefficient_buffer[i] * Input_buffer[i];
	      }
	      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
	    }

  }
//  for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
//  {
//    for (i = 1; i < FILTER_LENGTH; i++)
//    {
//    	Input_buffer[i] = Input[X + OUTPUT_FRAME_WIDTH * (i-1)];
//    }
//    for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
//    {
//      unsigned int Sum = 0;
//
//      for (i = 0; i < (FILTER_LENGTH - 1); i++) {
//    	  Input_buffer[i] = Input_buffer[i+1];
//      }
//
//      Input_buffer[FILTER_LENGTH - 1] = Input[X + OUTPUT_FRAME_WIDTH * (Y + FILTER_LENGTH-1)];
//      for (i = 0; i < FILTER_LENGTH; i++){
//
//        Sum += Coefficient_buffer[i] * Input_buffer[i];
//      }
//
//      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
//    }
//  }
}



void Filter_SW(const unsigned char * Input,unsigned char * Output)
{
  unsigned char * Temp = (unsigned char *) malloc(SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH);
  Filter_horizontal_SW(Input, Temp);
  Filter_vertical_SW(Temp, Output);
  free(Temp);
}


void Filter_HW(const unsigned char * Input,unsigned char * Output)
{
	unsigned char Temp[SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH];

	Filter_horizontal_HW(Input, Temp);
	Filter_vertical_HW(Temp, Output);

}
