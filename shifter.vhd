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


entity myFirstMIPSDataPath is

  port( i_A         : in std_logic_vector(31 downto 0);
		i_l_or_r    : in std_logic;
		o_F         : out std_logic_vector(31 downto 0));

end myFirstMIPSDataPath;

architecture structure of myFirstMIPSDataPath is
  
  
  component andg2
    port(
        i_A       : in std_logic_vector(31 downto 0);
		i_B       : in std_logic_vector(31 downto 0);
		o_F       : out std_logic_vector(31 downto 0));
  end component;

  component ingv
    port(	
		i_A          : in std_logic_vector(31 downto 0);
        o_F          : out std_logic_vector(31 downto 0));
	
  end component;

  component org2
    port(	
		 i_A      : in std_logic_vector(31 downto 0);
		 i_B      : in std_logic_vector(31 downto 0);
		 o_F      : out std_logic_vector(31 downto 0));
  end component;

--Signal for the register
  signal s_o_RF0		: std_logic_vector(31 downto 0);
  signal s_o_RF1		: std_logic_vector(31 downto 0);

begin

  ---------------------------------------------------------------------------
  -- and
  ---------------------------------------------------------------------------
  g_part1: mipsfinaldesign
    port MAP(iCLK    => iCLK,
	   i_reg_reset   => i_reg_reset,
       i_DS 		 => i_DS,
	   i_RR1	=> i_RR1,
	   i_RR2	=> i_RR2,
	   i_data   => s_alu_to_reg,
       o_M1     => s_o_RF0,
       o_M2     => s_o_RF1);        
 
		
  end structure;
