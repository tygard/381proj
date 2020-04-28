.data
.text
.globl main
main:
	
	# testing overflow, it can occur it two cases 
	
	# (1) overflow occurs when subtracting a negative number
	# from a positive number and get a negative result
	addi $1, $0, 2147483648 
	addi $2, $0, -1
	sub $24, $1, $2
	# this yields 0x80000001 which is a negative number 
	
	# (2) Subtract a positive number from a negative number and get
	# a positive result
	# taking the largest binary number in 32 bits 2147483648
	# which is 1111 1111 1111 1111 1111 1111 1111 1111
	# and -1 is 1111 1111 1111 1111 1111 1111 1111 1111
	# and then adding those together yields overflow because there is a carry out bit
	addi $1, $0, 2147483648
	addi $2, $0, -1
	sub $1, $2, $1
	# this yields a positive number which is 0x7fffffff and that number is positive 
	
	li $v0, 10
	syscall
	halt