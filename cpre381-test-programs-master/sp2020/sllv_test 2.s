#This test tests sllv'ing a register initialized to 2 by 0, expect each register to equal 2 at the end of each test
.data
.text
.globl main
main:
	#Start test
	add $1, $0, 2
	sllv $1, $1, $0 #expect $1=2

	add $2, $0, 2
	sllv $2, $2, $0 #expect $2=2

	add $3, $0, 2
	sllv $3, $3, $0 #expect $3=2

	add $4, $0, 2
	sllv $4, $4, $0 #expect $4=2

	add $5, $0, 2
	sllv $5, $5, $0 #expect $5=2

	add $6, $0, 2
	sllv $6, $6, $0 #expect $6=2

	add $7, $0, 2
	sllv $7, $7, $0 #expect $7=2

	add $8, $0, 2
	sllv $8, $8, $0 #expect $8=2

	add $9, $0, 2
	sllv $9, $9, $0 #expect $9=2
	
	#If all these work, it's safe to assume all work, or else there would be a problem with add

	#End test

	#Exit program
	li $v0, 10
	syscall
	halt
