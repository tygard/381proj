

library IEEE;
use IEEE.std_logic_1164.all;

entity mux_dataflow is
  port(i_A  : in std_logic;
       i_B  : in std_logic;
       i_S  : in std_logic;
       o_F  : out std_logic);

end mux_dataflow;

architecture dataflow of mux_dataflow is

  -- Signals to store A*x, B*x
  signal tNotS : std_logic;
  signal tAndA : std_logic;
  signal tAndB : std_logic;

begin

  tNotS <= not i_S;
  tAndA <= i_A and tNotS;
  tAndB <= i_B and i_s;
  
   o_F <= (i_A and not i_S) or (i_S and i_B);
end dataflow;