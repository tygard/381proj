.data
.text
.globl main
#This test more thoroughly tests jumping back to previous instructions (using jal)
main:
    addiu $1, $0, 0
    # Start Test
    jal JUMP1
    addiu $1, $1, 1
    jal JUMP2
    addiu $1, $1, 1
    jal JUMP3
    addiu $3, $0, 1
    j END
JUMP1:
    addiu $1, $1, 1
    jr $ra
JUMP2:
    addiu $2, $ra, 0
    addiu $1, $1, 1
    jal JUMP3
    addiu $ra, $2, 0
    addiu $1, $1, 1
    jr $ra
JUMP3:
    addiu $1, $1, 1
    jr $ra
    # End Test

    # Exit program
END:
    li $v0, 10
    syscall
halt