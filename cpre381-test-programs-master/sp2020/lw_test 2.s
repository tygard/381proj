.data
array: .word 4, 4294967295, 5, 5000000000
.text
.globl main
main:
    # Start Test
    # Test how it deals with large overflow in the array
    
    addi $t0, $zero, 0 #4
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #-1
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #5
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
    
    addi $t0, $t0, 4 #705032704
    
    lw $a0, array($t0)
    
    li $v0,1
    syscall
	halt