.data
.text
.globl main
main:
    # Start Test
    ori $1, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half 
    ori $2, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $3, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $4, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $5, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $6, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $7, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $8, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $9, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $10, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $11, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $12, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $13, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $14, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $15, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $16, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $17, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $18, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $19, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $20, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $21, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $22, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $23, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $24, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $25, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $26, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $27, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $28, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $29, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $30, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $31, $0, 65535     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
