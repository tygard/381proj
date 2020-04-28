.data
.text
.globl main
main:
    # Start Test0 infinite loop
    add $t1, $t1, $0
    jal overHere
    
    
    
overHere:
    addi $t1, $t1, 1
    jr $ra
	halt