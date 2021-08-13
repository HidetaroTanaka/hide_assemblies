#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # fdiv.s 3.14159265f, 2.71828182f
    TEST_FP_OP2_S(fdiv.s, 0x3F93EEE0, 0x40490FDB, 0x402DF854)
    PRINT_IF_ERR(2, a0)
    # fdiv.s -1234.0f, 1235.1f
    TEST_FP_OP2_S(fdiv.s, 0xBF7FC5A2, 0xC49A4000, 0x449A6333)
    PRINT_IF_ERR(3, a0)
    # fdiv.s 3.14159265f, 1.0f
    TEST_FP_OP2_S(fdiv.s, 0x40490FDB, 0x40490FDB, 0x3F800000)
    PRINT_IF_ERR(4, a0)
EXIT:
    j EXIT