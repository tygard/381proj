.data
.text
.globl main
main:

	# This program will test the range of operand values
	
	# Verifying that the program will perform a subtraction of two numbers resolving a postive outcome
	# Peforming 50 - 30
	addi $1, $0, 50 # storing 50 in register 1
	addi $2, $0, 30 # storing 30 in register 2
	sub $1, $1, $2 # storing 50 - 30 in register 1
	
	# Verifying that the program will perform a subtraction of two numbers who are equal to 0
	addi $1, $0, 0 # storing 0 in register 1
	addi $2, $0, 0 # storign 0 in register 2
	sub $1, $1, $2 # storing result of 0 - 0 in register 1
	
	# Verifying that the program will perform a subtraction of two numbers resolving a negative outcome
	addi $1, $0, 10 # storing 10 in register 1
	addi $2, $0, 20 # storing 20 in regiter 2
	sub $1, $1, $2 # storing result of 10 - 20 in register and verifying for a negative output
	
	# Verifying that the program will perform a subtraction of two numbers, one being positive and the other being negative
	addi $1, $0, 75 # storing 75 in reigster 1
	addi $2, $0, -10 # storing -10 in regiter 2
	sub $1, $1, $2, # storing result of 75 - (-10) in register 1 
	
 	# Exit program
	li $v0, 10
	syscall
	halt