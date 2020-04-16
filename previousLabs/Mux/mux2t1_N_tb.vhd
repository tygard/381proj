library IEEE;
use IEEE.std_logic_1164.all;

-- This is an empty entity so we don't need to declare ports
entity mux2t1_N_tb is
generic(N : integer := 32);

end mux2t1_N_tb;

architecture behavior of mux2t1_N_tb is

-- Declare the component we are going to instantiate

component mux2_n is
  generic(N : integer := 32);
  port(i_A  : in std_logic_vector(N-1 downto 0);
       i_B  : in std_logic_vector(N-1 downto 0);
       i_S  : in std_logic;
       o_F  : out std_logic_vector(N-1 downto 0));

end component;


signal  s_A, s_B ,s_F : std_logic_vector(N-1 downto 0);
signal s_S : std_logic;


begin

DUT:  mux2_n
generic map(N=>N)
  port map(i_A  => s_A,
            i_B=> s_B,
            i_S=>s_S,
  	    o_F  => s_F);
       


  process
  begin


    s_A <=x"FFFFFFFF";
	s_B <=x"00000000";
    s_S <='0';
	
	

    wait for 100 ns;


    s_A <=x"48879565";
	s_B <=x"89156571";
    s_S <='1';

    wait for 100 ns;
	
  end process;

  


  
end behavior;
