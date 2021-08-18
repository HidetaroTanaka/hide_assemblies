#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # fdiv.d 3.14159265, 2.71828182
    TEST_FP_OP2_D(fdiv.d, 0x3FF27DDB, 0xF6C383EC, 0x400921FB, 0x53C8D4F1, 0x4005BF0A, 0x89F1B0DD)
    PRINT_IF_ERR(2, a0)
    # fdiv.d -1234.0, 1235.1
    TEST_FP_OP2_D(fdiv.d, 0xBFEFF8B4, 0x3E1929A5, 0xC0934800, 0x00000000, 0x40934C66, 0x66666666)
    PRINT_IF_ERR(3, a0)
    # fdiv.d 3.14159265, 1.0
    TEST_FP_OP2_D(fdiv.d, 0x400921FB, 0x53C8D4F1, 0x400921FB, 0x53C8D4F1, 0x3FF00000, 0x00000000)
    PRINT_IF_ERR(4, a0)
EXIT:
    j EXIT