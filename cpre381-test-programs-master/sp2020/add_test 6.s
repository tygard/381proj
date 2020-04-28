#Jidong Sun (jidongs) add instruction test 1
.data 
.text
.globl main 
main: 
#start test 
#This is an edge case where a positive number is added to another number with same magnititude but different sign. This should produce a zero flag. 


addi $s1, $0, 0x7EBC # load 0x7EBC to s1 (decimal 32444)

lui $s2, 0xFFFF #load 0xffff to upper 16 bits of s2.
addi $s2, $s2, 0x8144 # load 0x8144 to s2 (devimal -32444) 

add $s3, $s1, $s2 #add the two numbers togerher, expected result is 0, with carryout flag and zero flag 

#end test


#exit program
li $v0, 10 
syscall 
halt