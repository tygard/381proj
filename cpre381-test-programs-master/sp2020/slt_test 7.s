.data
.text
.globl main
main:
	addi $t0,$0,10
	addi $t2,$0,8
	slt $t1,$t0,$t2 #Check what happens if $t0 is larger than $t2
	halt