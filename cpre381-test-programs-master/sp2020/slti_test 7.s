.data
.text
.globl main
main:

slti $t0, $zero, 5 #check to see if reading 0 register correctly
slti $t1, $zero, -5 #check the opposite 
slti $t2, $zero, 0x7FFF #check a high value
slti $t3, $zero, 0 #check against itself


li $v0, 10
syscall
halt