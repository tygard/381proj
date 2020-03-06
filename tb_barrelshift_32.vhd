-- tb_barrelshift_32.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a test bench for the 32-bit barrel-
-- shifter defined in barrelshift.vhd.
--
-- NOTES:
-- 2/23/2020 by zbesta::File created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;  -- For logic types I/O
library std;
use std.env.all;                -- For hierarchical/external signals
use std.textio.all;             -- For basic I/O

entity tb_barrelshift_32 is
	generic(gCLK_HPER   : time := 10 ns);   -- Generic for half of the clock cycle period
end tb_barrelshift_32;

architecture mixed of tb_barrelshift_32 is

	-- Define the total clock period time
	constant cCLK_PER  : time := gCLK_HPER * 2;
	component barrelshift_32 is
		generic(N : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
		port(i_SHAMT      : in std_logic_vector(4 downto 0);		 -- Shift amount input
			 i_D	        : in std_logic;     					 -- Shift direction input (0: left, 1: right)
			 i_T          : in std_logic;     					 -- Shift type input (0: logical, 1: arith.)
			 i_X          : in std_logic_vector(31 downto 0);     -- Data value input
			 o_Y          : out std_logic_vector(31 downto 0));   -- Data value output

	end component;
	
	-- Define test signals
	signal s_iSHAMT			:  std_logic_vector(4 downto 0);	 -- Shift amount input
	signal s_iD				:  std_logic;     					 -- Shift direction input (0: left, 1: right)
	signal s_iT				:  std_logic;     					 -- Shift type input (0: logical, 1: arith.)
	signal s_iX				:  std_logic_vector(31 downto 0);    -- Data value input
	signal s_oY				:  std_logic_vector(31 downto 0);  -- Data value output
	
	begin
	
	DUT0: barrelshift_32
	port map(
			 i_SHAMT => s_iSHAMT,
			 i_D => s_iD,
			 i_T => s_iT,
			 i_X => s_iX,
			 o_Y => s_oY);
			 
	
	P_TEST_CASES: process
		begin
			-- Test case 1:
			-- Shift an input of 2 right by 3
			wait for gCLK_HPER;
			
			s_iSHAMT    <= "00011";  
			s_iD	    <= '0';
			s_iT 		<= '0';
			s_iX	    <= "00000000000000000000000000000010";
			
			wait for gCLK_HPER;
			-- Expected output: s_oY = 0
			
			-- Test case 2:
			-- Shift an input of 0xF0000000 right by 31
			wait for gCLK_HPER;
			s_iSHAMT    <= "11111";  
			s_iD	    <= '0';
			s_iT 		<= '0';
			s_iX	    <= "11110000000000000000000000000000";
			wait for gCLK_HPER;
			-- Expected output: s_oY = 1
			
			-- Test case 3:
			-- Shift an input of 0x80000000 right by 31 arithmetically
			wait for gCLK_HPER;
			s_iSHAMT    <= "11111";  
			s_iD	    <= '0';
			s_iT 		<= '1';
			s_iX	    <= "10000000000000000000000000000000";
			wait for gCLK_HPER;
			-- Expected output: s_oY = 0xFFFFFFFF
			
			-- Test case 4:
			-- Shift an input of 0x40000000 right by 8 arithmetically
			wait for gCLK_HPER;
			s_iSHAMT    <= "01000";  
			s_iD	    <= '0';
			s_iT 		<= '1';
			s_iX	    <= "01000000000000000000000000000000";
			wait for gCLK_HPER;
			-- Expected output: s_oY = 0x00400000

    
	end process;
end mixed;