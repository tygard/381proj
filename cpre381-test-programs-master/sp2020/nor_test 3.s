.data
.text
.globl main
main:
    # Start Test

    addi $8, $3, 65535	#initialize $8 to 2^16-1
    addi $9, $4, 65535	#initialize $9 to 2^16-1
    addi $10, $0, 0	#initialize $10 to 0
    
    nor $10, $9, $8	#nor 3 with 4, the upper 16 bits should be 1 and the lower should be 0
   			#This case is used in order to see if we can swap bits/inverse them
   
   
   
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
