.data
.text
.globl main
main:
    addi $1, $0, 0x7fffffff  #0x7fff_ffff
    addi $2, $0, 0x80000000 #0x8000_0000
    
    # Start Test
    addi $1, $1, 1     # verify that 0x7fff_ffff is the largest signed value possible in a register before overflow occurs and addition works in the ALU
	# Print value in $2
	addi $a0, $1, 0
	addi $v0, $0, 1
	syscall
	
    addi $2, $2, -1     # verify that 0x8000_0000 is the smallest signed value possible in a register before overflow occurs and addition with negative values work in the ALU
	# Print value in $2
	addi $a0, $1, 0
	addi $v0, $0, 1
	syscall
    # End Test
	
    # Exit program
    li $v0, 10
    syscall
	halt