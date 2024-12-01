#include <iostream>
#include <cstdlib>
#include <chrono>
#include "Pipeline_streaming.h"
#include <hls_stream.h>


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
            Frame[Y * width + X] = rand() % 255;
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

void Filter_SW(const unsigned char * Input, unsigned char * Output);
void Filter_HW(const unsigned char * Input,unsigned char * Output);


int main()
{
    unsigned char *Input = Create_frame(TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);

    unsigned char *Output_SW = Create_frame(TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);
    unsigned char *Output_HW = Create_frame(TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);


    Randomize_frame(Input, TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);

    Filter_SW(Input, Output_SW);
    Filter_HW(Input, Output_HW);

    bool Equal_Filter = Compare_frames(Output_SW, Output_HW, TEST_FRAME_WIDTH, TEST_FRAME_HEIGHT);



    Destroy_frame(Input);
    Destroy_frame(Output_SW);
    Destroy_frame(Output_HW);


    if (Equal_Filter)
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

