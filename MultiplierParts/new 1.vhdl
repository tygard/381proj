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
       i_A 				: in std_logic_vector(31 downto 0);
	   i_B				: in std_logic;
	   i_CIN			: in std_logic;
       o_FA 		    : out std_logic_vector(31 downto 0);
	   o_COUT			: out std_logic);
end Mult32t1;

architecture structure of myFirstMIPSDataPath is
  
  
  component mipsfinaldesign
    port(
       iCLK                 : in std_logic;
	   i_reg_reset          : in std_logic;
       i_DS 				: in std_logic_vector(4 downto 0);
	   i_RR1				: in std_logic_vector(4 downto 0);
	   i_RR2				: in std_logic_vector(4 downto 0);
	   i_data				: in std_logic_vector(31 downto 0);
       o_M1 		        : out std_logic_vector(31 downto 0);
       o_M2 		        : out std_logic_vector(31 downto 0));
  end component;

  component add_sub_N_bit
    port(	
		i_A         : in std_logic_vector(31 downto 0);
		i_B         : in std_logic_vector(31 downto 0);
		i_SELECT    : in std_logic;
		o_S         : out std_logic_vector(31 downto 0);
		o_Cout      : out std_logic);
	
  end component;

  component mux32t1_2
    port(	
		i_D0    : in std_logic_vector(31 downto 0);
		i_D1    : in std_logic_vector(31 downto 0);
		i_S     : in std_logic;
        o_Q     : out std_logic_vector(31 downto 0));	
  end component;

--Signal for the register
  signal s_o_RF0		: std_logic_vector(31 downto 0);
  signal s_o_RF1		: std_logic_vector(31 downto 0);
  
--mux
  signal s_o_Imm	: std_logic_vector(31 downto 0);

--Signal for Mux
--  signal s_o_M1		: out std_logic_vector (31 downto 0);
--  signal s_o_M2		: out std_logic_vector (31 downto 0));

begin

  ---------------------------------------------------------------------------
  -- 32regi_part1_thingy
  ---------------------------------------------------------------------------
  g_part1: mipsfinaldesign
    port MAP(iCLK    => iCLK,
	   i_reg_reset   => i_reg_reset,
       i_DS 			=> i_DS,
	   i_RR1	=> i_RR1,
	   i_RR2	=> i_RR2,
	   i_data   => i_data,
       o_M1     => s_o_RF0,
       o_M2     => s_o_RF1);        
  ---------------------------------------------------------------------------
  -- new_32t1mux_2
  ---------------------------------------------------------------------------
  g_mux2_part2: mux32t1_2
port MAP(i_D0 => s_o_RF1,
		i_D1  => i_immediate,
		i_S  => i_immediate_select,
        o_Q  => s_o_Imm);
  ---------------------------------------------------------------------------
  -- ALU
  ---------------------------------------------------------------------------
 	     g_lab1_alu: add_sub_N_bit
port MAP(
		i_A       => s_o_RF0,
		i_B       => s_o_Imm,
		i_SELECT  => i_alu_select,
		o_S       => o_output,
		o_Cout    => o_overflow);
		
  end structure;
