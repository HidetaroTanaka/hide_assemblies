#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    // fcvt.d.w 2
    TEST_INT_FP_OP_D(fcvt.d.w, 0x40000000, 0x00000000, 2)
    PRINT_IF_ERR(2, a0)
    // fcvt.d.w -2
    TEST_INT_FP_OP_D(fcvt.d.w, 0xC0000000, 0x00000000, -2)
    PRINT_IF_ERR(3, a0)

    // fcvt.d.wu 2
    TEST_INT_FP_OP_D(fcvt.d.wu, 0x40000000, 0x00000000, 2)
    PRINT_IF_ERR(4, a0)
    // fcvt.d.wu 4294967294
    TEST_INT_FP_OP_D(fcvt.d.wu, 0x41EFFFFF, 0xFFC00000, -2)
    PRINT_IF_ERR(5, a0)

    // fcvt.s.d -1.5
    TEST_FCVT_S_D(0xBFC00000, 0xBFF80000, 0x00000000)
    PRINT_IF_ERR(10, a0)
    // fcvt.d.s -1.5
    TEST_FCVT_D_S(0xBFF80000, 0x00000000, 0xBFC00000)
    PRINT_IF_ERR(11, a0)

    // fcvt.d.s( fcvt.s.d( 0x7ffcffffffff8004 ) )
    li t0, 0x7FFCFFFF
    li t1, 0xFFFF8004
    li t2, 0x7FF80000
    li t3, 0x00000000
    addi t4, sp, -8
    sw t1, 0(t4)
    sw t0, 4(t4)
    fld ft0, 0(t4)
    fcvt.s.d ft1, ft0
    fcvt.d.s ft1, ft1
    fsd ft1, 0(t4)
    lw t5, 4(t4)
    lw t6, 0(t4)
    xor a0, t2, t5
    snez a0, a0
    xor a1, t3, t6
    snez a1, a1
    or a0, a0, a1
    PRINT_IF_ERR(12, a0)

EXIT:
    j EXIT