.data
.text
.globl main
main:
    # Start Test
    jal ahead    # verify that one can jump ahead in the program using jal
	addi $t0, $0, 0 #dummy instruction to take up space in the PC between JAL and the target
	ahead:
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt