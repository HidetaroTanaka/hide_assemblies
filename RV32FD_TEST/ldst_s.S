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
    mv a1, sp
    addi a1, a1, -28
    flw f1, 4(a1)
    fsw f1, 20(a1)
    lw a0, 20(a1)
    li t1, 0x40000000
    xor a0, a0, t1
    snez a0, a0
    PRINT_IF_ERR(2, a0)
    flw f1, 0(a1)
    fsw f1, 24(a1)
    lw a0, 24(a1)
    li t1, 0xBF800000
    xor a0, a0, t1
    snez a0, a0
    PRINT_IF_ERR(3, a0)
EXIT:
    j EXIT
