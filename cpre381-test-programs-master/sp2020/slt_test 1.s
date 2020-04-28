.data
.text
.globl main
main:
    #Start Test.
    addi $1, $0, 1 #Setting the value of $1 to 1.
    addi $2, $0, 2 #Setting the value of $2 to 2.
    slt $3, $2, $1 #Checking if a basic slt instruction works.
    addi $1, $0, 0 #Setting the value of $1 to 0.
    addi $2, $0, 0 #Setting the value of $2 to 0.
    slt $3, $2, $1 #Checking to make sure slt does not set the register if the two values are equal.
    addi $1, $0, -1 #Setting the value of $1 to -1.
    addi $2, $0, 1 #Setting the value of $2 to 1.
    slt $3, $2, $1 #Checking to make sure that the AlU can compare negative and positive numbers.
    addi $1, $0, -1 #Setting the value of $1 to -1.
    addi $2, $0, -2 #Setting the value of $2 to -2.
    slt $3, $2, $1 #Checking to make sure that the AlU can handle comparing negative numbers.
    addi $1, $0, 455 #Setting the value of $1 to 455.
    addi $2, $0, 24465 #Setting the value of $2 to 24465.
    slt $3, $2, $1 #Checking the functionality of slt with random values.
    #End test.
    
    # Exit program
    li $v0, 10
    syscall
halt 
