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
entity tb_decoder is
end tb_decoder;

architecture mixed of tb_decoder is

-- Define the total clock period time

-- We will be instantiating our design under test (DUT), so we need to specify its
-- component interface.
-- TODO: change component declaration as needed.
component Decoder
  port(
       i_S 		            : in std_logic_vector(4 downto 0);
       o_F 		            : out std_logic_vector(31 downto 0));
end component;

-- TODO: change input and output signals as needed.
signal s_i_S      : std_logic_vector(4 downto 0);
signal s_o_F      : std_logic_vector(31 downto 0);

begin

  -- TODO: Actually instantiate the component to test and wire all signals to the corresponding
  -- input or output. Note that DUT0 is just the name of the instance that can be seen 
  -- during simulation. What follows DUT0 is the entity name that will be used to find
  -- the appropriate library component during simulation loading.
  DUT0: Decoder
  port map(
            i_S       => s_i_S,
            o_F       => s_o_F);
  --You can also do the above port map in one line using the below format: http://www.ics.uci.edu/~jmoorkan/vhdlref/compinst.html

  
  --This first process is to setup the clock for the test bench
  -- This process resets the sequential components of the design.
  -- It is held to be 1 across both the negative and positive edges of the clock
  -- so it works regardless of whether the design uses synchronous (pos or neg edge)
  -- or asynchronous resets. 
  
  -- Assign inputs for each test case.
  -- TODO: add test cases as needed.
  P_TEST_CASES: process
  begin
    wait for 100 ns; -- for waveform clarity, I prefer not to change inputs on clk edges


--DO WE INPUT BINARY, DECIMAL????????
--CAN WE ASSUME INPUT WILL BE FILLED WITH 0S
   ----------------------------
   --HOW TO TEST
    -- Test case 1:
    -- Initialize weight value to 10.
  s_i_S       <= "00000"; 
  --Expected out to be 00000001
   
  --Expected sum to be 00000001 and Cout to be 00000000
    wait for 100 ns;
--------------------------------------------
    -- Test case 2:
    -- Perform average example of an input activation of 3 and a partial sum of 25. The weight is still 10. 
   s_i_S       <= "10000"; 
  --expecting out to be 100000000
  
--------------------------------------------
    -- Expect: s_W internal signal to be 10 after positive edge of clock
	wait for 100 ns;
    -- Test case 2:
    -- Perform average example of an input activation of 3 and a partial sum of 25. The weight is still 10. 
    s_i_S       <= "11111"; 
  --sum will equal.....
 
--------------------------------------------
   
  end process;

end mixed;