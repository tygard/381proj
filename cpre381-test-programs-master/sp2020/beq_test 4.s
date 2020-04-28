.data
.text
.globl main
main:
    # Start Test
    #basic functionality test
    begin:
    addi $8, $0, 0     
    addi $9,$0, 1
     beq $8, $9, begin #not equal so it continues
     addi $8, $8, 1
     beq $8, $9, end #equal so it skips to the end and doesn't add 1 to $8
     addi $8, $8, 1
     end:
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
