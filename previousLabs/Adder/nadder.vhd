library IEEE;
use IEEE.std_logic_1164.all;

entity nadder is
  
  generic(N: integer := 8);
  
  port(i_eA : in std_logic_vector(N-1 downto 0);
       i_eB : in std_logic_vector(N-1 downto 0);
       i_eC : in std_logic;
       o_eS : out std_logic_vector(N-1 downto 0);
       o_eC : out std_logic);

end nadder;

architecture structure of nadder is
  
component fullAdder is  

  port(i_A : in std_logic;
       i_B : in std_logic;
       i_C   : in std_logic;
       o_S    : out std_logic;
       o_C   : out std_logic);
       
end component;

  
  signal temp_Carryin : std_logic_vector(N downto 0);
  
  begin
    temp_Carryin(0) <= i_eC;
    
    G1: for i in 0 to N-1 generate
      fullAdder_i: fullAdder
        port map(i_A => i_eA(i),
                 i_B => i_eB(i),
                 i_C => temp_Carryin(i),
                 o_S => o_eS(i),
                 o_C => temp_Carryin(i+1));
      end generate;
      
      o_eC <= temp_Carryin(N);
      
    
  end structure;