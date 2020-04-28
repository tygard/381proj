#This test tests normal operation of sllv. Each register is initialized to 2 and sllv'd with a register containing 2, thus at #the end of each test case the register should hold a value of 4
.data
.text
.globl main
main:
	#Start test
	addi $1, $0, 2
	addi $2, $0, 2
	sllv $1, $1, $2 #expect $1=4

	addi $2, $0, 2
	addi $3, $0, 2
	sllv $2, $2, $3 #expect $2=4

	addi $3, $0, 2
	addi $4, $0, 2
	sllv $3, $3, $4 #expect $3=4

	addi $4, $0, 2
	addi $5, $0, 2
	sllv $4, $4, $5 #expect $4=4

	addi $5, $0, 2
	addi $6, $0, 2
	sllv $5, $5, $6 #expect $5=4

	addi $6, $0, 2
	addi $7, $0, 2
	sllv $6, $6, $7 #expect $6=4

	addi $7, $0, 2
	addi $8, $0, 2
	sllv $7, $7, $8 #expect $7=4

	addi $8, $0, 2
	addi $9, $0, 2
	sllv $8, $8, $9 #expect $8=4

	addi $9, $0, 2
	addi $10, $0, 2
	sllv $9, $9, $10 #expect $9=4

	addi $10, $0, 2
	addi $11, $0, 2
	sllv $10, $10, $11 #expect $10=4

	addi $11, $0, 2
	addi $12, $0, 2
	sllv $11, $11, $12 #expect $11=4

	addi $12, $0, 2
	addi $13, $0, 2
	sllv $12, $12, $13 #expect $12=4

	addi $13, $0, 2
	addi $14, $0, 2
	sllv $13, $13, $14 #expect $13=4

	addi $14, $0, 2
	addi $15, $0, 2
	sllv $14, $14, $15 #expect $14=4

	addi $15, $0, 2
	addi $16, $0, 2
	sllv $15, $15, $16 #expect $15=4

	addi $16, $0, 2
	addi $17, $0, 2
	sllv $16, $16, $17 #expect $16=4

	addi $17, $0, 2
	addi $18, $0, 2
	sllv $17, $17, $18 #expect $17=4

	addi $18, $0, 2
	addi $19, $0, 2
	sllv $18, $18, $19 #expect $18=4

	addi $19, $0, 2
	addi $20, $0, 2
	sllv $19, $19, $20 #expect $19=4

	addi $20, $0, 2
	addi $21, $0, 2
	sllv $20, $20, $21 #expect $20=4

	addi $21, $0, 2
	addi $22, $0, 2
	sllv $21, $21, $22 #expect $21=4

	addi $22, $0, 2
	addi $23, $0, 2
	sllv $22, $22, $23 #expect $22=4

	addi $23, $0, 2
	addi $24, $0, 2
	sllv $23, $23, $24 #expect $23=4

	addi $24, $0, 2
	addi $25, $0, 2
	sllv $24, $24, $25 #expect $24=4

	addi $25, $0, 2
	addi $26, $0, 2
	sllv $25, $25, $26 #expect $25=4

	addi $26, $0, 2
	addi $27, $0, 2
	sllv $26, $26, $27 #expect $26=4

	addi $27, $0, 2
	addi $28, $0, 2
	sllv $27, $27, $28 #expect $27=4

	addi $28, $0, 2
	addi $29, $0, 2
	sllv $28, $28, $29 #expect $28=4

	addi $29, $0, 2
	addi $30, $0, 2
	sllv $29, $29, $30 #expect $29=4

	addi $30, $0, 2
	addi $31, $0, 2
	sllv $30, $30, $31 #expect $30=4

	addi $31, $0, 2
	addi $1, $0, 2
	sllv $31, $31, $1 #expect $31=4
	#End test

	#Exit program
	li $v0, 10
	syscall
	halt
