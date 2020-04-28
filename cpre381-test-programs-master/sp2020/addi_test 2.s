.data
.text
.globl main
main:
    #Start Test
    addi $1, $0, 2147483647	#verify that the addi instruction works with an immediate that is larger that 16bits
	# Print value in $1
	addi $a0, $1, 0
	addi $v0, $0, 1
	syscall
	
    addi $2, $0, -2147483648	#verify that the addi instruction works with an immediate that is larger that 16bits
	# Print value in $2
	addi $a0, $2, 0
	addi $v0, $0, 1
	syscall
	
    addi $3, $0, 65536		#verify that the addi instruction works with an immediate that is larger that 16bits
	# Print value in $3
	addi $a0, $3, 0
	addi $v0, $0, 1
	syscall
    # End Test
	
    # Exit program
    li $v0, 10
    syscall
halt