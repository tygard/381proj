addi 	$s0, $t0, -1			#$s0: 0xFFFFFFFF
addiu 	$s1, $zero, 1			#$s1: 0x00000001
add	$s2, $s0, $s1			#$s2: 0x00000000 - should cause exception for overflow
ori	$s3, $s1, 4026531840		#$s3: 0xF0000001
addu	$s4, $s0, $s0			#$s4: 0xFFFFFFFE - should not cause exception for overflow
and	$s5, $s3, $s0			#$s5: 0x00000001
xor	$s6, $s3, $s2			#$s6: 0xF0000001
andi	$s7, $s3, 269999999		#$s7: 0x10000001
xori	$t0, $zero, 16843009		#$t0: 0x01010101
nor	$t1, $t1, $t0			#$t1: 0xFEFEFEFE
sll	$t2, $t1, 7			#$t2: 0x7f7f7f00
sra	$t3, $t2, 31			#$t3: 0x00000000
xori	$t4, $t3, 255			#$t4: 0x000000FF
or	$t5, $t1, $t2			#$t5: 0xFFFFFFFE
j	nonzeroing			#registers should not be zeroed out here
addiu 	$t2, $zero, 0
addiu 	$t3, $zero, 0
addiu 	$t4, $zero, 0
addiu 	$t5, $zero, 0
nonzeroing:
srl	$t6, $t0, 4			#$t6: 0x00101010
slti	$t7, $s1, 252			#$t7: 0x00000001
sllv	$t8, $s1, $s1			#$t8: 0x00000002
srlv	$t9, $t8, $s3			#$t9: 0x00000001
srav	$a0, $s1, $s3			#$a0: 0x00000000
addi 	$a1, $t0, -1			#$a1: 0x01010100
sltu	$a2, $s2, $s0			#$a2: 0x00000001
sltiu	$a3, $s2, -127			#$a3: 0x00000001
sub	$v0, $t1, $t0			#$t0: 0xFDFDFDFD
subu	$v1, $t4, $t5			#$t1: 0x00000101 - should cause exception
sw	$t1, 63($s7)			#store 0xFEFEFEFE at 0x10000040
lui	$t2, 4096			#$t2 = 0x10000000
beq	$t2, $zero, nonzeroing		#do not branch
bne	$zero, $zero, nonzeroing		#do not branch
addiu	$t1, $t2, 64			#$t1 = 0x10000040
lw	$t0, 0($t1)			#$t0 = 0xFEFEFEFE
multu	$t2, $t2			#$t2 = 0x10000000, hi = 0x01000000, lo = 0x00000000