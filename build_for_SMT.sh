#!/bin/bash

/home/hidetaro/docker_volume/semp/opt/riscv32/bin/riscv32-unknown-elf-gcc -c -o smt_test.o $1
#/home/hidetaro/docker_volume/semp/opt/riscv32/bin/riscv32-unknown-elf-gcc -S -o smt_test.S $1
/home/hidetaro/docker_volume/semp/opt/riscv32/bin/riscv32-unknown-elf-ld -m elf32lriscv smt_test.o _start_SMT.o -L/home/hidetaro/docker_volume/semp/opt/riscv/riscv32-unknown-elf/lib -T link.ld -nostartfiles -static -o smt_test.elf
/home/hidetaro/docker_volume/semp/opt/riscv32/bin/riscv32-unknown-elf-objcopy -O binary smt_test.elf smt_test.bin
hexdump -v -e '1/4 "%08x" "\n"' smt_test.bin > smt_test.hex
/home/hidetaro/docker_volume/semp/opt/riscv32/bin/riscv32-unknown-elf-objdump -d smt_test.elf > smt_machine.txt
