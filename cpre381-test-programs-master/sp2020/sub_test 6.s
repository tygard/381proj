.data
.text
.globl main
main:

	# testing that $0 can not be written to
	# zero register should still contain zero
	addi $1, $0, 5
	addi $2, $0, 3
	sub $0, $1, $2 # zero should not be wrote to
	
	# testing to be sure a number x subtracted by a negative number is same as +
	# 5 - (-5) == 5 + 5
	addi $1, $0, 5
	addi $2, $0, -5
	sub $3, $1, $2 # 5 - (-5) = 10
	
	# testing that a user can subtract by 0
	addi $1, $0, 10
	sub $1, $0, 0 # register 1 should now store 10
	
	# testing that user can subtract two values in memory 
	# and store it somewhere else 
	addi $1, $0, 200
	addi $2, $0, 100
	sub $29, $1, $2 # register 29 should now store 100
	
	# testing that a user is able to subtract the current value
	# in a register and then store in back in the same position
	addi $1, $0, 72
	addi $8, $0, 8
	sub $1, $1, $8 # register 1 should now store 72 - 8 = 64

	li $v0, 10
	syscall
	halt