addiu	$a0, $zero, 4
addiu	$a1, $zero, 2300
initialcall:
jal 	addandshift
slt		$t1, $a0, $a1
bne		$t1, $zero, initialcall
j 		end
addandshift:
#add 1 to $a0, then shift it left by 2 bit positions if it is not a multiple of four or by 4 if it is exactly 4
addiu	$a0, $a0, 1
sw 		$ra, 0($sp)
jal 	fourcheck
lw		$ra, 0($sp)
jr		$ra
fourcheck:
xori	$t0, $a0, 4294967291
beq		$t0, $zero, fourchecknotfour
sll		$a0, $a0, 4
j fourcheckend
fourchecknotfour:
sll		$a0, $a0, 2
fourcheckend:
jr		$ra
end:
#expected outputs: $a0 = 0x00005110
#		   $a1 = 0x000008FC