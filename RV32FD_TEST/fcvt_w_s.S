#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # fcvt.w.s -1.1f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, -1, 0xBF8CCCCD, rtz)
    PRINT_IF_ERR(2, a0)
    # fcvt.w.s -1.0f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, -1, 0xBF800000, rtz)
    PRINT_IF_ERR(3, a0)
    # fcvt.w.s -0.9f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, 0, 0xBF666666, rtz)
    PRINT_IF_ERR(4, a0)
    # fcvt.w.s 0.9f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, 0, 0x3F666666, rtz)
    PRINT_IF_ERR(5, a0)
    # fcvt.w.s 1.0f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, 1, 0x3F800000, rtz)
    PRINT_IF_ERR(6, a0)
    # fcvt.w.s 1.1f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, 1, 0x3F8CCCCD, rtz)
    PRINT_IF_ERR(7, a0)
    # fcvt.w.s -3e9f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, -1<<31, 0xCF32D05E, rtz)
    PRINT_IF_ERR(8, a0)
    # fcvt.w.s 3e9f, rtz
    TEST_FP_INT_OP_S(fcvt.w.s, (1<<31)-1, 0x4F32D05E, rtz)
    PRINT_IF_ERR(9, a0)

    # fcvt.wu.s -3.0f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 0, 0xC0400000, rtz)
    PRINT_IF_ERR(12, a0)
    # fcvt.wu.s -1.0f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 0, 0xBF800000, rtz)
    PRINT_IF_ERR(13, a0)
    # fcvt.wu.s -0.9f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 0, 0xBF666666, rtz)
    PRINT_IF_ERR(14, a0)
    # fcvt.wu.s 0.9f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 0, 0x3F666666, rtz)
    PRINT_IF_ERR(15, a0)
    # fcvt.wu.s 1.0f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 1, 0x3F800000, rtz)
    PRINT_IF_ERR(16, a0)
    # fcvt.wu.s 1.1f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 1, 0x3F8CCCCD, rtz)
    PRINT_IF_ERR(17, a0)
    # fcvt.wu.s -3e9f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 0, 0xCF32D05E, rtz)
    PRINT_IF_ERR(18, a0)
    # fcvt.wu.s 3e9f, rtz
    TEST_FP_INT_OP_S(fcvt.wu.s, 3000000000, 0x4F32D05E, rtz)
    PRINT_IF_ERR(19, a0)

    # fcvt.w.s 0xFFFFFFFF(-NaN)
    TEST_FP_INT_OP_S(fcvt.w.s, 0x7FFFFFFF, 0xFFFFFFFF, rne)
    PRINT_IF_ERR(42, a0)
    # fcvt.w.s 0xFF800000(-Inf)
    TEST_FP_INT_OP_S(fcvt.w.s, 0x80000000, 0xFF800000, rne)
    PRINT_IF_ERR(44, a0)
    # fcvt.w.s 0x7FFFFFFF(+NaN)
    TEST_FP_INT_OP_S(fcvt.w.s, 0x7FFFFFFF, 0x7FFFFFFF, rne)
    PRINT_IF_ERR(52, a0)
    # fcvt.w.s 0x7F800000(+Inf)
    TEST_FP_INT_OP_S(fcvt.w.s, 0x7FFFFFFF, 0x7F800000, rne)
    PRINT_IF_ERR(54, a0)

    # fcvt.wu.s 0xFFFFFFFF(-NaN)
    TEST_FP_INT_OP_S(fcvt.wu.s, 0xFFFFFFFF, 0xFFFFFFFF, rne)
    PRINT_IF_ERR(62, a0)
    # fcvt.wu.s 0x7FFFFFFF(+NaN)
    TEST_FP_INT_OP_S(fcvt.wu.s, 0xFFFFFFFF, 0x7FFFFFFF, rne)
    PRINT_IF_ERR(63, a0)
    # fcvt.wu.s 0xFF800000(-Inf)
    TEST_FP_INT_OP_S(fcvt.wu.s, 0x00000000, 0xFF800000, rne)
    PRINT_IF_ERR(64, a0)
    # fcvt.wu.s 0x7F800000(+Inf)
    TEST_FP_INT_OP_S(fcvt.wu.s, 0xFFFFFFFF, 0x7F800000, rne)
    PRINT_IF_ERR(65, a0)
EXIT:
    j EXIT