.data
array: .word 4, 2, 5, 6, 14, 15, 7
.text
.globl main
main:
    # Start Test
    # Test that it's printing what it should by having it jump around different addresses, back and forth
    
    addi $t0, $zero, 0 #4
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #2
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, -4 #4
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #2
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #5
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, -4 #2
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #5
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #6
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, -4 #5
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #6
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #14
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #15
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, -4 #14
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #15
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
	halt