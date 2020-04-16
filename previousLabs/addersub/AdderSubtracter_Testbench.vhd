library IEEE;
use IEEE.std_logic_1164.all;
-- use work.FullAdderStructural;
-- use work.AdderSubtracter;
entity AdderSubtracter_Testbench is
  generic(N : integer := 8);

end AdderSubtracter_Testbench;

architecture structure of AdderSubtracter_Testbench is

component nbit_adder_sub  is 
    generic (N : integer := N);
    port(		
		i_nA  		: in std_logic_vector(N-1 downto 0);
        i_nB  		: in std_logic_vector(N-1 downto 0);
		sub_sel		: in std_logic;
        n_out  		: out std_logic_vector(N-1 downto 0);
        carry_out  	: out std_logic
		);

end component; 
  
signal i_tA  :  std_logic_vector(N-1 downto 0);
signal i_tB  :  std_logic_vector(N-1 downto 0);
signal i_tS  :  std_logic;
signal o_tF  :  std_logic_vector(N-1 downto 0);
signal o_tC  :  std_logic;

begin


  g_Adder: nbit_adder_sub
    generic map(
		N	 => N)
    port map
		(
			i_nA  		=> i_tA,
			i_nB  		=> i_tB,
			sub_sel		=> i_tS,
			n_out 		=> o_tF,
			carry_out  	=> o_tC
		);
  process
    begin
	
		i_tA <= "11111111"; -- 127 + 1 = overflow = -1
		i_tB <= "00000001";      
		i_tS <= '0';
		wait for 100 ns;


		i_tA <= "11111111"; -- -1 + 1 = overflow = 0
		i_tB <= "00000001";      
		i_tS <= '0';
		wait for 100 ns;


		i_tA <= x"0F"; -- 15 - 48 = -32
		i_tB <= x"30";
		i_tS <= '1';
		wait for 100 ns;


		i_tA <= "10000001"; -- -127 - -122 = -5
		i_tB <= "10000110";
		i_tS <= '1';
		wait for 100 ns;


		i_tA <= "11110010"; -- -14 + -3 = -17
		i_tB <= "11111101";
		i_tS <= '0';
		wait for 100 ns;


		i_tA <= x"FF"; -- -1 + 1 = 0
		i_tB <= x"01";      
		i_tS <= '0';
		wait for 100 ns;
		
		i_tA <= x"0F"; -- 15 - 33 = -18
		i_tB <= x"30";
		i_tS <= '1';
		wait for 100 ns;
		
		i_tA <= "00010100"; -- 20 + 16 = 36
		i_tB <= x"30";
		i_tS <= '0';
		wait for 100 ns;
		
		i_tA <= "00010100"; -- 20 - 16 = 4
		i_tB <= x"30";
		i_tS <= '1';
		wait for 100 ns;
      
  end process;
  
end structure;