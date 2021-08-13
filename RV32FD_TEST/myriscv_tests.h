// a0 = !(inst(rs1, rs2) == rd);
// inst: (Float, Float) -> Float
// 正しければa0=0, 間違っていればa0=1
// feqではNaNとNaNの比較が同じデータでも偽になるので
#define TEST_FP_OP2_S( inst, rd, rs1, rs2 ) \
    li t0, rs1; \
    li t1, rs2; \
    li t2, rd; \
    fmv.w.x ft0, t0; \
    fmv.w.x ft1, t1; \
    inst ft2, ft0, ft1; \
    fmv.x.w t3, ft2; \
    xor a0, t2, t3; \
    snez a0, a0;

// a0 = !(fclass_s(rs1) == rd);
// inst: Float -> Int
#define TEST_FCLASS_S(rd, rs1) \
    li t0, rs1; \
    li t1, rd; \
    fmv.w.x ft0, t0; \
    fclass.s t2, ft0; \
    xor a0, t1, t2; \
    snez a0, a0;

// a0 = !(fcmp_inst(rs1, rs2) == rd);
// inst: (Float, Float) -> Int
#define TEST_FP_CMP_OP_S(fcmp_inst, rd, rs1, rs2) \
    li t0, rs1; \
    li t1, rs2; \
    li t2, rd; \
    fmv.w.x ft0, t0; \
    fmv.w.x ft1, t1; \
    fcmp_inst t3, ft0, ft1; \
    xor a0, t2, t3; \
    snez a0, a0;

// a0 = !(inst(rs1) == rd);
// inst: Int -> Float
#define TEST_INT_FP_OP_S(inst, rd, rs1) \
    li t0, rs1; \
    li t1, rd; \
    inst ft0, t0; \
    fmv.x.w t2, ft0; \
    xor a0, t1, t2; \
    snez a0, a0;

// a0 = !(inst(rs1, roundmode) == rd);
// inst: (Float, roundmode) -> Int
#define TEST_FP_INT_OP_S(inst, rd, rs1, roundmode) \
    li t0, rs1; \
    li t1, rd; \
    fmv.w.x ft0, t0; \
    inst t2, ft0, roundmode; \
    xor a0, t1, t2; \
    snez a0, a0;

// a0 = !(inst(rs1) == rd);
// inst: Float -> Float
#define TEST_FP_OP1_S(inst, rd, rs1) \
    li t0, rs1; \
    li t1, rd; \
    fmv.w.x ft0, t0; \
    inst ft1, ft0; \
    fmv.x.w t2, ft1; \
    xor a0, t1, t2; \
    snez a0, a0;

// a0 = !(inst(rs1, rs2, rs3) == rd);
// inst: (Float, Float, Float) -> Float
#define TEST_FP_OP3_S(inst, rd, rs1, rs2, rs3) \
    li t0, rs1; \
    li t1, rs2; \
    li t2, rs3; \
    li t3, rd; \
    fmv.w.x ft0, t0; \
    fmv.w.x ft1, t1; \
    fmv.w.x ft2, t2; \
    inst ft3, ft0, ft1, ft2; \
    fmv.x.w t4, ft3; \
    xor a0, t3, t4; \
    snez a0, a0;

// print(res * val)
#define PRINT_IF_ERR( val, res ) \
    li t0, val; \
    mul t2, t0, res; \
    li t3, 0xFFC01000; \
    sw t2, 0(t3);
