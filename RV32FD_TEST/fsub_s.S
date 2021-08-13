#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // 1.5f = 2.5f - 1.0f
    TEST_FP_OP2_S(fsub.s, 0x3FC00000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(5, a0)
    // -1234.0f = -1235.1f - (-1.1f)
    TEST_FP_OP2_S(fsub.s, 0xC49A4000, 0xC49A6333, 0xBF8CCCCD)
    PRINT_IF_ERR(6, a0)
    // 3.14159265f = 3.14159265f - 0.00000001f
    TEST_FP_OP2_S(fsub.s, 0x40490FDB, 0x40490FDB, 0x322BCC77)
    PRINT_IF_ERR(7, a0)
    // Canonical NaN = Inf - Inf
    TEST_FP_OP2_S(fsub.s, 0x7FC00000, 0x7F800000, 0x7F800000)
    PRINT_IF_ERR(11, a0)

EXIT:
    j EXIT