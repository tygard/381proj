.data
.text
.globl main
main:
    # Start Test
    li	$t1, 0x00000000 #Load 0 to t1
    multu $t1,$t1 #Multiply 0 by 0 which will result in 0
    #There is no values that I can find that will cause problems for the operation		
    # End Test
	halt
