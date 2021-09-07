#define USE_DEBUG_REG
	.text
	.globl	input_data
	.section	.rodata
	.align	2
	.type	input_data, @object
	.size	input_data, 80
input_data:
	.word	41
	.word	454
	.word	833
	.word	335
	.word	564
	.word	1
	.word	187
	.word	989
	.word	749
	.word	365
	.word	350
	.word	572
	.word	132
	.word	64
	.word	949
	.word	153
	.word	584
	.word	216
	.word	805
	.word	140
	.globl	verify_data
	.align	2
	.type	verify_data, @object
	.size	verify_data, 80
result_data:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
    .text
    .globl median
    .type median, @function
median:
    addi sp, sp, -4
    sw ra, 0(sp)
    nop
    nop
    #ifdef USE_DEBUG_REG
    li s11, 0 # debug
    #endif
    li t0, 0 # int a = 0;
    li t1, 0 # int b = 0;
    li t2, 0 # int c = 0;
    li t3, 1 # int i = 1;
    la t4, input_data # int in_ptr* = input_data;
    la t5, result_data # int *out_ptr = result_data;
    li t6, 19
    sw zero, 0(t5) # *out_ptr = 0;
    # i = 1 to 18
    # result_data[i]への書込を行う．
median_LOOP:
    bge t3, t6, median_EXIT_LOOP # if(i >= 19) goto median_EXIT_LOOP;
    addi t4, t4, 4 # in_ptr++;
    addi t5, t5, 4 # out_ptr++;
    lw t0, -4(t4) # a = *(in_ptr-1);
    lw t1, 0(t4) # b = *in_ptr;
    lw t2, 4(t4) # c = *(in_ptr+1);
    bge t0, t1, median_A_ge_B # if(a >= b) goto median_A_ge_B;
    bge t1, t2, median_B_ge_C_0 # if(b >= c) goto median_B_ge_C_0;
    sw t1, 0(t5) # *out_ptr = b;
    #ifdef USE_DEBUG_REG
    mv s11, t1 # debug
    #endif
    j median_LOOP_cont
median_B_ge_C_0:
    bge t2, t0, median_C_ge_A_0 # if(c >= a) goto median_C_ge_A;
    sw t0, 0(t5) # *out_ptr = a;
    #ifdef USE_DEBUG_REG
    mv s11, t0 # debug
    #endif
    j median_LOOP_cont
median_C_ge_A_0:
    sw t2, 0(t5) # *out_ptr = c;
    #ifdef USE_DEBUG_REG
    mv s11, t2 # debug
    #endif
    j median_LOOP_cont
median_A_ge_B:
    bge t0, t2, median_A_ge_C_1 # if(a >= c) goto median_A_ge_C_1;
    sw t0, 0(t5) # *out_ptr = a;
    #ifdef USE_DEBUG_REG
    mv s11, t0 # debug
    #endif
    j median_LOOP_cont
median_A_ge_C_1:
    bge t2, t1, median_C_ge_B_1 # if(c >= b) goto median_C_ge_B_1;
    sw t1, 0(t5) # *out_ptr = b;
    #ifdef USE_DEBUG_REG
    mv s11, t1 # debug
    #endif
    j median_LOOP_cont
median_C_ge_B_1:
    sw t2, 0(t5) # *out_ptr = c;
    #ifdef USE_DEBUG_REG
    mv s11, t2 # debug
    #endif
    j median_LOOP_cont
median_LOOP_cont:
    addi t3, t3, 1 # i++;
    j median_LOOP # goto median_LOOP;
median_EXIT_LOOP:
    addi t5, t5, 4
    sw zero, 0(t5)
    #ifdef USE_DEBUG_REG
    mv s11, zero
    #endif
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

.globl main
.type main, @function
main:
    addi sp, sp, -4
    sw ra, 0(sp)
    call median
    li t0, 0 # unsigned int i = 0;
    li t1, 20 # unsigned int n = 20;
    la t2, result_data # unsigned int* ptr = result_data;
    li t3, 0xFFC01000
main_LOOP:
    bge t0, t1, main_EXIT_LOOP # if(i >= n) goto main_EXIT_LOOP;
    lw t4, 0(t2) # unsigned dat = *ptr;
    sw t0, 0(t3) # print(i);
    sw t4, 0(t3) # print(dat);
    addi t0, t0, 1 # i++;
    addi t2, t2, 4 # ptr++;
    j main_LOOP
main_EXIT_LOOP:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret