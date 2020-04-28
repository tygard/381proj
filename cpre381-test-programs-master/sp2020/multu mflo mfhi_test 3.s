.data
	newline: .asciiz "\n"
.text

.globl main

main:

    # Start Test

    addi $s1, $0, 0xFFFFFFFF     # verify that one can clear registers and 0+0 works in the ALU   

    addi $s0, $0, 0xFFFFFFFF     # verify that one can clear registers and 0+0 works in the ALU   

    multu $s0,$s1		#unsign 

    mfhi $s3

	li $v0, 36
    add $a0,$0,$s3		#$s3=0xFFFFFFFE
    syscall
    
    li $v0, 4       
	la $a0, newline       # load address of the string
	syscall

    mflo $s2
    
    li $v0, 36
    add $a0,$0,$s2		#$s2=0x00000001
    syscall
    # End Test

	#0xFFFFFFFE00000001=0xFFFFFFFF*0xFFFFFFFF, so in range

    # Exit program
    li $v0, 10
    syscall
	halt

