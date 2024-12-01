#include "App.h"
//#include <stdio.h>
//#include <stdlib.h>
#include "stopwatch.h"
#include <cstdint>
#include <iostream>

#define DATA_SIZE (12000 * 8000)
#define STAGES (5)

unsigned char * Data[STAGES + 1];

void Exit_with_error(void)
{
  perror(NULL);
  exit(EXIT_FAILURE);
}

void Load_data(void)
{
  FILE * File = fopen("Input.bin", "rb");
  if (File == NULL)
    Exit_with_error();

  if (fread(Data[0], 1, DATA_SIZE, File) != DATA_SIZE)
    Exit_with_error();

  if (fclose(File) != 0)
    Exit_with_error();
}

void Store_data(const char * Filename, int Stage, unsigned int Size)
{
  FILE * File = fopen(Filename, "wb");
  if (File == NULL)
    Exit_with_error();

  if (fwrite(Data[Stage], 1, Size, File) != Size)
    Exit_with_error();

  if (fclose(File) != 0)
    Exit_with_error();
}

int main()
{
  for (int i = 0; i <= STAGES; i++)
  {
    // We could strictly allocate less memory for some of these buffers, but
    // that is irrelevant here.
    Data[i] = (unsigned char*)malloc(DATA_SIZE);
    if (Data[i] == NULL)
      Exit_with_error();
  }
  Load_data();

  // Declare stopwatch timers for each function
  stopwatch sw_scale;
  stopwatch sw_filter_vertical;
  stopwatch sw_filter_horizontal;
  stopwatch sw_differentiate;
  stopwatch sw_compress;
  stopwatch sw_total_time ;


  // Assuming you want to run multiple iterations for calculating average latency
  int iterations = 10;  // for example, 10 iterations
  for (int iter = 0; iter < iterations; iter++) {


    sw_total_time.start();

    // Measure time for Scale
    sw_scale.start();  
    Scale(Data[0], Data[1]);
    sw_scale.stop();
    

    //Measure time for Filter horizontal
    sw_filter_horizontal.start();
    Filter_horizontal(Data[1],Data[2]);
    sw_filter_horizontal.stop();

    //Measure time for Filter vertical
    sw_filter_vertical.start();
    Filter_vertical(Data[2], Data[3]);
    sw_filter_vertical.stop();
 

    // Measure time for Differentiate
    sw_differentiate.start();
    Differentiate(Data[3], Data[4]);
    sw_differentiate.stop();
 


    // Measure time for Compress
    sw_compress.start();
    int Size = Compress(Data[4], Data[5]);
    sw_compress.stop();
  
    sw_total_time.stop();

  // Store the compressed data
    Store_data("Output.bin", 4, Size);
  };


  // std::cout << "Scale function execution time: " << sw_scale.latency() << " ns." << std::endl;
  // std::cout << "Filter function execution time: " << sw_filter.latency() << " ns." << std::endl;
  // std::cout << "Differentiate function execution time: " << sw_differentiate.latency() << " ns." << std::endl;
  // std::cout << "Compress function execution time: " << sw_compress.latency() << " ns." << std::endl;
  // std::cout << "Total time taken by the loop is: " << sw_total_time.latency() << " ns." << std::endl;
  std::cout << "---------------------------------------------------------------" << std::endl;
  std::cout << "Average latency of Scale function per loop iteration is: " << sw_scale.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Filter horizontal function per loop iteration is: " << sw_filter_horizontal.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Filter vertical function per loop iteration is: " << sw_filter_vertical.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Differentiate function per loop iteration is: " << sw_differentiate.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Compress function per loop iteration is: " << sw_compress.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of each loop iteration is: " << sw_total_time.avg_latency() << " ns." << std::endl;



  for (int i = 0; i <= STAGES; i++)
    free(Data[i]);

  puts("Application completed successfully.");

  return EXIT_SUCCESS;
}


