library IEEE;
use IEEE.std_logic_1164.all;

entity fullAdder is  

  port(i_A : in std_logic;
       i_B : in std_logic;
       i_C   : in std_logic;
       o_S    : out std_logic;
       o_C   : out std_logic);
       
end fullAdder;

architecture structure of fullAdder is

component andg2 is
  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
end component;

component org2 is
  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
end component;

component xorg2 is
  port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
end component;

signal output_Xorg1, output_Andg1, output_Andg2 : std_logic;

begin
  
  g_Andg2_1 : andg2
    port map(i_A => i_A,
             i_B => i_B,
             o_F => output_Andg1);
              
  g_Andg2_2 : andg2
    port map(i_A => output_Xorg1,
             i_B => i_C,
             o_F => output_Andg2);
              
  g_Xorg2_1 : xorg2
    port map(i_A => i_A,
             i_B => i_B,
             o_F => output_Xorg1);
  
  g_Xorg2_2 : xorg2
    port map(i_A => output_Xorg1,
             i_B => i_C,
             o_F => o_S);
             
  g_Org2 : org2
    port map(i_A => output_Andg1,
             i_B => output_Andg2,
             o_F => o_C);                 
    
              
  
end structure;