.data
.text
.globl main
main:
	#Start test
	lui $1, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $2, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $3, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $4, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $5, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $6, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $7, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $8, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $9, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $10, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $11, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $12, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $13, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $14, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $15, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $16, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $17, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $18, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $19, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $20, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $21, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $22, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $23, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $24, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $25, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $26, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $27, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $28, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $29, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $30, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	lui $31, 0xFFFF     # verify that the biggest 16 bit value can be stored in each register
	#End test

	# Exit program
    li $v0, 10
    syscall
halt