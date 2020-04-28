.data
.text
.globl main

main:
    # Start Test
    addi $4, $0, 0xFFFF
    
    sll $5, $4, 16
    sll $6, $4, 16
    sll $7, $4, 16
    sll $8, $4, 16
    sll $9, $4, 16
    sll $10, $4, 16
    sll $11, $4, 16
    sll $12, $4, 16
    sll $13, $4, 16
    sll $14, $4, 16
    sll $15, $4, 16
    sll $16, $4, 16
    sll $17, $4, 16
    sll $18, $4, 16
    sll $19, $4, 16
    sll $20, $4, 16
    sll $21, $4, 16
    sll $22, $4, 16
    sll $23, $4, 16
    sll $24, $4, 16
    sll $25, $4, 16
    sll $26, $4, 16
    sll $27, $4, 16
    sll $28, $4, 16
    sll $29, $4, 16
    sll $30, $4, 16
    sll $31, $4, 16
    sll $0, $4, 16
    sll $1, $4, 16
    sll $2, $4, 16
    sll $3, $4, 16
    sll $4, $4, 16
      
    # Exit program
    li $v0, 10
    syscall
    halt