#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void lzw(char*, int*, char*, int, int, int, int);
extern "C" void apatb_lzw_hw(volatile void * __xlx_apatb_param_in, volatile void * __xlx_apatb_param_chunk_size, volatile void * __xlx_apatb_param_compressed_data, volatile void * __xlx_apatb_param_compressed_size) {
  // Collect __xlx_in__tmp_vec
  vector<sc_bv<8> >__xlx_in__tmp_vec;
  for (int j = 0, e = 1024; j != e; ++j) {
    __xlx_in__tmp_vec.push_back(((char*)__xlx_apatb_param_in)[j]);
  }
  int __xlx_size_param_in = 1024;
  int __xlx_offset_param_in = 0;
  int __xlx_offset_byte_param_in = 0*1;
  char* __xlx_in__input_buffer= new char[__xlx_in__tmp_vec.size()];
  for (int i = 0; i < __xlx_in__tmp_vec.size(); ++i) {
    __xlx_in__input_buffer[i] = __xlx_in__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_chunk_size_compressed_size__tmp_vec
  vector<sc_bv<32> >__xlx_chunk_size_compressed_size__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_chunk_size_compressed_size__tmp_vec.push_back(((int*)__xlx_apatb_param_chunk_size)[j]);
  }
  int __xlx_size_param_chunk_size = 1;
  int __xlx_offset_param_chunk_size = 0;
  int __xlx_offset_byte_param_chunk_size = 0*4;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_chunk_size_compressed_size__tmp_vec.push_back(((int*)__xlx_apatb_param_compressed_size)[j]);
  }
  int __xlx_size_param_compressed_size = 1;
  int __xlx_offset_param_compressed_size = 1;
  int __xlx_offset_byte_param_compressed_size = 1*4;
  int* __xlx_chunk_size_compressed_size__input_buffer= new int[__xlx_chunk_size_compressed_size__tmp_vec.size()];
  for (int i = 0; i < __xlx_chunk_size_compressed_size__tmp_vec.size(); ++i) {
    __xlx_chunk_size_compressed_size__input_buffer[i] = __xlx_chunk_size_compressed_size__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_compressed_data__tmp_vec
  vector<sc_bv<8> >__xlx_compressed_data__tmp_vec;
  for (int j = 0, e = 1024; j != e; ++j) {
    __xlx_compressed_data__tmp_vec.push_back(((char*)__xlx_apatb_param_compressed_data)[j]);
  }
  int __xlx_size_param_compressed_data = 1024;
  int __xlx_offset_param_compressed_data = 0;
  int __xlx_offset_byte_param_compressed_data = 0*1;
  char* __xlx_compressed_data__input_buffer= new char[__xlx_compressed_data__tmp_vec.size()];
  for (int i = 0; i < __xlx_compressed_data__tmp_vec.size(); ++i) {
    __xlx_compressed_data__input_buffer[i] = __xlx_compressed_data__tmp_vec[i].range(7, 0).to_uint64();
  }
  // DUT call
  lzw(__xlx_in__input_buffer, __xlx_chunk_size_compressed_size__input_buffer, __xlx_compressed_data__input_buffer, __xlx_offset_byte_param_in, __xlx_offset_byte_param_chunk_size, __xlx_offset_byte_param_compressed_data, __xlx_offset_byte_param_compressed_size);
// print __xlx_apatb_param_in
  sc_bv<8>*__xlx_in_output_buffer = new sc_bv<8>[__xlx_size_param_in];
  for (int i = 0; i < __xlx_size_param_in; ++i) {
    __xlx_in_output_buffer[i] = __xlx_in__input_buffer[i+__xlx_offset_param_in];
  }
  for (int i = 0; i < __xlx_size_param_in; ++i) {
    ((char*)__xlx_apatb_param_in)[i] = __xlx_in_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_chunk_size
  sc_bv<32>*__xlx_chunk_size_output_buffer = new sc_bv<32>[__xlx_size_param_chunk_size];
  for (int i = 0; i < __xlx_size_param_chunk_size; ++i) {
    __xlx_chunk_size_output_buffer[i] = __xlx_chunk_size_compressed_size__input_buffer[i+__xlx_offset_param_chunk_size];
  }
  for (int i = 0; i < __xlx_size_param_chunk_size; ++i) {
    ((int*)__xlx_apatb_param_chunk_size)[i] = __xlx_chunk_size_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_compressed_size
  sc_bv<32>*__xlx_compressed_size_output_buffer = new sc_bv<32>[__xlx_size_param_compressed_size];
  for (int i = 0; i < __xlx_size_param_compressed_size; ++i) {
    __xlx_compressed_size_output_buffer[i] = __xlx_chunk_size_compressed_size__input_buffer[i+__xlx_offset_param_compressed_size];
  }
  for (int i = 0; i < __xlx_size_param_compressed_size; ++i) {
    ((int*)__xlx_apatb_param_compressed_size)[i] = __xlx_compressed_size_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_compressed_data
  sc_bv<8>*__xlx_compressed_data_output_buffer = new sc_bv<8>[__xlx_size_param_compressed_data];
  for (int i = 0; i < __xlx_size_param_compressed_data; ++i) {
    __xlx_compressed_data_output_buffer[i] = __xlx_compressed_data__input_buffer[i+__xlx_offset_param_compressed_data];
  }
  for (int i = 0; i < __xlx_size_param_compressed_data; ++i) {
    ((char*)__xlx_apatb_param_compressed_data)[i] = __xlx_compressed_data_output_buffer[i].to_uint64();
  }
}
