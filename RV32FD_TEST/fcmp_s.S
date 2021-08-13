#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # feq.s -1.36f, -1.36f
    TEST_FP_CMP_OP_S(feq.s, 1, 0xBFAE147B, 0xBFAE147B)
    PRINT_IF_ERR(2, a0)
    # fle.s -1.36f, -1.36f
    TEST_FP_CMP_OP_S(fle.s, 1, 0xBFAE147B, 0xBFAE147B)
    PRINT_IF_ERR(3, a0)
    # flt.s -1.36f, -1.36f
    TEST_FP_CMP_OP_S(flt.s, 0, 0xBFAE147B, 0xBFAE147B)
    PRINT_IF_ERR(4, a0)

    # feq.s -1.37f, -1.36f
    TEST_FP_CMP_OP_S(feq.s, 0, 0xBFAF5C29, 0xBFAE147B)
    PRINT_IF_ERR(5, a0)
    # fle.s -1.37f, -1.36f
    TEST_FP_CMP_OP_S(fle.s, 1, 0xBFAF5C29, 0xBFAE147B)
    PRINT_IF_ERR(6, a0)
    # flt.s -1.37f, -1.36f
    TEST_FP_CMP_OP_S(flt.s, 1, 0xBFAF5C29, 0xBFAE147B)
    PRINT_IF_ERR(7, a0)

    # feq.s NaN, 0
    TEST_FP_CMP_OP_S(feq.s, 0, 0x7FC00000, 0x00000000)
    PRINT_IF_ERR(8, a0)
    # feq.s NaN, NaN
    TEST_FP_CMP_OP_S(feq.s, 0, 0x7FC00000, 0x7FC00000)
    PRINT_IF_ERR(9, a0)
    # feq.s sNaN, 0
    TEST_FP_CMP_OP_S(feq.s, 0, 0x7F800001, 0x00000000)
    PRINT_IF_ERR(10, a0)

    # flt.s NaN, 0
    TEST_FP_CMP_OP_S(flt.s, 0, 0x7FC00000, 0x00000000)
    PRINT_IF_ERR(11, a0)
    # flt.s NaN, NaN
    TEST_FP_CMP_OP_S(flt.s, 0, 0x7FC00000, 0x7FC00000)
    PRINT_IF_ERR(12, a0)
    # flt.s sNaN, 0
    TEST_FP_CMP_OP_S(flt.s, 0, 0x7F800001, 0x00000000)
    PRINT_IF_ERR(13, a0)
    # fle.s NaN, 0
    TEST_FP_CMP_OP_S(fle.s, 0, 0x7FC00000, 0x00000000)
    PRINT_IF_ERR(14, a0)
    # fle.s NaN, NaN
    TEST_FP_CMP_OP_S(fle.s, 0, 0x7FC00000, 0x7FC00000)
    PRINT_IF_ERR(15, a0)
    # fle.s sNaN, 0
    TEST_FP_CMP_OP_S(fle.s, 0, 0x7F800001, 0x00000000)
    PRINT_IF_ERR(16, a0)
EXIT:
    j EXIT