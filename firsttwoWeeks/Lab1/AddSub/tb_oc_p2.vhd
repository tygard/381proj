-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- tb_TPU_MV_Element.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a testbench for the TPU MAC unit.
--              
-- 01/03/2020 by H3::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;  -- For logic types I/O
library std;
use std.env.all;                -- For hierarchical/external signals
use std.textio.all;             -- For basic I/O

-- Usually name your testbench similar to below for clarity tb_<name>
-- TODO: change all instances of tb_TPU_MV_Element to reflect the new testbench.
entity tb_oc_p2 is
  generic(N : integer := 32);   -- Generic for half of the clock cycle period
end tb_oc_p2;

architecture mixed of tb_oc_p2 is

-- We will be instantiating our design under test (DUT), so we need to specify its
-- component interface.
-- TODO: change component declaration as needed.
component oc_p2
generic(N : integer := 32);
  port(
       i_D1 		            : in std_logic_vector(N-1 downto 0);
       o_O 		            : out std_logic_vector(N-1 downto 0));
end component;

-- Create signals for all of the inputs and outputs of the file that you are testing
-- := '0' or := (others => '0') just make all the signals start at an initial value of zero

-- TODO: change input and output signals as needed.
signal s_i_D1   : std_logic_vector(N-1 downto 0);
signal s_o_O   : std_logic_vector(N-1 downto 0);

begin

  -- TODO: Actually instantiate the component to test and wire all signals to the corresponding
  -- input or output. Note that DUT0 is just the name of the instance that can be seen 
  -- during simulation. What follows DUT0 is the entity name that will be used to find
  -- the appropriate library component during simulation loading.
  DUT0: oc_p2
  generic map(N => N)
  port map(
            i_D1      => s_i_D1,
            o_O       => s_o_O);
  --You can also do the above port map in one line using the below format: http://www.ics.uci.edu/~jmoorkan/vhdlref/compinst.html 
  
  -- Assign inputs for each test case.
  -- TODO: add test cases as needed.
  P_TEST_CASES: process
  begin
    wait for 100 ns; -- for waveform clarity, I prefer not to change inputs on clk edges


--DO WE INPUT BINARY, DECIMAL????????
--CAN WE ASSUME INPUT WILL BE FILLED WITH 0S
   ----------------------------
   
    -- Test case 1:
    -- Initialize weight value to 10.
    s_i_D1   <= X"00000000";  -- Not strictly necessary, but this makes the testcases easier to read
  
    wait for 100 ns;
    -- Expect: s_W internal signal to be 10 after positive edge of clock

    -- Test case 2:
    -- Perform average example of an input activation of 3 and a partial sum of 25. The weight is still 10. 
    s_i_D1   <= X"FFFFFFFF";  
   
  end process;

end mixed;