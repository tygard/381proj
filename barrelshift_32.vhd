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
       i_D	        : in std_logic;     					 -- Shift direction input (0: right, 1: left)
       i_T          : in std_logic;     					 -- Shift type input (0: logical, 1: arith.)
	   i_X          : in std_logic_vector(31 downto 0);     -- Data value input
       o_Y          : out std_logic_vector(31 downto 0));   -- Data value output

end barrelshift_32;

architecture structural of barrelshift_32 is

	signal s_iS : std_logic;							-- if arithmetic shift: MSB of i_X
	signal s_iF : std_logic_vector(N-1 downto 0);		-- if leftward shift: contains flipped version of s_iX
	-- Signals to handle connections between the MUX rows
	signal s_iM : std_logic_vector(N-1 downto 0);		-- output of MUX used for leftward shift
	signal s_iA : std_logic_vector(N-1 downto 0);		-- output of MUX A
	signal s_iB : std_logic_vector(N-1 downto 0);		-- output of MUX B
	signal s_iC : std_logic_vector(N-1 downto 0);		-- output of MUX C
	signal s_iD : std_logic_vector(N-1 downto 0);		-- output of MUX D
	signal s_iE : std_logic_vector(N-1 downto 0);		-- output of MUX E
	signal s_iG : std_logic_vector(N-1 downto 0);		-- if leftward shift: contains flipped version of s_iS
	
	-- N-bit 2:1 MUX
	component mux2t1_N
		port(i_S          : in std_logic;
			 i_D0         : in std_logic_vector(N-1 downto 0);
			 i_D1         : in std_logic_vector(N-1 downto 0);
			 o_O          : out std_logic_vector(N-1 downto 0));
	end component;
	
	component andg2
		port(i_A          : in std_logic;
			 i_B          : in std_logic;
			 o_F          : out std_logic);
	end component;
		
	component reverser_32 is
		port(i_X : in std_logic_vector(31 downto 0);
			 o_Y : out std_logic_vector(31 downto 0));
	end component;
	
	begin
		
	
		---------------------------------------------------------------------------
		-- Level 0: reverser used for logical shift functionality
		---------------------------------------------------------------------------
		g_REVERSERA: reverser_32
		port MAP(i_X => i_X,
				 o_Y => s_iF);
				 
		---------------------------------------------------------------------------
		-- Level 1: AND gate used for arithmetic shift functionality
		---------------------------------------------------------------------------
		g_ANDA: andg2
		port MAP(i_A => i_T,
				 i_B => i_X(31),
				 o_F => s_iS);
				 
		g_MUXF: mux2t1_N
		port MAP(i_S               => i_D,
				 i_D0			   => i_X,
				 i_D1              => s_iF,
				 o_O               => s_iM);
				 
		---------------------------------------------------------------------------
		-- Level 2: leftmost MUX array (A) configured to shift 1 bit right
		-- if the LSB of shift amount is 1
		---------------------------------------------------------------------------
		g_MUXA: mux2t1_N
		port MAP(i_S               => i_SHAMT(0),
				 i_D0			   => s_iM,
				 i_D1              => s_iS & i_X(31 downto 1),	-- concatenate 
				 o_O               => s_iA);
				 
		---------------------------------------------------------------------------
		-- Level 3: MUX array B configured to shift 2 bits right
		---------------------------------------------------------------------------
		g_MUXB: mux2t1_N
		port MAP(i_S               => i_SHAMT(1),
				 i_D0			   => s_iA,
				 i_D1              => s_iS & s_iS & s_iA(31 downto 2),
				 o_O               => s_iB);
				 
		---------------------------------------------------------------------------
		-- Level 4: MUX array C configured to shift 4 bits right
		---------------------------------------------------------------------------
		g_MUXC: mux2t1_N
		port MAP(i_S               => i_SHAMT(2),
				 i_D0			   => s_iB,
				 i_D1              => s_iS & s_iS & s_iS & s_iS & s_iB(31 downto 4),
				 o_O               => s_iC);
		
		---------------------------------------------------------------------------
		-- Level 5: MUX array D configured to shift 8 bits right
		---------------------------------------------------------------------------
		g_MUXD: mux2t1_N
		port MAP(i_S               => i_SHAMT(3),
				 i_D0			   => s_iC,
				 i_D1              => s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iC(31 downto 8),
				 o_O               => s_iD);
  
  		---------------------------------------------------------------------------
		-- Level 6: MUX array E configured to shift 16 bits right
		---------------------------------------------------------------------------
		g_MUXE: mux2t1_N
		port MAP(i_S               => i_SHAMT(4),
				 i_D0			   => s_iD,
				 i_D1              => s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iS & s_iD(31 downto 16),
				 o_O               => s_iE);
				 
  		---------------------------------------------------------------------------
		-- Level 7: second reverser used for rightward shifts
		---------------------------------------------------------------------------
		g_REVERSERB: reverser_32
		port MAP(i_X => s_iE,
				 o_Y => s_iG);
				 
  		---------------------------------------------------------------------------
		-- Level 8: MUX to select output based on shift direction
		---------------------------------------------------------------------------
		g_MUXG: mux2t1_N
		port MAP(i_S               => i_D,
				 i_D0			   => s_iE,
				 i_D1              => s_iG,
				 o_O               => o_Y); 
				 
		
end structural;