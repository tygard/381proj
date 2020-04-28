.data
.text
.globl main
main:
    # Set register values to 0 
    addi $17, $0, 0        
    addi $18, $0, 0       
    addi $19, $0, 0        
    addi $20, $0, 0       
    addi $21, $0, 0        
    addi $22, $0, 0        
    addi $23, $0, 0       

    
    #begin test
    
    clz $t1, $s1  #verify that when all bits are zero, it returns the total number of bits in the register(32)
    clz $t2, $s2  #verify that when all bits are zero, it returns the total number of bits in the register(32)
    clz $t3, $s3  #verify that when all bits are zero, it returns the total number of bits in the register(32)
    clz $t4, $s4  #verify that when all bits are zero, it returns the total number of bits in the register(32)
    clz $t5, $s5  #verify that when all bits are zero, it returns the total number of bits in the register(32)
    clz $t6, $s6  #verify that when all bits are zero, it returns the total number of bits in the register(32)
    clz $t7, $s7  #verify that when all bits are zero, it returns the total number of bits in the register(32)
    
    #end test
    
    # Exit program
    li $v0, 10
    syscall
	halt