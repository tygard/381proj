.data
.align 4
Array: .space 100
msg1: .asciiz "Enter Integer : "
msg2: .asciiz " "
msg3: .asciiz "\nSorted array is : "
msg4: .asciiz "Enter array size : "
.text
.globl main
main:

addi $t0,$zero,0

li $v0,4
la $a0,msg4
syscall

li $v0,5
syscall

addi $s0,$v0,0
subi $s0,$s0,1

in:
li $v0,4
la $a0,msg1
syscall
li $v0,5
syscall

add $t1,$t0,$zero
sll $t1,$t0,2
add $t3,$v0,$zero
sw $t3,Array ( $t1 ) #store here
addi $t0,$t0,1
slt $t1,$s0,$t0
beq $t1,$zero,in

la $a0,Array
addi $a1,$s0,1 
jal bubble_sort      #call bubble_sort

li $v0,4
la $a0,msg3
syscall

la $t0,Array

add $t1,$zero,$zero
printtable:
lw $a0,0($t0)
li $v0,1
syscall

li $v0,4
la $a0,msg2
syscall

addi $t0,$t0,4
addi $t1,$t1,1
slt $t2,$s0,$t1
beq $t2,$zero,printtable

li $v0,10
syscall

bubble_sort:
add $t0,$zero,$zero  #counter1( i )=0

loop1: #outer loop
addi $t0,$t0,1 #i++
bgt $t0,$a1,endloop1 
add $t1,$a1,$zero    #counter2=size=6

loop2: #inner loop
bge $t0,$t1,loop1    #j < = i
addi $t1,$t1,-1      #j--
mul $t4,$t1,4        #t4+a0=table[j]
addi $t3,$t4,-4      #t3+a0=table[j-1]
add $t7,$t4,$a0      #t7=table[j]
add $t8,$t3,$a0      #t8=table[j-1]
lw $t5,0($t7)
lw $t6,0($t8)
bgt $t5,$t6,loop2
sw $t5,0($t8)        #swap
sw $t6,0($t7)
j loop2

endloop1:
jr $ra
