-- fetch_logic.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains the fetch logic for the single-cycle MIPS Processor

-- 02/29/2020 by tygard:Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity fetch_logic is
  generic(N : integer := 32);
	port(
		i_Branch: in std_logic;
		i_Jump  : in std_logic;
		i_instr	: in std_logic_vector(31 downto 0); -- 32 instruction
		i_PC	: in std_logic_vector(31 downto 0); -- the PC value
		o_PC	: out std_logic_vector(31 downto 0) -- output to the PC register
		);
end  fetch_logic;


architecture structure of fetch_logic is

component adder_N_bit is
	port(	
		i_A    : in std_logic_vector(N-1 downto 0);
		i_B    : in std_logic_vector(N-1 downto 0);
		i_Cin  : in std_logic;
		o_S    : out std_logic_vector(N-1 downto 0);
		o_Cout : out std_logic
		);
end component;

component mux2t1_N is
	port(
		i_S     : in std_logic;
		i_D0    : in std_logic_vector(N-1 downto 0);
		i_D1    : in std_logic_vector(N-1 downto 0);
		o_O     : out std_logic_vector(N-1 downto 0)
		);
end component;

component  extender is
  generic(Y : integer := 16);
  port(input : in std_logic_vector(Y-1 downto 0);
       sign  : in std_logic;
      output: out std_logic_vector(31 downto 0));
end component;

signal s_SEBA		: std_logic_vector(31 downto 0);	
signal s_SEBASL2	: std_logic_vector(31 downto 0);	
signal s_Mux0		: std_logic_vector(31 downto 0);	
signal s_JA			: std_logic_vector(31 downto 0);	
signal s_BA			: std_logic_vector(31 downto 0);	
signal s_JASL2		: std_logic_vector(27 downto 0);	
signal s_PC4		: std_logic_vector(31 downto 0);	


begin 
	-- shift left SEBA, store in SEABSL2
	s_SEBASL2(31 downto 2) 	<= s_SEBA(29 downto 0);
	s_SEBASL2(1) 			<= '0';
	s_SEBASL2(0) 			<= '0';
	
	-- shift left inst[25:0] by 2 bits, store in JASL2
	s_JASL2 <= i_instr(25 downto 0) & "00";
	s_JASL2(27 downto 2) 	<= i_instr(25 downto 0);
	s_JASL2(1) 				<= '0';
	s_JASL2(0) 				<= '0';


	-- concatenate PC+4 and JASL2
	s_JA <= s_PC4(31 downto 28) & s_JASL2(27 downto 0);
		
		
	extender0 : extender
	port MAP(
		input 	=> i_instr(15 downto 0),
		sign	=> i_instr(15),
		output	=> s_SEBA
		);

	adder0 : adder_N_bit
	port MAP(
		i_A		=> i_PC,
		i_B     => "100",	-- add 4 to the PC
		i_Cin   => '0',		-- no carry in
		o_S     => s_PC4,
		o_Cout  => open	-- we dont use the Cout because the PC will never have its MSB increased
		);
	
	
	adder1 : adder_N_bit	
	port MAP(
		i_A		=> s_SEBASL2,
		i_B     => s_PC4,	-- branch address after shift left 2 in overall design		
		i_Cin   => '0',		-- no carry in
		o_S     => s_BA,
		o_Cout  => open		-- we dont use the Cout because the PC will never have its MSB increased
		);
		
	mux0: mux2t1_N 
	port map(
		i_S 	=> i_Branch,-- select branch address when this bit is set, D0 when not
		i_D0    => s_PC4,	-- just the PC+4
		i_D1    => s_BA,	-- output from adder1, branch address
		o_O     => s_Mux0	-- either next instruction address or branch address
		);
	
	
	mux1: mux2t1_N 
	port map(
		i_S 	=> i_Jump,	-- select either next instr addr or BA when this bit is set, JA when not
		i_D0    => s_Mux0,	-- 32 bit branch or PC+4 address	
		i_D1    => s_JA,	-- JA
		o_O     => o_PC	-- next PC value
		);
	
end structure;