#include "myriscv_tests.h"

    .text
    .globl main
    .type main, @function
main:
    li t0, 0x1337d00d
    sw t0, 0(sp)
    li t0, 0xabad1dea
    sw t0, -4(sp)
    li t0, 0xcafebabe
    sw t0, -8(sp)
    li t0, 0xdeadbeef
    sw t0, -12(sp)
    li t0, 0xc0800000
    sw t0, -16(sp)
    li t0, 0x40400000
    sw t0, -20(sp)
    li t0, 0x40000000
    sw t0, -24(sp)
    li t0, 0xbf800000
    sw t0, -28(sp)
    mv s0, sp
    addi s0, s0, -28

    fld f2, 0(s0)
    fsd f2, 16(s0)
    lw a0, 20(s0)
    lw a1, 16(s0)
    li t0, 0x40000000
    li t1, 0xBF800000
    xor a0, a0, t0
    snez a0, a0
    xor a1, a1, t1
    snez a1, a1
    or a0, a0, a1
    PRINT_IF_ERR(2, a0)

    fld f2, 0(s0)
    fsw f2, 16(s0)
    lw a0, 20(s0)
    lw a1, 16(s0)
    li t0, 0x40000000
    li t1, 0xBF800000
    xor a0, a0, t0
    snez a0, a0
    xor a1, a1, t1
    snez a1, a1
    or a0, a0, a1
    PRINT_IF_ERR(3, a0)

    flw f2, 0(s0)
    fsw f2, 16(s0)
    lw a0, 20(s0)
    lw a1, 16(s0)
    li t0, 0x40000000
    li t1, 0xBF800000
    xor a0, a0, t0
    snez a0, a0
    xor a1, a1, t1
    snez a1, a1
    or a0, a0, a1
    PRINT_IF_ERR(4, a0)

    fld f2, 8(s0)
    fsd f2, 16(s0)
    lw a0, 20(s0)
    lw a1, 16(s0)
    li t0, 0xC0800000
    li t1, 0x40400000
    xor a0, a0, t0
    snez a0, a0
    xor a1, a1, t1
    snez a1, a1
    or a0, a0, a1
    PRINT_IF_ERR(5, a0)

    flw f2, 8(s0)
    fsd f2, 16(s0)
    lw a0, 20(s0)
    lw a1, 16(s0)
    li t0, 0xFFFFFFFF
    li t1, 0x40400000
    xor a0, a0, t0
    snez a0, a0
    xor a1, a1, t1
    snez a1, a1
    or a0, a0, a1
    PRINT_IF_ERR(6, a0)
    
EXIT:
    j EXIT
