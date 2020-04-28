.data
.text
.globl main
main:
    # Start Test

    addi $8, $3, 4294967295	#initialize $8 to 0xFFFF_FFFF
    addi $9, $4, 4294967295	#initialize $9 to 
    addi $10, $0, 4294967295	#initialize $10 to 0xFFFF_FFFF
    
    nor $10, $9, $8	#nor 8 with 9 and it should result in a 2^32 -1 (All Fs)
    			#Testing if NOR can clear a register by NORing with 2^32-1 with 2^32-1
   			
   
   
   
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
