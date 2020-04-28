.data
.text
.globl main
main:
    # Start Test
    #loop test
	addi $8, $0, 0  
	addi $10, $0, 0  
	addi $9, $0, 4
	beq $8, $0, condition
	loop: 
	addi $10, $10, 1
	beq $10, $9, end
    condition:
    beq $8, $0, loop
    end:
    # End Test
    # Exit program
    li $v0, 10
    syscall
	halt
