.data
.text
.globl main

main:
li $s1, 0x0000		#loads all 0's into register
clo $s2, $s1		#counts number of leading 1's

add $a0, $s2, $zero
li $v0, 1		#output should be 0
syscall
li $v0, 10
syscall
halt
#verifies it executes properly with lowest possible operand value
