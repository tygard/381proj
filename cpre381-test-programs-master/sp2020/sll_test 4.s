.data
.text
.globl main

main:
    # Start Test
    addi $t0, $0, 0xf
    
    sll $t1, $t0, 0
    sll $t1, $t0, 1
    sll $t1, $t0, 2
    sll $t1, $t0, 3
    sll $t1, $t0, 4
    sll $t1, $t0, 5
    sll $t1, $t0, 6
    sll $t1, $t0, 7
    sll $t1, $t0, 8
    sll $t1, $t0, 9
    sll $t1, $t0, 10
    sll $t1, $t0, 11
    sll $t1, $t0, 12
    sll $t1, $t0, 13
    sll $t1, $t0, 14
    sll $t1, $t0, 15
    sll $t1, $t0, 16
    sll $t1, $t0, 17
    sll $t1, $t0, 18
    sll $t1, $t0, 19
    sll $t1, $t0, 20
    sll $t1, $t0, 21
    sll $t1, $t0, 22
    sll $t1, $t0, 23
    sll $t1, $t0, 24
    sll $t1, $t0, 25
    sll $t1, $t0, 26
    sll $t1, $t0, 27
    sll $t1, $t0, 28
    sll $t1, $t0, 29
    sll $t1, $t0, 30
    sll $t1, $t0, 31

    
    # Exit program
    li $v0, 10
    syscall
	halt