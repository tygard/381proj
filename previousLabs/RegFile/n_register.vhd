LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY n_register IS
    GENERIC (N : INTEGER := 32);
    PORT (
        i_CLK : IN std_logic;
        i_RST : IN std_logic;
        i_WE : IN std_logic;
        i_d : IN std_logic_vector(N - 1 DOWNTO 0);
        o_q : OUT std_logic_vector(N - 1 DOWNTO 0));
END n_register;
ARCHITECTURE structure OF n_register IS

    COMPONENT dffg
        PORT (
            i_CLK : IN std_logic; -- Clock input
            i_RST : IN std_logic; -- Reset input
            i_WE : IN std_logic; -- Write enable input
            i_D : IN std_logic; -- Data value input
            o_Q : OUT std_logic); -- Data value output
    END COMPONENT;

BEGIN
    G1 : FOR i IN 0 TO N - 1 GENERATE

        dff : dffg

        PORT MAP(
            i_D => i_d(i),
            i_CLK => i_CLK,
            i_RST => i_RST,
            i_WE => i_WE,
            o_Q => o_q(i)
        );
    END GENERATE;
END ARCHITECTURE;