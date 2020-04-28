.data
.text
.globl main
main:
li $s0, 10000

slti $t1, $s0, 9999 #check a high-end number
slti $t2, $s0, -9999 #check a negative number
slti $t3, $s0, 0x7FFF#check to see if putting in the max value operates correctly
slti $t4, $s0, 0 #check if zero clears

li $s1, 1 #check with smaller number

slti $t5, $s1, 9999 #check a high-end number
slti $t6, $s1, -9999 #check a negative number
slti $t7, $s1, 0x7FFF#check to see if putting in the max value operates correctly
slti $t8, $s1, 0 #check if zero clears

li $s2, 5 #check a common number
slti $t9, $s2, 10 #common case
slti $t0, $s2, 4 #common case

li $v0, 10
syscall
halt