.data
.text
.globl main
main:
    # Set register values to have leading 1 and all other bits 0
     
    lui $17, 32768      
    lui $18, 32768     
    lui $19, 32768   
    lui $20, 32768        
    lui $21, 32768        
    lui $22, 32768        
    lui $23, 32768       
    
    
    #begin test
    
    clz $t1, $s1  #verify that when there are zeros but they are not leading, they are not counted
    clz $t2, $s2  #verify that when there are zeros but they are not leading, they are not counted
    clz $t3, $s3  #verify that when there are zeros but they are not leading, they are not counted
    clz $t4, $s4  #verify that when there are zeros but they are not leading, they are not counted
    clz $t5, $s5  #verify that when there are zeros but they are not leading, they are not counted
    clz $t6, $s6  #verify that when there are zeros but they are not leading, they are not counted
    clz $t7, $s7  #verify that when there are zeros but they are not leading, they are not counted
    
    #end test
    
    # Exit program
    li $v0, 10
    syscall
	halt