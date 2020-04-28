# in this test case, we are testing functionality of beq
# by skipping to Exit once the 

addi $t0, $0, 1
addi $t1, $0, 0

Loop:

subi $t0, $0, 1
beq $t0 , $0, Exit
beq $t1, $t0, Loop

Exit:
halt