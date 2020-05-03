-------------------------------------------------------------------------
-- Adnan Salihovic
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

entity nbit_Reg is
  generic(N : integer := 32); 
  port(
		i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		i_D        : in std_logic_vector(N-1 downto 0);
		o_Q         : out std_logic_vector(N-1 downto 0));

end nbit_Reg;
--
architecture structural of nbit_Reg is

  component dffg is
    port(	i_CLK     	: in std_logic;
			i_RST      	: in std_logic;
			i_WE    	: in std_logic;
			i_D    		: in std_logic;
			o_Q      	: out std_logic);
  end component;
			
--signal CI2  :std_logic_vector(N-1 downto 0); Might need a signal

begin

G_nbit_Reg: for i in 0 to N-1 generate
--signal
    RegI: dffg port map(    
								    
              i_CLK       	=> i_CLK,
			  i_RST       	=> i_RST, 
			  i_WE     		=> i_WE,
              i_D      		=> i_D(i),
			  o_Q    	=> o_Q(i));

end generate G_nbit_Reg;

end structural;
