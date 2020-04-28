.data
.text
.globl main
main:
    # Start Test
	addi $t0, $0, 0 	#store 0 in $t0
	behind:	
	bne $t0, $0, end	#program will not continue to the end until $t0 is set to a non-zero value
	addi $t0, $0, 1		#set $t0 equal to 1
    jal behind    		# verify that one can jump backwards in the program using jal
	end:
	
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt