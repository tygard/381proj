.data
.text
.globl main
main:
    #Start Test.
    addi $1, $0, 9 #Setting the value of $1 to 9.
    addi $2, $0, 5 #Setting the value of $2 to 5.
    sub $3, $1, $2 #Checking if a basic sub instruction works.
    addi $2, $0, -5 #Setting the value of $2 to -5.
    sub $3, $1, $2 #Checking to see if subtracting negative number from a postive number works.
    addi $1, $0, -5 #Setting the value of $1 to -5.
    addi $2, $0, -9 #Setting the value of $2 to -9.
    sub $3, $1, $2 #Checking if the result is a postive value to make sure negative numbers subtraction works.
    addi $1, $0, 0x0000 #Setting the value of $1 to 0.
    addi $2, $0, 0xFFFF #Setting the value of $2 to -1.
    sub $3, $1, $2 #Checking to see if subtraction works with edge cases.
    addi $1, $0, 888 #Setting the value of $1 to 888.
    addi $2, $0, 4568 #Setting the value of $2 to 4568.
    sub $3, $1, $2 #Checking to see if subtraction works with a random value.
    #End test.
    
    # Exit program
    li $v0, 10
    syscall
	halt
