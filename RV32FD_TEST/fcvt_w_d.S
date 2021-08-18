#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # fcvt.w.d -1.1, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, -1, 0xBFF19999, 0x9999999A, rtz)
    PRINT_IF_ERR(2, a0)
    # fcvt.w.d -1.0, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, -1, 0xBFF00000, 0x00000000, rtz)
    PRINT_IF_ERR(3, a0)
    # fcvt.w.d -0.9, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, 0, 0xBFECCCCC, 0xCCCCCCCD, rtz)
    PRINT_IF_ERR(4, a0)
    # fcvt.w.d 0.9, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, 0, 0x3FECCCCC, 0xCCCCCCCD, rtz)
    PRINT_IF_ERR(5, a0)
    # fcvt.w.d 1.0, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, 1, 0x3FF00000, 0x00000000, rtz)
    PRINT_IF_ERR(6, a0)
    # fcvt.w.d 1.1, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, 1, 0x3FF19999, 0x9999999A, rtz)
    PRINT_IF_ERR(7, a0)
    # fcvt.w.d -3e9, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, -1<<31, 0xC1E65A0B, 0xC0000000, rtz)
    PRINT_IF_ERR(8, a0)
    # fcvt.w.d 3e9, rtz
    TEST_FP_INT_OP_D(fcvt.w.d, (1<<31)-1, 0x41E65A0B, 0xC0000000, rtz)
    PRINT_IF_ERR(9, a0)

    # fcvt.wu.d -3.0, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 0, 0xC0080000, 0x00000000, rtz)
    PRINT_IF_ERR(12, a0)
    # fcvt.wu.d -1.0, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 0, 0xBFF00000, 0x00000000, rtz)
    PRINT_IF_ERR(13, a0)
    # fcvt.wu.d -0.9, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 0, 0xBFECCCCC, 0xCCCCCCCD, rtz)
    PRINT_IF_ERR(14, a0)
    # fcvt.wu.d 0.9, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 0, 0x3FECCCCC, 0xCCCCCCCD, rtz)
    PRINT_IF_ERR(15, a0)
    # fcvt.wu.d 1.0, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 1, 0x3FF00000, 0x00000000, rtz)
    PRINT_IF_ERR(16, a0)
    # fcvt.wu.d 1.1, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 1, 0x3FF19999, 0x9999999A, rtz)
    PRINT_IF_ERR(17, a0)
    # fcvt.wu.d -3e9, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 0, 0xC1E65A0B, 0xC0000000, rtz)
    PRINT_IF_ERR(18, a0)
    # fcvt.wu.d 3e9, rtz
    TEST_FP_INT_OP_D(fcvt.wu.d, 0xb2d05e00, 0x41E65A0B, 0xC0000000, rtz)
    PRINT_IF_ERR(19, a0)

    # fcvt.w.d 0xFFFFFFFFFFFFFFFF(-NaN)
    TEST_FP_INT_OP_D(fcvt.w.d, 0x7FFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, rne)
    PRINT_IF_ERR(42, a0)
    # fcvt.w.d 0xFFF0000000000000(-Inf)
    TEST_FP_INT_OP_D(fcvt.w.d, 0x80000000, 0xFFF00000, 0x00000000, rne)
    PRINT_IF_ERR(44, a0)
    # fcvt.w.d 0x7FFFFFFFFFFFFFFF(+NaN)
    TEST_FP_INT_OP_D(fcvt.w.d, 0x7FFFFFFF, 0x7FFFFFFF, 0xFFFFFFFF, rne)
    PRINT_IF_ERR(52, a0)
    # fcvt.w.d 0x7FF0000000000000(+Inf)
    TEST_FP_INT_OP_D(fcvt.w.d, 0x7FFFFFFF, 0x7FF00000, 0x00000000, rne)
    PRINT_IF_ERR(54, a0)

    # fcvt.wu.d 0xFFFFFFFFFFFFFFFF(-NaN)
    TEST_FP_INT_OP_D(fcvt.wu.d, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, rne)
    PRINT_IF_ERR(62, a0)
    # fcvt.wu.d 0x7FFFFFFFFFFFFFFF(+NaN)
    TEST_FP_INT_OP_D(fcvt.wu.d, 0xFFFFFFFF, 0x7FFFFFFF, 0xFFFFFFFF, rne)
    PRINT_IF_ERR(63, a0)
    # fcvt.wu.d 0xFFF0000000000000(-Inf)
    TEST_FP_INT_OP_D(fcvt.wu.d, 0x00000000, 0xFFF00000, 0x00000000, rne)
    PRINT_IF_ERR(64, a0)
    # fcvt.wu.d 0x7FF0000000000000(+Inf)
    TEST_FP_INT_OP_D(fcvt.wu.d, 0xFFFFFFFF, 0x7FF00000, 0x00000000, rne)
    PRINT_IF_ERR(65, a0)
EXIT:
    j EXIT