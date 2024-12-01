
#include "Common/EventTimer.h"
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include <vector>


#include "Pipeline_final.h"
#include "Common/Utilities.h"

#define STAGES (4)

int main()
{
  unsigned char *Input_data = (unsigned char *)malloc(FRAMES * FRAME_SIZE);
  unsigned char *Temp_data[STAGES - 1];
  unsigned char *Output_data = (unsigned char *)malloc(MAX_OUTPUT_SIZE);

  for (int Stage = 0; Stage < STAGES - 1; Stage++)
  {
    Temp_data[Stage] = (unsigned char *)malloc(FRAME_SIZE);
    if (Temp_data[Stage] == NULL)
      Exit_with_error("malloc failed at main for Temp_data");
  }

  Load_data(Input_data);


  int Size = 0;
  for (int Frame = 0; Frame < FRAMES; Frame++)
  {



    Scale_SW(Input_data + Frame * FRAME_SIZE, Temp_data[0]);

    Filter_HW(Temp_data[0], Temp_data[1]);


    Differentiate_SW(Temp_data[1], Temp_data[2]);


    Size = Compress_SW(Temp_data[2], Output_data);


  }

  Store_data("Output_base.bin", Output_data, Size);
  Check_data(Output_data, Size);

  for (int i = 0; i < STAGES - 1; i++)
    free(Temp_data[i]);
  free(Input_data);
  free(Output_data);

  return EXIT_SUCCESS;
}
