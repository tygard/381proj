
library IEEE;
use IEEE.std_logic_1164.all;


entity onesComplemntor is

  port(i_S      : in std_logic_vector(31 downto 0);
       o_O 	    : out std_logic_vector(31 downto 0));

end onesComplemntor;

architecture structure of onesComplemntor is
  
  -- Describe the component entities as defined in Adder.vhd, Reg.vhd,
  -- Multiplier.vhd, RegLd.vhd (not strictly necessary).
  component invg32
    port(i_A             : in std_logic_vector(31 downto 0);
         o_F             : out std_logic_vector(31 downto 0));
  end component;

begin

  ---------------------------------------------------------------------------
  -- NOT
  ---------------------------------------------------------------------------
 
  g_not: invg32
    port MAP(i_A    => i_S,
             o_F    => o_O);

  end structure;
