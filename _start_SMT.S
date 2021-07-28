.section .text.init;
.globl _start

_start:
  la sp, 65536  # スタックポインタ 変数格納できる場所確保
  call main
  
  li s0, 0xFFC01000
  li s1, 0x00114514
  sw s1, 0(s0)
EXIT:
  j EXIT  # jump to EXIT
  

#ifdef USE_EXTERN_IN_C
  .globl _pallc
_pallc: // 引数 a0 アドレス, 引数 a1 スレッドid
    li a2, 0
    // pallcが成功するまで繰り返し
LOOP0:
    pallc a2, a0, a1
    beqz a2, LOOP0
    /*
    // fwdが成功するまで繰り返し
    // fwd rd, rs1, rs2では，rs1が転送先LTN，rs2が転送したいレジスタ
    // 従って，fwd a2, a1, sp
LOOP1:
    fwd a2, a1, sp
    // fwd a2, a0, sp
    beqz a2, LOOP1
LOOP2:
    fwd a2, a1, s0
    // fwd a2, a0, s0
    beqz a2, LOOP2
    mv a0, a2
    */
    ret

  .globl _publk
_publk: // 引数 a0 スレッドid
    li a2, 0
    publk a2, a0
    nop
    nop
    mv a0, a2
    ret

  .globl _pblk
_pblk: // 引数 a0 スレッドid
    li a2, 0
    pblk a2, a0
    nop
    nop
    mv a0, a2
    ret

  .globl _pdall
_pdall: // 引数 a0 スレッドid
  li a2, 0
  pdall a2, a0
  nop
  nop
#endif