# in this test case, we are testing functionality of beq
# by adding up to 5

addi $t0, $0, 5
addi $t1, $0, 0

Loop:

addi $t0, $0, 1
beq $t1, $t0, Loop

Exit:

# Exit program
li $v0, 10
syscall
halt