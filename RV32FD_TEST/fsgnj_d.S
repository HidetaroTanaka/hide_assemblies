#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // fsgnj.d 0x123456789ABCDEF0, 0x0000000000000000
    TEST_FP_OP2_D(fsgnj.d, 0x12345678, 0x9ABCDEF0, 0x12345678, 0x9ABCDEF0, 0x00000000, 0x00000000)
    PRINT_IF_ERR(10, a0)
    // fsgnj.d 0x123456789ABCDEF0, 0xFFFFFFFFFFFFFFFF
    TEST_FP_OP2_D(fsgnj.d, 0x92345678, 0x9ABCDEF0, 0x12345678, 0x9ABCDEF0, 0xFFFFFFFF, 0xFFFFFFFF)
    PRINT_IF_ERR(11, a0)
    // fsgnj.d 0x923456789ABCDEF0, 0x0000000000000000
    TEST_FP_OP2_D(fsgnj.d, 0x12345678, 0x9ABCDEF0, 0x92345678, 0x9ABCDEF0, 0x00000000, 0x00000000)
    PRINT_IF_ERR(12, a0)
    // fsgnj.d 0x923456789ABCDEF0, 0xFFFFFFFFFFFFFFFF
    TEST_FP_OP2_D(fsgnj.d, 0x92345678, 0x9ABCDEF0, 0x92345678, 0x9ABCDEF0, 0xFFFFFFFF, 0xFFFFFFFF)
    PRINT_IF_ERR(13, a0)

    // fsgnjn.d 0x123456789ABCDEF0, 0x0000000000000000
    TEST_FP_OP2_D(fsgnjn.d, 0x92345678, 0x9ABCDEF0, 0x12345678, 0x9ABCDEF0, 0x00000000, 0x00000000)
    PRINT_IF_ERR(20, a0)
    // fsgnjn.d 0x123456789ABCDEF0, 0xFFFFFFFFFFFFFFFF
    TEST_FP_OP2_D(fsgnjn.d, 0x12345678, 0x9ABCDEF0, 0x12345678, 0x9ABCDEF0, 0xFFFFFFFF, 0xFFFFFFFF)
    PRINT_IF_ERR(21, a0)
    // fsgnjn.d 0x923456789ABCDEF0, 0x0000000000000000
    TEST_FP_OP2_D(fsgnjn.d, 0x92345678, 0x9ABCDEF0, 0x92345678, 0x9ABCDEF0, 0x00000000, 0x00000000)
    PRINT_IF_ERR(22, a0)
    // fsgnjn.d 0x923456789ABCDEF0, 0xFFFFFFFFFFFFFFFF
    TEST_FP_OP2_D(fsgnjn.d, 0x12345678, 0x9ABCDEF0, 0x92345678, 0x9ABCDEF0, 0xFFFFFFFF, 0xFFFFFFFF)
    PRINT_IF_ERR(23, a0)

    // fsgnjx.d 0x123456789ABCDEF0, 0x0000000000000000
    TEST_FP_OP2_D(fsgnjx.d, 0x12345678, 0x9ABCDEF0, 0x12345678, 0x9ABCDEF0, 0x00000000, 0x00000000)
    PRINT_IF_ERR(30, a0)
    // fsgnjx.d 0x123456789ABCDEF0, 0xFFFFFFFFFFFFFFFF
    TEST_FP_OP2_D(fsgnjx.d, 0x92345678, 0x9ABCDEF0, 0x12345678, 0x9ABCDEF0, 0xFFFFFFFF, 0xFFFFFFFF)
    PRINT_IF_ERR(31, a0)
    // fsgnjx.d 0x923456789ABCDEF0, 0x0000000000000000
    TEST_FP_OP2_D(fsgnjx.d, 0x92345678, 0x9ABCDEF0, 0x92345678, 0x9ABCDEF0, 0x00000000, 0x00000000)
    PRINT_IF_ERR(32, a0)
    // fsgnjx.d 0x923456789ABCDEF0, 0xFFFFFFFFFFFFFFFF
    TEST_FP_OP2_D(fsgnjx.d, 0x12345678, 0x9ABCDEF0, 0x92345678, 0x9ABCDEF0, 0xFFFFFFFF, 0xFFFFFFFF)
    PRINT_IF_ERR(33, a0)

    // fsgnj.s 0x7ffffffe12345678, 0x0000000000000000
    TEST_FSGNJS(0x7FC00000, 0x7ffffffe, 0x12345678, 0x00000000, 0x00000000)
    PRINT_IF_ERR(40, a0)
    // fsgnj.s 0xfffffffe12345678, 0x0000000000000000
    TEST_FSGNJS(0x7FC00000, 0xfffffffe, 0x12345678, 0x00000000, 0x00000000)
    PRINT_IF_ERR(41, a0)
    // fsgnj.s 0x7fffffff12345678, 0x0000000000000000
    TEST_FSGNJS(0x7FC00000, 0x7fffffff, 0x12345678, 0x00000000, 0x00000000)
    PRINT_IF_ERR(42, a0)
    // fsgnj.s 0xffffffff12345678, 0x0000000000000000
    TEST_FSGNJS(0x12345678, 0xffffffff, 0x12345678, 0x00000000, 0x00000000)
    PRINT_IF_ERR(43, a0)

    // fsgnj.s 0x7ffffffe12345678, 0x0000000080000000
    TEST_FSGNJS(0x7FC00000, 0x7ffffffe, 0x12345678, 0x00000000, 0x80000000)
    PRINT_IF_ERR(50, a0)
    // fsgnj.s 0xfffffffe12345678, 0x0000000080000000
    TEST_FSGNJS(0x7FC00000, 0xfffffffe, 0x12345678, 0x00000000, 0x80000000)
    PRINT_IF_ERR(51, a0)
    // fsgnj.s 0x7fffffff12345678, 0x0000000080000000
    TEST_FSGNJS(0x7FC00000, 0x7fffffff, 0x12345678, 0x00000000, 0x80000000)
    PRINT_IF_ERR(52, a0)
    // fsgnj.s 0xffffffff12345678, 0x0000000000000000
    TEST_FSGNJS(0x12345678, 0xffffffff, 0x12345678, 0x00000000, 0x80000000)
    PRINT_IF_ERR(53, a0)

    // fsgnj.s 0x7ffffffe12345678, 0xFFFFFFFF80000000
    TEST_FSGNJS(0xFFC00000, 0x7ffffffe, 0x12345678, 0xffffffff, 0x80000000)
    PRINT_IF_ERR(60, a0)
    // fsgnj.s 0xfffffffe12345678, 0xFFFFFFFF80000000
    TEST_FSGNJS(0xFFC00000, 0xfffffffe, 0x12345678, 0xffffffff, 0x80000000)
    PRINT_IF_ERR(61, a0)
    // fsgnj.s 0xffffffff12345678, 0xFFFFFFFF80000000
    TEST_FSGNJS(0x92345678, 0xffffffff, 0x12345678, 0xffffffff, 0x80000000)
    PRINT_IF_ERR(62, a0)
    // fsgnj.s 0xffffffff12345678, 0x7FFFFFFF80000000
    TEST_FSGNJS(0x12345678, 0xffffffff, 0x12345678, 0x7fffffff, 0x80000000)
    PRINT_IF_ERR(63, a0)

    // fsgnj.d 0xffffffff11111111, 0xffffffff11111111
    // ft2 = 0xffffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0xffffffff, 0x11111111, 0xffffffff, 0x11111111)
    PRINT_IF_ERR(70, a0)
    // fsgnj.d 0xffffffff11111111, 0x7fffffff11111111
    // ft2 = 0x7fffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0xffffffff, 0x11111111, 0x7fffffff, 0x11111111)
    PRINT_IF_ERR(71, a0)
    // fsgnj.d 0xffffffff11111111, 0xffffffff91111111
    // ft2 = 0xffffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0xffffffff, 0x11111111, 0xffffffff, 0x91111111)
    PRINT_IF_ERR(72, a0)
    // fsgnj.d 0xffffffff11111111, 0x8000000000000000
    // ft2 = 0xffffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0xffffffff, 0x11111111, 0x80000000, 0x00000000)
    PRINT_IF_ERR(73, a0)
    // fsgnj.d 0x7fffffff11111111, 0xffffffff11111111
    // ft2 = 0xffffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0x7fffffff, 0x11111111, 0xffffffff, 0x11111111)
    PRINT_IF_ERR(74, a0)
    // fsgnj.d 0x7fffffff11111111, 0x7fffffff11111111
    // ft2 = 0x7fffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0x7fffffff, 0x11111111, 0x7fffffff, 0x11111111)
    PRINT_IF_ERR(75, a0)
    // fsgnj.d 0x7fffffff11111111, 0xffffffff91111111
    // ft2 = 0xffffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0x7fffffff, 0x11111111, 0xffffffff, 0x91111111)
    PRINT_IF_ERR(76, a0)
    // fsgnj.d 0x7fffffff11111111, 0x8000000000000000
    // ft2 = 0xffffffff11111111
    TEST_FSGNJD_SP(0x11111111, 0x7fffffff, 0x11111111, 0x80000000, 0x00000000)
    PRINT_IF_ERR(77, a0)

EXIT:
    j EXIT
