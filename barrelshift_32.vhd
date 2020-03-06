-- barrelshift_32.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a barrel shifter
-- for a 32-bit binary input with support for shifting in either
-- direction, both logically and arithmetically. The implementation
-- uses logarithmic shifting.
--
-- NOTES:
-- 2/21/2020 by zbesta::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity barrelshift_32 is
  generic(N : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
  port(i_SHAMT      : in std_logic_vector(4 downto 0);		 -- Shift amount input
       i_D	        : in std_logic;     					 -- Shift direction input (0: left, 1: right)
       i_T          : in std_logic;     					 -- Shift type input (0: logical, 1: arith.)
	   i_X          : in std_logic_vector(31 downto 0);     -- Data value input
       o_Y          : out std_logic_vector(31 downto 0));   -- Data value output

end barrelshift_32;

architecture structural of barrelshift_32 is

	-- Signals to handle connections between the MUX rows
	signal s_iA : std_logic_vector(N-1 downto 0);		-- output of MUX A
	signal s_iB : std_logic_vector(N-1 downto 0);		-- output of MUX B
	signal s_iC : std_logic_vector(N-1 downto 0);		-- output of MUX C
	signal s_iD : std_logic_vector(N-1 downto 0);		-- output of MUX D
	signal s_iE : std_logic_vector(N-1 downto 0);		-- output of MUX E (test signal)
	
	
	-- N-bit 2:1 MUX
	component mux2t1_N
		port(i_S          : in std_logic;
			 i_D0         : in std_logic_vector(N-1 downto 0);
			 i_D1         : in std_logic_vector(N-1 downto 0);
			 o_O          : out std_logic_vector(N-1 downto 0));
	end component;
	
	begin
		-- TODO: add shift-right and arithmetic functionality before the first MUX
		---------------------------------------------------------------------------
		-- Level 0: leftmost MUX array (A) configured to shift 1 bit right
		-- if the LSB of shift amount is 1
		---------------------------------------------------------------------------
		g_MUXA: mux2t1_N
		port MAP(i_S               => i_SHAMT(0),
				 i_D0			   => i_X,
				 i_D1              => "0" & i_X(31 downto 1),	-- concatenate 
				 o_O               => s_iA);
				 
		---------------------------------------------------------------------------
		-- Level 1: MUX array B configured to shift 2 bits right
		---------------------------------------------------------------------------
		g_MUXB: mux2t1_N
		port MAP(i_S               => i_SHAMT(1),
				 i_D0			   => s_iA,
				 i_D1              => "00" & s_iA(31 downto 2),
				 o_O               => s_iB);
				 
		---------------------------------------------------------------------------
		-- Level 2: MUX array C configured to shift 4 bits right
		---------------------------------------------------------------------------
		g_MUXC: mux2t1_N
		port MAP(i_S               => i_SHAMT(2),
				 i_D0			   => s_iB,
				 i_D1              => "0000" & s_iB(31 downto 4),
				 o_O               => s_iC);
		
		---------------------------------------------------------------------------
		-- Level 3: MUX array D configured to shift 8 bits right
		---------------------------------------------------------------------------
		g_MUXD: mux2t1_N
		port MAP(i_S               => i_SHAMT(3),
				 i_D0			   => s_iC,
				 i_D1              => "00000000" & s_iC(31 downto 8),
				 o_O               => s_iD);
  
  		---------------------------------------------------------------------------
		-- Level 4: MUX array E configured to shift 16 bits right
		---------------------------------------------------------------------------
		g_MUXE: mux2t1_N
		port MAP(i_S               => i_SHAMT(4),
				 i_D0			   => s_iD,
				 i_D1              => "0000000000000000" & s_iD(31 downto 16),
				 o_O               => o_Y);		-- final stage, so output to component output
				 
		
end structural;