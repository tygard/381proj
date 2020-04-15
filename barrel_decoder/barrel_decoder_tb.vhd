LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY barrel_decoder_tb IS
END barrel_decoder_tb;

ARCHITECTURE structure OF barrel_decoder_tb IS
    COMPONENT barrel_decoder IS
        PORT (
            i_ALUctrl : IN std_logic_vector(4 DOWNTO 0);
            o_D : OUT std_logic; -- Shift direction output (0: right, 1: left)
            o_T : OUT std_logic; -- Shift type output (0: logical, 1: arith.)
            o_VarEn : OUT std_logic;
            o_ShiftEn : OUT std_logic
        );
    END COMPONENT;

    SIGNAL i_tALUctrl : std_logic_vector(4 DOWNTO 0);
    SIGNAL o_tD : std_logic; -- Shift direction output (0: right, 1: left)
    SIGNAL o_tT : std_logic; -- Shift type output (0: logical, 1: arith.)
    SIGNAL o_tVarEn : std_logic;
    SIGNAL o_tShiftEn : std_logic;

BEGIN

    DUT : barrel_decoder
    PORT MAP(
        i_ALUctrl => i_tALUctrl,
        o_D => o_tD,
        o_T => o_tT,
        o_VarEn => o_tVarEn,
        o_ShiftEn => o_tShiftEn
    );

    PROCESS
    BEGIN
        -- test run command for modelsim: vsim -voptargs="+acc" barrel_decoder_tb

        -- TEST 1: sll
        i_tALUctrl <= "00000";
        WAIT FOR 10 ns;
        -- expected o_tD: 1
        -- expected o_tT: 0
        -- expected o_tVarEn: 0
        -- expected o_tShiftEn: 1

        -- TEST 2: srl
        i_tALUctrl <= "00001";
        WAIT FOR 10 ns;
        -- expected o_tD: 0
        -- expected o_tT: 0
        -- expected o_tVarEn: 0
        -- expected o_tShiftEn: 1

        -- TEST 3: sra
        i_tALUctrl <= "00010";
        WAIT FOR 10 ns;
        -- expected o_tD: 0
        -- expected o_tT: 1
        -- expected o_tVarEn: 0
        -- expected o_tShiftEn: 1

        -- TEST 4: sllv
        i_tALUctrl <= "00011";
        WAIT FOR 10 ns;
        -- expected o_tD: 1
        -- expected o_tT: 0
        -- expected o_tVarEn: 1
        -- expected o_tShiftEn: 1

        -- TEST 5: srlv
        i_tALUctrl <= "00100";
        WAIT FOR 10 ns;
        -- expected o_tD: 0
        -- expected o_tT: 0
        -- expected o_tVarEn: 1
        -- expected o_tShiftEn: 1

        -- TEST 6: srav
        i_tALUctrl <= "00101";
        WAIT FOR 10 ns;
        -- expected o_tD: 0
        -- expected o_tT: 1
        -- expected o_tVarEn: 1
        -- expected o_tShiftEn: 1

        i_tALUctrl <= "00110";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "00111";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01000";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01001";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01010";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01011";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01100";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01101";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01110";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "01111";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10000";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10001";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10010";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10011";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10100";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10101";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10110";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "10111";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11000";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11001";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11010";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11011";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11100";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11101";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11110";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0
        i_tALUctrl <= "11111";
        WAIT FOR 10 ns;
        -- expected o_tShiftEn: 0

        WAIT FOR 100 ns;
    END PROCESS;
END structure;