LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RegFile IS
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
END RegFile;

ARCHITECTURE structural OF RegFile IS

	COMPONENT nbit_Reg IS
		GENERIC (N : INTEGER := 32);
		PORT (
			i_CLK : IN std_logic;
			i_RST : IN std_logic;
			i_WE : IN std_logic;
			i_D : IN std_logic_vector(N - 1 DOWNTO 0);
			o_Q : OUT std_logic_vector(N - 1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT Decoder IS
		PORT (
			i_S : IN std_logic_vector(4 DOWNTO 0);
			o_F : OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux32t1 IS
		PORT (
			i_D0 : IN std_logic_vector(31 DOWNTO 0);
			i_D1 : IN std_logic_vector(31 DOWNTO 0);
			i_D2 : IN std_logic_vector(31 DOWNTO 0);
			i_D3 : IN std_logic_vector(31 DOWNTO 0);
			i_D4 : IN std_logic_vector(31 DOWNTO 0);
			i_D5 : IN std_logic_vector(31 DOWNTO 0);
			i_D6 : IN std_logic_vector(31 DOWNTO 0);
			i_D7 : IN std_logic_vector(31 DOWNTO 0);
			i_D8 : IN std_logic_vector(31 DOWNTO 0);
			i_D9 : IN std_logic_vector(31 DOWNTO 0);
			i_D10 : IN std_logic_vector(31 DOWNTO 0);
			i_D11 : IN std_logic_vector(31 DOWNTO 0);
			i_D12 : IN std_logic_vector(31 DOWNTO 0);
			i_D13 : IN std_logic_vector(31 DOWNTO 0);
			i_D14 : IN std_logic_vector(31 DOWNTO 0);
			i_D15 : IN std_logic_vector(31 DOWNTO 0);
			i_D16 : IN std_logic_vector(31 DOWNTO 0);
			i_D17 : IN std_logic_vector(31 DOWNTO 0);
			i_D18 : IN std_logic_vector(31 DOWNTO 0);
			i_D19 : IN std_logic_vector(31 DOWNTO 0);
			i_D20 : IN std_logic_vector(31 DOWNTO 0);
			i_D21 : IN std_logic_vector(31 DOWNTO 0);
			i_D22 : IN std_logic_vector(31 DOWNTO 0);
			i_D23 : IN std_logic_vector(31 DOWNTO 0);
			i_D24 : IN std_logic_vector(31 DOWNTO 0);
			i_D25 : IN std_logic_vector(31 DOWNTO 0);
			i_D26 : IN std_logic_vector(31 DOWNTO 0);
			i_D27 : IN std_logic_vector(31 DOWNTO 0);
			i_D28 : IN std_logic_vector(31 DOWNTO 0);
			i_D29 : IN std_logic_vector(31 DOWNTO 0);
			i_D30 : IN std_logic_vector(31 DOWNTO 0);
			i_D31 : IN std_logic_vector(31 DOWNTO 0);
			i_S : IN std_logic_vector(4 DOWNTO 0);
			o_Q : OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL s_WE : std_logic;
	SIGNAL s_Data : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D0 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D1 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D2 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D3 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D4 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D5 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D6 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D7 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D8 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D9 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D10 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D11 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D12 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D13 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D14 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D15 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D16 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D17 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D18 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D19 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D20 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D21 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D22 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D23 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D24 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D25 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D26 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D27 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D28 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D29 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D30 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_D31 : std_logic_vector(31 DOWNTO 0);

BEGIN
	decode : Decoder
	PORT MAP(
		i_S => i_WA,
		o_F => s_Data
	);
	reg0 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(0) and i_WE,
		i_d => i_WD,
		o_q => s_D0
	);
	reg1 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(1) and i_WE,
		i_d => i_WD,
		o_q => s_D1
	);
	reg2 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(2) and i_WE,
		i_d => i_WD,
		o_q => s_D2
	);
	reg3 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(3) and i_WE,
		i_d => i_WD,
		o_q => s_D3
	);
	reg4 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(4) and i_WE,
		i_d => i_WD,
		o_q => s_D4
	);
	reg5 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(5) and i_WE,
		i_d => i_WD,
		o_q => s_D5
	);
	reg6 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(6) and i_WE,
		i_d => i_WD,
		o_q => s_D6
	);
	reg7 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(7) and i_WE,
		i_d => i_WD,
		o_q => s_D7
	);
	reg8 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(8) and i_WE,
		i_d => i_WD,
		o_q => s_D8
	);
	reg9 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(9) and i_WE,
		i_d => i_WD,
		o_q => s_D9
	);
	reg10 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(10) and i_WE,
		i_d => i_WD,
		o_q => s_D10
	);
	reg11 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(11) and i_WE,
		i_d => i_WD,
		o_q => s_D11
	);
	reg12 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(12) and i_WE,
		i_d => i_WD,
		o_q => s_D12
	);
	reg13 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(13) and i_WE,
		i_d => i_WD,
		o_q => s_D13
	);
	reg14 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(14) and i_WE,
		i_d => i_WD,
		o_q => s_D14
	);
	reg15 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(15) and i_WE,
		i_d => i_WD,
		o_q => s_D15
	);
	reg16 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(16) and i_WE,
		i_d => i_WD,
		o_q => s_D16
	);
	reg17 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(17) and i_WE,
		i_d => i_WD,
		o_q => s_D17
	);
	reg18 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(18) and i_WE,
		i_d => i_WD,
		o_q => s_D18
	);
	reg19 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(19) and i_WE,
		i_d => i_WD,
		o_q => s_D19
	);
	reg20 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(20) and i_WE,
		i_d => i_WD,
		o_q => s_D20
	);
	reg21 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(21) and i_WE,
		i_d => i_WD,
		o_q => s_D21
	);
	reg22 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(22) and i_WE,
		i_d => i_WD,
		o_q => s_D22
	);
	reg23 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(23) and i_WE,
		i_d => i_WD,
		o_q => s_D23
	);
	reg24 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(24) and i_WE,
		i_d => i_WD,
		o_q => s_D24
	);
	reg25 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(25) and i_WE,
		i_d => i_WD,
		o_q => s_D25
	);
	reg26 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(26) and i_WE,
		i_d => i_WD,
		o_q => s_D26
	);
	reg27 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(27) and i_WE,
		i_d => i_WD,
		o_q => s_D27
	);
	reg28 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(28) and i_WE,
		i_d => i_WD,
		o_q => s_D28
	);
	reg29 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(29) and i_WE,
		i_d => i_WD,
		o_q => s_D29
	);
	reg30 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(30) and i_WE,
		i_d => i_WD,
		o_q => s_D30
	);
	reg31 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(31) and i_WE,
		i_d => i_WD,
		o_q => s_D31
	);
	mux0 : mux32t1
	PORT MAP(
		i_D0 => s_D0,
		i_D1 => s_D1,
		i_D2 => s_D2,
		i_D3 => s_D3,
		i_D4 => s_D4,
		i_D5 => s_D5,
		i_D6 => s_D6,
		i_D7 => s_D7,
		i_D8 => s_D8,
		i_D9 => s_D9,
		i_D10 => s_D10,
		i_D11 => s_D11,
		i_D12 => s_D12,
		i_D13 => s_D13,
		i_D14 => s_D14,
		i_D15 => s_D15,
		i_D16 => s_D16,
		i_D17 => s_D17,
		i_D18 => s_D18,
		i_D19 => s_D19,
		i_D20 => s_D20,
		i_D21 => s_D21,
		i_D22 => s_D22,
		i_D23 => s_D23,
		i_D24 => s_D24,
		i_D25 => s_D25,
		i_D26 => s_D26,
		i_D27 => s_D27,
		i_D28 => s_D28,
		i_D29 => s_D29,
		i_D30 => s_D30,
		i_D31 => s_D31,
		i_S => i_RA0,
		o_Q => o_q0
	);
	mux1 : mux32t1
	PORT MAP(
		i_D0 => s_D0,
		i_D1 => s_D1,
		i_D2 => s_D2,
		i_D3 => s_D3,
		i_D4 => s_D4,
		i_D5 => s_D5,
		i_D6 => s_D6,
		i_D7 => s_D7,
		i_D8 => s_D8,
		i_D9 => s_D9,
		i_D10 => s_D10,
		i_D11 => s_D11,
		i_D12 => s_D12,
		i_D13 => s_D13,
		i_D14 => s_D14,
		i_D15 => s_D15,
		i_D16 => s_D16,
		i_D17 => s_D17,
		i_D18 => s_D18,
		i_D19 => s_D19,
		i_D20 => s_D20,
		i_D21 => s_D21,
		i_D22 => s_D22,
		i_D23 => s_D23,
		i_D24 => s_D24,
		i_D25 => s_D25,
		i_D26 => s_D26,
		i_D27 => s_D27,
		i_D28 => s_D28,
		i_D29 => s_D29,
		i_D30 => s_D30,
		i_D31 => s_D31,
		i_S => i_RA1,
		o_Q => o_q1
	);

END structural;