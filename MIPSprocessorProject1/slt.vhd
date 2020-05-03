-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity slt is

  port(i_A          : in std_logic_vector(31 downto 0);
       i_B          : in std_logic_vector(31 downto 0);
       o_F          : out std_logic);

end slt;

architecture dataflow of slt is
begin
-- might need to subtract then compare to zero w signal
 process(i_A, i_B)
	begin
	if(i_A < i_B) then
		
			o_F <= '0';
		
	else
	
		o_F <= '1';
	
	end if;
	
	end process;
  
end dataflow;
