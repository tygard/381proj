LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY datapath IS
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

END datapath;

architecture structure of datapath is

COMPONENT adder_N_bit IS
    GENERIC (N : INTEGER := 32);
    PORT (
        i_A : IN std_logic_vector(N - 1 DOWNTO 0);
        i_B : IN std_logic_vector(N - 1 DOWNTO 0);
        i_Cin : IN std_logic;
        o_S : OUT std_logic_vector(N - 1 DOWNTO 0);
        o_Cout : OUT std_logic;
        o_Ovfl : OUT std_logic
    );
END COMPONENT;

COMPONENT mux2t1_N IS
    GENERIC (N : INTEGER := 32);
    PORT (
        i_S : IN std_logic;
        i_D0 : IN std_logic_vector(N - 1 DOWNTO 0);
        i_D1 : IN std_logic_vector(N - 1 DOWNTO 0);
        o_O : OUT std_logic_vector(N - 1 DOWNTO 0));
END COMPONENT;

COMPONENT RegFile IS
    GENERIC (N : INTEGER := 32);
    PORT (
        i_WA : IN std_logic_vector(4 DOWNTO 0);
        i_WD : IN std_logic_vector(31 DOWNTO 0);
        i_RA0 : IN std_logic_vector(4 DOWNTO 0);
        i_RA1 : IN std_logic_vector(4 DOWNTO 0);
        i_WE : IN std_logic;
        i_RST : IN std_logic;
        i_CLK : IN std_logic;
        o_q0 : OUT std_logic_vector(31 DOWNTO 0);
        o_q1 : OUT std_logic_vector(31 DOWNTO 0)
    );
END COMPONENT;

SIGNAL s_outA : std_logic_vector(31 DOWNTO 0);
SIGNAL s_outB : std_logic_vector(31 DOWNTO 0);
SIGNAL s_outC : std_logic_vector(31 DOWNTO 0);
SIGNAL s_adderOut : std_logic_vector(31 DOWNTO 0);
SIGNAL s_Mux1 : std_logic_vector(31 DOWNTO 0);

BEGIN

    registers : RegFile
    GENERIC MAP(N => 32)
    PORT MAP(
        i_WA => i_Caddr,
        i_WD => o_AdderOut,
        i_RA0 => i_Aaddr,
        i_RA1 => i_Baddr,
        i_WE => '1',
        i_RST => i_RST,
        i_CLK => i_CLK,
        o_q0 => s_outA,
        o_q1 => s_outB
    );

    mux0 : mux2t1_N
    GENERIC MAP(N => 32)
    PORT MAP(
        i_S => i_ALUsrc,
        i_D0 => s_outB,
        i_D1 => i_Imm,
        o_O => s_Mux1
    );

    Adder0 : adder_N_bit
    GENERIC MAP(N => 32)
    PORT MAP(
        i_A => s_outA,
        i_B => s_Mux1,
        i_Cin => i_Sub,
        o_S => o_AdderOut,
        o_Cout => OPEN,
        o_Ovfl => OPEN
    );

END structure;