.data
.text
.globl main
#This test makes sure we can jump from a value in each register
main:
    # Start Test
    slti $2, $1, 1 		 # if register 1 < 2 then jump back to the begining
    beq $2, $0, NEXT
    addi $1, $0, 0 		 # Set Register 1 to 0
    lui $1, 64 		 	# Set register 1 to the first instruction address 0x40_0000	
    ori $1, 0
    jr $1      			 # verify that one can jump to PC = 0
NEXT:
    addi $1, $1, 32
    jr $1      # verify that one can jump with the value in this register
    addi $2, $1, 8   
    jr $2      # verify that one can jump with the value in this register
    addi $3, $2, 8   
    jr $3      # verify that one can jump with the value in this register   
    addi $4, $3, 8   
    jr $4      # verify that one can jump with the value in this register   
    addi $5, $4, 8   
    jr $5      # verify that one can jump with the value in this register   
    addi $6, $5, 8   
    jr $6      # verify that one can jump with the value in this register   
    addi $7, $6, 8   
    jr $7      # verify that one can jump with the value in this register   
    addi $8, $7, 8   
    jr $8      # verify that one can jump with the value in this register 
    addi $9, $8, 8   
    jr $9      # verify that one can jump with the value in this register 
    addi $10, $9, 8   
    jr $10     # verify that one can jump with the value in this register
    addi $11, $10, 8   
    jr $11     # verify that one can jump with the value in this register   
    addi $12, $11, 8
    jr $12     # verify that one can jump with the value in this register   
    addi $13, $12, 8
    jr $13     # verify that one can jump with the value in this register   
    addi $14, $13, 8
    jr $14     # verify that one can jump with the value in this register   
    addi $15, $14, 8
    jr $15     # verify that one can jump with the value in this register   
    addi $16, $15, 8   
    jr $16     # verify that one can jump with the value in this register   
    addi $17, $16, 8   
    jr $17     # verify that one can jump with the value in this register   
    addi $18, $17, 8   
    jr $18     # verify that one can jump with the value in this register   
    addi $19, $18, 8   
    jr $19     # verify that one can jump with the value in this register   
    addi $20, $19, 8   
    jr $20     # verify that one can jump with the value in this register    
    addi $21, $20, 8  
    jr $21     # verify that one can jump with the value in this register    
    addi $22, $21, 8  
    jr $22     # verify that one can jump with the value in this register    
    addi $23, $22, 8  
    jr $23     # verify that one can jump with the value in this register   
    addi $24, $23, 8   
    jr $24     # verify that one can jump with the value in this register     
    addi $25, $24, 8 
    jr $25     # verify that one can jump with the value in this register    
    addi $26, $25, 8  
    jr $26     # verify that one can jump with the value in this register    
    addi $27, $26, 8  
    jr $27     # verify that one can jump with the value in this register   
    addi $28, $27, 8   
    jr $28     # verify that one can jump with the value in this register    
    addi $29, $28, 8  
    jr $29     # verify that one can jump with the value in this register    
    addi $30, $29, 8  
    jr $30     # verify that one can jump with the value in this register    
    addi $31, $30, 8  
    jr $31     # verify that one can jump with the value in this register      
    addu $31, $31, $1 #should be 264 (24+8*30)
    # End Test

    # Exit program
    li $v0, 10
    syscall
halt