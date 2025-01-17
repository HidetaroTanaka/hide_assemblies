#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // fsgnj.s 0x12345678, 0x00000000
    TEST_FP_OP2_S(fsgnj.s, 0x12345678, 0x12345678, 0x00000000)
    PRINT_IF_ERR(10, a0)
    // fsgnj.s 0x12345678, 0xFFFFFFFF
    TEST_FP_OP2_S(fsgnj.s, 0x92345678, 0x12345678, 0xFFFFFFFF)
    PRINT_IF_ERR(11, a0)
    // fsgnj.s 0x92345678, 0x00000000
    TEST_FP_OP2_S(fsgnj.s, 0x12345678, 0x92345678, 0x00000000)
    PRINT_IF_ERR(12, a0)
    // fsgnj.s 0x92345678, 0xFFFFFFFF
    TEST_FP_OP2_S(fsgnj.s, 0x92345678, 0x92345678, 0xFFFFFFFF)
    PRINT_IF_ERR(13, a0)

    // fsgnjn.s 0x12345678, 0x00000000
    TEST_FP_OP2_S(fsgnjn.s, 0x92345678, 0x12345678, 0x00000000)
    PRINT_IF_ERR(20, a0)
    // fsgnjn.s 0x12345678, 0xFFFFFFFF
    TEST_FP_OP2_S(fsgnjn.s, 0x12345678, 0x12345678, 0xFFFFFFFF)
    PRINT_IF_ERR(21, a0)
    // fsgnjn.s 0x92345678, 0x00000000
    TEST_FP_OP2_S(fsgnjn.s, 0x92345678, 0x92345678, 0x00000000)
    PRINT_IF_ERR(22, a0)
    // fsgnjn.s 0x92345678, 0xFFFFFFFF
    TEST_FP_OP2_S(fsgnjn.s, 0x12345678, 0x92345678, 0xFFFFFFFF)
    PRINT_IF_ERR(23, a0)

    // fsgnjx.s 0x12345678, 0x00000000
    TEST_FP_OP2_S(fsgnjx.s, 0x12345678, 0x12345678, 0x00000000)
    PRINT_IF_ERR(30, a0)
    // fsgnjx.s 0x12345678, 0xFFFFFFFF
    TEST_FP_OP2_S(fsgnjx.s, 0x92345678, 0x12345678, 0xFFFFFFFF)
    PRINT_IF_ERR(31, a0)
    // fsgnjx.s 0x92345678, 0x00000000
    TEST_FP_OP2_S(fsgnjx.s, 0x92345678, 0x92345678, 0x00000000)
    PRINT_IF_ERR(32, a0)
    // fsgnjx.s 0x92345678, 0xFFFFFFFF
    TEST_FP_OP2_S(fsgnjx.s, 0x12345678, 0x92345678, 0xFFFFFFFF)
    PRINT_IF_ERR(33, a0)

EXIT:
    j EXIT
