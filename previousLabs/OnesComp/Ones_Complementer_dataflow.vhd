library IEEE;
use IEEE.std_logic_1164.all;

entity ones_compliment_dataflow is
  generic(N : integer := 14);
  
  port(i_A  : in std_logic_vector(N-1 downto 0);
       o_F  : out std_logic_vector(N-1 downto 0));
end ones_compliment_dataflow;

  
architecture dataflow of ones_compliment_dataflow is
begin
      

      G1: for i in 0 to N-1 generate
            o_F(i) <= not i_A(i);
      end generate;
    
 end dataflow;
