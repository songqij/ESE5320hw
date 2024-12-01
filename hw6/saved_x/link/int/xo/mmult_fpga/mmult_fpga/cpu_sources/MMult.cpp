#include "MMult.h"
#include "hls_stream.h"

/**
 *
 * Design principles to achieve II = 1
 * 1. Stream data into local RAM for inputs (multiple access required)
 * 2. Partition local RAMs into N/2 sub-arrays for fully parallel access
 * (dual-port read)
 * 3. Pipeline the dot-product loop, to fully unroll it
 * 4. Separate multiply-accumulate in inner loop to force two FP operators
 *
 */
//void mmult_fpga(float A[CHUNKS * N * N], float B[CHUNKS * N * N],
//                float C[CHUNKS * N * N]) {
//  float A_tmp[N][N], B_tmp[N][N];
//#pragma HLS array_partition variable=A_tmp block factor=16 dim=2
//#pragma HLS array_partition variable=B_tmp block factor=16 dim=1
//
//  for (int c = 0; c < CHUNKS; c++) {
//    for (int i = 0; i < N; i++) {
//      for (int j = 0; j < N; j++) {
//#pragma HLS PIPELINE
//        A_tmp[i][j] = A[c * N * N + i * N + j];
//        B_tmp[i][j] = B[c * N * N + i * N + j];
//      }
//    }
//
//    for (int i = 0; i < N; i++) {
//      for (int j = 0; j < N; j++) {
//#pragma HLS PIPELINE
//        float result = 0;
//        for (int k = 0; k < N; k++) {
//          float term = A_tmp[i][k] * B_tmp[k][j];
//          result += term;
//        }
//        C[c * N * N + i * N + j] = result;
//      }
//    }
//  }
//}

void read(const float *A, const float *B,
		hls::stream<float> &A_tmp, hls::stream<float> &B_tmp, int itr)
{
//	#pragma HLS array_partition variable=A_tmp block factor=16 dim=2
//	#pragma HLS array_partition variable=B_tmp block factor=16 dim=1

	for (int c = 0; c < itr; c++) {
//#pragma HLS PIPELINE
				A_tmp.write(A[c]);
				B_tmp.write(B[c]);
			}
}


void execution(hls::stream<float> &A_tmp, hls::stream<float> &B_tmp, hls::stream<float> &result)
	{
	float A_temp1[N][N];
	float B_temp1[N][N];
#pragma HLS array_partition variable=A_temp1 block factor=32 dim=2
#pragma HLS array_partition variable=B_temp1 block factor=32 dim=1
	for (int c = 0; c < CHUNKS; c++) {

		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				A_temp1[i][j]=A_tmp.read();
				B_temp1[i][j]=B_tmp.read();
			}
		}

//		int i=0;
//		int j=0;
//		for (int itr = 0; itr < N*N; itr++) {
////#pragma HLS PIPELINE II=1
//			if(j==N){
//				j=0;
//				i++;
//			}
//
//			A_temp1[i][j]=A_tmp.read();
//			B_temp1[i][j]=B_tmp.read();
//			++j;
//		}

		for (int i = 0; i < N; i++) {

			for (int j = 0; j < N; j++) {
#pragma HLS PIPELINE II=1
				float res = 0;
				for (int k = 0; k < N; k++) {
					float term = A_temp1[i][k] * B_temp1[k][j];
					res += term;
	        	}
				result.write(res);
        	}
    	}
	}

}

void write(hls::stream<float> &result, float *output ,int itr){
	for (int i = 0; i < itr; i++) {
//#pragma HLS PIPELINE
	        output[i] = result.read();

	    }

}

void mmult_fpga(float A[CHUNKS * N * N], float B[CHUNKS * N * N], float C[CHUNKS * N * N]) {
#pragma HLS INTERFACE m_axi port=A bundle=b0
#pragma HLS INTERFACE m_axi port=B bundle=b1
#pragma HLS INTERFACE m_axi port=C bundle=b2
#pragma HLS INTERFACE ap_ctrl_chain port=return


	#pragma HLS DATAFLOW

	hls::stream<float> A_tmp;
	hls::stream<float> B_tmp;
	hls::stream<float> result;

	read(A, B, A_tmp, B_tmp, N*N*CHUNKS);
	execution(A_tmp, B_tmp, result);
	write(result, C, N*N*CHUNKS);
}


