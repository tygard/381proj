.data
.text
.globl main
main:
	# Start Test1 clear all registers in a dumb way
    add $1, $0, $0
    jal overHere
    add $2, $0, $0
    jal overHere
    add $3, $0, $0
    jal overHere
    add $4, $0, $0
    jal overHere
    add $5, $0, $0
    jal overHere
    add $6, $0, $0
    jal overHere
    add $7, $0, $0
    jal overHere
    add $8, $0, $0
    jal overHere
    add $9, $0, $0
    jal overHere
    add $10, $0, $0
    jal overHere
    add $11, $0, $0
    jal overHere
    add $12, $0, $0
    jal overHere
    add $13, $0, $0
    jal overHere
    add $14, $0, $0
    jal overHere
    add $15, $0, $0
    jal overHere
    add $16, $0, $0
    jal overHere
    add $17, $0, $0
    jal overHere
    add $18, $0, $0
    jal overHere
    add $19, $0, $0
    jal overHere
    add $20, $0, $0
    jal overHere
    add $21, $0, $0
    jal overHere
    add $22, $0, $0
    jal overHere
    add $23, $0, $0
    jal overHere
    add $24, $0, $0
    jal overHere
    add $25, $0, $0
    jal overHere
    add $26, $0, $0
    jal overHere
    add $27, $0, $0
    jal overHere
    add $28, $0, $0
    jal overHere
    add $29, $0, $0
    jal overHere
    add $30, $0, $0
    jal exit
   
    #can't do 31 here because that would cause an infinite loop
    
    
    
overHere:
    jr $ra
exit:
    add $31, $0, $0
	halt