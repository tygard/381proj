library IEEE;
use IEEE.std_logic_1164.all;

entity invg is

  port(i_A          : in std_logic_vector(31 downto 0);
       o_F          : out std_logic_vector(31 downto 0));

end invg;

architecture dataflow of invg is
begin

  o_F <= not i_A;
  
end dataflow;