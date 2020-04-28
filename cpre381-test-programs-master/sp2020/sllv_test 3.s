#This test tests sllv'ing a register initialized to 0xffffffff by 32, expect 0 in each register
.data
.text
.globl main
main:
	#Start test
	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $1=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $2=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $3=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $4=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $5=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $6=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $7=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $8=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $9=0

	addi $1, $0, 0xffffffff 
	addi $2, $0, 0x00100000
	sllv $1, $1, $2 #expect $10=0

	#If all these tests pass, it's safe to assume that all other registers work unless there's a problem with addi
	#End test

	#Exit program
	li $v0, 10
	syscall
	halt
