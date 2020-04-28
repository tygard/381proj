.data
.text
.globl main
main:
    # Start Test
    addi $s2, $zero, 24 #pre loading $s2 with an immediate divisible by 8
    sra $s2, $s2, 3 #This will check 24/8=3
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt