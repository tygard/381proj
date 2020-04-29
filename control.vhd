-- control.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a control unit.
--
-------------------------------------------------------------------------

LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY control IS
	PORT (
		i_instruction : IN std_logic_vector(31 DOWNTO 0);
		o_immSign : OUT std_logic;
		o_MemToReg : OUT std_logic;
		o_sub : OUT std_logic;
		o_imm : OUT std_logic;
		o_lui : OUT std_logic;
		o_ALUOp : OUT std_logic_vector(5 DOWNTO 0);
		o_Shift : OUT std_logic;
		o_leftShift : OUT std_logic;
		o_arithShift : OUT std_logic;
		o_MemWrite : OUT std_logic;
		o_shiftReg : OUT std_logic;
		o_DestReg : OUT std_logic;
		o_jump : OUT std_logic;
		o_branch : OUT std_logic;
		o_RegWrite : OUT std_logic);
END control;

ARCHITECTURE behavorial OF control IS

	SIGNAL s_OP : std_logic_vector(5 DOWNTO 0); -- OpCode Signal
	SIGNAL s_FN : std_logic_vector(5 DOWNTO 0); -- Function Signal
BEGIN

	s_OP <= i_instruction(31 DOWNTO 26);
	s_FN <= i_instruction(5 DOWNTO 0);
	PROCESS (s_OP, s_FN) IS
	BEGIN

		IF s_OP = "001000" THEN --addi
			o_immSign <= '1';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0'; -- i or j type set to 0, r-type set to 1
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "001001" THEN --addiu
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "001100" THEN --andi
			o_immSign <= '1';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "001111" THEN --lui
			o_immSign <= '1';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '1';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "100011" THEN --lw
			o_immSign <= '1';
			o_MemToReg <= '1';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "001110" THEN --xori
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "001101" THEN --ori
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "001010" THEN --slti
			o_immSign <= '1';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "001011" THEN --sltiu
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "101011" THEN --sw
			o_immSign <= '1';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '1';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '1';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '0';
			o_RegWrite <= '0';

		ELSIF s_OP = "000100" THEN --beq
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '0';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '1';
			o_RegWrite <= '0';

		ELSIF s_OP = "000101" THEN --bne
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '0';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '0';
			o_branch <= '1';
			o_RegWrite <= '0';

		ELSIF s_OP = "000010" THEN --j
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '0';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '0';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '1';
			o_branch <= '0';
			o_RegWrite <= '0';

		ELSIF s_OP = "000011" THEN --jal
		-- maybe add a specific jal output
			o_immSign <= '0';
			o_MemToReg <= '0';
			o_sub <= '0';
			o_imm <= '0';
			o_lui <= '0';
			o_ALUOp <= s_OP;
			o_shift <= '0';
			o_leftShift <= '0';
			o_arithShift <= '0';
			o_MemWrite <= '1';
			o_shiftReg <= '0';
			o_DestReg <= '0';
			o_jump <= '1';
			o_branch <= '0';
			o_RegWrite <= '1';

		ELSIF s_OP = "000000" THEN
			IF s_FN = "100000" THEN --add
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "100001" THEN --addu
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "100100" THEN --and
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "100111" THEN --nor
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "100110" THEN --xor
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "100101" THEN --or
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "101010" THEN --slt
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "101011" THEN --sltu
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "000000" THEN --sll
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '1';
				o_leftShift <= '1';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "000010" THEN --srl
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '1';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "000011" THEN --sra
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '1';
				o_leftShift <= '0';
				o_arithShift <= '1';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "000100" THEN --sllv
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '1';
				o_leftShift <= '1';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '1';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "000110" THEN --srlv
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '1';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '1';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "000110" THEN --srav
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '1';
				o_leftShift <= '0';
				o_arithShift <= '1';
				o_MemWrite <= '0';
				o_shiftReg <= '1';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "100010" THEN --sub
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '1';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "100011" THEN --subu
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '1';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '1';
				o_jump <= '0';
				o_branch <= '0';
				o_RegWrite <= '1';

			ELSIF s_FN = "001000" THEN --jr
				o_immSign <= '0';
				o_MemToReg <= '0';
				o_sub <= '0';
				o_imm <= '0';
				o_lui <= '0';
				o_ALUOp <= s_OP;
				o_shift <= '0';
				o_leftShift <= '0';
				o_arithShift <= '0';
				o_MemWrite <= '0';
				o_shiftReg <= '0';
				o_DestReg <= '0';
				o_jump <= '1';
				o_branch <= '0';
				o_RegWrite <= '0';

			END IF;
		END IF;
	END PROCESS;

END behavorial;