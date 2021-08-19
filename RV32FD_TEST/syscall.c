// D拡張を実装しているか？
#define _HAS_D_EXTENSION

// ecallと独自命令による入出力を使うか否か
// #define USE_OLD_IO

// ecallによる独自処理を使用するか否か
// #define USE_ECALL

// 待機処理あり？
// #define USE_LOOP_DELAY

#ifdef USE_ECALL
void signalOn() {
    volatile register unsigned int _systemNum asm ("a0") = 1;
    asm volatile("ecall");
}
void signalOff() {
    volatile register unsigned int _systemNum asm ("a0") = 2;
    asm volatile("ecall");
}
void timerStart() {
    volatile register unsigned int _systemNum asm ("a0") = 3;
    asm volatile("ecall");
}
void timerStop() {
    volatile register unsigned int _systemNum asm ("a0") = 4;
    asm volatile("ecall");
}
void timerPrint() {
    volatile register unsigned int _systemNum asm ("a0") = 5;
    asm volatile("ecall");
}
#ifdef USE_OLD_IO
// WIP: 32bit整数を出力するときに符号拡張どうしようか
// 今は32bit浮動小数点の出力を考えて零拡張にする
void valuePrint(unsigned int num) {
    volatile register unsigned int _systemNum asm ("a0") = 6;
    volatile register unsigned int _systemRead asm ("a1") = num;
    asm volatile("ecall");
}
void float32Print(float val) {
    volatile register float ft0 asm ("ft0");
    ft0 = val;
    volatile register unsigned int _systemNum asm ("a0") = 6;
    volatile register unsigned int _systemRead asm ("a1");
    asm volatile(
        "fmv.x.w a1, ft0;"
        "ecall;"
    );
    return;
}
#endif
#endif
void valuePrint_uint32(unsigned int val) {
    volatile register unsigned int *ptr = (unsigned int*)0xFFC01000;
    *ptr = val;
    return;
}
void valuePrint_int32(signed int val) {
    volatile register signed int *ptr = (signed int*)0xFFC01000;
    *ptr = val;
    return;
}
void valuePrint_float32(float val) {
    volatile register float *ptr = (float*)0xFFC01000;
    *ptr = val;
    return;
}
#ifdef _HAS_D_EXTENSION
void valuePrint_float64(double val) {
    volatile register double *ptr = (double*)0xFFC01000;
    *ptr = val;
    return;
}
#endif
#ifdef USE_ECALL
void instCallCountReset() {
    volatile register unsigned int _systemNum asm ("a0") = 7;
    asm volatile("ecall");
}
void instCallCountStop() {
    volatile register unsigned int _systemNum asm ("a0") = 8;
    asm volatile("ecall");
}
#ifdef USE_OLD_IO
// WIP, 64bit浮動小数点の出力
#ifdef _HAS_D_EXTENSION
void float64Print(double num) {
    volatile register unsigned int _systemNum asm ("a0") = 9;
    volatile register double _printVal asm ("fa0") = num;
    asm volatile("ecall");
}
#endif
#endif
#endif

unsigned int switchRead_uint32(void) {
    volatile register unsigned int *ptr = (unsigned int*)0xFFC02000;
    return *ptr;
}
signed int switchRead_int32(void) {
    volatile register signed int *ptr = (signed int*)0xFFC02000;
    return *ptr;
}
float switchRead_float32(void) {
    volatile register float *ptr = (float*)0xFFC02000;
    return *ptr;
}
#ifdef _HAS_D_EXTENSION
double switchRead_float64(void) {
    volatile register double *ptr = (double*)0xFFC02000;
    return *ptr;
}
#endif
#ifdef USE_OLD_IO
unsigned int instCallCountRead() {
    volatile register unsigned int _systemNum asm ("a0") = 0;
    asm volatile(".insn u 0x2B, %0, 0x0":"=r" (_systemNum));
    return _systemNum;
}
#endif

#ifdef USE_LOOP_DELAY
void loopDelay(unsigned int cnt) {
    volatile register unsigned int _systemNum asm ("a0") = cnt;
    asm volatile(
        "addi t0, x0, 0;"
        "loop:"
        "addi t0, t0, 1;"
        "bne t0, a0, loop;"
    );
}
#endif