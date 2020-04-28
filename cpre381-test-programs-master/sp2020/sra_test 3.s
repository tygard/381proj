.data
.text
.globl main
main:
    # Start Test
    addi $s2, $zero, 0x40000010 #pre loading reg $s2 with a positive immediate value
    sra $s2, $s2, 31 #this will carry the sign bit and fill every bit with 0's
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt