.data
.text
.globl main
main:
#negative-shift
#checks to see if the shift can convert negative numbers as well as shift by such a large (now positive) value

addi $t0, $zero,31 	#get the maximum value that can be within register (31, a 5 bit number)
addi $t1, $zero, -1	#sets register to contain a negative value, to use as shift variable
srlv $t2, $t0, $t1 	#attempts to shift in a negative direction, but should convert to max positive value
	#should return zero
halt