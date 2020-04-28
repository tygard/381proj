# 
#  In this test case, we are testing to verify that sw will not store data outside of a one word increment
#  This test will fail in MARS but may otherwise succeed in live testing, although it will overwrite values
#  This test was approved directly by Professor Duwe and is not to be implimented for the class
#
.data
.text
lui $t1, 0x1000		# Setting register to 0x1000_0000

lui $t0, 0xABCD		# Setting upper value of $t0 to 0xABCD
ori $t0, 0xEFAA		# Setting lower value of $t0 to 0xEFAA
sw $t0, 0($t1)		# store word $t0 into $t1 + 0

lui $t0, 0x1234		# Setting upper value of $t0 to 0x1234
ori $t0, 0x5678		# Setting lower value of $t0 to 0x5678
sw $t0, 1($t1)		# store word $t0 into $t1 + 1

lui $t0, 0xABCD		# Setting upper value of $t0 to 0xABCD
ori $t0, 0xEFAA		# Setting lower value of $t0 to 0xEFAA
sw $t0, 2($t1)		# store word $t0 into $t1 + 2

lui $t0, 0x1234		# Setting upper value of $t0 to 0x1234
ori $t0, 0x5678		# Setting lower value of $t0 to 0x5678
sw $t0, 3($t1)		# store word $t0 into $t1 + 3

halt