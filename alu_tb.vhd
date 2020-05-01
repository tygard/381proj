
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;  -- For logic types I/O
library std;
use std.env.all;                -- For hierarchical/external signals
use std.textio.all;             -- For basic I/O

entity alu_tb is
  generic(N : integer := 32);   -- Generic for half of the clock cycle period
end alu_tb;

architecture mixed of alu_tb is


component f_alu
generic(N : integer := 32);
  port(i_A         : in std_logic_vector(N-1 downto 0);  --input 1
		i_B         : in std_logic_vector(N-1 downto 0);  --input 2
		i_C	        : in std_logic_vector (4 downto 0);   --alu control
		o_S         : out std_logic_vector(31 downto 0); --sum output
		o_C         : out std_logic_vector(31 downto 0); --carry output
		o_Overflow  : out std_logic);
end component;


signal s_i_A   : std_logic;
signal s_i_B  : std_logic_vector(N-1 downto 0);
signal s_i_C  : std_logic_vector(N-1 downto 0);
signal s_o_S   : std_logic_vector(N-1 downto 0);
signal s_o_C   : std_logic_vector(N-1 downto 0);
signal s_o_Overflow   : std_logic_vector(N-1 downto 0);

begin


  DUT0: f_alu
  generic map(N => N)
  port map( i_S      => s_i_S,
            i_D0     => s_i_D0,
            i_D1     => s_i_D1,
            o_O      => s_o_O);
  
  
  P_TEST_CASES: process
  begin
    wait for 100 ns ; -- for waveform clarity, I prefer not to change inputs on clk edges100

  
s_i_A  <='0X00000000';
s_i_B  <=
s_i_C  <=
 

wait for 100 ns;
  
s_i_A  <=
s_i_B  <=
s_i_C  <=v

   
   end process;

end mixed;
