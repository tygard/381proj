.data
.text
.globl main
main:

	#start test
	add $t0, $t0, $t1	#no instantiation test, should still be zero
	
	#end test
	
	#end program
	li $v0, 10
	syscall
	halt