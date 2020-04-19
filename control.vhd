-- control.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a control unit.
--
-------------------------------------------------------------------------

LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY control IS
  port(i_instruction       	 	: in std_logic_vector(31 downto 0);
       o_immSign             	: out std_logic;
	   o_MemToReg          		: out std_logic;
	   o_sub             		: out std_logic;
	   o_imm            		: out std_logic;
	   o_lui           			: out std_logic;
	   o_ALUOp         			: out std_logic_vector(5 downto 0);
	   o_Shift		           	: out std_logic;
	   o_leftShift           	: out std_logic;
	   o_arithShift             : out std_logic;
	   o_MemWrite           	: out std_logic;
	   o_shiftReg           	: out std_logic;
	   o_DestReg             	: out std_logic;
	   o_jump           		: out std_logic;
	   o_branch           		: out std_logic);
END control;

ARCHITECTURE behavorial OF control IS

	signal s_OP : std_logic_vector(5 downto 0);			-- OpCode Signal
	signal s_FN : std_logic_vector(5 downto 0);			-- Function Signal
	

BEGIN

	s_OP  <= i_instruction(31 downto 26);
	s_FN  <= i_instruction(5 downto 0);
	process(s_OP, s_FN) is 
	begin
	
    if s_OP = "001000" then        --addi
		o_immSign   	<= '1';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "000000" then        --add
		if s_FN = "100000" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "001001" then        --addiu
		o_immSign   	<= '0';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "000000" then        --addu
		if s_FN = "100001" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';	
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --and
		if s_FN = "100100" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "001100" then        --andi
		o_immSign   	<= '1';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "001111" then        --lui
		o_immSign   	<= '0';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '1';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "100011" then        --lw
		o_immSign   	<= '1';
		o_MemToReg  	<= '1';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
              
	if s_OP = "000000" then        --nor
		if s_FN = "100111" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --xor
		if s_FN = "100110" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "001110" then        --xori
		o_immSign   	<= '1';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "000000" then        --or
		if s_FN = "100101" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "001101" then        --ori
		o_immSign   	<= '1';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	
	if s_OP = "000000" then        --slt
		if s_FN = "101010" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "001010" then        --slti
		o_immSign   	<= '1';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "001011" then        --sltiu
		o_immSign   	<= '1';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "000000" then        --sltu
		if s_FN = "101011" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --sll
		if s_FN = "000000" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '1';
			o_leftShift     <= '1';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --srl
		if s_FN = "000010" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '1';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --sra
		if s_FN = "000011" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '1';
			o_leftShift     <= '0';
			o_arithShift    <= '1';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --sllv
		if s_FN = "000100" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '1';
			o_leftShift     <= '1';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '1';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --srlv
		if s_FN = "000110" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '1';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '1';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --srav
		if s_FN = "000110" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '1';
			o_leftShift     <= '0';
			o_arithShift    <= '1';
			o_MemWrite      <= '0';
			o_shiftReg      <= '1';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "101011" then        --sw
		o_immSign   	<= '1';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '1';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '1';
		o_shiftReg      <= '0';
		o_DestReg       <= '1';
		o_jump          <= '0';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "000000" then        --sub
		if s_FN = "100010" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '1';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000000" then        --subu
		if s_FN = "100011" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '1';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '0';
			o_branch 		<= '0';
		end if;
	end if;
	
	if s_OP = "000100" then        --beq
		o_immSign   	<= '0';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '0';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '0';
		o_jump          <= '0';
		o_branch 		<= '1';
	end if;
	
	if s_OP = "000101" then        --bne
		o_immSign   	<= '0';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '0';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '0';
		o_jump          <= '0';
		o_branch 		<= '1';
	end if;
	
	
	if s_OP = "000101" then        --j
		o_immSign   	<= '0';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '0';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '0';
		o_shiftReg      <= '0';
		o_DestReg       <= '0';
		o_jump          <= '1';
		o_branch 		<= '0';
	end if;
	
	if s_OP = "000011" then        --jal
		o_immSign   	<= '0';
		o_MemToReg  	<= '0';
		o_sub           <= '0';
		o_imm           <= '0';
		o_lui           <= '0';
		o_ALUOp         <= s_OP;
		o_shift         <= '0';
		o_leftShift     <= '0';
		o_arithShift    <= '0';
		o_MemWrite      <= '1';
		o_shiftReg      <= '0';
		o_DestReg       <= '0';
		o_jump          <= '1';
		o_branch 		<= '0';
	end if;
	
	
	if s_OP = "000000" then        --jr
		if s_FN = "001000" then
			o_immSign   	<= '0';
			o_MemToReg  	<= '0';
			o_sub           <= '0';
			o_imm           <= '0';
			o_lui           <= '0';
			o_ALUOp         <= s_OP;
			o_shift         <= '0';
			o_leftShift     <= '0';
			o_arithShift    <= '0';
			o_MemWrite      <= '0';
			o_shiftReg      <= '0';
			o_DestReg       <= '0';
			o_jump          <= '1';
			o_branch 		<= '0';
		end if;
	end if;
	end process;
	
END behavorial;