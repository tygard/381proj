.data
.text
.globl main

main:
    # Start Test
    addi $1, $0, 0x4444
    addi $2, $0, 0x4444
    addi $3, $0, 0x4444
    addi $4, $0, 0x4444
    addi $5, $0, 0x4444
    addi $6, $0, 0x4444
    addi $7, $0, 0x4444
    addi $8, $0, 0x4444
    addi $9, $0, 0x4444
    addi $10, $0, 0x4444
    addi $11, $0, 0x4444
    addi $12, $0, 0x4444
    addi $13, $0, 0x4444
    addi $14, $0, 0x4444
    addi $15, $0, 0x4444
    
    addi $16, $0, 0x4444
    addi $17, $0, 0x4444
    addi $18, $0, 0x4444
    addi $19, $0, 0x4444
    addi $20, $0, 0x4444
    addi $21, $0, 0x4444
    addi $22, $0, 0x4444
    addi $23, $0, 0x4444
    addi $24, $0, 0x4444
    addi $25, $0, 0x4444
    addi $26, $0, 0x4444
    addi $27, $0, 0x4444
    addi $28, $0, 0x4444
    addi $29, $0, 0x4444
    addi $30, $0, 0x4444
    addi $31, $0, 0x4444
    
    
    sll $1, $1, 16
    add $1, $0, $0
    
    sll $1, $2, 16
    add $1, $0, $0
    
    sll $1, $3, 16
    add $1, $0, $0
    
    sll $1, $4, 16
    add $1, $0, $0
    
    sll $1, $5, 16
    add $1, $0, $0
    
    sll $1, $6, 16
    add $1, $0, $0
    
    sll $1, $7, 16
    add $1, $0, $0
    
    sll $1, $8, 16
    add $1, $0, $0
    
    sll $1, $9, 16
    add $1, $0, $0
    
    sll $1, $10, 16
    add $1, $0, $0
    
    sll $1, $22, 16
    add $1, $0, $0
    
    sll $1, $12, 16
    add $1, $0, $0
    
    sll $1, $13, 16
    add $1, $0, $0
    
    sll $1, $14, 16
    add $1, $0, $0
    
    sll $1, $15, 16
    add $1, $0, $0
    
    sll $1, $16, 16
    add $1, $0, $0
    
    sll $1, $17, 16
    add $1, $0, $0
    
    sll $1, $18, 16
    add $1, $0, $0
    
    sll $1, $19, 16
    add $1, $0, $0
    
    sll $1, $20, 16
    add $1, $0, $0
    
    sll $1, $21, 16
    add $1, $0, $0
    
    sll $1, $22, 16
    add $1, $0, $0
    
    sll $1, $23, 16
    add $1, $0, $0
    
    sll $1, $24, 16
    add $1, $0, $0
    
    sll $1, $25, 16
    add $1, $0, $0
    
    sll $1, $26, 16
    add $1, $0, $0
    
    sll $1, $27, 16
    add $1, $0, $0
    
    sll $1, $28, 16
    add $1, $0, $0
    
    sll $1, $29, 16
    add $1, $0, $0
    
    sll $1, $30, 16
    add $1, $0, $0
    
    sll $1, $31, 16
    add $1, $0, $0
    
    
    # Exit program
    li $v0, 10
    syscall
	halt