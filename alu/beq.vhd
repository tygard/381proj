-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity beq is

  port(i_A          : in std_logic_vector(31 downto 0);
       i_B          : in std_logic_vector(31 downto 0);
       o_F          : out std_logic);

end beq;

architecture dataflow of beq is
begin

 process(i_A, i_B)
	begin
	if(i_A = i_B) then
		
			o_F <= '1';
		
	else
	
		o_F <= '0';
	
	end if;
	
	end process;
  
end dataflow;
