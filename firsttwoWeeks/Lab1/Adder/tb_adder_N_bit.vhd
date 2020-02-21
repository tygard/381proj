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
entity tb_adder_N_bit is
  generic(N : integer := 32);
end tb_adder_N_bit;

architecture mixed of tb_adder_N_bit is

-- Define the total clock period time

-- We will be instantiating our design under test (DUT), so we need to specify its
-- component interface.
-- TODO: change component declaration as needed.
component adder_N_bit
  port(
       i_A 		            : in std_logic_vector(N-1 downto 0);
	   i_B 		            : in std_logic_vector(N-1 downto 0);
	   i_Cin 		        : in std_logic;
       o_S 		            : out std_logic_vector(N-1 downto 0);
	   o_Cout 		        : out std_logic);
end component;

-- TODO: change input and output signals as needed.
signal s_i_A      : std_logic_vector(N-1 downto 0);
signal s_i_B      : std_logic_vector(N-1 downto 0);
signal s_i_Cin    : std_logic;
signal s_o_S      : std_logic_vector(N-1 downto 0);
signal s_o_Cout   : std_logic;

begin

  -- TODO: Actually instantiate the component to test and wire all signals to the corresponding
  -- input or output. Note that DUT0 is just the name of the instance that can be seen 
  -- during simulation. What follows DUT0 is the entity name that will be used to find
  -- the appropriate library component during simulation loading.
  DUT0: adder_N_bit
  generic map(N => N)
  port map(
            i_A       => s_i_A,
			i_B       => s_i_B,
			i_Cin     => s_i_Cin,
            o_S       => s_o_S,
			o_Cout    => s_o_Cout);
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
  s_i_A       <= X"00000001"; 
  s_i_B       <= X"00000000"; 
  s_i_Cin     <= '0'; 
  --Expected sum to be 00000001 and Cout to be 00000000
   
  --Expected sum to be 00000001 and Cout to be 00000000
    wait for 100 ns;
--------------------------------------------
    -- Test case 2:
    -- Perform average example of an input activation of 3 and a partial sum of 25. The weight is still 10. 
   s_i_A       <= X"0000000A"; 
   s_i_B       <= X"0000000B"; 
   s_i_Cin     <= '0';
  --expectinf sum to be 00000015 and cout nothing
  
--------------------------------------------
    -- Expect: s_W internal signal to be 10 after positive edge of clock
	wait for 100 ns;
    -- Test case 2:
    -- Perform average example of an input activation of 3 and a partial sum of 25. The weight is still 10. 
    s_i_A       <= X"11111111"; 
    s_i_B       <= X"00000000"; 
    s_i_Cin     <= '1'; 
  --sum will equal.....
 
  --Expected sum to be 00000001 and Cout to be 00000000
    wait for 100 ns;
	
	s_i_A       <= X"F0083940"; 
    s_i_B       <= X"F343ABC0"; 
    s_i_Cin     <= '0'; 
--------------------------------------------
   
  end process;

end mixed;