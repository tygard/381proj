.data
array: .word 4, 2, 5, 6, 8, 5, 3, 6, 90
.text
.globl main
main:
    # Start Test
    
    # Trying out normal values in the array
    # See if it minds jumping forward past parts of the array
    addi $t0, $zero, 0 #4
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 12 #6
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #8
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 8 #3
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
	halt