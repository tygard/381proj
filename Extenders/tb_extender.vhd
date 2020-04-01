library IEEE;
use IEEE.std_logic_1164.all;


entity tb_extender is
end tb_extender;

architecture behavior of tb_extender is

  component extender
    generic(Y: integer := 16);
    port(input : in std_logic_vector(Y-1 downto 0);
         sign  : in std_logic;
         output: out std_logic_vector(31 downto 0));
  end component;

  signal s_in : std_logic_vector(16-1 downto 0);
  signal s_sign : std_logic;
  signal s_output : std_logic_vector(31 downto 0);
  
begin

  ext: extender
  port map(s_in, s_sign, s_output);

  P_TB: process
  begin

    s_in <= x"FFFF";
    s_sign <= '0';
	wait for 100 ns;

    s_sign <= '1';
	wait for 100 ns;

    s_in <= x"0FFF";
    s_sign <= '0';
	wait for 100 ns;

    s_sign <= '1';
	wait for 100 ns;

  end process;
  
end behavior;