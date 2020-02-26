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
		i_JA	: in std_logic_vector(28 downto 0); -- 27 bit Jump Address for jump instruction
		i_BA	: in std_logic_vector(31 downto 0); -- 32 bit Branch Address for branch instruction
		i_PC	: in std_logic_vector(31 downto 0); -- the PC value
		o_PC	: out std_logic_vector(31 downto 0); -- output to the PC register
		);
end  fetch_logic;


architecture structure of fetch_logic is

component adder_N_bit is
	port(	
		i_A    : in std_logic_vector(N-1 downto 0);
		i_B    : in std_logic_vector(N-1 downto 0);
		i_Cin  : in std_logic;
		o_S    : out std_logic_vector(N-1 downto 0);
		o_Cout : out std_logic;
		);
		
component mux2t1_N is
	port(
		i_S     : in std_logic;
		i_D0    : in std_logic_vector(N-1 downto 0);
		i_D1    : in std_logic_vector(N-1 downto 0);
		o_O     : out std_logic_vector(N-1 downto 0);
		);

end mux2t1_N;

signal s_A0	: std_logic_vector(31 downto 0);
signal s_A1	: std_logic_vector(31 downto 0);
signal s_M0	: std_logic_vector(31 downto 0);


begin 
	adder0 : adder_N_bit
	port MAP(
		i_A		=> i_PC,
		i_B     => '0100',	-- add 4 to the PC
		i_Cin   => '0',		-- no carry in
		o_S     => s_A0,
		o_Cout  => open,	-- we dont use the Cout because the PC will never have its MSB increased
		);
		
	adder0 : adder_N_bit
	port MAP(
		i_A		=> s_A0,
		i_B     => i_BA,	-- branch address after shift left 2 in overall design
		i_Cin   => '0',		-- no carry in
		o_S     => s_A1,
		o_Cout  => open		-- we dont use the Cout because the PC will never have its MSB increased
		);
		
	mux0: mux2t1_N 
	port map(
		i_S 	=> i_Branch,-- select branch address when this bit is set, D0 when not
		i_D0    => s_A0,	-- output from adder0, just next instruction address
		i_D1    => s_A1,	-- output from adder1, branch address
		o_O     => s_M0,	-- either next instruction address or branch address
		);
	
	mux1: mux2t1_N 
	port map(
		i_S 	=> i_Jump,	-- select either next instr addr or BA when this bit is set, JA when not
		i_D0    => i_JA,	-- 32 bit jump address
		i_D1    => s_M0,	-- either next instruction address or branch address
		o_O     => o_PC,	-- next PC value
		);
	
end structure;