#!/bin/bash

riscv64-unknown-elf-gcc -march=rv32imfd -mabi=ilp32  -c -o test.o $1
# riscv64-unknown-elf-gcc -march=rv32imfd -mabi=ilp32  -S -o test.S $1
riscv64-unknown-elf-ld -march=rv32imfd -melf32lriscv test.o build.o -L/home/hidetaro/docker_volume/opt/riscv/riscv64-unknown-elf/lib/ -T link.ld -nostartfiles -static -o test.elf
riscv64-unknown-elf-objcopy -O binary test.elf test.bin
hexdump -v -e '1/4 "%08x" "\n"' test.bin > test.hex
riscv64-unknown-elf-objdump -d test.elf > machine.txt
python3 convert_to_mem.py < test.hex > memory.txt
#./hex_conv < test.hex > memory.txt
