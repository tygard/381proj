# In this test case, we are testing functionality of beq
# by subtracting 1 from t0
.text
addi $t0, $0, 5
addi $t1, $0, 0

Loop:

subi $t0, $0, 1
beq $t1, $t0, Loop

Exit:
halt