.data
.text
.globl main
main:
    # Start Test
	jal end 			#store the program counter value of the instruction after jal in $ra
	addi $t0, $0, 0 	#dummy instruction to take up space in the PC between JAL and the target
	end:
    # End Test - $ra should be the PC value corresponding to line 7

    # Exit program
    li $v0, 10
    syscall
	halt