LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY datapathTB IS
END datapathTB;

ARCHITECTURE structure OF datapathTB IS

    COMPONENT datapath IS
        PORT (
            i_Aaddr : IN std_logic_vector(4 DOWNTO 0);
            i_Baddr : IN std_logic_vector(4 DOWNTO 0);
            i_Caddr : IN std_logic_vector(4 DOWNTO 0);
            i_Imm : IN std_logic_vector(31 DOWNTO 0);
            i_Sub : IN std_logic;
            i_ALUsrc : IN std_logic;
            i_CLK : IN std_logic;
            i_RST : IN std_logic;
            o_AdderOut : OUT std_logic_vector(31 DOWNTO 0)
        );

    END COMPONENT;

    SIGNAL s_Aaddr : std_logic_vector(4 DOWNTO 0);
    SIGNAL s_Baddr : std_logic_vector(4 DOWNTO 0);
    SIGNAL s_Caddr : std_logic_vector(4 DOWNTO 0);
    SIGNAL s_Imm : std_logic_vector(31 DOWNTO 0);
    SIGNAL s_Sub : std_logic;
    SIGNAL s_AdderOut : std_logic_vector(31 DOWNTO 0);
    SIGNAL s_ALUsrc : std_logic;
    SIGNAL s_CLK : std_logic;
    signal s_RST : std_logic;

BEGIN
    g_datapath : datapath
    PORT map (
        i_Aaddr => s_Aaddr,
        i_Baddr => s_Baddr,
        i_Caddr => s_Caddr,
        i_Imm => s_Imm,
        i_Sub => s_Sub,
        i_ALUsrc => s_ALUsrc,
        i_CLK => s_CLK,
        i_RST => s_RST,
        o_AdderOut => s_AdderOut
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

        s_RST <= '1';
        wait for 30 ns;

        s_RST <= '0';
        wait for 30 ns;

        --test 1
        s_Aaddr <= "00000";
        s_Baddr <= "00001";
        s_Caddr <= "00010";
        s_Imm <= x"FFFFFFFF";
        s_Sub <= '0';
        s_ALUsrc <= '1';
        WAIT FOR 20 ns;
    END PROCESS;

END structure;