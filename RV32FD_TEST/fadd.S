// a0 = (inst(rs1, rs2) == rd);
#define TEST_FP_OP2_S( inst, rd, rs1, rs2 ) \
    li t0, rs1; \
    li t1, rs2; \
    li t2, rd; \
    fmv.w.x ft0, t0; \
    fmv.w.x ft1, t1; \
    fmv.w.x ft2, t2; \
    inst ft3, ft0, ft1; \
    feq.s a0, ft2, ft3;

// if(res) print(0); else print(val);
#define PRINT_IF_ERR( val, res ) \
    li t0, val; \
    xori t1, res, 0x1; \
    mul t2, t0, t1; \
    li t3, 0xFFC01000; \
    sw t2, 0(t3);

    .text
    .globl main
    .type main, @function
main:
    // 3.5f = 2.5f + 1.0f
    TEST_FP_OP2_S(fadd.s, 0x40600000, 0x40200000, 0x3F800000)
    PRINT_IF_ERR(2, a0)
EXIT:
    j EXIT