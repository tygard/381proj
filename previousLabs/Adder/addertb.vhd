library IEEE;
use IEEE.std_logic_1164.all;

entity addertb is
  generic(N : integer := 8);

end addertb;

architecture structure of addertb is

component nadder is
  
  generic(N: integer := 8);
  
  port(i_eA : in std_logic_vector(N-1 downto 0);
       i_eB : in std_logic_vector(N-1 downto 0);
       i_eC : in std_logic;
       o_eS : out std_logic_vector(N-1 downto 0);
       o_eC : out std_logic);

end component;

 
  
  signal i_tA : std_logic_vector(N-1 downto 0);
  signal i_tB : std_logic_vector(N-1 downto 0);
  signal i_tC : std_logic;
  signal o_structure  : std_logic_vector(N-1 downto 0);
  signal c_structure  : std_logic;

begin


  g_structure: nadder
    generic map(N => N)
    port map(i_eA  => i_tA,
             i_eB  => i_tB,
             i_eC  => i_tC,
             o_eS  => o_Structure,
	     o_eC  => c_Structure);
 
  process
    begin
      I_tA <= x"00";
      I_tB <= x"01";
      I_tC <= '0';
      wait for 100 ns;
      
      I_tC <= '1';
      wait for 100 ns;

      I_tA <= x"01";
      I_tB <= x"01";      
      I_tC <= '1';
      wait for 100 ns;

      I_tA <= x"FF";
      I_tB <= x"01";      
      I_tC <= '0';
      wait for 100 ns;

      I_tC <= '1';
      wait for 100 ns;

      I_tA <= x"AA";
      I_tB <= x"A0";      
      I_tC <= '0';
      wait for 100 ns;
      
  end process;
  
end structure;