
// See LICENSE for license details.
// riscv-tests/benchmark/median
//**************************************************************************
// Median filter bencmark
//--------------------------------------------------------------------------
//
// This benchmark performs a 1D three element median filter. The
// input data (and reference data) should be generated using the
// median_gendata.pl perl script and dumped to a file named
// dataset1.h.


//--------------------------------------------------------------------------

#define BUILD_FOR_SEMP

#ifndef BUILD_FOR_SEMP
#include<stdio.h>
#endif

#define DATA_SIZE 20

const int input_data[DATA_SIZE] =
{
   41, 454, 833, 335, 564,   1, 187, 989, 749, 365, 350, 572, 132,  64, 949, 153, 584, 216, 805, 140,
};

const int verify_data[DATA_SIZE] =
{
    0, 454, 454, 564, 335, 187, 187, 749, 749, 365, 365, 350, 132, 132, 153, 584, 216, 584, 216, 0,
};

int results[DATA_SIZE] = {0};

void thread1(){
  volatile register int A, B, C, i;
    // 端っこは無視せよ
    results[0] = 0;
  for (i = 1; i < DATA_SIZE-1; i++)
  {
    //results[i] = input_data[i];
    A = input_data[i-1];
    B = input_data[i];
    C = input_data[i+1];

    if ( A < B ) {
      if ( B < C )
        results[i] = B;
      else if ( C < A )
        results[i] = A;
      else
        results[i] = C;
    }

    else {
      if ( A < C )
        results[i] = A;
      else if ( C < B )
        results[i] = B;
      else
        results[i] = C;
    }
  }
  results[i] = 0;
}

#ifdef BUILD_FOR_SEMP
void _valuePrint(unsigned int val) {
  volatile register unsigned int *ptr = (unsigned int*)0xFFC01000;
  *ptr = val;
  return;
  /*
    asm volatile(
        "li t0, 0xFFC01000;"
        "sw a0, 0(t0);"
    );
    return;
    */
}
#endif

//--------------------------------------------------------------------------
// Main

int main()
{
  
  // Do the filter
  thread1();
  

  // Check the results
  volatile register unsigned int i;
  for(i=0; i<DATA_SIZE; i++) {
    #ifdef BUILD_FOR_SEMP
    _valuePrint(i);
    _valuePrint(results[i]);
    #else
    printf("%X: results=%X, verify=%X\n", i, results[i], verify_data[i]);
    #endif
  }
  return 0;
  //return verify( DATA_SIZE, results_data, verify_data );
}
