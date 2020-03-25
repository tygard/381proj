library IEEE;
use IEEE.std_logic_1164.all;

entity alucontrol is

  port(	i_OP         		: in std_logic_vector (5 downto 0); --op code
		i_FI          		: in std_logic_vector (5 downto 0); --instruction
		o_F         	 	: out std_logic_vector (7 downto 0)); --output

end alucontrol;

architecture behavorial of alucontrol is
begin

if i_OP = "000000" then 
	with i_FI select
		  o_F <= 	"00000000" when "000000", --sll
					"00000001" when "000010", --srl
					"00000010" when "000011", --sra
					"00000011" when "000100", --sllv
					"00000100" when "000110", --srlv
					"00000101" when "000111", --srav
					"00000110" when "001000", --jr
					"00000111" when "011001", --multu
					"00001000" when "100000", --add
					"00001001" when "100001", --addu
					"00001010" when "100010", --sub
					"00001011" when "100011", --subu
					"00001100" when "100100", --and
					"00001101" when "100101", --or
					"00001110" when "100110", --xor
					"00001111" when "100111", --nor
					"00010000" when "101010", --slt
					"00010001" when "101011"; --sltu
					
elsif i_OP = "000010" then 
	o_F <= "00010010"; --j
	
elsif i_OP = "000011" then 
	o_F <= "00010011"; --jal
	
elsif i_OP = "000100" then 
	o_F <= "00010100"; --beq
	
elsif i_OP = "000101" then 
	o_F <= "00010101"; --bne
	
elsif i_OP = "001000" then 
	o_F <= "00010110"; --addi
	
elsif i_OP = "001001" then 
	o_F <= "00010111"; --addiu
	
elsif i_OP = "001010" then 
	o_F <= "00011000"; --slti
	
elsif i_OP = "001011" then 
	o_F <= "00011001"; --sltiu
	
elsif i_OP = "001100" then 
	o_F <= "00011010"; --andi
	
elsif i_OP = "001101" then 
	o_F <= "00011011"; --ori
	
elsif i_OP = "001110" then 
	o_F <= "00011011"; --ori	
	




end behavorial;
