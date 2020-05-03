library IEEE;
use IEEE.std_logic_1164.all;

entity alucontrol is

  port(	i_OP         		: in std_logic_vector (5 downto 0); --op code
		i_FI          		: in std_logic_vector (5 downto 0); --instruction
		o_F         	 	: out std_logic_vector (4 downto 0)); --output

end alucontrol;

architecture behavorial of alucontrol is
begin


process (i_OP, i_FI)
begin

if i_OP = "000000" then 

	if i_FI = "000000" then
		o_F <= "00000"; --sll
		
	elsif i_FI = "000010" then
		o_F <= "00001"; --srl
		
	elsif i_FI = "000011" then
		o_F <= "00010"; --sra
		
	elsif i_FI = "000100" then
		o_F <= "00011"; --sllv
		
	elsif i_FI = "000110" then
		o_F <= "00100"; --srlv 
		
	elsif i_FI = "000111" then
		o_F <= "00101"; --srav
		
	elsif i_FI = "001000" then
		o_F <= "00110"; --jr
		
	elsif i_FI = "011001" then
		o_F <= "00111"; --multu
		
	elsif i_FI = "100000" then
		o_F <= "01000"; --add
		
	elsif i_FI = "100001" then
		o_F <= "01001"; --addu
	
	elsif i_FI = "100010" then
		o_F <= "01010"; --sub
	
	elsif i_FI = "100011" then
		o_F <= "01011"; --subu
		
	elsif i_FI = "100100" then
		o_F <= "01100"; --and

	elsif i_FI = "100101" then
		o_F <= "01101"; --or

	elsif i_FI = "100110" then
		o_F <= "01110"; --xor	

	elsif i_FI = "100111" then
		o_F <= "01111"; --nor

	elsif i_FI = "101010" then
		o_F <= "10000"; --slt

	elsif i_FI = "101011" then
		o_F <= "10001"; --sltu

	else
		null;
	end if;
	
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
	o_F <= "11111"; --sv
	
else
	null;
	
end if;	
end process;
end behavorial;
