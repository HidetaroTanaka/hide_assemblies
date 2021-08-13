#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // 3.5f = 2.5f + 1.0f
    TEST_FP_OP2_S(fadd.s, 0x40600000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(2, a0)
    // -1234.0f = -1235.1f + 1.1f
    TEST_FP_OP2_S(fadd.s, 0xC49A4000, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(3, a0)
    // 3.14159265f = 3.14159265f + 0.00000001f
    TEST_FP_OP2_S(fadd.s, 0x40490FDB, 0x40490FDB, 0x322BCC77)
    PRINT_IF_ERR(4, a0)

EXIT:
    j EXIT