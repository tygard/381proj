library IEEE;
use IEEE.std_logic_1164.all;

entity mux2t1 is
  port(i_A  : in std_logic;
       i_B  : in std_logic;
       i_S  : in std_logic;
       o_F  : out std_logic);

end mux2t1;


architecture structure of mux2t1 is

  component andg2
    port(i_A  : in std_logic;
         i_B  : in std_logic;
         o_F  : out std_logic);
  end component;

  component org2
    port(i_A  : in std_logic;
         i_B  : in std_logic;
         o_F  : out std_logic);
  end component;

  component invg
    port(i_A  : in std_logic;
         o_F  : out std_logic);
  end component;

 
  signal tNotS : std_logic;
  signal tAndA : std_logic;
  signal tAndB : std_logic;

begin


  invg_1: invg
    port MAP(i_A => i_S,
           o_F => tNotS);
  andg_1: andg2
    port MAP(i_A => tNotS,
             i_B => i_A,
             o_F => tAndA);
  andg_2: andg2
    port MAP(i_A => i_S,
             i_B => i_B,
             o_F => tAndB);
  org_1: org2
    port MAP(i_A => tAndA,
             i_B => tAndB,
             o_F => o_F);

  
end structure;