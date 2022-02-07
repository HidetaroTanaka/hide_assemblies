# hide_toybox
とりあえずいろんなものをここに入れてる

# アセンブリ言語・C言語ビルド方法（SMTプロセッサ）
スレッド制御命令を使用する場合，まずSMTプロセッサ対応gccコンパイラを入手する必要がある．https://github.com/a163236/riscv-gnu-toolchain で入手可能だが，https://hub.docker.com/r/a163236/semp_riscv_toolchain のDockerを用いればすぐに使うことができる．

事前に`_start_SMT.S`を次のコマンドでオブジェクトファイル？に変換する．ちなみにこれの`_start`ラベルがメモリの0番地に格納され，プロセッサはここからプログラム実行を開始する．
```
$ /home/hidetaro/docker_volume/semp/opt/riscv32/bin/riscv32-unknown-elf-gcc -c -o _start_SMT.o _start_SMT.S
```
ビルドしたいファイル（例：`median_main.c`）を次のようにしてやれば機械語のhexファイルが`smt_test.hex`に，逆アセンブル結果が`smt_machine.txt`に出力される．
```
$ ./build_for_SMT.sh median_main.c
```
C言語ファイルをビルドする場合，`build_for_SMT.sh`スクリプトのコメントアウトしてるところを有効にすると`smt_test.S`にC言語からアセンブリ言語へのコンパイル結果が出力される．

# アセンブリ言語・C言語ビルド方法（D拡張プロセッサ）
こちらは通常（少なくともD拡張対応）のriscv用gccがあれば良い．V拡張の追加を予定しているのでhttps://github.com/a163236/rvv_toolchain から入手することをおすすめする．

上記と同様に，事前に`build.S`をオブジェクトファイルに変換する．
```
$ riscv64-unknown-elf-gcc -march=rv32imfd -mabi=ilp32  -c -o build.o build.S
```
次にビルドしたいファイルを次のようにしてやれば機械語のhexファイルは`test.hex`に，逆アセンブル結果は`machine.txt`に，Chiselの`instMem.scala`にコピペできるやつは`memory.txt`に出力される．
```
$ ./buildall.sh tribonacci.c
```

浮動小数点テストのファイルはriscv-testsのベンチマークを参考に作成しています．

# HAVE_FUN_WITH_MICROBLAZE
MicroBlazeでいろいろやる用

# CHISEL_BlackBoxInlineRTL
ChiselのBlackBoxInlineを使ったテストのやり方．次のようにVerilatorBackendAnnotationとかいうのを付ければ良い

```scala
test(new BlackBoxInlineRTL).withAnnotations(Seq(VerilatorBackendAnnotation)) { c =>
```

# 参考資料(Reference)

https://github.com/riscv/riscv-tests

https://www.tech-diningyo.info/entry/2021/12/20/0630
