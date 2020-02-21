library IEEE;
use IEEE.std_logic_1164.all;

entity dataflow21mux is

port( W0, W1: in std_logic_vector;
	SEL: in std_logic_vector(1 downto 0);
        o_Q  : out std_logic_vector(1 downto 0));
end dataflow21mux;

architecture dataflow of dataflow21mux is


begin
with SEL  select
	o_Q <= 
W0 when "00",
W1 when "01",


 (others=>'0') when others;
end dataflow;