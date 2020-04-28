.data
.text
.globl main
main:

	#start test
	addi $t1, $t1, 1		#testing for overflow
	addi $t2, $t2, 0x7fffffff	#using the highest number that can be represented and adding 1
	add $t0, $t1, $t2		#should roll over to zero
	
	#end test
	
	#end program
	li $v0, 10
	syscall
	halt