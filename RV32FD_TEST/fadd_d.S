#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
/*
    // 3.5 = 2.5 + 1.0
    TEST_FP_OP2_D(fadd.d, 0x400C0000, 0x00000000, 0x40040000, 0x00000000, 0x3FF00000, 0x00000000)
    PRINT_IF_ERR(2, a0)
    */
    // -1234.0 = -1235.1 + 1.1
    TEST_FP_OP2_D(fadd.d, 0xC0934800, 0x00000000, 0xC0934C66, 0x66666666, 0x3FF19999, 0x9999999A)
    PRINT_IF_ERR(3, a0)
    /*
    // -1234.0f = -1235.1f + 1.1f
    TEST_FP_OP2_S(fadd.s, 0xC49A4000, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(3, a0)
    // 3.14159265f = 3.14159265f + 0.00000001f
    TEST_FP_OP2_S(fadd.s, 0x40490FDB, 0x40490FDB, 0x322BCC77)
    PRINT_IF_ERR(4, a0)
*/
EXIT:
    j EXIT