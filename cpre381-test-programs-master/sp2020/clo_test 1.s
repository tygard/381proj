.data
.text
.globl main

main:
lui $s1, 0xffff
ori $s1, 0xffff	#loads all 1's into register
clo $s2, $s1		#counts number of leading 1's

add $a0, $s2, $zero
li $v0, 1		#output should be 32
syscall
li $v0, 10
syscall
halt
#verifies it executes correctly with highest possible operand value