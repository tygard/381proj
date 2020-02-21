
library IEEE;
use IEEE.std_logic_1164.all;


entity mux2t1 is

 port(i_S       : in std_logic;
       i_D0	    : in std_logic;
       i_D1     : in  std_logic;
       o_O 	    : out std_logic);


end mux2t1;

architecture structure of mux2t1 is
  
  -- Describe the component entities as defined in Adder.vhd, Reg.vhd,
  -- Multiplier.vhd, RegLd.vhd (not strictly necessary).
  component invg
    port(i_A      : in std_logic;
         o_F      : out std_logic);
  end component;

  component andg2
    port(i_A      : in std_logic;
         i_B      : in std_logic;
         o_F      : out std_logic);
  end component;

  component org2
    port(i_A       : in std_logic;
         i_B             : in std_logic;
         o_F             : out std_logic);
  end component;


  -- Signal to carry stored weight
  signal notSelect, AndNotSelectandA, AndSelectandB         : std_logic;

begin

  ---------------------------------------------------------------------------
  -- NOT
  ---------------------------------------------------------------------------
 
  g_not: invg
    port MAP(i_A              => i_S,
             o_F               => notSelect);


  ---------------------------------------------------------------------------
  -- ANDS
  ---------------------------------------------------------------------------

  g_andAandnotSelect: andg2
    port MAP(i_A               => i_D0,
             i_B               => notSelect,
             o_F               => AndNotSelectandA);
			 
			 
	g_andBandSelect: andg2
    port MAP(i_A               => i_D1,
             i_B               => i_S,
             o_F               => AndSelectandB);

    
  ---------------------------------------------------------------------------
  -- OR
  ---------------------------------------------------------------------------

  g_FINALoR: org2
    port MAP(i_A               => AndNotSelectandA,
             i_B               => AndSelectandB,
             o_F               => o_O);
    

  end structure;
