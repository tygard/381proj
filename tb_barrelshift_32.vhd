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

entity barrelshift_32 is
  generic(N : integer := 4); -- Generic of type integer for input/output data width. Default value is 32.
  
  port(i_SHAMT      : in std_logic_vector(1 downto 0)		 -- Shift amount input
       i_D	        : in std_logic;     					 -- Shift direction input (0: left, 1: right)
       i_T          : in std_logic;     					 -- Shift type input (0: logical, 1: arith.)
	   i_X          : in std_logic_vector(N-1 downto 0);     -- Data value input
       o_Y          : out std_logic_vector(N-1 downto 0));   -- Data value output

end barrelshift_32;

architecture structural of barrelshift_32 is

-- Todo: structural architecture, test process

end structural;