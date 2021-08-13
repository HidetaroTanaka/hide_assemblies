#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    # fmadd.s 1.0f, 2.5f, 1.0f
    TEST_FP_OP3_S(fmadd.s, 0x40600000, 0x3F800000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(2, a0)
    # fmadd.s -1.0f, -1235.1f, 1.1f
    TEST_FP_OP3_S(fmadd.s, 0x449A8666, 0xBF800000, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(3, a0)
    # fmadd.s 2.0f, -5.0f, -2.0f
    TEST_FP_OP3_S(fmadd.s, 0xC1400000, 0x40000000, 0xC0A00000, 0xC0000000)
    PRINT_IF_ERR(4, a0)

    # fnmadd.s 1.0f, 2.5f, 1.0f
    TEST_FP_OP3_S(fnmadd.s, 0xC0600000, 0x3F800000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(5, a0)
    # fnmadd.s -1.0f, -1235.1f, 1.1f
    TEST_FP_OP3_S(fnmadd.s, 0xC49A8666, 0xBF800000, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(6, a0)
    # fnmadd.s 2.0f, -5.0f, -2.0f
    TEST_FP_OP3_S(fnmadd.s, 0x41400000, 0x40000000, 0xC0A00000, 0xC0000000)
    PRINT_IF_ERR(7, a0)

    # fmsub.s 1.0f, 2.5f, 1.0f
    TEST_FP_OP3_S(fmsub.s, 0x3FC00000, 0x3F800000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(8, a0)
    # fmsub.s -1.0f, -1235.1f, 1.1f
    TEST_FP_OP3_S(fmsub.s, 0x449A4000, 0xBF800000, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(9, a0)
    # fmsub.s 2.0f, -5.0f, -2.0f
    TEST_FP_OP3_S(fmsub.s, 0xC1000000, 0x40000000, 0xC0A00000, 0xC0000000)
    PRINT_IF_ERR(10, a0)

    # fnmsub.s 1.0f, 2.5f, 1.0f
    TEST_FP_OP3_S(fnmsub.s, 0xBFC00000, 0x3F800000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(11, a0)
    # fnmsub.s -1.0f, -1235.1f, 1.1f
    TEST_FP_OP3_S(fnmsub.s, 0xC49A4000, 0xBF800000, 0xC49A6333, 0x3F8CCCCD)
    PRINT_IF_ERR(12, a0)
    # fnmsub.s 2.0f, -5.0f, -2.0f
    TEST_FP_OP3_S(fnmsub.s, 0x41000000, 0x40000000, 0xC0A00000, 0xC0000000)
    PRINT_IF_ERR(13, a0)
EXIT:
    j EXIT