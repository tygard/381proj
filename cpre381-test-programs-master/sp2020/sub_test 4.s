.data
.text
.globl main
main:
	#THIS PROGRAM WILL TEST NEGATIVE, POSITIVE SUBTRACTION
	
#Test -15 - (-5) register t2 should be -10 or FFFFFFF6
   addi $t0, $zero, -15
   addi $t1, $zero, -5
   sub $t2, $t0, $t1
   
#Test -10 - (-4000) register t3 should be -4010 or FFFFF056
   addi $t0, $zero, -10
   addi $t1, $zero, 4000
   sub $t3, $t0, $t1
   
#Test -1 - (-2147483648) register t4 should be 2147483647 or 7FFFFFFF
   addi $t0, $zero, -1
   addi $t1, $zero, -2147483648
   sub $t4, $t0, $t1
   
#Test  -2147483648 - (-2147483648) register t5 should be 0
   lui $t0, 0x8000
   ori $t0, $t0, 0x0000
   lui $t1, 0x8000
   ori $t1, $t1, 0x0000
   sub $t5, $t0, $t1

   
# End Test

    # Exit program
    li $v0, 10
    syscall
	halt
