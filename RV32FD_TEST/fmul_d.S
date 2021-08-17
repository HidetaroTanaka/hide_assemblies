#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // 2.5 = 2.5 * 1.0
    TEST_FP_OP2_D(fmul.d, 0x40040000, 0x00000000, 0x40040000, 0x00000000, 0x3FF00000, 0x00000000)
    PRINT_IF_ERR(8, a0)
    // 1358.61 = -1235.1 * (-1.1)
    TEST_FP_OP2_D(fmul.d, 0x40953A70, 0xA3D70A3D, 0xC0934C66, 0x66666666, 0xBFF19999, 0x9999999A)
    PRINT_IF_ERR(9, a0)
    // 3.14159265e-8 = 3.14159265 * 0.00000001
    TEST_FP_OP2_D(fmul.d, 0x3E60DDC5, 0xA5C1FF09, 0x400921FB, 0x53C8D4F1, 0x3E45798E, 0xE2308C3A)
    PRINT_IF_ERR(10, a0)

EXIT:
    j EXIT