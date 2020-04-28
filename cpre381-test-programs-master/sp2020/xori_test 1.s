.text
#xori_njorts_3#xori_njorts_3.s

	addi $1, $0, 0xAAAA		# put 5 into register 1
    xori $2, $1, 0     # put 5 into register 2 
    xori $3, $2, 0     # put 5 into register 3 
    xori $4, $3, 0     # put 5 into register 4 
    xori $5, $4, 0     # put 5 into register 5 
    xori $6, $5, 0     # put 5 into register 6 
    xori $7, $6, 0     # put 5 into register 7
    xori $8, $7, 0     # put 5 into register 8 
    xori $9, $8, 0     # put 5 into register 9 
    xori $10, $9, 0     # put 5 into register 10 
    xori $11, $10, 0     # put 5 into register 11 
    xori $12, $11, 0     # put 5 into register 12 
    xori $13, $12, 0     # put 5 into register 13
    xori $14, $13, 0     # put 5 into register 14
    xori $15, $14, 0     # put 5 into register 15
    xori $16, $15, 0     # put 5 into register 16
    xori $17, $16, 0     # put 5 into register 17
    xori $18, $17, 0     # put 5 into register 18
    xori $19, $18, 0     # put 5 into register 19
    xori $20, $19, 0     # put 5 into register 20 
    xori $21, $20, 0     # put 5 into register 21 
    xori $22, $21, 0     # put 5 into register 22 
    xori $23, $22, 0     # put 5 into register 23 
    xori $24, $23, 0     # put 5 into register 24
    xori $25, $24, 0     # put 5 into register 25 
    xori $26, $25, 0     # put 5 into register 26 
    xori $27, $26, 0     # put 5 into register 27 
    xori $28, $27, 0     # put 5 into register 28 
    xori $29, $28, 0     # put 5 into register 29 
    xori $30, $29, 0     # put 5 into register 30 
    xori $31, $30, 0     # put 5 into register 31
	
	#the real test
	xori $1, $1, 0xFFFF     # verify that xori can be used to invert bits  
	xori $2, $2, 0xFFFF     # verify that xori can be used to invert bits  
    xori $3, $3, 0xFFFF     # verify that xori can be used to invert bits  
    xori $4, $4, 0xFFFF     # verify that xori can be used to invert bits  
    xori $5, $5, 0xFFFF     # verify that xori can be used to invert bits  
    xori $6, $6, 0xFFFF     # verify that xori can be used to invert bits  
    xori $7, $7, 0xFFFF     # verify that xori can be used to invert bits  
    xori $8, $8, 0xFFFF     # verify that xori can be used to invert bits  
    xori $9, $9, 0xFFFF     # verify that xori can be used to invert bits  
    xori $10, $10, 0xFFFF     # verify that xori can be used to invert bits  
    xori $11, $11, 0xFFFF     # verify that xori can be used to invert bits  
    xori $12, $12, 0xFFFF     # verify that xori can be used to invert bits  
    xori $13, $13, 0xFFFF     # verify that xori can be used to invert bits  
    xori $14, $14, 0xFFFF     # verify that xori can be used to invert bits  
    xori $15, $15, 0xFFFF     # verify that xori can be used to invert bits  
    xori $16, $16, 0xFFFF     # verify that xori can be used to invert bits  
    xori $17, $17, 0xFFFF     # verify that xori can be used to invert bits  
    xori $18, $18, 0xFFFF     # verify that xori can be used to invert bits  
    xori $19, $19, 0xFFFF     # verify that xori can be used to invert bits  
    xori $20, $20, 0xFFFF     # verify that xori can be used to invert bits  
    xori $21, $21, 0xFFFF     # verify that xori can be used to invert bits  
    xori $22, $22, 0xFFFF     # verify that xori can be used to invert bits  
    xori $23, $23, 0xFFFF     # verify that xori can be used to invert bits  
    xori $24, $24, 0xFFFF     # verify that xori can be used to invert bits  
    xori $25, $25, 0xFFFF     # verify that xori can be used to invert bits  
    xori $26, $26, 0xFFFF     # verify that xori can be used to invert bits  
    xori $27, $27, 0xFFFF     # verify that xori can be used to invert bits  
    xori $28, $28, 0xFFFF     # verify that xori can be used to invert bits  
    xori $29, $29, 0xFFFF     # verify that xori can be used to invert bits  
    xori $30, $30, 0xFFFF     # verify that xori can be used to invert bits  
    xori $31, $31, 0xFFFF     # verify that xori can be used to invert bits  
    # End Test
	halt