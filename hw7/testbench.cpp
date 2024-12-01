//#include "Pipeline.h"
//#include <cstdint>
//#include <cstdlib>
//#include <fstream>
//#include <iostream>
//#include <unistd.h>
//
//#define NUM_MAT (5)
//#define NUM_TESTS (255)
//
//
//static void init_arrays(unsigned char *Input[NUM_MAT]) {
//  for (int m = 0; m < NUM_MAT; m++) {
//      for (int Y = 0; Y < SCALED_FRAME_HEIGHT; Y++) {
//        for (int X = 0; X < SCALED_FRAME_WIDTH; X++) {
//          Input[m][(Y * SCALED_FRAME_WIDTH) + X] = rand() % (255);
//          //Input[m][(Y * SCALED_FRAME_WIDTH) + X] = rand() % (SCALED_FRAME_HEIGHT * SCALED_FRAME_WIDTH);
//        }
//      }
//  }
//}
//
//static int result_check(unsigned char *Output_HW[NUM_MAT], unsigned char *Output_SW[NUM_MAT]) {
//  for (int m = 0; m < NUM_MAT; m++) {
//    for (int i = 0; i < (OUTPUT_FRAME_WIDTH * SCALED_FRAME_HEIGHT); i++) {
//      if (Output_SW[m][i] != Output_HW[m][i]) {
//        std::cout << "Mismatch: data index=" << i << " dout_sw=" << Output_SW[m][i]
//                  << ", dout=" << Output_HW[m][i] << std::endl;
//        return 1;
//      }
//    }
//  }
//  return 0;
//}
//
//int main(int argc, char *argv[]) {
//  unsigned char *Input[NUM_MAT], *Output_HW[NUM_MAT], *Output_SW[NUM_MAT];
//
//  for (int m = 0; m < NUM_MAT; m++) {
//    Input[m] = (unsigned char *)malloc(SCALED_FRAME_WIDTH * SCALED_FRAME_HEIGHT * sizeof(unsigned char));
//    Output_HW[m] = (unsigned char *)malloc(OUTPUT_FRAME_WIDTH * SCALED_FRAME_HEIGHT * sizeof(unsigned char));
//    Output_SW[m] = (unsigned char *)malloc(OUTPUT_FRAME_WIDTH * SCALED_FRAME_HEIGHT * sizeof(unsigned char));
//
//
//    if (!Input[m] || !Output_HW[m] || !Output_SW[m]) {
//      if (Input[m])
//        free(Input[m]);
//      if (Output_HW[m])
//        free(Output_HW[m]);
//      if (Output_SW[m])
//        free(Output_SW[m]);
//      return 2;
//    }
//  }
//
//  init_arrays(Input);
//  for (int i = 0; i < NUM_TESTS; i++) {
//    Filter_horizontal_SW(Input[i % NUM_MAT], Output_SW[i % NUM_MAT]);
//  }
//
//  for (int i = 0; i < NUM_TESTS; i++) {
//    Filter_horizontal_HW(Input[i % NUM_MAT], Output_HW[i % NUM_MAT]);
//  }
//
//  int failed = 0;
//  for (int i = 0; !failed && i < NUM_MAT; i++)
//    failed = result_check(Output_HW, Output_SW);
//  std::cout << "TEST " << (!failed ? "PASSED" : "FAILED") << std::endl;
//
//  for (int m = 0; m < NUM_MAT; m++) {
//    free(Input[m]);
//    free(Output_HW[m]);
//    free(Output_SW[m]);
//  }
//
//  return failed ? 1 : 0;
//}
#include <iostream>
#include <cstdlib>
#include <chrono>
#include "Pipeline.h"


#define TEST_FRAME_WIDTH 1920
#define TEST_FRAME_HEIGHT 1080

class stopwatch
{
public:
    double total_time, calls;
    std::chrono::time_point<std::chrono::high_resolution_clock> start_time, end_time;
    stopwatch() : total_time(0), calls(0) {}

    inline void reset()
    {
        total_time = 0;
        calls = 0;
    }

    inline void start()
    {
        start_time = std::chrono::high_resolution_clock::now();
        calls++;
    }

    inline void stop()
    {
        end_time = std::chrono::high_resolution_clock::now();
        auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end_time - start_time).count();
        total_time += static_cast<double>(elapsed);
    }

    // Return latency in ns
    inline double latency()
    {
        return total_time;
    }

    // Return average latency in ns
    inline double avg_latency()
    {
        return (total_time / calls);
    }
};


unsigned char *Create_frame(int width, int height)
{
    unsigned char *Frame = static_cast<unsigned char *>(malloc(width * height * sizeof(unsigned char)));
    if (Frame == NULL)
    {
        std::cerr << "Could not allocate frame." << std::endl;
        exit(EXIT_FAILURE);
    }
    return Frame;
}


void Destroy_frame(unsigned char *Frame)
{
    free(Frame);
}


void Randomize_frame(unsigned char *Frame, int width, int height)
{
    for (int Y = 0; Y < height; Y++)
        for (int X = 0; X < width; X++)
            Frame[Y * width + X] = rand() % 256;
}


bool Compare_frames(const unsigned char *Frame_1, const unsigned char *Frame_2, int width, int height)
{
    bool Equal = true;
    for (int Y = 0; Y < height; Y++)
    {
        for (int X = 0; X < width; X++)
        {
            if (Frame_1[Y * width + X] != Frame_2[Y * width + X])
            {
                std::cout << "Mismatch at (" << X << ", " << Y << "): "
                          << static_cast<int>(Frame_1[Y * width + X]) << " != "
                          << static_cast<int>(Frame_2[Y * width + X]) << std::endl;
                Equal = false;
            }
        }
    }
    return Equal;
}

void Filter_horizontal_SW(const unsigned char *Input, unsigned char *Output);
void Filter_horizontal_HW(const unsigned char *Input, unsigned char *Output);

int main()
{
    unsigned char *Input = Create_frame(TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);
    unsigned char *Output_SW_Horizontal = Create_frame(TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);
    unsigned char *Output_HW_Horizontal = Create_frame(TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);



    Randomize_frame(Input, TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);

    Filter_horizontal_SW(Input, Output_SW_Horizontal);
    Filter_horizontal_HW(Input, Output_HW_Horizontal);

    bool Equal_Horizontal = Compare_frames(Output_SW_Horizontal, Output_HW_Horizontal, TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);


    Destroy_frame(Input);
    Destroy_frame(Output_SW_Horizontal);
    Destroy_frame(Output_HW_Horizontal);


    if (Equal_Horizontal)
    {
        std::cout << "TEST PASSED" << std::endl;
        return 0;
    }
    else
    {
        std::cout << "TEST FAILED" << std::endl;
        return 1;
    }
}

