-- barrelshift.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a barrel shifter
-- for a 32-bit binary input with support for shifting in either
-- direction, both logically and arithmetically.
--
--
-- NOTES:
-- 2/21/2020 by zbesta::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity barrelshift is
  generic(N : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
  
  port(i_SHAMT      : in std_logic_vector(4 downto 0);		 -- Shift amount input
       i_D	        : in std_logic;     					 -- Shift direction input (0: left, 1: right)
       i_T          : in std_logic;     					 -- Shift type input (0: logical, 1: arith.)
	   i_X          : in std_logic_vector(N-1 downto 0);     -- Data value input
       o_Y          : out std_logic_vector(N-1 downto 0));   -- Data value output

end barrelshift;

architecture structural of barrelshift is

	-- Signals to handle connections between the 5 MUX rows A-H
	signal s_iA : std_logic_vector(N downto 0);
	signal s_iB : std_logic_vector(N downto 0);
	signal s_iC : std_logic_vector(N downto 0);
	signal s_iD : std_logic_vector(N downto 0);
	signal s_iE : std_logic_vector(N downto 0);
	
	
	-- N-bit 2:1 MUX
	component mux2t1_N
		port(i_S          : in std_logic;
			 i_D0         : in std_logic_vector(N-1 downto 0);
			 i_D1         : in std_logic_vector(N-1 downto 0);
			 o_O          : out std_logic_vector(N-1 downto 0));
	end component;
	
	begin
		---------------------------------------------------------------------------
		-- Level 0: leftmost MUX array configured to shift 1 bit left
		---------------------------------------------------------------------------
		g_MUXA: mux2t1_N
		port MAP(i_S               => i_SHAMT(4),
				 i_D0			   => i_X,
				 i_D1              => "0" & i_X(30 downto 0),
				 o_O               => s_iA);
		
  
end structural;