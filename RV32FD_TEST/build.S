.section .text.init;
.globl _start
_start:
    la sp, 2048
    call main
    