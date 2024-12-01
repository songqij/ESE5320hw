#ifndef _ENCODER_H_
#define _ENCODER_H_

// max number of elements we can get from ethernet
#define NUM_ELEMENTS 16384
#define HEADER 2

#endif

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include "server.h"
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "stopwatch.h"
#include "cdc.h"
#include "lzw.h"
#include "sha.h"
#include "Dedup.h"
#include <map>


void handle_input(int argc, char* argv[], int* blocksize);
bool process_packet(unsigned char* file, std::vector<unsigned char> &output_buffer, int& offset,
std::map<std::string, int>& lzw_cache,
std::unordered_set<std::string>& hash_table);
