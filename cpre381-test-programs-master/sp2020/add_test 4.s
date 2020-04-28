#Jidong Sun (jidongs) add instruction test 0
.data 
.text
.globl main 
main: 
#start test 
#This is a common test case to see if the adder can perform a regular add with 2 positive numbers and no flags expected. 

lui $s1, 0x5678 #load 0x5678 to upper 16 bits of $s1
addi $s1, $s1, 0x1234 #load 0x1234 to lower 16 bits of $1. $1 should == 0x56781234

lui $s2, 0x1FFF #load 0x1FFF to upper 16 bits of $s2
addi $s2, $s2, 0x1111 #load 0x1111 to lower 16 bits of $s2. $2 should == 0x1FFF1111 

add $s3, $s2, $s1 #perform add. Expected result: 0x7677_2345. No overflow. No zero. No carry out 
#end test 

#exit program
li $v0, 10 
syscall 
halt