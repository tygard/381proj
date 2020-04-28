.data
.text
.globl main
main:
	#Start test
	lui $1, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $2, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $3, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $4, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $5, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $6, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $7, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $8, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $9, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $10, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $11, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $12, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $13, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $14, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $15, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $16, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $17, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $18, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $19, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $20, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $21, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $22, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $23, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $24, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $25, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $26, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $27, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $28, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $29, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $30, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	lui $31, 0xF000     # verify that an F can be loaded into the most significant bit of a register overwriting all other bits
	#End test

	# Exit program
    li $v0, 10
    syscall
halt