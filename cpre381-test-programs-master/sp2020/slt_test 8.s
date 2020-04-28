.data
.text
.globl main
main:
	addi $t0,$0,8
	addi $t2,$0,10
	slt $t1,$t0,$t2 #Check what happens if $t0 is less than %t2
	halt