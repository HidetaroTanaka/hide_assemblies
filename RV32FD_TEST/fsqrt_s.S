#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # fsqrt.s 3.14159265f
    TEST_FP_OP1_S(fsqrt.s, 0x3FE2DFC5, 0x40490FDB)
    PRINT_IF_ERR(5, a0)
    # fsqrt.s 10000.0f
    TEST_FP_OP1_S(fsqrt.s, 0x42C80000, 0x461C4000)
    PRINT_IF_ERR(6, a0)
    # fsqrt.s -1.0f
    TEST_FP_OP1_S(fsqrt.s, 0x7FC00000, 0xBF800000)
    PRINT_IF_ERR(7, a0)
    # fsqrt.s 171.0f
    TEST_FP_OP1_S(fsqrt.s, 0x41513A26, 0x432B0000)
    PRINT_IF_ERR(8, a0)
EXIT:
    j EXIT