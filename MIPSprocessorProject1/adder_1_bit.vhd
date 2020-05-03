
library IEEE;
use IEEE.std_logic_1164.all;


entity ADDER_1_BIT is

  port(i_A         : in std_logic;
       i_B	    : in std_logic;
       i_Cin         : in  std_logic;
	     o_S	    : out std_logic;
       o_Cout 	    : out std_logic);

end ADDER_1_BIT;

architecture structure of ADDER_1_BIT is
  
  -- Describe the component entities as defined in Adder.vhd, Reg.vhd,
  -- Multiplier.vhd, RegLd.vhd (not strictly necessary).
  
component xorg2
    port(i_A            : in std_logic;
         i_B            : in std_logic;
         o_F            : out std_logic);
  end component;


  component andg2
    port(i_A            : in std_logic;
         i_B            : in std_logic;
         o_F            : out std_logic);
  end component;

  component org2
    port(i_A           : in std_logic;
         i_B           : in std_logic;
         o_F           : out std_logic);
  end component;


  -- Signal to carry stored weight
  signal XOR_A_B, AND_Cin_XORAB, AND_A_B : std_logic;

begin

  ---------------------------------------------------------------------------
  -- XOR
  ---------------------------------------------------------------------------
 
  g_xor1: xorg2
    port MAP(i_A           => i_A,
			 i_B            => i_B,
             o_F           => XOR_A_B);
			 
	g_xor2: xorg2
    port MAP(i_A           => XOR_A_B,
			i_B            => i_Cin,
             o_F           => o_S);


  ---------------------------------------------------------------------------
  -- ANDS
  ---------------------------------------------------------------------------

  g_andAandnotSelect1: andg2
    port MAP(i_A               => XOR_A_B,
             i_B               => i_Cin,
             o_F               => AND_Cin_XORAB);
			 
			 
	g_andBandSelect1: andg2
    port MAP(i_A               => i_A,
             i_B               => i_B,
             o_F               => AND_A_B);

    
  ---------------------------------------------------------------------------
  -- OR
  ---------------------------------------------------------------------------

  g_FINALoR1: org2
    port MAP(i_A               => AND_Cin_XORAB,
             i_B               => AND_A_B,
             o_F               => o_Cout);
    

  end structure;
