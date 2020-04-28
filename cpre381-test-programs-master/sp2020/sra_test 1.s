.data
.text
.globl main
main:
    # Start Test
    addi $s2, $zero, 0x80000000 #pre loading reg $s2 with a negative number
    sra $s2, $s2, 31 #effectivly fills every bit in the register with 1
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt