.data
.text
.globl main
main:
#no-shift
#checks that the shift can shift no zeros in, effectively moving the value to another location

addi $t0, $zero,8 	#sets register to arbitrary value between 1 and 31
addi $t1, $zero, 0	#sets register to zero to shift with
srlv $t2, $t0, $t1 	#shifts with value of zero, should return with the value in $t0
	#should return $t0
halt