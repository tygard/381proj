-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- mux2t1_N.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an N-bit wide 2:1
-- mux using structural VHDL, generics, and generate statements.
--
--
-- NOTES:
-- 1/6/20 by H3::Created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity adder_N_bit is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);
		i_B         : in std_logic_vector(N-1 downto 0);
		i_Cin       : in std_logic;
		o_S         : out std_logic_vector(N-1 downto 0);
		o_Cout      : out std_logic);

end adder_N_bit;
--
architecture structural of adder_N_bit is

  component adder_1_bit is
    port(	i_A      : in std_logic;
			i_B      : in std_logic;
			i_Cin    : in std_logic;
			o_S      : out std_logic;
			o_Cout   : out std_logic);
  end component;
			
signal CI2  :std_logic_vector(N-1 downto 0);

begin

o_Cout    <= CI2(N-1);							
    ADDERI: adder_1_bit port map(    
								    
              i_A       => i_A(0),   --should be 31, but is 30 
			  i_B       => i_B(0),   --should be 31, but is 30
			  i_Cin     => i_Cin, --should be 30
              o_S       => o_S(0),   --should be 31, but is 30
			  o_Cout    => CI2(0));--31s
G_NBit_ADDER: for i in 1 to N-1 generate
--signal
    ADDERII: adder_1_bit port map(    
								    
              i_A       => i_A(i),   --should be 31, but is 30 
			  i_B       => i_B(i),   --should be 31, but is 30
			  i_Cin     => CI2(i-1), --should be 30
              o_S       => o_S(i),   --should be 31, but is 30
			  o_Cout    => CI2(i));--31+1

end generate G_NBit_ADDER;

end structural;
