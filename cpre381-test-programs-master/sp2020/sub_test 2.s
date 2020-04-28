.data
.text
.globl main
main:
	#THIS PROGRAM WILL TEST POSITIVE, NEGATIVE SUBTRACTION
	
#Test 15 - (-5) register t2 should be 20 or 14
   addi $t0, $zero, 15
   addi $t1, $zero, -5
   sub $t2, $t0, $t1
   
#Test 10 - (-4000) register t3 should be 4010 or FAA
   addi $t0, $zero, 10
   addi $t1, $zero, -4000
   sub $t3, $t0, $t1
   
#Test 65536 - (-65536) register t4 should be 131072 or 20000
   addi $t0, $zero, 65536
   addi $t1, $zero, -65536
   sub $t4, $t0, $t1
   
#Test 1 - (-2147483648) register t5 should be 2147483649 but will overflow
   addi $t0, $zero, 1
   lui $t1, 0x8000
   ori $t1, $t1, 0x0000
   sub $t5, $t0, $t1
   
# End Test

    # Exit program
    li $v0, 10
    syscall
	halt
