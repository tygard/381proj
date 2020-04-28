.data
.text
.globl main
main:
    # Set register values to have ones at bit 15, 7, 6, and 3
    addi $17, $0, 32868        
    addi $18, $0, 32868       
    addi $19, $0, 32868   
    addi $20, $0, 32868  
    addi $21, $0, 32868   
    addi $22, $0, 32868   
    addi $23, $0, 32868  

    
    #begin test
    
    clz $t1, $s1  #verify that when there are 0s between 1s, only the leading 0s are counted
    clz $t2, $s2  #verify that when there are 0s between 1s, only the leading 0s are counted
    clz $t3, $s3  #verify that when there are 0s between 1s, only the leading 0s are counted
    clz $t4, $s4  #verify that when there are 0s between 1s, only the leading 0s are counted
    clz $t5, $s5  #verify that when there are 0s between 1s, only the leading 0s are counted
    clz $t6, $s6  #verify that when there are 0s between 1s, only the leading 0s are counted
    clz $t7, $s7  #verify that when there are 0s between 1s, only the leading 0s are counted
    
    #end test
    
    # Exit program
    li $v0, 10
    syscall
	halt