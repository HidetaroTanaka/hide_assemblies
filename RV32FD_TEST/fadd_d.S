#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // 3.5 = 2.5 + 1.0
    TEST_FP_OP2_D(fadd.d, 0x3FF80000, 0x00000000, 0x40040000, 0x00000000, 0x3FF00000, 0x00000000)
    PRINT_IF_ERR(2, a0)
    // -1234.0 = -1235.1 + 1.1
    TEST_FP_OP2_D(fadd.d, 0xC0934800, 0x00000000, 0xC0934C66, 0x66666666, 0x3FF19999, 0x9999999A)
    PRINT_IF_ERR(3, a0)
    // 3.14159266 = 3.14159265 + 0.00000001
    TEST_FP_OP2_D(fadd.d, 0x400921FB, 0x55206DDF, 0x400921FB, 0x53C8D4F1, 0x3E45798E, 0xE2308C3A)
    PRINT_IF_ERR(4, a0)

EXIT:
    j EXIT