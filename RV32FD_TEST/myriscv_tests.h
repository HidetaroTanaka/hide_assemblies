// #define SUPPORT_RV64

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

#ifdef SUPPORT_RV64
// TODO: RV64用のマクロを追加
#else
// a0 = !(inst(rs1, rs2) == rd);
// inst: (Double, Double) -> Double
#define TEST_FP_OP2_D(inst, rd_up, rd_down, rs1_up, rs1_down, rs2_up, rs2_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rs2_up; \
    li t3, rs2_down; \
    li a0, rd_up; \
    li a1, rd_down; \
    addi t6, sp, -16; \
    sw t3, 0(t6); \
    sw t2, 4(t6); \
    sw t1, 8(t6); \
    sw t0, 12(t6); \
    fld ft0, 8(t6); \
    fld ft1, 0(t6); \
    inst ft2, ft0, ft1; \
    fsd ft2, 0(t6); \
    lw t4, 4(t6); \
    lw t5, 0(t6); \
    xor a0, a0, t4; \
    snez a0, a0; \
    xor a1, a1, t5; \
    snez a1, a1; \
    or a0, a0, a1;

// a0 = !(fclass_d(rs1) == rd);
// inst: Double -> Int
#define TEST_FCLASS_D(rd, rs1_up, rs1_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rd; \
    addi t3, sp, -8; \
    sw t1, 0(t3); \
    sw t0, 4(t3); \
    fld ft0, 0(t3); \
    fclass.d t4, ft0; \
    xor a0, t4, t2; \
    snez a0, a0;

// a0 = !(fcmp_inst(rs1, rs2) == rd);
// inst: (Double, Double) -> Int
#define TEST_FP_CMP_OP_D(fcmp_inst, rd, rs1_up, rs1_down, rs2_up, rs2_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rs2_up; \
    li t3, rs2_down; \
    li t4, rd; \
    addi t5, sp, -16; \
    sw t3, 0(t5); \
    sw t2, 4(t5); \
    sw t1, 8(t5); \
    sw t0, 12(t5); \
    fld ft0, 8(t5); \
    fld ft1, 0(t5); \
    fcmp_inst t6, ft0, ft1; \
    xor a0, t4, t6; \
    snez a0, a0;

// a0 = !(inst(rs1) == rd);
// inst: Int -> Double
#define TEST_INT_FP_OP_D(inst, rd_up, rd_down, rs1) \
    li t0, rs1; \
    li t1, rd_up; \
    li t2, rd_down; \
    inst ft1, t0; \
    addi t3, sp, -8; \
    fsd ft1, 0(t3); \
    lw t4, 4(t3); \
    lw t5, 0(t3); \
    xor a0, t1, t4; \
    snez a0, a0; \
    xor a1, t2, t5; \
    snez a1, a1; \
    or a0, a0, a1;

// a0 = !(fcvt_s_d(rs1) == rd);
// inst: Double -> Float
#define TEST_FCVT_S_D(rd, rs1_up, rs1_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rd; \
    addi t3, sp, -8; \
    sw t1, 0(t3); \
    sw t0, 4(t3); \
    fld ft0, 0(t3); \
    fcvt.s.d ft1, ft0; \
    fmv.x.w t4, ft1; \
    xor a0, t2, t4; \
    snez a0, a0;

// a0 = !(fcvt_d_s(rs1) == rd);
// inst: Float -> Double
#define TEST_FCVT_D_S(rd_up, rd_down, rs1) \
    li t0, rs1; \
    li t1, rd_up; \
    li t2, rd_down; \
    fmv.w.x ft0, t0; \
    fcvt.d.s ft1, ft0; \
    addi t3, sp, -8; \
    fsd ft1, 0(t3); \
    lw t4, 4(t3); \
    lw t5, 0(t3); \
    xor a0, t1, t4; \
    snez a0, a0; \
    xor a1, t2, t5; \
    snez a1, a1; \
    or a0, a0, a1;

// a0 = !(inst(rs1, roundmode) == rd);
// inst: (Double, roundmode) -> Int
#define TEST_FP_INT_OP_D(inst, rd, rs1_up, rs1_down, roundmode) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rd; \
    addi t3, sp, -8; \
    sw t1, 0(t3); \
    sw t0, 4(t3); \
    fld ft0, 0(t3); \
    inst t4, ft0, roundmode; \
    xor a0, t2, t4; \
    snez a0, a0;

// a0 = !(inst(rs1) == rd);
// inst: Double -> Double
#define TEST_FP_OP1_D(inst, rd_up, rd_down, rs1_up, rs1_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rd_up; \
    li t3, rd_down; \
    addi t4, sp, -8; \
    sw t1, 0(t4); \
    sw t0, 4(t4); \
    fld ft0, 0(t4); \
    inst ft1, ft0; \
    fsd ft1, 0(t4); \
    lw t5, 4(t4); \
    lw t6, 0(t4); \
    xor a0, t2, t5; \
    snez a0, a0; \
    xor a1, t3, t6; \
    snez a1, a1; \
    or a0, a0, a1;

// a0 = !(inst(rs1, rs2, rs3) == rd);
// inst: (Double, Double, Double) -> Double
#define TEST_FP_OP3_D(inst, rd_up, rd_down, rs1_up, rs1_down, rs2_up, rs2_down, rs3_up, rs3_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rs2_up; \
    li t3, rs2_down; \
    li t4, rs3_up; \
    li t5, rs3_down; \
    addi t6, sp, -24; \
    sw t5, 0(t6); \
    sw t4, 4(t6); \
    sw t3, 8(t6); \
    sw t2, 12(t6); \
    sw t1, 16(t6); \
    sw t0, 20(t6); \
    fld ft0, 16(t6); \
    fld ft1, 8(t6); \
    fld ft2, 0(t6); \
    inst ft3, ft0, ft1, ft2; \
    fsd ft3, 0(t6); \
    li t0, rd_up; \
    li t1, rd_down; \
    lw t2, 4(t6); \
    lw t3, 0(t6); \
    xor a0, t0, t2; \
    snez a0, a0; \
    xor a1, t1, t3; \
    snez a1, a1; \
    or a0, a0, a1;

#define TEST_FSGNJS(rd_down, rs1_up, rs1_down, rs2_up, rs2_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rs2_up; \
    li t3, rs2_down; \
    li t5, rd_down; \
    addi t6, sp, -16; \
    sw t3, 0(t6); \
    sw t2, 4(t6); \
    sw t1, 8(t6); \
    sw t0, 12(t6); \
    fld ft0, 8(t6); \
    fld ft1, 0(t6); \
    fsgnj.s ft2, ft0, ft1; \
    fmv.x.s a0, ft2; \
    xor a0, a0, t5; \
    snez a0, a0;

#define TEST_FSGNJD_SP(rd_down, rs1_up, rs1_down, rs2_up, rs2_down) \
    li t0, rs1_up; \
    li t1, rs1_down; \
    li t2, rs2_up; \
    li t3, rs2_down; \
    li t5, rd_down; \
    addi t6, sp, -16; \
    sw t3, 0(t6); \
    sw t2, 4(t6); \
    sw t1, 8(t6); \
    sw t0, 12(t6); \
    fld ft0, 8(t6); \
    fld ft1, 0(t6); \
    fsgnj.d ft2, ft0, ft1; \
    fmv.x.s a0, ft2; \
    xor a0, a0, t5; \
    snez a0, a0;
    
#endif

// print(res * val)
#define PRINT_IF_ERR( val, res ) \
    li t0, val; \
    mul t2, t0, res; \
    li t3, 0xFFC01000; \
    sw t2, 0(t3);
