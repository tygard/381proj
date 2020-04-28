.data
.text
.globl main
main:
#same-shift
#checks to see that we can shift using the same register values for both the value to shift and the amount to shift by

addi $t0, $zero,3 	#sets register to some arbitrary number 
srlv $t0, $t0, $t0 	#shifts using the same register in both the value to shift and the value to shift with
	#should return zero, in the same register as the value
halt