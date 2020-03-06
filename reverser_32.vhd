-- reverser_32.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a reverser that
-- reverses the order of bits in a 32-bit input
--
-- NOTES:
-- 3/6/2020 by zbesta::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity reverser_32 is
	port(i_X : in std_logic_vector(31 downto 0);
		 o_Y : out std_logic_vector(31 downto 0));
end entity reverser_32	;


architecture dataflow of reverser_32 is
   
	begin
		G0 : for i in 0 to 31 generate
		o_Y(i) <= i_X((31-i));
    
	end generate;
end dataflow;