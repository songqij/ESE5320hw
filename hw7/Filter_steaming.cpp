 
#include "Pipeline_streaming.h"
#include <stdlib.h>
#include <iostream>
#include <hls_stream.h>
#include <stdio.h>


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

void Filter_horizontal_HW(const unsigned char * Input, hls::stream<unsigned char>&Output_temp)
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
            //Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
            Output_temp.write(Sum>>8);
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
void Filter_vertical_HW(hls::stream<unsigned char> & Input_temp, unsigned char * Output)
{
    int X, Y, i;
    unsigned char Input_buffer[OUTPUT_FRAME_WIDTH][FILTER_LENGTH];
    unsigned char Coefficient_buffer[FILTER_LENGTH];


#pragma HLS ARRAY_PARTITION variable=Coefficient_buffer complete
#pragma HLS ARRAY_PARTITION variable=Input_buffer complete dim=2

        for (int i=0;i<7;i++)
        {
        	Coefficient_buffer[i] = Coefficients[i];
        }
        for (int i = 0; i < FILTER_LENGTH; i++) {
        	for (int j = 0; j < OUTPUT_FRAME_WIDTH; j++) {
        		Input_buffer[j][i] = Input_temp.read();
        	}
        }
        for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++){
        	for (X = 0; X < OUTPUT_FRAME_WIDTH; X++){
        		unsigned int Sum = 0;
        		for (i = 0; i < FILTER_LENGTH; i++){
        			Sum += Coefficient_buffer[i] * Input_buffer[X][i];
        		}
        		Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
        		//std::cout << "output = " << static_cast<int>(Output[Y * OUTPUT_FRAME_WIDTH + X]) << std::endl;
        	}
//        	if((X+FILTER_LENGTH)<OUTPUT_FRAME_HEIGHT)
//        	{
//        		for (int j = 0; j < OUTPUT_FRAME_WIDTH; j++)
//        		{
//        			for (int i = 0; i < (FILTER_LENGTH - 1); i++)
//        			{
//        			//yi wei jia shang bu zuihouyihang
//        				Input_buffer[j][i] = Input_buffer[j][i+1];
//        			}
//        		}
//        		for(int j=0;j < OUTPUT_FRAME_WIDTH;j++)
//        		{
//        			Input_buffer[j][(FILTER_LENGTH - 1)] = Input_temp.read();
//        		}
//        	}

        	 if (Y < (OUTPUT_FRAME_HEIGHT - 1)) {
        	    for (i = 0; i < OUTPUT_FRAME_WIDTH; i++){
        	      for (int j = 0; j < FILTER_LENGTH - 1; j++){
        	        Input_buffer[i][j] = Input_buffer[i][j+1];
        	      }
        	      Input_buffer[i][FILTER_LENGTH - 1] = Input_temp.read();
        	    }

//        	    for(int i=0;i < OUTPUT_FRAME_WIDTH;i++){
//        	    	Input_buffer[i][FILTER_LENGTH - 1] = Input_temp.read();
//        	    }
        	 }
        }
}
//void Filter_vertical_HW(hls::stream<unsigned char> & Input_temp, unsigned char * Output)
//{
//    int X, Y, i;
//    unsigned char Input_buffer[FILTER_LENGTH][OUTPUT_FRAME_WIDTH];
//    unsigned char Coefficient_buffer[FILTER_LENGTH];
//
//
//#pragma HLS ARRAY_PARTITION variable=Coefficient_buffer complete
//#pragma HLS ARRAY_PARTITION variable=Input_buffer complete dim=1
//
//        for (int i=0;i<7;i++)
//        {
//        	Coefficient_buffer[i] = Coefficients[i];
//        }
//
//        for (int i = 0; i < FILTER_LENGTH; i++) {
//        	for (int j = 0; j < OUTPUT_FRAME_WIDTH; j++) {
//        		Input_buffer[i][j] = Input_temp.read();
//        	}
//        }
//
//        for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++){
//        	for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
//        	{
//        		unsigned int Sum = 0;
//        		for (i = 0; i < FILTER_LENGTH; i++)
//        		{
//        			Sum += Coefficient_buffer[i] * Input_buffer[i][X];
//        		}
//        		Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
//
//        	}
//        	if((Y+FILTER_LENGTH)<OUTPUT_FRAME_WIDTH)
//        	{
//        		for (int i = 0; i < (FILTER_LENGTH - 1); i++) {
//        	    //yi wei jia shang bu zuihouyihang
//        			for (int j = 0; j < OUTPUT_FRAME_WIDTH; j++) {
//        				Input_buffer[i][j] = Input_buffer[i+1][j];
//
//        			}
//        		}
//        		for(int j=0;j < OUTPUT_FRAME_WIDTH;j++)
//        		{
//        			Input_buffer[(FILTER_LENGTH - 1)][j] = Input_temp.read();
//        		}
//        	}
//        }
//}





void Filter_SW(const unsigned char * Input,unsigned char * Output)
{
  unsigned char * Temp = (unsigned char *) malloc(SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH);
  Filter_horizontal_SW(Input, Temp);
  Filter_vertical_SW(Temp, Output);
  free(Temp);
}


void Filter_HW(const unsigned char * Input,unsigned char * Output)
{
  static hls::stream<unsigned char> tempStream("Temp1");
  #pragma HLS STREAM variable=tempStream
  #pragma HLS dataflow
  #pragma HLS INTERFACE m_axi port=Input bundle=aximm1
  #pragma HLS INTERFACE m_axi port=Output bundle=aximm2
  Filter_horizontal_HW(Input, tempStream);
  Filter_vertical_HW(tempStream, Output);

}
