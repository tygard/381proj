.data

.text

.globl main

main:

    # Start Test

    addi $s1, $0, 4294967295     # verify that one can clear registers and 0+0 works in the ALU   

    addi $s0, $0, 0     # verify that one can clear registers and 0+0 works in the ALU   

    multu $s0,$s1		#unsign -100*2=11111111111111111111111110011100*00000000000000000000000000000010

    mfhi $s3

	li $v0, 36
    add $a0,$0,$s3		#$s3=00000000000000000000000000000001
    syscall
    
    mflo $s2
    
    li $v0, 36
    add $a0,$0,$s2		#$s2=11111111111111111111111100111000=42949670964294967096
    syscall
    # End Test



    # Exit program

    li $v0, 10
    syscall
	halt

