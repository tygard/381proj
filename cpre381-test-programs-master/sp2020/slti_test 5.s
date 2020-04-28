.data
.text
.globl main
main:
li $s0, 0x7FFF

slti $t0, $s0, 0x00007FFF #compare the a very high value against itself
slti $t1, $s0, 0x0000 #check 0
slti $t2, $s0, 0x00007FFE #check high value immediate minus 1

li $s1, 2
slti $t3, $s1, 5 #common case
slti $t4, $s1, -2 #check negative
slti $t5, $s1, 1 #a number below, common

li $v0, 10
syscall
halt