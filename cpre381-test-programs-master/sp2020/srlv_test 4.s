.data
.text
.globl main
main:
#big-shift
#this test should check that some very large number can be shifted down into a more reasonable range

addi $t0, $zero,512 	#sets register to some binary with a single 1 and five trailing zeroes (xxxxx00000)
addi $t1, $zero, 5	#sets register to contain a smallish number that should divide the above value to be less than 32
srlv $t2, $t0, $t1 	#shifts the alrge value, should return a value with a single 1 within it
	#should return a single one somewhere within result
halt