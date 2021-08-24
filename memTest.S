.globl main
main:

li a0,0x1234ABCD
sw a0,-4(sp)  #4byte
sh a0,-8(sp)  #2byte
sb a0,-12(sp) #1byte

lw  a1,-4(sp) #4byte
lh  a2,-4(sp) #signed   2byte
lhu a3,-4(sp) #unsigned 2byte
lb  a4,-4(sp) #signed   1byte
lbu a5,-4(sp) #unsigned 1byte