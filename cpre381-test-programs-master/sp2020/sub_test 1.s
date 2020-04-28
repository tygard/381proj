.data
.text
.globl main
main:
	#THIS PROGRAM WILL TEST POSITIVE, POSITIVE SUBTRACTION
	
#Test 15 - 5 register t2 should be 10 or A
   addi $t0, $zero, 15
   addi $t1, $zero, 5
   sub $t2, $t0, $t1
   
#Test 10 - 0 register t3 should be 10 or A
   addi $t0, $zero, 10
   addi $t1, $zero, 0
   sub $t3, $t0, $t1
   
#Test 65536 - 65500 register t4 should be 36 or 24
   addi $t0, $zero, 65536
   addi $t1, $zero, 65500
   sub $t4, $t0, $t1
   
#Test 1 - 2147483648 register t5 should be -2147483647 or 0x7FFFFFFF but will overflow
   addi $t0, $zero, 1
   addi $t1, $zero, 2147483648
   sub $t5, $t0, $t1
   
# End Test

    # Exit program
    li $v0, 10
    syscall
	halt
