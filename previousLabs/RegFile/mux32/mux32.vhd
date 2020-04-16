library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL;



entity mux32 is

  port(i_A0 : in std_logic_vector(31 downto 0);
       i_A1 : in std_logic_vector(31 downto 0);
       i_A2 : in std_logic_vector(31 downto 0);
       i_A3 : in std_logic_vector(31 downto 0);
       i_A4 : in std_logic_vector(31 downto 0);
       i_A5 : in std_logic_vector(31 downto 0);
       i_A6 : in std_logic_vector(31 downto 0);
       i_A7 : in std_logic_vector(31 downto 0);
       i_A8 : in std_logic_vector(31 downto 0);
       i_A9 : in std_logic_vector(31 downto 0);
       i_A10 : in std_logic_vector(31 downto 0);
       i_A11 : in std_logic_vector(31 downto 0);
       i_A12 : in std_logic_vector(31 downto 0);
       i_A13 : in std_logic_vector(31 downto 0);
       i_A14 : in std_logic_vector(31 downto 0);
       i_A15 : in std_logic_vector(31 downto 0);
       i_A16 : in std_logic_vector(31 downto 0);
       i_A17: in std_logic_vector(31 downto 0);
       i_A18: in std_logic_vector(31 downto 0);
       i_A19: in std_logic_vector(31 downto 0);
       i_A20 : in std_logic_vector(31 downto 0);
       i_A21 : in std_logic_vector(31 downto 0);
       i_A22 : in std_logic_vector(31 downto 0);
       i_A23 : in std_logic_vector(31 downto 0);
       i_A24 : in std_logic_vector(31 downto 0);
       i_A25 : in std_logic_vector(31 downto 0);
       i_A26 : in std_logic_vector(31 downto 0);
       i_A27 : in std_logic_vector(31 downto 0);
       i_A28 : in std_logic_vector(31 downto 0);
       i_A29 : in std_logic_vector(31 downto 0);
       i_A30 : in std_logic_vector(31 downto 0);
       i_A31 : in std_logic_vector(31 downto 0);
       i_S  : in std_logic_vector(4 downto 0);
       o_F  : out std_logic_vector(31 downto 0));

end mux32;

architecture dataflow of mux32 is
 


begin


 with i_S select
    o_F <=
          i_A0	when "00000",
          i_A1	when "00001",
          i_A2	when "00010",
          i_A3	when "00011",
          i_A4	when "00100",
          i_A5	when "00101",
          i_A6	when "00110",
          i_A7	when "00111",
          i_A8	when "01000",
          i_A9	when "01001",
          i_A10 when "01010",
          i_A11 when "01011",
          i_A12 when "01100",
          i_A13 when "01101",
          i_A14 when "01110",
          i_A15 when "01111",
          i_A16 when "10000",
          i_A17 when "10001",
          i_A18 when "10010",
          i_A19 when "10011",
          i_A20 when "10100",
          i_A21 when "10101",
          i_A22 when "10110",
          i_A23 when "10111",
          i_A24 when "11000",
          i_A25 when "11001",
          i_A26 when "11010",
          i_A27 when "11011",
          i_A28 when "11100",
          i_A29 when "11101",
          i_A30 when "11110",
          i_A31 when "11111",
          "00000000000000000000000000000000"  when others;
  
end dataflow;