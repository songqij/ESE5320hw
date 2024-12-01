CXX = g++
CXXFLAGS = -std=c++11 -Wall -O2 -mcpu=native -fno-tree-vectorize -DNDEBUG -pthread
LDFLAGS = -lpthread -pthread -lOpenCL
INCLUDES = -I./

# Executable for SHA-256 test
EXECUTABLES = sha

# Source files
SHA256_SOURCES = sha.cpp sha256.h
SHA256_OBJECTS = $(SHA256_SOURCES:.cpp=.o)

# All targets
.PHONY: all clean

all: $(EXECUTABLES)

# Rule to build sha256_test executable
sha: $(SHA256_OBJECTS)
	$(CXX) -DVECTORIZED $(CXXFLAGS) $(INCLUDES) $^ -o $@ $(LDFLAGS)

clean:
	$(RM) -rf perf* *.bin *.txt *.dSYM *.out *.o *~ $(EXECUTABLES)

