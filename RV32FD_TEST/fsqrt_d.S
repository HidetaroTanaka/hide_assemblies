#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # fsqrt.d 3.14159265
    TEST_FP_OP1_D(fsqrt.d, 0x3FFC5BF8, 0x916F587B, 0x400921FB, 0x53C8D4F1)
    PRINT_IF_ERR(5, a0)
    # fsqrt.d 10000.0
    TEST_FP_OP1_D(fsqrt.d, 0x40590000, 0x00000000, 0x40C38800, 0x00000000)
    PRINT_IF_ERR(6, a0)
    # fsqrt.d -1.0
    TEST_FP_OP1_D(fsqrt.d, 0x7FF80000, 0x00000000, 0xBFF00000, 0x00000000)
    PRINT_IF_ERR(16, a0)
    # fsqrt.d 171.0
    TEST_FP_OP1_D(fsqrt.d, 0x402A2744, 0xCE9674F5, 0x40656000, 0x00000000)
    PRINT_IF_ERR(7, a0)
    # fsqrt.d 1.60795e-7
    TEST_FP_OP1_D(fsqrt.d, 0x3F3A4789, 0xC0E37F99, 0x3E8594DF, 0xC70AA105)
    PRINT_IF_ERR(8, a0)
    
EXIT:
    j EXIT