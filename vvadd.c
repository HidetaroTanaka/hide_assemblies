#define BUILD_FOR_SEMP

#ifndef BUILD_FOR_SEMP
#include<stdio.h>
#endif

#define DATA_SIZE 20

static int input1_data[DATA_SIZE] = 
{
  0, 15, 10, 3, 14, 6, 2, 18, 11, 15, 11, 0, 17, 16, 7, 13, 18, 2, 2, 5,
};
static int input2_data[DATA_SIZE] =
{
  8, 6, 0, 18, 6, 10, 1, 2, 4, 2, 4, 10, 6, 11, 17, 4, 0, 16, 14, 12, 
};
static int output_data[DATA_SIZE];

void vvadd(unsigned int n, const int* x, const int* y, int* z) {
    volatile register unsigned int i;
    for(i=0; i<n; i++) {
        z[i] = x[i] + y[i];
    }
    return;
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

int main(void) {
    vvadd(DATA_SIZE, input1_data, input2_data, output_data);
    volatile register unsigned int i;
    for(i=0; i<DATA_SIZE; i++) {
        #ifdef BUILD_FOR_SEMP
        _valuePrint(i);
        _valuePrint(output_data[i]);
        #else
        printf("%X: %X\n", i, output_data[i]);
        #endif
    }
    return 0;
}