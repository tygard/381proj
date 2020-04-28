.data
.text
.globl main
main:
	#THIS PROGRAM WILL TEST NEGATIVE, POSITIVE SUBTRACTION
	
#Test -15 - 5 register t2 should be -20 or FFFFFFEC
   addi $t0, $zero, -15
   addi $t1, $zero, 5
   sub $t2, $t0, $t1
   
#Test -10 - 4000 register t3 should be -4010 or FFFFF056
   addi $t0, $zero, -10
   addi $t1, $zero, 4000
   sub $t3, $t0, $t1
   
#Test -200 - 0 register t4 should be -200 or FFFFFF38
   addi $t0, $zero, -200
   addi $t1, $zero, 0
   sub $t4, $t0, $t1
   
#Test  -2147483648 - 2 register t5 should be  -2147483650 but will overflow
   lui $t0, 0x8000
   ori $t0, $t0, 0x0000
   addi $t1, $zero, 2
   sub $t5, $t0, $t1
   

   
# End Test

    # Exit program
    li $v0, 10
    syscall
	halt
