#define ARCH_RISCV

#ifdef ARCH_RISCV
#include "syscall.c"
#else
#include<stdio.h>
#endif

double loadDouble(unsigned int up, unsigned int down) {
    double val = 0;
    unsigned int* ptr;
    ptr = &val;
    *ptr = down;
    *(ptr+1) = up;
    return val;
}
float loadFloat(unsigned int num) {
    float val = 0;
    unsigned int* ptr;
    ptr = &val;
    *ptr = num;
    return val;
}

// T_0 = 0, T_1 = 1, T_2 = 1
double tribonacci_double(unsigned int n) {
    #ifdef ARCH_RISCV
    volatile register double a = loadDouble(0x00000000, 0x00000000);
    volatile register double b = loadDouble(0x3FF00000, 0x00000000);
    volatile register double c = loadDouble(0x3FF00000, 0x00000000);
    volatile register double tmp;
    #else
    // aが答え
    double a = 0.0, b = 1.0, c = 1.0, tmp;
    #endif
    int i=0;
    while(i<n) {
        tmp = c;
        c = a + b + c;
        a = b;
        b = tmp;
        i++;
    }
    return a;
}

float tribonacci_float(unsigned int n) {
    #ifdef ARCH_RISCV
    volatile register float a = loadFloat(0x00000000);
    volatile register float b = loadFloat(0x3F800000);
    volatile register float c = loadFloat(0x3F800000);
    volatile register float tmp = loadFloat(0x00000000);
    #else
    float a = 0.0f, b = 1.0f, c = 1.0f, tmp = 0.0f;
    #endif
    int i=0;
    while(i<n) {
        tmp = c;
        c = a + b + c;
        a = b;
        b = tmp;
        i++;
    }
    return a;
}

unsigned int tribonacci_int(unsigned int n) {
    #ifdef ARCH_RISCV
    volatile register unsigned int  a = 0;
    volatile register unsigned int b = 1;
    volatile register unsigned int c = 1;
    volatile register unsigned int tmp = 0;
    #else
    unsigned int a = 0.0f, b = 1.0f, c = 1.0f, tmp = 0.0f;
    #endif
    int i=0;
    while(i<n) {
        tmp = c;
        c = a + b + c;
        a = b;
        b = tmp;
        i++;
    }
    return a;
}

int main(void) {
    #ifdef ARCH_RISCV
    volatile register double ans = tribonacci_double(switchRead_uint32());
    valuePrint_float64(ans);
    while(1);
    #else
    int i;
    float num;
    int* p;
    p = &num;
    for(i=0; i<100; i++) {
        num = tribonacci(i);
        //printf("%-26.0f\n", num);
        printf("%X\n", *p);
    }
    #endif
    return 0;
    
}