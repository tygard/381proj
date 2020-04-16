library IEEE;
use IEEE.std_logic_1164.all;

entity mux32_tb is

end mux32_tb;

architecture behavior of mux32_tb is


component mux32 is

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


end component;

signal  s_A: std_logic_vector(31 downto 0);
signal  s_S :std_logic_vector(4 downto 0);
signal  s_F : std_logic_vector(31 downto 0);


begin

DUT:  mux32
  port map(i_A0 =>s_A,
       i_A1 =>s_A,
       i_A2  =>s_A,
       i_A3  =>s_A,
       i_A4  =>s_A,
       i_A5  =>s_A,
       i_A6  =>s_A,
       i_A7  =>s_A,
       i_A8  =>s_A,
       i_A9  =>s_A,
       i_A10  =>s_A,
       i_A11 =>s_A,
       i_A12  =>s_A,
       i_A13  =>s_A,
       i_A14  =>s_A,
       i_A15  =>s_A,
       i_A16  =>s_A,
       i_A17 =>s_A,
       i_A18 =>s_A,
       i_A19 =>s_A,
       i_A20  =>s_A,
       i_A21  =>s_A,
       i_A22  =>s_A,
       i_A23  =>s_A,
       i_A24  =>s_A,
       i_A25  =>s_A,
       i_A26  =>s_A,
       i_A27  =>s_A,
       i_A28  =>s_A,
       i_A29  =>s_A,
       i_A30  =>s_A,
       i_A31  =>s_A,
       

       i_S=>s_S,
       o_F  => s_F);      
  process
  begin

    s_A <= "00000000000000000000000000000001";
	
    s_S <="00000";

    wait for 100 ns;


    s_A <="00000000000000000000000000000010";
	
    s_S <= "00001";

    wait for 100 ns;
	
	s_A <="00000000000000000000000000000100";

    s_S <="00010";

    wait for 100 ns;
	
	s_A <="00000000000000000000000000001000";

    s_S <="00011";

    wait for 100 ns;
	
	s_A <="00000000000000000000000000010000";
	
    s_S <="00100";

    wait for 100 ns;
	
	s_A <="00000000000000000000000000100000";

    s_S <="00101";



  end process;
end behavior;

