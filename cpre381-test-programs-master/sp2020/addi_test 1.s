.data
.text
.globl main
main:
    addi $1, $0, 1 
    addi $2, $0, 0
    addi $3, $0, 1
    addi $4, $0, 0
    
    # Start Test
    addi $2, $1, 0     # verify that one can move data between registers and addition works in the ALU
	# Print value in $2
	addi $a0, $2, 0
	addi $v0, $0, 1
	syscall

    addi $3, $2, 0     # verify that one can move data between registers and addition works in the ALU
	# Print value in $2
	addi $a0, $3, 0
	addi $v0, $0, 1
	syscall

    addi $4, $3, 0     # verify that one can move data between registers and addition works in the ALU 
	# Print value in $2
	addi $a0, $4, 0
	addi $v0, $0, 1
	syscall
    # End Test
	
    # Exit program
    li $v0, 10
    syscall
	halt