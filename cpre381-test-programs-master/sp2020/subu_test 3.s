.data
.text
.globl main
main:
    # Start Test
    lui $4, 0x0000	# Load upper test value 1
    addi $4, $0, 0x0022	# Load lower test value 1
    lui $1, 0xFFFF	# Load upper test value
    addi $1, $0, 0xFFFC	# Load lower test value
    subu $2, $2, $1	# Test subtracting by a negative value, no overflow, result should be a 0x26 (0x22 - (-2))

    # Start Test
    lui $4, 0xFFFF	# Load upper test value 1
    addi $4, $0, 0xFFF6	# Load lower test value 1
    lui $1, 0x0000	# Load upper test value
    addi $1, $0, 0x0005	# Load lower test value
    subu $2, $2, $1	# TEst of bassic subtraction of a of a negative minus a positive, no overflow, result should be a 0xFFFF_FFF1 (0xFFFF_FFF6 - 5)

    # Start Test
    lui $4, 0x0000	# Load upper test value 1
    addi $4, $0, 0x0000	# Load lower test value 1
    lui $1, 0x0000	# Load upper test value
    addi $1, $0, 0x0001	# Load lower test value
    subu $2, $2, $1	# Test subtraction of 0 minus positive, no overflow, result should be a 0x26 (0x22 - (-2))
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
