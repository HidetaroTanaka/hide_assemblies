#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // fmin.s 2.5f, 1.0f
    TEST_FP_OP2_S(fmin.s, 0x3F800000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(2, a0)
    // fmin.s -1235.1f, 1.1f
    TEST_FP_OP2_S(fmin.s, 0xC49A6333, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(3, a0)
    // fmin.s 1.1f, -1235.1f
    TEST_FP_OP2_S(fmin.s, 0xC49A6333, 0x3F8CCCCD, 0xC49A6333)
    PRINT_IF_ERR(4, a0)
    // fmin.s NaN, -1235.1f
    TEST_FP_OP2_S(fmin.s, 0xC49A6333, 0x7FC00000, 0xC49A6333)
    PRINT_IF_ERR(5, a0)
    // fmin.s 3.14159265f, 0.00000001f
    TEST_FP_OP2_S(fmin.s, 0x322BCC77, 0x40490FDB, 0x322BCC77)
    PRINT_IF_ERR(6, a0)
    // fmin.s -1.0f, -2.0f
    TEST_FP_OP2_S(fmin.s, 0xC0000000, 0xBF800000, 0xC0000000)
    PRINT_IF_ERR(7, a0)

    // fmax.s 2.5f, 1.0f
    TEST_FP_OP2_S(fmax.s, 0x40200000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(12, a0)
    // fmax.s -1235.1f, 1.1f
    TEST_FP_OP2_S(fmax.s, 0x3F8CCCCD, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(13, a0)
    // fmax.s 1.1f, -1235.1f
    TEST_FP_OP2_S(fmax.s, 0x3F8CCCCD, 0x3F8CCCCD, 0xC49A6333)
    PRINT_IF_ERR(14, a0)
    // fmax.s NaN, -1235.1f
    TEST_FP_OP2_S(fmax.s, 0xC49A6333, 0x7FC00000, 0xC49A6333)
    PRINT_IF_ERR(15, a0)
    // fmax.s 3.14159265f, 0.00000001f
    TEST_FP_OP2_S(fmax.s, 0x40490FDB, 0x40490FDB, 0x322BCC77)
    PRINT_IF_ERR(16, a0)
    // fmax.s -1.0f, -2.0f
    TEST_FP_OP2_S(fmax.s, 0xBF800000, 0xBF800000, 0xC0000000)
    PRINT_IF_ERR(17, a0)

    // fmax.s sNaN, 1.0f
    TEST_FP_OP2_S(fmax.s, 0x3F800000, 0x7F800001, 0x3F800000)
    PRINT_IF_ERR(20, a0)
    // fmax.s qNaN, qNaN
    TEST_FP_OP2_S(fmax.s, 0x7FC00000, 0x7FC00000, 0x7FC00000)
    PRINT_IF_ERR(21, a0)

    // fmin.s -0.0f, 0.0f
    TEST_FP_OP2_S(fmin.s, 0x80000000, 0x80000000, 0x00000000)
    PRINT_IF_ERR(30, a0)
    // fmin.s 0.0f, -0.0f
    TEST_FP_OP2_S(fmin.s, 0x80000000, 0x00000000, 0x80000000)
    PRINT_IF_ERR(31, a0)
    // fmax.s -0.0f, 0.0f
    TEST_FP_OP2_S(fmax.s, 0x00000000, 0x80000000, 0x00000000)
    PRINT_IF_ERR(32, a0)
    // fmax.s 0.0f, -0.0f
    TEST_FP_OP2_S(fmax.s, 0x00000000, 0x00000000, 0x80000000)
    PRINT_IF_ERR(33, a0)
EXIT:
    j EXIT