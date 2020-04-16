library IEEE;
use IEEE.std_logic_1164.all;

entity n_register_tb is
  generic(gCLK_HPER   : time := 50 ns; 
  N: integer := 32);
end n_register_tb;

architecture behavior of n_register_tb is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;


  component n_register
    generic(N: integer := 32);
    port (i_CLK  : in std_logic;
          i_RST  : in std_logic; 
          i_WE   : in std_logic;
          i_d : in std_logic_vector(N-1 downto 0);
          o_q : out std_logic_vector(N-1 downto 0));
  end component;

  -- Temporary signals to connect to the dff component.
  signal s_CLK, s_RST, s_WE  : std_logic;
  signal s_d, s_q : std_logic_vector(N-1 downto 0);
begin

  DUT: n_register

  port map(i_CLK => s_CLK, 
           i_RST => s_RST,
           i_WE  => s_WE,
           i_d   => s_d,
           o_q   => s_q );

  -- This process sets the clock value (low for gCLK_HPER, then high
  -- for gCLK_HPER). Absent a "wait" command, processes restart 
  -- at the beginning once they have reached the final statement.
  P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
  end process;
  
  -- Testbench process  
  P_TB: process
  begin
    -- Reset the FF
    s_RST <= '1';
    s_WE  <= '1';
    s_d   <= x"11111111";
    wait for cCLK_PER;

    -- Store '1'
    s_RST <= '0';
    s_WE  <= '1';
    s_d   <= x"00000000";
    wait for cCLK_PER;  

    -- Keep '1'
    s_RST <= '0';
    s_WE  <= '1';
    s_d   <= x"11111111";
    wait for cCLK_PER;  

    -- Store '0'    
    s_RST <= '0';
    s_WE  <= '1';
    s_d   <= x"00000000";
    wait for cCLK_PER;  

    -- Keep '0'
    s_RST <= '0';
    s_WE  <= '1';
    s_d   <= x"11111111";
    wait for cCLK_PER;  

    wait;
  end process;
  
end behavior;
