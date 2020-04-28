.data
.text
.globl main
main:
    
    # Start Test
    lui $1, 0xFFFF	# Load upper test value
    addi $1, $0,0xFFFF	# Load lower test value
    subu $2, $2, $1	# Test edge case of wrapping around value to positive, no overflow, result should be a zero
    
    lui $3, 0x0000	# Load upper test value
    addi $3, $0, 0x0001	# Load lower test value
    subu $2, $2, $3	# Test basic subraction operation zero minus positive value, value should result in a zero
    
    lui $4, 0x0000	# Load upper test value 1
    addi $4, $0, 0x1001	# Load lower test value 1
    lui $5, 0x0000	# Load upper test value 2
    addi $5, $0, 0x0110	# Load lower test valie 2
    subu $4, $4, $5	# Test basic subraction operation positive value minus positive value, value should result in a zero
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
