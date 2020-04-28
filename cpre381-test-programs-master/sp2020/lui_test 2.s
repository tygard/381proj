.data
.text
.globl main
main:
	#Start test
	addi $1, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $2, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $3, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $4, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $5, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $6, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $7, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $8, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $9, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $10, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $11, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $12, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $13, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $14, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $15, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $16, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $17, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $18, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $19, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $20, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $21, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $22, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $23, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $24, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $25, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $26, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $27, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $28, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $29, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $30, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits
	addi $31, $0, 0xFF  #ensure that register is completely erased instead of putting number in the top 16 bits

	lui $1, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $2, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $3, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $4, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $5, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $6, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $7, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $8, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $9, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $10, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $11, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $12, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $13, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $14, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $15, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $16, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $17, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $18, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $19, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $20, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $21, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $22, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $23, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $24, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $25, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $26, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $27, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $28, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $29, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $30, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	lui $31, 0x0000      #now put 0 into upper 16 bits and ensure bottom bits are also erased
	#End test

	# Exit program
    li $v0, 10
    syscall
halt




    