LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY RegFile_tb IS
END RegFile_tb;

ARCHITECTURE behavior OF RegFile_tb IS
    COMPONENT RegFile
        GENERIC (N : INTEGER := 32);
        PORT (
            i_WA : IN std_logic_vector(4 DOWNTO 0);
            i_WD : IN std_logic_vector(31 DOWNTO 0);
            i_RA0 : IN std_logic_vector(4 DOWNTO 0);
            i_RA1 : IN std_logic_vector(4 DOWNTO 0);
            i_RST : IN std_logic;
            i_CLK : IN std_logic;
            o_q0 : OUT std_logic_vector(31 DOWNTO 0);
            o_q1 : OUT std_logic_vector(31 DOWNTO 0)
        );
    END COMPONENT;
    
    SIGNAL s_WA : std_logic_vector(4 DOWNTO 0);
    SIGNAL s_WD : std_logic_vector(31 DOWNTO 0);
    SIGNAL s_RA0 : std_logic_vector(4 DOWNTO 0);
    SIGNAL s_RA1 : std_logic_vector(4 DOWNTO 0);
    SIGNAL s_RST : std_logic;
    SIGNAL s_CLK : std_logic;
    SIGNAL s_q0 : std_logic_vector(31 DOWNTO 0);
    SIGNAL s_q1 : std_logic_vector(31 DOWNTO 0);

BEGIN

    DUT : RegFile
    GENERIC MAP(N => 32)
    PORT MAP(
        i_WA => s_WA,
        i_WD => s_WD,
        i_RA0 => s_RA0,
        i_RA1 => s_RA1,
        i_RST => s_RST,
        i_CLK => s_CLK,
        o_q0 => s_q0,
        o_q1 => s_q1
    );

    P_CLK : PROCESS
    BEGIN
        s_CLK <= '0';
        WAIT FOR 10 ns;
        s_CLK <= '1';
        WAIT FOR 10 ns;
    END PROCESS;

    P_TB : PROCESS
    BEGIN
        -- test run command for modelsim: vsim -voptargs="+acc" RegFile_tb

        -- reset flip flops
        s_RST <= '1';
        s_WA <= "00000";
        s_WD <= x"FFFFFFFF";
        WAIT FOR 100 ns;

        -- test writes

        -- TEST 1: store values of each register in order
        s_RST <= '0';
        s_WA <= "00000";
        s_WD <= x"00000001";

        WAIT FOR 20 ns;

        -- TEST 2: store values of each register in order
        s_RST <= '0';
        s_WA <= "00001";
        s_WD <= x"00000002";

        WAIT FOR 20 ns;

        -- TEST 3: store values of each register in order
        s_RST <= '0';
        s_WA <= "00010";
        s_WD <= x"00000003";

        WAIT FOR 20 ns;

        -- TEST 4: store values of each register in order
        s_RST <= '0';
        s_WA <= "00011";
        s_WD <= x"00000004";

        WAIT FOR 20 ns;

        -- TEST 5: store values of each register in order
        s_RST <= '0';
        s_WA <= "00100";
        s_WD <= x"00000005";

        WAIT FOR 20 ns;

        -- TEST 6: store values of each register in order
        s_RST <= '0';
        s_WA <= "00101";
        s_WD <= x"00000006";

        WAIT FOR 20 ns;

        -- test reads

        -- TEST 1: read values of each register in order
        s_RA0 <= "00000";
        s_RA1 <= "00000";
        WAIT FOR 20 ns;

        -- TEST 2: read values of each register in order
        s_RA0 <= "00001";
        s_RA1 <= "00001";
        WAIT FOR 20 ns;

        -- TEST 3: read values of each register in order
        s_RA0 <= "00010";
        s_RA1 <= "00010";
        WAIT FOR 20 ns;

        -- TEST 4: read values of each register in order
        s_RA0 <= "00011";
        s_RA1 <= "00011";
        WAIT FOR 20 ns;

        -- TEST 5: read values of each register in order
        s_RA0 <= "00100";
        s_RA1 <= "00100";
        WAIT FOR 20 ns;

        -- TEST 6: read values of each register in order
        s_RA0 <= "00101";
        s_RA1 <= "00101";
        WAIT FOR 20 ns;

    END PROCESS;
END behavior;