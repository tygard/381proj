.data
.text
.globl main
main:
	#Start Test 1
	li $t1, 0x10
	sra	$t2,$t1, 1	#expect 0x8
	sra 	$t2,$t1, 2	#expect 0x4
	sra	$t2,$t1, 3	#expect 0x2
	sra 	$t2,$t1, 4	#expect 0x1
	sra	$t2,$t1, 5	#expect 0x0
	sra	$t2,$t1, 5	#expect 0x0 Value is still 0 because the value has been shifted too far that it doesn't read an 1
	halt

	
	
