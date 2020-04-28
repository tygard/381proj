.data
.text
.globl main
main:
    # Start Test
    subu $1, $0, $1     # verify that one can clear registers and 0-0 works in the ALU   
    subu $2, $0, $2     # verify that one can clear registers and 0-0 works in the ALU   
    subu $3, $0, $3     # verify that one can clear registers and 0-0 works in the ALU   
    subu $4, $0, $4     # verify that one can clear registers and 0-0 works in the ALU   
    subu $5, $0, $5     # verify that one can clear registers and 0-0 works in the ALU   
    subu $6, $0, $6     # verify that one can clear registers and 0-0 works in the ALU   
    subu $7, $0, $7     # verify that one can clear registers and 0-0 works in the ALU   
    subu $8, $0, $8     # verify that one can clear registers and 0-0 works in the ALU   
    subu $9, $0, $9     # verify that one can clear registers and 0-0 works in the ALU   
    subu $10, $0, $10     # verify that one can clear registers and 0-0 works in the ALU   
    subu $11, $0, $11     # verify that one can clear registers and 0-0 works in the ALU   
    subu $12, $0, $12     # verify that one can clear registers and 0-0 works in the ALU   
    subu $13, $0, $13     # verify that one can clear registers and 0-0 works in the ALU   
    subu $14, $0, $14     # verify that one can clear registers and 0-0 works in the ALU   
    subu $15, $0, $15     # verify that one can clear registers and 0-0 works in the ALU   
    subu $16, $0, $16     # verify that one can clear registers and 0-0 works in the ALU   
    subu $17, $0, $17     # verify that one can clear registers and 0-0 works in the ALU   
    subu $18, $0, $18     # verify that one can clear registers and 0-0 works in the ALU   
    subu $19, $0, $19     # verify that one can clear registers and 0-0 works in the ALU   
    subu $20, $0, $20     # verify that one can clear registers and 0-0 works in the ALU   
    subu $21, $0, $21     # verify that one can clear registers and 0-0 works in the ALU   
    subu $22, $0, $22     # verify that one can clear registers and 0-0 works in the ALU   
    subu $23, $0, $23     # verify that one can clear registers and 0-0 works in the ALU   
    subu $24, $0, $24     # verify that one can clear registers and 0-0 works in the ALU   
    subu $25, $0, $25     # verify that one can clear registers and 0-0 works in the ALU   
    subu $26, $0, $26     # verify that one can clear registers and 0-0 works in the ALU   
    subu $27, $0, $27     # verify that one can clear registers and 0-0 works in the ALU   
    subu $28, $0, $28     # verify that one can clear registers and 0-0 works in the ALU   
    subu $29, $0, $29     # verify that one can clear registers and 0-0 works in the ALU   
    subu $30, $0, $30     # verify that one can clear registers and 0-0 works in the ALU   
    subu $31, $0, $31     # verify that one can clear registers and 0-0 works in the ALU   
    # End Test

    # Exit program
    li $v0, 10
    syscall
	halt
