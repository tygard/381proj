-------------------------------------------------------------------------
-- Adnan Salihovic
-- Iowa State University
-------------------------------------------------------------------------
-- mux2t1_N.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an N-bit wide 2:1
-- mux using structural VHDL, generics, and generate statements.
--
--
-- NOTES:
-- 1/6/20 by H3::Created.
-------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY PC_reg IS
    PORT (
        i_CLK : IN std_logic;
        i_RST : IN std_logic;
        i_WE : IN std_logic;
        i_D : IN std_logic_vector(31 DOWNTO 0);
        o_Q : OUT std_logic_vector(31 DOWNTO 0));

END PC_reg;
--
ARCHITECTURE structural OF PC_reg IS

    COMPONENT dffg IS
        PORT (
            i_CLK : IN std_logic;
            i_RST : IN std_logic;
            i_WE : IN std_logic;
            i_D : IN std_logic;
            o_Q : OUT std_logic);
    END COMPONENT;

    COMPONENT dffgReset1 IS
        PORT (
            i_CLK : IN std_logic;
            i_RST : IN std_logic;
            i_WE : IN std_logic;
            i_D : IN std_logic;
            o_Q : OUT std_logic);
    END COMPONENT;

BEGIN

    RegBit31 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(31),
        o_Q => o_Q(31)
    );
    RegBit30 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(30),
        o_Q => o_Q(30)
    );
    RegBit29 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(29),
        o_Q => o_Q(29)
    );
    RegBit28 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(28),
        o_Q => o_Q(28)
    );
    -----------------------
    RegBit27 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(27),
        o_Q => o_Q(27)
    );
    RegBit26 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(26),
        o_Q => o_Q(26)
    );
    RegBit25 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(25),
        o_Q => o_Q(25)
    );
    RegBit24 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(24),
        o_Q => o_Q(24)
    );
    -----------------------
    RegBit23 : dffg
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(23),
        o_Q => o_Q(23)
    );

    RegBit22 : dffg 
    -- changed this back to a reg dffg because it caused errors in some tests with the fetch
    PORT MAP(
        i_CLK => i_CLK,
        i_RST => i_RST,
        i_WE => i_WE,
        i_D => i_D(22),
        o_Q => o_Q(22)
    );

    G_nbit_Reg : FOR i IN 0 TO 21 GENERATE
        RegI : dffg
        PORT MAP(

            i_CLK => i_CLK,
            i_RST => i_RST,
            i_WE => i_WE,
            i_D => i_D(i),
            o_Q => o_Q(i));

    END GENERATE G_nbit_Reg;
END structural;