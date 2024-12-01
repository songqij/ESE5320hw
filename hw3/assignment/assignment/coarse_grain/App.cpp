#include "App.h"
#define HEIGHT (264)

#define STAGES (4)

int main()
{
  unsigned char *Input_data = (unsigned char *)malloc(FRAMES * FRAME_SIZE);
  unsigned char *Temp_data[STAGES - 1];
  unsigned char *Output_data = (unsigned char *)malloc(MAX_OUTPUT_SIZE);

  if (Input_data == NULL)
    Exit_with_error("malloc failed at main for Input_data");

  if (Output_data == NULL)
    Exit_with_error("malloc failed at main for Output_data");

  for (int Stage = 0; Stage < STAGES - 1; Stage++)
  {
    Temp_data[Stage] = (unsigned char *)malloc(FRAME_SIZE);
    if (Temp_data[Stage] == NULL)
      Exit_with_error("malloc failed at main for Temp_data");
  }

  Load_data(Input_data);

  stopwatch total_time;
  stopwatch time_scale;
  stopwatch time_filter;
  stopwatch time_differentiate;
  stopwatch time_compress;

  int Size = 0;

  //total_time.start();
  for (int Frame = 0; Frame < FRAMES; Frame++)
  {
    total_time.start();



    time_scale.start();
    std::vector<std::thread> ths;
    ths.push_back(std::thread(&Scale_coarse, Input_data + Frame * FRAME_SIZE, Temp_data[0], 0, INPUT_HEIGHT_SCALE / 2));
    ths.push_back(std::thread(&Scale_coarse, Input_data + Frame * FRAME_SIZE, Temp_data[0], INPUT_HEIGHT_SCALE / 2, INPUT_HEIGHT_SCALE));

    pin_thread_to_cpu(ths[0], 0);
    pin_thread_to_cpu(ths[1], 1);

    for (auto &th : ths)
    {
      th.join();
    }
    time_scale.stop();


    time_filter.start();
    Filter_coarse(Temp_data[0], Temp_data[1]);
    time_filter.stop();

    time_differentiate.start();
    std::vector<std::thread> thd;
    thd.push_back(std::thread(&Differentiate_coarse,Temp_data[1], Temp_data[2], 0, HEIGHT / 2));
    thd.push_back(std::thread(&Differentiate_coarse,Temp_data[1], Temp_data[2], HEIGHT / 2, HEIGHT));

    pin_thread_to_cpu(thd[0],0);
    pin_thread_to_cpu(thd[1],1);

    for (auto &th : thd)
    {
      th.join();
    }    
    time_differentiate.stop();


    time_compress.start();
    Size = Compress(Temp_data[2], Output_data);
    time_compress.stop();

    // std::vector<std::thread> thc;
    // int Length1 = 0, Byte1 = 0;
    // int Length2 = 0, Byte2 = 0;

    // thc.push_back(std::thread(&Compress_coarse, Temp_data[2], Output_data, 0, SIZE / 2, std::ref(Length1), std::ref(Byte1)));
    // thc.push_back(std::thread(&Compress_coarse, Temp_data[2], Output_data+SIZE/16, SIZE / 2, SIZE, std::ref(Length2), std::ref(Byte2)));

    // pin_thread_to_cpu(thc[0], 0);
    // pin_thread_to_cpu(thc[1], 1);

    // for (auto &th : thc)
    // {
    //   th.join();
    // }

    // Size = (Length1 / 8 + (Length1 % 8 > 0 ? 1 : 0)) + (Length2 / 8 + 1 );
    // //Total_Size += Compressed_size;


  total_time.stop();
  }
  //total_time.stop();
  std::cout << "Total latency of Scale is: " << time_scale.latency() << " ns." << std::endl;
  std::cout << "Total latency of Filter is: " << time_filter.latency() << " ns." << std::endl;
  std::cout << "Total latency of Differentiate is: " << time_differentiate.latency() << " ns." << std::endl;
  std::cout << "Total latency of Compress is: " << time_compress.latency() << " ns." << std::endl;
  std::cout << "Total time taken by the loop is: " << total_time.latency() << " ns." << std::endl;
  std::cout << "---------------------------------------------------------------" << std::endl;
  std::cout << "Average latency of Scale per loop iteration is: " << time_scale.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Filter per loop iteration is: " << time_filter.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Differentiate per loop iteration is: " << time_differentiate.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Compress per loop iteration is: " << time_compress.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of each loop iteration is: " << total_time.avg_latency() << " ns." << std::endl;

  Store_data("Output.bin", Output_data, Size);
  Check_data(Output_data, Size);

  for (int i = 0; i < STAGES - 1; i++)
    free(Temp_data[i]);


  free(Input_data);
  free(Output_data);

  return EXIT_SUCCESS;
}
