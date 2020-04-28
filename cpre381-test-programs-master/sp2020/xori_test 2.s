#xori_njorts_1.s
# Start Test
	addi $1, $0, 0		# put 5 into register 1
    xori $2, $1, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $3, $2, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $4, $3, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $5, $4, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $6, $5, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $7, $6, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $8, $7, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $9, $8, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $10, $9, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $11, $10, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $12, $11, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $13, $12, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $14, $13, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $15, $14, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $16, $15, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $17, $16, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $18, $17, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $19, $18, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $20, $19, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $21, $20, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $22, $21, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $23, $22, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $24, $23, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $25, $24, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $26, $25, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $27, $26, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $28, $27, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $29, $28, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $30, $29, 0     # verify that xori can be used as a move instruction when immediate is 0  
    xori $31, $30, 0     # verify that xori can be used as a move instruction when immediate is 0  
    # End Test
	
	# Exit program
    li $v0, 10
    syscall
	halt