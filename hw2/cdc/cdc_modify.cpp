#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include"stopwatch.h"

#define WIN_SIZE 16
#define PRIME 3
#define MODULUS 256
#define TARGET 0

// Initial hash function to calculate full hash for a given window
uint64_t initial_hash_func(const unsigned char *input, unsigned int pos)
{
    uint64_t hash = 0;
    for (int i = 0; i < WIN_SIZE; i++)
    {
        hash += input[pos + WIN_SIZE - 1 - i] * (uint64_t)pow(PRIME, i + 1);
    }
    return hash;
}

// Rolling hash function to update hash from previous position
uint64_t rolling_hash(uint64_t previous_hash, unsigned char old_char, unsigned char new_char)
{
    previous_hash = (previous_hash * PRIME) 
                    - (old_char * (uint64_t)pow(PRIME, WIN_SIZE + 1))
                    + (new_char * PRIME);
    return previous_hash;
}

// Modified CDC function using the rolling hash
void cdc(const unsigned char *buff, unsigned int buff_size)
{
    if (buff_size < WIN_SIZE) return;

    // Calculate initial hash for the first window
    uint64_t current_hash = initial_hash_func(buff, 0);

    // Check the first hash
    if (current_hash % MODULUS == TARGET) {
        printf("0\n");
    }

    // Iterate over the buffer and use rolling hash for subsequent windows
    for (unsigned int i = 1; i <= buff_size - WIN_SIZE; i++)
    {
        // Update the hash using rolling hash formula
        current_hash = rolling_hash(current_hash, buff[i - 1], buff[i + WIN_SIZE - 1]);

        if (current_hash % MODULUS == TARGET) {
            printf("%u\n", i);
        }
    }
}

// Function to test the CDC with a given file
void test_cdc(const char* file)
{
    FILE* infile = fopen(file, "rb");
    if (!infile)
    {
        perror("Error opening file");
        return;
    }

    // Get the file size
    fseek(infile, 0, SEEK_END);
    long file_size = ftell(infile);
    fseek(infile, 0, SEEK_SET);

    // Allocate buffer to hold the file contents
    unsigned char* buff = (unsigned char*)malloc(file_size);
    if (!buff)
    {
        perror("Error allocating memory");
        fclose(infile);
        return;
    }

    // Read the file into the buffer
    if (fread(buff, 1, file_size, infile) != file_size)
    {
        perror("Error reading file");
        free(buff);
        fclose(infile);
        return;
    }

    // Call the CDC function to perform chunking
    cdc(buff, file_size);

    // Clean up
    free(buff);
    fclose(infile);
}

int main()
{
    stopwatch timer;

	timer.start();
	test_cdc("prince.txt");	
	timer.stop();

	printf("Latency of cdc_modify function: %lf ns.\n", timer.latency());
	
	return 0;
}
