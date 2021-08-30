//#define USE_MULTI_THREAD

#ifdef USE_MULTI_THREAD
    .globl thread1
    .type thread1, @function
thread1:
    li s0, 0x114514
thread1_exit:
    j thread1_exit
#endif

    .globl main
    .type main, @function
main:
    addi sp, sp, -4
    sw ra, 0(sp)
#ifdef USE_MULTI_THREAD
    li s1, 1 # thread_id = 1
    la s0, thread1
    pallc s3, s0, s1 # s3 = _pallc(1, thread1)
    nop
    nop
    nop
    publk s4, s1 # s4 = _publk(1)
    nop
    nop
    nop
#endif
    li t0, 0
    li t1, 4
main_LOOP_start:
    beq t0, t1, main_LOOP_end
    addi t0, t0, 1
    j main_LOOP_start
main_LOOP_end:
    li t2, 0x114514
    lw ra, 0(sp)
    addi sp, sp, 4
    ret