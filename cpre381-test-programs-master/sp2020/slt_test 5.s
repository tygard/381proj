#since the the temporary registers have a limited value they can hold (as high as 4,294,967,295 or as low as -4,294,967,295)
#anything outside this range will cause an overflow of digits and incorect comparisons for slt.

.data
message: .asciiz "the number is less than the other"
.text
add $t1, $0, 3000000000000
add $t2, $0, 2000000000000000000000000000000000
slt $s0, $t2, $t1

bne $s0, $0, printMessage

li $v0, 10
syscall
halt

printMessage:
li $v0, 4
la $a0, message
syscall
halt