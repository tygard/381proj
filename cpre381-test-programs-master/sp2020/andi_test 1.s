.data
.text
.globl main
main:
    #Start Test.
    addi $1, $0, 15 #Setting the value of $1 to 15.
    andi $2, $1, 3 #Checking if the basic andi instruction work.
    addi $1, $0, -1 #Setting the value of $1 to -1.
    andi $2, $1, 0 #Checking to see if andi still works with extreme values.
    addi $1, $0, -1 #Setting the value of $1 to -1.
    andi $2, $1, -1 #Another test to see if andi works with extreme values.
    addi $1, $0, 15 #Setting the value of $1 to 15.
    andi $2, $1, 78 #Checking to see if the andi instruction works with random values.
    addi $1, $0, 421 #Setting the value of $1 to 421.
    andi $2, $1, 4588 #Anothe test to check if andi instruction works with random values.
    #End test.
    
    # Exit program
    li $v0, 10
    syscall
	halt