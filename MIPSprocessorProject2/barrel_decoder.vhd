-- barrel_decoder.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains barrel decoder for parsing the
-- ALU control output and assigning the proper control signals to the
-- barrel shifter
--
-- 04/13/2020 by tygard:Design created.
-------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY barrel_decoder IS
	PORT (
		i_ALUctrl : IN std_logic_vector(4 DOWNTO 0);
		o_D : OUT std_logic; -- Shift direction output (0: right, 1: left)
		o_T : OUT std_logic; -- Shift type output (0: logical, 1: arith.)
		o_VarEn : OUT std_logic;
		o_ShiftEn : OUT std_logic
	);
END barrel_decoder;

ARCHITECTURE dataflow OF barrel_decoder IS

BEGIN

	WITH i_ALUctrl SELECT
		o_D <=
		'1' WHEN "00000", -- sll
		'0' WHEN "00001", -- srl
		'0' WHEN "00010", -- sra
		'1' WHEN "00011", -- sllv
		'0' WHEN "00100", -- srlv
		'0' WHEN "00101", -- srav
		'0' WHEN "00110", -- jr
		'0' WHEN "00111", -- multu
		'0' WHEN "01000", -- add
		'0' WHEN "01001", -- addu
		'0' WHEN "01010", -- sub
		'0' WHEN "01011", -- subu
		'0' WHEN "01100", -- and
		'0' WHEN "01101", -- or
		'0' WHEN "01110", -- xor
		'0' WHEN "01111", -- nor
		'0' WHEN "10000", -- slt
		'0' WHEN "10001", -- sltu
		'0' WHEN "10010", -- j
		'0' WHEN "10011", -- jal
		'0' WHEN "10100", -- beq
		'0' WHEN "10101", -- bne
		'0' WHEN "10110", -- addi
		'0' WHEN "10111", -- addiu
		'0' WHEN "11000", -- slti
		'0' WHEN "11001", -- sltiu
		'0' WHEN "11010", -- andi
		'0' WHEN "11011", -- ori
		'0' WHEN "11100", -- xori
		'0' WHEN "11101", -- lui
		'0' WHEN "11110", -- lw
		'0' WHEN "11111", -- sv
		'0' WHEN OTHERS;

	WITH i_ALUctrl SELECT
		o_T <=
		'0' WHEN "00000", -- sll
		'0' WHEN "00001", -- srl
		'1' WHEN "00010", -- sra
		'0' WHEN "00011", -- sllv
		'0' WHEN "00100", -- srlv
		'1' WHEN "00101", -- srav
		'0' WHEN OTHERS;

	WITH i_ALUctrl SELECT
		o_VarEn <=
		'0' WHEN "00000", -- sll
		'0' WHEN "00001", -- srl
		'0' WHEN "00010", -- sra
		'1' WHEN "00011", -- sllv
		'1' WHEN "00100", -- srlv
		'1' WHEN "00101", -- srav
		'0' WHEN OTHERS;

	WITH i_ALUctrl SELECT
		o_ShiftEn <=
		'1' WHEN "00000", -- sll
		'1' WHEN "00001", -- srl
		'1' WHEN "00010", -- sra
		'1' WHEN "00011", -- sllv
		'1' WHEN "00100", -- srlv
		'1' WHEN "00101", -- srav
		'0' WHEN OTHERS;

END dataflow;