.data
.text
.globl main
main:
#zero-out
#checks to make sure the shift can zero out a register with the exact number of shifts needed
addi $t0, $zero, 7	#set a value consisting of all 1's into the register
addi $t1, $zero, 3	#set the value to the number of bits to encode the value above in binary
addi $t2, $zero, 2	#set the register we plan to check with an arbitrary, nonzero value to see if it truly returns zero
srlv $t2, $t0, $t1	#checks that all values are cleared out of register
	#should return 0
halt