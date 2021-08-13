#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // fcvt.s.w 2
    TEST_INT_FP_OP_S(fcvt.s.w, 0x40000000, 2)
    PRINT_IF_ERR(2, a0)
    // fcvt.s.w -2
    TEST_INT_FP_OP_S(fcvt.s.w, 0xC0000000, -2)
    PRINT_IF_ERR(3, a0)

    // fcvt.s.wu 2
    TEST_INT_FP_OP_S(fcvt.s.wu, 0x40000000, 2)
    PRINT_IF_ERR(4, a0)
    // fcvt.s.w 4294967294
    TEST_INT_FP_OP_S(fcvt.s.wu, 0x4F800000, -2)
    PRINT_IF_ERR(5, a0)
EXIT:
    j EXIT