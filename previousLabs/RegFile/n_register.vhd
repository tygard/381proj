library IEEE;
use IEEE.std_logic_1164.all;


entity n_register is
    generic(N: integer := 32);
    port (i_CLK  : in std_logic;
          i_RST  : in std_logic; 
          i_WE   : in std_logic;
          i_d : in std_logic_vector(N-1 downto 0);
          o_q : out std_logic_vector(N-1 downto 0));
end n_register;


architecture structure of n_register is

      component dffg
      

    port(i_CLK        : in std_logic;     -- Clock input
           i_RST        : in std_logic;     -- Reset input
           i_WE         : in std_logic;     -- Write enable input
           i_D          : in std_logic;     -- Data value input
           o_Q          : out std_logic);   -- Data value output
    end component;

begin 
    G1: for i in 0 to N-1 generate 

        dff: dffg
            
          port MAP(  i_D   => i_d(i),
                     i_CLK => i_CLK,
                     i_RST => i_RST,
                     i_WE  => i_WE,
                     o_Q   => o_q(i)
                     );
    end generate;

end structure;