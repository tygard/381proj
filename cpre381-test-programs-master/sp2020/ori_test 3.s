.data
.text
.globl main
main:
    # Start Test
    ori $1, $1, 43690     #sets hex value to 0xAAAA, 1010101010101010
    ori $2, $2, 21845     #sets hex value to 0x5555, 0101010101010101
    ori $1, $1, 1     #Verify that hex value is 0xAAAB
    ori $2, $2, 2     #Verify that hex value is 0x5557
    ori $1, $1, 4     #Verify that hex value is 0xAAAF
    ori $2, $2, 8     #Verify that hex value is 0x555F
    ori $1, $1, 16     #Verify that hex value is 0xAABF
    ori $2, $2, 32     #Verify that hex value is 0x557F
    ori $1, $1, 64     #Verify that hex value is 0xAAFF
    ori $2, $2, 128     #Verify that hex value is 0x55FF
    ori $1, $1, 256     #Verify that hex value is 0xABFF
    ori $2, $2, 512     #Verify that hex value is 0x57FF
    ori $1, $1, 1024     #Verify that hex value is 0xAFFF
    ori $2, $2, 2048     #Verify that hex value is 0x5FFF
    ori $1, $1, 4096     #Verify that hex value is 0xBFFF
    ori $2, $2, 8192     #Verify that hex value is 0x7FFF
    ori $1, $1, 16384     #Verify that hex value is 0xFFFF
    ori $2, $2, 32768     #Verify that hex value is 0xFFFF
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
