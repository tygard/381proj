.data
.text
.globl main
main:
    # Start Test
    li	$t1, 0xFFFFFFFF #Load max 32bit immediate value to t1
    multu $t1,$t1 #Multiply the max value by itself which should be the max value the answer could be. #HI should be 0xFFFFFFFE and Low should be 0x00000001
    multu $t1,$t1 #Does the same thing hi and lo will be consistently updated.
    #Low can still be filled but there is no values that will mess with the processor		
    halt
    # End Test
