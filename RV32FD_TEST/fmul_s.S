#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // 2.5f = 2.5f * 1.0f
    TEST_FP_OP2_S(fmul.s, 0x40200000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(8, a0)
    // 1358.61f = -1235.1f * (-1.1f)
    TEST_FP_OP2_S(fmul.s, 0x44A9D385, 0xC49A6333, 0xBF8CCCCD)
    PRINT_IF_ERR(9, a0)
    // 3.14159265e-8f = 3.14159265f * 0.00000001f
    TEST_FP_OP2_S(fmul.s, 0x3306EE2D, 0x40490FDB, 0x322BCC77)
    PRINT_IF_ERR(10, a0)

EXIT:
    j EXIT