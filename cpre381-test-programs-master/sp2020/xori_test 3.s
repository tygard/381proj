#xori_njorts_2.s
.text
# Start Test
	addi $1, $0, 5		# put 5 into register 1
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

	
    xori $2, $1, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $3, $2, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $4, $3, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $5, $4, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $6, $5, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $7, $6, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $8, $7, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $9, $8, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $10, $9, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $11, $10, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $12, $11, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $13, $12, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $14, $13, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $15, $14, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $16, $15, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $17, $16, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $18, $17, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $19, $18, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $20, $19, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $21, $20, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $22, $21, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $23, $22, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $24, $23, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $25, $24, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $26, $25, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $27, $26, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $28, $27, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $29, $28, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $30, $29, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    xori $31, $30, 0xFFFFFFFF     # test functionality of xori when immediate is larger than 16 bits  
    # End Test
	halt