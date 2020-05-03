-- tb_reverer_32.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a test bench for the 32-bit reverser
-- defined in reverser_32.vhd.
--
-- NOTES:
-- 3/6/2020 by zbesta::File created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;  -- For logic types I/O
library std;
use std.env.all;                -- For hierarchical/external signals
use std.textio.all;             -- For basic I/O

entity tb_reverser_32 is
	generic(gCLK_HPER   : time := 10 ns);   -- Generic for half of the clock cycle period
end tb_reverser_32;

architecture mixed of tb_reverser_32 is

	-- Define the total clock period time
	constant cCLK_PER  : time := gCLK_HPER * 2;
	
	component reverser_32 is
		port(i_X : in std_logic_vector(31 downto 0);
			 o_Y : out std_logic_vector(31 downto 0));
	end component;

	
	-- Define test signals
	signal s_iX				:  std_logic_vector(31 downto 0); -- Input to be reversed
	signal s_oY				:  std_logic_vector(31 downto 0); -- Reversed version of input
	
	begin
	
	DUT0: reverser_32
	port map(
			 i_X => s_iX,
			 o_Y => s_oY);
			 
	
	P_TEST_CASES: process
		begin
			-- Test case 1:
			-- Reverse 32-bit input
			wait for gCLK_HPER;
			s_iX	    <= "01001000100001000001000000100000";
			wait for gCLK_HPER;

    
	end process;
end mixed;