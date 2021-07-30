//#include "semp_syscall.c"

#define BUILD_FOR_SMT

#ifndef BUILD_FOR_SMT
#include<stdio.h>
#endif

unsigned int tribonacci(unsigned int n) {
    volatile register unsigned int a = 0;
    volatile register unsigned int b = 1;
    volatile register unsigned int c = 1;
    volatile register unsigned int tmp;
    volatile register unsigned int i=0;
    while(i<n) {
        tmp = c;
        c = a + b + c;
        a = b;
        b = tmp;
        i++;
    }
    return a;
}

#ifdef BUILD_FOR_SMT
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
    volatile register unsigned int i;
    for(i=0; i<20; i++) {
        #ifdef BUILD_FOR_SMT
        // これがあるとプログラム実行が長すぎてシミュレーションで最後まで実行できないので
        //_valuePrint(i);
        _valuePrint(tribonacci(i));
        #else
        printf("%x: %x\n", i, tribonacci(i));
        #endif
    }
    return 0;
}
