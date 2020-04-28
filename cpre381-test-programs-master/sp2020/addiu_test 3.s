.text
.globl main
main:
    # Start Test
    lui $16, 65535 	      
    addiu $16, $16, 65535      #$16 should have all F's
    addiu $16, $16, 65535     # verify that one can add max unsigned 16 bitnumber to max 32 bit 0xFFFF_FFFF+65535 works in the ALU   
    # End Test $16 should have 0x0000_FFFE

    # Exit program
    li $v0, 10
    syscall
	halt