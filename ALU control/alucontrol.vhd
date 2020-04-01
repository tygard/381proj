library IEEE;
use IEEE.std_logic_1164.all;

entity alucontrol is

  port(	i_OP         		: in std_logic_vector (5 downto 0); --op code
		i_FI          		: in std_logic_vector (5 downto 0); --instruction
		o_F         	 	: out std_logic_vector (4 downto 0)); --output

end alucontrol;

architecture behavorial of alucontrol is
begin

if i_OP = "000000" then 
	with i_FI select
		  o_F <= 	"00000" when "000000", --sll
					"00001" when "000010", --srl
					"00010" when "000011", --sra
					"00011" when "000100", --sllv
					"00100" when "000110", --srlv
					"00101" when "000111", --srav
					"00110" when "001000", --jr
					"00111" when "011001", --multu
					"01000" when "100000", --add
					"01001" when "100001", --addu
					"01010" when "100010", --sub
					"01011" when "100011", --subu
					"01100" when "100100", --and
					"01101" when "100101", --or
					"01110" when "100110", --xor
					"01111" when "100111", --nor
					"10000" when "101010", --slt
					"10001" when "101011"; --sltu
					
elsif i_OP = "000010" then 
	o_F <= "10010"; --j
	
elsif i_OP = "000011" then 
	o_F <= "10011"; --jal
	
elsif i_OP = "000100" then 
	o_F <= "10100"; --beq
	
elsif i_OP = "000101" then 
	o_F <= "10101"; --bne
	
elsif i_OP = "001000" then 
	o_F <= "10110"; --addi
	
elsif i_OP = "001001" then 
	o_F <= "10111"; --addiu
	
elsif i_OP = "001010" then 
	o_F <= "11000"; --slti
	
elsif i_OP = "001011" then 
	o_F <= "11001"; --sltiu
	
elsif i_OP = "001100" then 
	o_F <= "11010"; --andi
	
elsif i_OP = "001101" then 
	o_F <= "11011"; --ori
	
elsif i_OP = "001110" then 
	o_F <= "11100"; --xori

elsif i_OP = "001111" then 
	o_F <= "11101"; --lui

elsif i_OP = "100011" then 
	o_F <= "11110"; --lw		
	
elsif i_OP = "101011" then 
	o_F <= "11111"; --sw	
	
end if;	
end behavorial;
