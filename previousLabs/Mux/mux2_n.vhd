library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_n is
  generic(N : integer := 32);
  port(i_A  : in std_logic_vector(N-1 downto 0);
       i_B  : in std_logic_vector(N-1 downto 0);
       i_S  : in std_logic;
       o_F  : out std_logic_vector(N-1 downto 0));

end mux2_n;

architecture structure of mux2_n is

  component andg2
    port(i_A  : in std_logic;
         i_B  : in std_logic;
         o_F  : out std_logic);
  end component;

  component org2
    port(i_A  : in std_logic;
         i_B  : in std_logic;
         o_F  : out std_logic);
  end component;

  component invg
    port(i_A  : in std_logic;
         o_F  : out std_logic);
  end component;

  -- Signals to store A*x, B*x
  signal tNotS : std_logic_vector(N-1 downto 0);
  signal tAndA : std_logic_vector(N-1 downto 0);
  signal tAndB : std_logic_vector(N-1 downto 0);

begin

  G1: for i in 0 to N-1 generate
    invg_i1: invg
      port MAP(i_S      , tNotS(i)          );
    andg_i1: andg2
      port MAP(tNotS(i) , i_A(i)  ,tAndA(i) );
    andg_i2: andg2
      port MAP(i_S      , i_B(i)  , tAndB(i));
    org_i1: org2
      port MAP(tAndA(i) , tAndB(i), o_F(i)  );
  end generate;
  
end structure;