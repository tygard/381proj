.data 
	array: .word 1,3,4,2,25,10,16,32,7,44,11 #if changing the ammount of numbers in the array, need to change down below at 3rd addi instruction. it is documented.
	sortedArray: .word 0:100
	arraySpace: .asciiz " "
.text

main: #main method of merge sort.
	la $a0,array	#Load the address of array that is declared above into a0
	addi $a1,$zero,0 #set a1 to be lower end
	addi $a2,$zero,10 #set a2 to be the high end (Change the 10 here to be the size of the array you want sorted)
	
	#begin
	jal mergesort	#jump to mergesort method
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
		
	#begin printing the sorted array
	addi $t0,$a1,0 #add a1 into t0
	add $t1,$a2,0 #add a2 into t1
	la $t4,array #load address of array into t4
	
	jal printArray #jump to printArray method, this will print final array.
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	syscall
	
mergesort: #This is a recursive method

	slt $t0,$a1,$a2 #check to if the size of the lower is less than the size of high. if 0 it has invalid inputs.
	
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	beqz $t0,done #if zero, go to done which will take it done main.
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	#make space on stack and save the values
	addi $sp,$sp,-16 
	sw $ra,0($sp) #store address
	sw $a1,4($sp) #store low
	sw $a2,8($sp) #store high
	#need to find the middle of the array
	
	#read after write
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $s0,$a2,$a1 #a1 + a2
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sra $s0,$s0,1 #divide by 2
	
	sw $s0,12($sp) #store mid
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	#sort first half of array
	addi $a2,$s0,0 	#high = mid, used to sort
	
	jal mergesort #recursion
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	#sort second half of array
	lw $s0,12($sp) #load mid
	
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $s1,$s0,1	#add 1 to mid
	
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	add $a1,$s1,$zero #low = mid, used to sort second half of array
	
	lw $a2,8($sp) #load high
	
	jal mergesort # recursive call to MergeSort
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop

	#once sorting is completed need to merge the outcomes
	lw $a1,4($sp) #load low
	lw $a2,8($sp) #load high
	lw $a3,12($sp) #load mid
	
	jal merge #got to merge
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	#restore stack and return to main
	lw $ra,0($sp) #load return address
	addi $sp,$sp,16 #restore the stack pointer
	
	b done #branch to done
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop

#Setup i,j,k 
merge:
	addi $s0,$a1,0 #s0 = i
	addi $s1,$a1,0 #s1 = k
	addi $s2,$a3,1 #s2 = j
	#IMPORTANT LESS AMOUNT OF NOOPS!
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop

ifConditional:
	sll $t0,$s0,2 #multiply i by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t0,$t0,$a0
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	lw $t1,0($t0) #load a[i] into t1
	sll $t2,$s2,2 #multiply j by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t2,$t2,$a0
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	lw $t3,0($t2) #load [j] into t3
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	blt $t3, $t1, elseConditional #if a[j] < a[i] branch to else
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	la $t4, sortedArray #load address of sortedArray
	sll $t5, $s1, 2	#multiply k by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t4, $t4, $t5 #set t4 = c[k]
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sw $t1, 0($t4) #c[k] = a[i]
	
	#increments
	addi $s1, $s1, 1 #increment k by 1
	addi $s0, $s0, 1 #increment i by 1
	j firstWhile #jump to firstWhile
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
elseConditional:
	sll $t2,$s2,2 #multiply j by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t2,$t2,$a0
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	lw $t3,0($t2) #t3 a[j]	
	la $t4,sortedArray #load address of sortedArray
	
	sll $t5,$s1,2 #multiply k by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t4,$t4,$t5	#$t4 = c[k]; $t4 is address of c[k]
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sw $t3,0($t4) #c[k] = a[j]
	
	#increments
	addi $s1,$s1,1 #increment k by 1
	addi $s2,$s2,1 #increment j by 1
	j firstWhile #jump to firstWhile
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop

firstWhile:
	blt $a2,$s2,secondWhile	#if high is less than value j, go to secondWhile
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	blt $a3,$s0,secondWhile	#if mid is less that value i, go to secondWhile
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	j ifConditional #jump to ifConditional
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
secondWhile:
	blt $a3,$s0,thirdWhile #branch to thirdWhile if mid < i
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sll $t0,$s0,2 #multiply i by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t0,$a0,$t0
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	lw $t1,0($t0) #load a[i]
	la $t2,sortedArray #load address of sortedArray
	#Use 3 noops and not max IMPORTANT FOR REPORT
	sll $t3,$s1,2 #multiply k by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop

	add $t3,$t3,$t2
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sw $t1,0($t3) #store a[i] into c[k]
	
	#increments
	addi $s1,$s1,1 #increment k by 1
	addi $s0,$s0,1 #increment i by 1
	j secondWhile #jump to secondWhile
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop

thirdWhile:
	blt $a2,$s1,beginFor #branch to beginFor
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sll $t2,$s2,2 #multiply j by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t2,$t2,$a0 
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	lw $t3,0($t2) #load value a[j]
	la $t4,sortedArray #load address of sortedArray
	sll $t5,$s1,2 #multiply k by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t4,$t4,$t5 #add c[k]
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sw $t3,0($t4) #store c[k]
	#increments
	addi $s1,$s1,1 #increment k by 1
	addi $s2,$s2,1 #increment j by 1
	j thirdWhile #jump to thirdWhile
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop

beginFor:
	addi $t0,$a1,0 #add 0 to a1 and store in t0
	addi $t1,$a2,1 # add 1 to a2 and store in t1
	la $t4,sortedArray #load address of sortedArray into t4
	j forLoop #jump to forLoop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
forLoop:
	slt $t7,$t0,$t1 #t7=0 if t0 >= t1, else it is 1
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	beqz $t7,done #go to done
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sll $t2,$t0,2 #multiply t0 by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t3,$t2,$a0
	add $t5,$t2,$t4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	lw $t6,0($t5) #load t5 into t6
	sw $t6,0($t3) #store t3 into t6
	#increments
	addi $t0,$t0,1 #increment i by 1
	j forLoop #jump to forLoop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
		
printArray:
	blt $t1,$t0,done #if t1 is less than t0 branch to done
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	sll $t3,$t0,2 #multiply t0 by 4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	add $t3,$t3,$t4
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	lw $t2,0($t3) #load value of t3 into t2
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
	move $a0,$t2 #move t2 to a0
	li $v0,1 #print
	syscall #syscall do we need a noop after this?
	addi $t0,$t0,1 #increment t0 by 1
	la $a0,arraySpace #places a space in between the numbers.
	li $v0,4 #print
	syscall #syscall
	j printArray #jump to printArray
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	
done:
	jr $ra	#jump to set return address
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
	addi $zero,$zero,0 #noop
