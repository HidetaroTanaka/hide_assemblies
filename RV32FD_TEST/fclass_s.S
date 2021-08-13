#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    TEST_FCLASS_S(1<<0, 0xFF800000)
    PRINT_IF_ERR(2, a0)

    TEST_FCLASS_S(1<<1, 0xBF800000)
    PRINT_IF_ERR(3, a0)

    TEST_FCLASS_S(1<<2, 0x807FFFFF)
    PRINT_IF_ERR(4, a0)

    TEST_FCLASS_S(1<<3, 0x80000000)
    PRINT_IF_ERR(5, a0)

    TEST_FCLASS_S(1<<4, 0x00000000)
    PRINT_IF_ERR(6, a0)

    TEST_FCLASS_S(1<<5, 0x007FFFFF)
    PRINT_IF_ERR(7, a0)

    TEST_FCLASS_S(1<<6, 0x3F800000)
    PRINT_IF_ERR(8, a0)
    
    TEST_FCLASS_S(1<<7, 0x7f800000)
    PRINT_IF_ERR(9, a0)

    TEST_FCLASS_S(1<<8, 0x7F800001)
    PRINT_IF_ERR(10, a0)

    TEST_FCLASS_S(1<<9, 0x7FC00000)
    PRINT_IF_ERR(11, a0)

EXIT:
    j EXIT