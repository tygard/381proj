.data
.text
.globl main
main:
    # Start Test
    li	$t1, 0xFFFFFFFF #Load max 32bit immediate value to t1
    li	$t2, 0x00000000 #Load smallest value to t2
    multu $t1,$t2 #multiply max and min value. answer should be 0
    li	$t2, 0x00000002 #Load 2 into t2
    multu $t1,$t2 #multiply max value by 2. Hi = 0x01 Lo=0xFFFFFFFE
    #There is no value that will break the processor.
	halt