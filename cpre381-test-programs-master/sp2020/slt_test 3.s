.data
.text
.globl main
main:
	addi $t0,$0,0xFFFFFFFF
	slt $t1,$t0,$0 #Check that signed numbers work
	halt