-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- mipsfinaldesign.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a processing
-- element for the systolic matrix-vector multiplication array inspired 
-- by Google's TPU.
--
--
-- NOTES:
-- 1/14/19 by H3::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity Mult32t1 is

  port(
       i_A 				: in std_logic_vector(31 downto 0); -- M
	   i_B				: in std_logic; -- Q
	   i_CIN			: in std_logic; -- 
	   i_FA_IN			: in std_logic_vector(31 downto 0);
      	 o_FA 		    : out std_logic_vector(31 downto 0);			
	   o_COUT			: out std_logic);
end Mult32t1;

architecture structure of Mult32t1 is
  
  component adder_1_bit
    port(
		i_A        	 : in std_logic;
		i_B        	 : in std_logic;	
		i_Cin        : in std_logic;
		o_S     	 : out std_logic;
		o_Cout       : out std_logic);
  end component;

  component andg2
    port(	
		i_A        	 : in std_logic;
		i_B        	 : in std_logic;
		o_F     	 : out std_logic);
  end component;

--Signal for the AND outputs
signal s_o_F			: std_logic_vector(31 downto 0); --signal for the AND outputs
  
--Signal for the FA outputs
signal s_o_COUT	: std_logic_vector(31 downto 0);

--Signal for Mux
--  signal s_o_M1		: out std_logic_vector (31 downto 0);
--  signal s_o_M2		: out std_logic_vector (31 downto 0));

begin

  ---------------------------------------------------------------------------
  -- 32 And Gates
  ---------------------------------------------------------------------------
  g_part1: for i in 0 to 31 generate 
	and_i:andg2
		port MAP(
			i_A    	=> i_A(i),
			i_B   	=> i_B,
			o_F 	=> s_o_F(i));
	end generate;
  ---------------------------------------------------------------------------
  -- 32 Full Adders
  ---------------------------------------------------------------------------
  
   g_part2:
	adder_1_bit 
		port map(    					    
			i_A       => s_o_F(0),   
			i_B       => i_FA_IN(0),   
			i_Cin     => '0',
			o_S       => o_FA(0),
			o_Cout    => s_o_COUT(0));
    
  g_part3: for i in 1 to 30 generate
	adder_1_bit_i: adder_1_bit
		port MAP(
			i_A       => s_o_F(i),   
			i_B       => i_FA_IN(i),   
			i_Cin     => s_o_COUT(i-1),
			o_S       => o_FA(i),
			o_Cout    => s_o_COUT(i));
	end generate;

   g_part4:
	adder_1_bit 
		port map(    					    
			i_A       => s_o_F(31),   
			i_B       => i_FA_IN(31),   
			i_Cin     => s_o_COUT(30),
			o_S       => o_FA(31),
			o_Cout    => o_COUT);
		
  end structure;
