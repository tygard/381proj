.data
.text
.globl main
main:

	#start test
	addi $t0, $t0, -1		#subtracting one from zero for an overflow back to ffffffff
	add $t2, $t1, $t0
	
	#end test
	
	#end program
	li $v0, 10
	syscall
	halt