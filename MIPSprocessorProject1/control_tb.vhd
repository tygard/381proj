library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;  -- For logic types I/O
library std;
use std.env.all;                -- For hierarchical/external signals
use std.textio.all;             -- For basic I/O

entity tb_control is
 
end tb_control;

architecture mixed of tb_control is

component control is

  port(i_instruction : IN std_logic_vector(31 DOWNTO 0);
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
		o_RegWrite : OUT std_logic;
		o_JR : OUT std_logic;
		o_JAL : OUT std_logic);
end component;

signal s_i_instruction  : std_logic_vector(31 DOWNTO 0);

begin

 DUT0: control

  port map(i_instruction      => s_i_instruction);
 
  P_TEST_CASES: process
  begin
  wait for 100 ns ;
  
    s_i_instruction <= X"30000000";--assuming hex? for 001100 andi
	
	--expected:
			-- o_immSign <= '0';
			-- o_MemToReg <= '0';
			-- o_sub <= '0';
			-- o_imm <= '1';
			-- o_lui <= '0';
			-- o_ALUOp <= s_OP;
			-- o_shift <= '0';
			-- o_leftShift <= '0';
			-- o_arithShift <= '0';
			-- o_MemWrite <= '0';
			-- o_shiftReg <= '0';
			-- o_DestReg <= '0';
			-- o_jump <= '0';
			-- o_branch <= '0';
			-- o_RegWrite <= '1';
			-- o_JR <= '0';
			-- o_JAL <= '0';
	
  
  wait for 100 ns;
   
   s_i_instruction   <= X"20000000";--IF s_OP = "001000" THEN --addi
   --expected:
			-- o_immSign <= '1';
			-- o_MemToReg <= '0';
			-- o_sub <= '0';
			-- o_imm <= '1';
			-- o_lui <= '0';
			-- o_ALUOp <= s_OP;
			-- o_shift <= '0';
			-- o_leftShift <= '0';
			-- o_arithShift <= '0';
			-- o_MemWrite <= '0';
			-- o_shiftReg <= '0';
			-- o_DestReg <= '0'; -- i or j type set to 0, r-type set to 1
			-- o_jump <= '0';
			-- o_branch <= '0';
			-- o_RegWrite <= '1';
			-- o_JR <= '0';
			-- o_JAL <= '0';

 end process;

end mixed;
