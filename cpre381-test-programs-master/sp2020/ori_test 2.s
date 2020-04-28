.data
.text
.globl main
main:
    # Start Test
    ori $1, $1, 65535
    ori $1, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half 
    ori $2, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $3, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $4, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $5, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $6, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $7, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $8, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $9, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $10, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $11, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $12, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $13, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $14, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $15, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $16, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $17, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $18, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $19, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $20, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $21, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $22, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $23, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $24, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $25, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $26, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $27, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $28, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $29, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $30, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    ori $31, $1, 0     # verify that a register with a value of zero or'd with an immediate value of 1 is or'd in the lower half verify that one can clear registers and 0+0 works in the ALU   
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
