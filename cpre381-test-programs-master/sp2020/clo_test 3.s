.data
.text
.globl main

main:
addi $s1, $zero, 0xffe0	#top 16 bits will be 0's
clo $s2, $s1		#bottom 16 bits = "1111111111100000"

add $a0, $s2, $zero
li $v0, 1		#output should 0
syscall
li $v0, 10
syscall
halt
#verfies it doesn't count one's when leading bit is 0