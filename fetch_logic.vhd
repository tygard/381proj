-- fetch_logic.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains the fetch logic for the single-cycle MIPS Processor

-- 01/29/2019 by H3::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity fetch_logic is
  generic(N : integer := 32);
	port(
		i_Branch: in std_logic;
		i_Jump  : in std_logic;
		i_JA	: in std_logic_vector(25 downto 0); -- 25 bit Jump Address for jump instruction
		i_BA	: in std_logic_vector(15 downto 0); -- 16 bit Branch Address for branch instruction
		i_PC	: in std_logic_vector(31 downto 0); -- the PC for use with both branch and jump as well as simply incrementing the PC from its current value
		);
end  fetch_logic;