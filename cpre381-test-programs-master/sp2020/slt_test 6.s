.data
.text
.globl main
main:
	addi $t0,$0,-15
	addi $t2,$0,-10
	slt $t1,$t0,$t2 #Check what happens if compairing two negative number
	halt