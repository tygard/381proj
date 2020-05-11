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


signal s_i_A   : std_logic_vector(N-1 downto 0);
signal s_i_B  : std_logic_vector(N-1 downto 0);
signal s_i_C  : std_logic_vector(4 downto 0);
signal s_o_S   : std_logic_vector(N-1 downto 0);
signal s_o_C   : std_logic_vector(N-1 downto 0);
signal s_o_Overflow   : std_logic;

begin


  DUT0: f_alu
  generic map(N => N)
  port map(i_A => s_i_A,
  i_B => s_i_B,
  i_C => s_i_c,
  o_S => s_o_S,
  o_C => s_o_C,
  o_Overflow => s_o_Overflow);
 
  
  
  P_TEST_CASES: process
  begin
    wait for 100 ns ; -- for waveform clarity, I prefer not to change inputs on clk edges100

  
s_i_A  <= X"00000004";
s_i_B  <= X"00000000";
s_i_C  <= "01001"; --addu
 --4+0 should be 4

wait for 100 ns;
  
s_i_A  <=  X"00000008";
s_i_B  <=  X"00000000";
s_i_C  <= "01010"; --sub
--8-0 should be 8

wait for 100 ns;
  
s_i_A  <=  X"00000008";
s_i_B  <=  X"00000002";
s_i_C  <= "01000"; --add
--8+2 should be 10

wait for 100 ns;
  
s_i_A  <=  X"00000008";
s_i_B  <=  X"00000004";
s_i_C  <= "01011"; --subu
--8-4 = 4

wait for 100 ns;
  
s_i_A  <=  X"00000FFF";
s_i_B  <=  X"00000F00";
s_i_C  <= "01100"; --and
--answer should be 00000F00

wait for 100 ns;
  
s_i_A  <=  X"00000000";
s_i_B  <=  X"0000FFF0";
s_i_C  <= "01101"; --or
--answer is 0000FFF0

wait for 100 ns;
  
s_i_A  <=  X"00000F0F";
s_i_B  <=  X"000000F0";
s_i_C  <= "01110"; --xor
--answer should be 00000FFF

wait for 100 ns;
  
s_i_A  <=  X"0000000A";
s_i_B  <=  X"0000000B";
s_i_C  <= "01111"; --nor
--answer should be FFFFFFF4

wait for 100 ns;
  
s_i_A  <=  X"0000000F";
s_i_B  <=  X"0000000E";
s_i_C  <= "10000"; --slt
--answer should be 0

wait for 100 ns;
  
s_i_A  <=  X"0000000F";
s_i_B  <=  X"00000FF0";
s_i_C  <= "10001"; --sltu
--answer should be 1

wait for 100 ns;
  
s_i_A  <=  X"0000000A";
s_i_B  <=  X"00000001";
s_i_C  <= "10110"; --addi
--answer should be B

wait for 100 ns;
  
s_i_A  <=  X"00000004";
s_i_B  <=  X"00000005";
s_i_C  <= "10111"; --addiu
--answer should be 9

wait for 100 ns;
  
s_i_A  <=  X"0000000F";
s_i_B  <=  X"00000001";
s_i_C  <= "11000"; --slti
--answer should be 0

wait for 100 ns;
  
s_i_A  <=  X"00000000";
s_i_B  <=  X"0000000A";
s_i_C  <= "11001"; --sltiu
--answer should be 1

wait for 100 ns;
  
s_i_A  <=  X"00000101";
s_i_B  <=  X"00000100";
s_i_C  <= "11010"; --andi
--answer should be 00000100

wait for 100 ns;
  
s_i_A  <=  X"00000000";
s_i_B  <=  X"000000FF";
s_i_C  <= "11011"; --ori
--answer should be 000000FF

wait for 100 ns;
  
s_i_A  <=  X"00000F0F";
s_i_B  <=  X"000000F0";
s_i_C  <= "11100"; --xori
--answer should be 00000FFF



wait for 100 ns;
  
s_i_A  <=  X"00000004";
s_i_B  <=  X"00000002";
s_i_C  <= "00100"; --xor
--answer should be 00000000



wait for 100 ns;
  
s_i_A  <=  X"00000002";
s_i_B  <=  X"00000002";
s_i_C  <= "00111"; --multu
--answer should be 00000004 - comonent works on own




   end process;

end mixed;
