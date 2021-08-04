    .text
    .globl _data_a
    .section    .rodata
    .align 2
    .type _data_a, @object
    .size _data_a, 4
_data_a:
    .word   0
    .globl _data_b
    .section    .rodata
    .align 2
    .type _data_b, @object
    .size _data_b, 4
_data_b:
    .word   0
    .text
    .globl thread0
    .type thread0, @function
thread0:
    addi sp, sp, -4
    sw ra, 0(sp)
    mv t0, zero
    li t1, 25
_thread0_LOOP:
    addi t0, t0, 1
    blt t0, t1, _thread0_LOOP
    la t2, _data_a
    sw t0, 0(t2)
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
thread1:
    addi sp, sp, -4
    mv t0, zero
    li t1, 25
_thread1_LOOP:
    addi t0, t0, 1
    blt t0, t1, _thread1_LOOP
    la t2, _data_b
    sw t0, 0(t2)
    # restart thread0
    li t3, 0 # int success_publk = 0
    li t4, 0 # thread_id = 0
_success_publk_LOOP:
    publk t3, t4 # success_publk = _publk(0)
    nop
    nop
    beqz t3, _success_publk_LOOP # if(success_publk == 0) goto _success_publk_LOOP;
    # terminate thread1
    li t5, 0 # int success_pdall = 0
    li t4, 1 # thread_id = 1
_success_pdall_LOOP:
    pdall t5, t4 # success_pdall = _pdall(1)
    nop
    nop
    beqz t5, _success_pdall_LOOP # if(success_pdall == 0) goto _success_pdall_LOOP;
    // thread1 never reach here but anyway
    addi sp, sp, 4
    ret
    .globl main
    .type main, @function
main:
    addi sp, sp, -4
    sw ra, 0(sp)
    // allocate thread 1
    li s0, 1 # thread_id = 1
    la s1, thread1
    pallc s3, s1, s0 # s3 = _pallc(1, thread1)
    nop
    nop
    // unblock thread 1
    publk s4, s0 # s4 = _publk(1)
    // call thread0
    call thread0
    // block thread 0
    mv s0, zero # thread_id = 0
    pblk s5, s0 # s5 = _pblk(0)
    la s0, _data_a
    lw s1, 0(s0) # s1 = _data_a
    la s0, _data_b
    lw s2, 0(s0) # s2 = _data_b
    add s1, s1, s2 # s1 = _data_a + _data_b
    li s0, 0xFFC01000
    sw s1, 0(s0) # print(s1)
    lw ra, 0(sp)
    ret

