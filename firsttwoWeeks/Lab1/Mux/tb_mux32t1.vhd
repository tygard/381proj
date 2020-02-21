-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------
-- tb_mux2t1N_Element.vhd
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
-- TODO: change all instances of tb_mux2t1N_Element to reflect the new testbench.
entity tb_mux32t1 is
 
end tb_mux32t1;

architecture mixed of tb_mux32t1 is

-- Define the total clock period time
-- constant cCLK_PER  : time := gCLK_HPER * 2;

-- We will be instantiating our design under test (DUT), so we need to specify its
-- component interface.
-- TODO: change component declaration as needed.
component mux32t1 is

  port(
	   i_S	     : in std_logic_vector(4 downto 0);
       i_D		 : in std_logic_vector(31 downto 0);
       o_Q 		 : out std_logic);
end component;

-- Create signals for all of the inputs and outputs of the file that you are testing
-- := '0' or := (others => '0') just make all the signals start at an initial value of zero
-- signal CLK, reset : std_logic := '0';

-- TODO: change input and output signals as needed.
signal s_i_S   : std_logic_vector(4 downto 0);
signal s_i_D   : std_logic_vector(31 downto 0);
signal s_o_Q   : std_logic;

begin

  -- TODO: Actually instantiate the component to test and wire all signals to the corresponding
  -- input or output. Note that DUT0 is just the name of the instance that can be seen 
  -- during simulation. What follows DUT0 is the entity name that will be used to find
  -- the appropriate library component during simulation loading.
  DUT0: mux32t1

  port map(
  
            -- iCLK     => CLK,
            i_S      => s_i_S,
            i_D0     => s_i_D0,
            i_D1     => s_i_D1,
            o_O      => s_o_O);
  --You can also do the above port map in one line using the below format: http://www.ics.uci.edu/~jmoorkan/vhdlref/compinst.html

  --This first process is to setup the clock for the test bench
  -- P_CLK: process
  -- begin
    -- CLK <= '1';         -- clock starts at 1
    -- wait for gCLK_HPER; -- after half a cycle
    -- CLK <= '0';         -- clock becomes a 0 (negative edge)
    -- wait for gCLK_HPER; -- after half a cycle, process begins evaluation again
  -- end process;

  -- This process resets the sequential components of the design.
  -- It is held to be 1 across both the negative and positive edges of the clock
  -- so it works regardless of whether the design uses synchronous (pos or neg edge)
  -- or asynchronous resets.
  -- P_RST: process
  -- begin
  	-- reset <= '0';   
    -- wait for gCLK_HPER/2;
	-- reset <= '1';
    -- wait for gCLK_HPER*2;
	-- reset <= '0';
	-- wait;
  -- end process;  
  
  -- Assign inputs for each test case.
  -- TODO: add test cases as needed.
  P_TEST_CASES: process
  begin
  wait for 100 ns ; -- for waveform clarity, I prefer not to change inputs on clk edges100

   ----------------------------
   
    -- Test case 1:
    -- Initialize weight value to 10.
    s_i_S   <= '1';  -- Not strictly necessary, but this makes the testcases easier to read
    s_i_D0   <= '0';
    s_i_D1 <= '1';
   --  --do we need o_o output?  -- Not strictly necessary, but this makes the testcases easier to read
    wait for 100 ns;
    -- Expect: s_W internal signal to be 10 after positive edge of clock

    -- Test case 2:
    -- Perform average example of an input activation of 3 and a partial sum of 25. The weight is still 10. 
    s_i_S   <= '0';  -- Not strictly necessary, but this makes the testcases easier to read
    s_i_D0   <= '0';
    s_i_D1 <= '1';
    --do we need o_o
    -- wait for gCLK_HPER*2;
    -- wait for gCLK_HPER*2;
   
    -- Expect: o_Y output signal to be 55 = 3*10+25 and o_X output signal to be 3 after two positive edge of clock.

    -- TODO: add test cases as needed (at least 3 more for this lab)
  end process;

end mixed;
