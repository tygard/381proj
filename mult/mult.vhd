library IEEE;
use IEEE.std_logic_1164.all;

entity m_N_bit is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);
		i_B         : in std_logic_vector(N-1 downto 0);
		o_S         : out std_logic_vector(N-1 downto 0);
		o_Cout      : out std_logic);

end m_N_bit;
--
architecture structural of m_N_bit is

  component new_entity is
    port(	i_A      : in std_logic_vector(N-1 downto 0); --treat like fa
			i_FA     : in std_logic_vector(N-1 downto 0); --treat like m
			i_B      : in std_logic);--taking the last fa 1 bit Qs
			i_Cin    : in std_logic);--last fa out put
			--need one for first fa outpus
			o_FA     : out std_logic_vector(N-1 downto 0);
			o_Cout   : out std_logic,
			o_Cout_OF_THE_FIRST_FA   : out std_logic);
			
  end component;
    
  component andg2 is
    port(	i_A      : in std_logic;
			i_B      : in std_logic; 
			o_F      : out std_logic);
  end component;
					
signal first_and_outputs  :std_logic_vector(N-1 downto 0);

begin
--EDGE CASE FOR ROW 0
firstrowAND: for i in 1 to N-1 generate
--signal
    r0And: andg2 port map(    				    
              i_A       => i_A(i),
			  i_B       => i_B(0),              --	Q2 i generate per bit
              o_FA      => first_and_outputs);  --fa takes previous
end generate firstrowAND;
			  
o_FA      => first_and_outputs(0),  --TAKES CARE OF P0	  

--EGDE CASE FOR ROW 1
G_NBit_mul: for i in 1 to N-1 generate
--sig
r1EC : new_entity
port MAP (    i_A       => first_and_outputs(i-1),--treating like the fa
			  i_FA      => i_A(i),--original 32 bit M inputs
			  i_B       => i_B(1),   --	Q2 i generate per bit
			  i_Cin     => o_Cout_OF_THE_LAST_FULL_ADDER(i-1)       -- always takes 0
              o_FA      => o_FA,  --fa takes previous
			  o_Cout    => o_Cout);  --31+1
			  o_S(i)    => o_Cout_OF_THE_FIRST_FA(i));
end generate G_NBit_mul;

--CASES FOR ROWS 2-30			  
G_NBit_mul: for i in 1 to N-1 generate
--sig
    ADDERII: new_entity port map(    
								    
              i_A       => o_FA(i-1),--treating like the fa
			  i_FA      => i_A(i),--original 32 bit M inputs
			  i_B       => i_B(2),   --	Q2 i generate per bit
			  i_Cin     => o_Cout_OF_THE_LAST_FULL_ADDER(i-1)       -- always takes 0
              o_FA      => o_FA,  --fa takes previous
			  o_Cout    => o_Cout);  --31+1
			  o_S(i)    => o_Cout_OF_THE_FIRST_FA(i));

end generate G_NBit_mul;

--CASE FOR ROW 32, need to select outputs
--
--
-- .........

end structural;