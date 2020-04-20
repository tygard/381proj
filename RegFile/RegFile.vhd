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
		i_RST : IN std_logic;
		i_CLK : IN std_logic;
		o_q0 : OUT std_logic_vector(31 DOWNTO 0);
		o_q1 : OUT std_logic_vector(31 DOWNTO 0)
	);
END RegFile;

ARCHITECTURE structure OF RegFile IS

	COMPONENT n_register
		GENERIC (N : INTEGER := 32);
		PORT (
			i_CLK : IN std_logic;
			i_RST : IN std_logic;
			i_WE : IN std_logic;
			i_d : IN std_logic_vector(N - 1 DOWNTO 0);
			o_q : OUT std_logic_vector(N - 1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT decoder5_32
		PORT (
			i_A : IN std_logic_vector(4 DOWNTO 0);
			o_D : OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux32
		PORT (
			i_A0 : IN std_logic_vector(31 DOWNTO 0);
			i_A1 : IN std_logic_vector(31 DOWNTO 0);
			i_A2 : IN std_logic_vector(31 DOWNTO 0);
			i_A3 : IN std_logic_vector(31 DOWNTO 0);
			i_A4 : IN std_logic_vector(31 DOWNTO 0);
			i_A5 : IN std_logic_vector(31 DOWNTO 0);
			i_A6 : IN std_logic_vector(31 DOWNTO 0);
			i_A7 : IN std_logic_vector(31 DOWNTO 0);
			i_A8 : IN std_logic_vector(31 DOWNTO 0);
			i_A9 : IN std_logic_vector(31 DOWNTO 0);
			i_A10 : IN std_logic_vector(31 DOWNTO 0);
			i_A11 : IN std_logic_vector(31 DOWNTO 0);
			i_A12 : IN std_logic_vector(31 DOWNTO 0);
			i_A13 : IN std_logic_vector(31 DOWNTO 0);
			i_A14 : IN std_logic_vector(31 DOWNTO 0);
			i_A15 : IN std_logic_vector(31 DOWNTO 0);
			i_A16 : IN std_logic_vector(31 DOWNTO 0);
			i_A17 : IN std_logic_vector(31 DOWNTO 0);
			i_A18 : IN std_logic_vector(31 DOWNTO 0);
			i_A19 : IN std_logic_vector(31 DOWNTO 0);
			i_A20 : IN std_logic_vector(31 DOWNTO 0);
			i_A21 : IN std_logic_vector(31 DOWNTO 0);
			i_A22 : IN std_logic_vector(31 DOWNTO 0);
			i_A23 : IN std_logic_vector(31 DOWNTO 0);
			i_A24 : IN std_logic_vector(31 DOWNTO 0);
			i_A25 : IN std_logic_vector(31 DOWNTO 0);
			i_A26 : IN std_logic_vector(31 DOWNTO 0);
			i_A27 : IN std_logic_vector(31 DOWNTO 0);
			i_A28 : IN std_logic_vector(31 DOWNTO 0);
			i_A29 : IN std_logic_vector(31 DOWNTO 0);
			i_A30 : IN std_logic_vector(31 DOWNTO 0);
			i_A31 : IN std_logic_vector(31 DOWNTO 0);
			i_S : IN std_logic_vector(4 DOWNTO 0);
			o_F : OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL s_WE : std_logic;
	SIGNAL s_Data : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A0 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A1 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A2 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A3 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A4 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A5 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A6 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A7 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A8 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A9 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A10 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A11 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A12 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A13 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A14 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A15 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A16 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A17 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A18 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A19 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A20 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A21 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A22 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A23 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A24 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A25 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A26 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A27 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A28 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A29 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A30 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_A31 : std_logic_vector(31 DOWNTO 0);

BEGIN
	decoder : decoder5_32
	PORT MAP(
		i_A => i_WA,
		o_D => s_Data
	);
	reg0 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(0),
		i_d => i_WD,
		o_q => s_A0
	);
	reg1 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(1),
		i_d => i_WD,
		o_q => s_A1
	);
	reg2 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(2),
		i_d => i_WD,
		o_q => s_A2
	);
	reg3 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(3),
		i_d => i_WD,
		o_q => s_A3
	);
	reg4 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(4),
		i_d => i_WD,
		o_q => s_A4
	);
	reg5 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(5),
		i_d => i_WD,
		o_q => s_A5
	);
	reg6 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(6),
		i_d => i_WD,
		o_q => s_A6
	);
	reg7 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(7),
		i_d => i_WD,
		o_q => s_A7
	);
	reg8 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(8),
		i_d => i_WD,
		o_q => s_A8
	);
	reg9 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(9),
		i_d => i_WD,
		o_q => s_A9
	);
	reg10 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(10),
		i_d => i_WD,
		o_q => s_A10
	);
	reg11 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(11),
		i_d => i_WD,
		o_q => s_A11
	);
	reg12 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(12),
		i_d => i_WD,
		o_q => s_A12
	);
	reg13 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(13),
		i_d => i_WD,
		o_q => s_A13
	);
	reg14 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(14),
		i_d => i_WD,
		o_q => s_A14
	);
	reg15 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(15),
		i_d => i_WD,
		o_q => s_A15
	);
	reg16 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(16),
		i_d => i_WD,
		o_q => s_A16
	);
	reg17 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(17),
		i_d => i_WD,
		o_q => s_A17
	);
	reg18 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(18),
		i_d => i_WD,
		o_q => s_A18
	);
	reg19 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(19),
		i_d => i_WD,
		o_q => s_A19
	);
	reg20 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(20),
		i_d => i_WD,
		o_q => s_A20
	);
	reg21 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(21),
		i_d => i_WD,
		o_q => s_A21
	);
	reg22 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(22),
		i_d => i_WD,
		o_q => s_A22
	);
	reg23 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(23),
		i_d => i_WD,
		o_q => s_A23
	);
	reg24 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(24),
		i_d => i_WD,
		o_q => s_A24
	);
	reg25 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(25),
		i_d => i_WD,
		o_q => s_A25
	);
	reg26 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(26),
		i_d => i_WD,
		o_q => s_A26
	);
	reg27 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(27),
		i_d => i_WD,
		o_q => s_A27
	);
	reg28 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(28),
		i_d => i_WD,
		o_q => s_A28
	);
	reg29 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(29),
		i_d => i_WD,
		o_q => s_A29
	);
	reg30 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(30),
		i_d => i_WD,
		o_q => s_A30
	);
	reg31 : n_register
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => s_Data(31),
		i_d => i_WD,
		o_q => s_A31
	);
	mux0 : mux32
	PORT MAP(
		i_A0 => s_A0,
		i_A1 => s_A1,
		i_A2 => s_A2,
		i_A3 => s_A3,
		i_A4 => s_A4,
		i_A5 => s_A5,
		i_A6 => s_A6,
		i_A7 => s_A7,
		i_A8 => s_A8,
		i_A9 => s_A9,
		i_A10 => s_A10,
		i_A11 => s_A11,
		i_A12 => s_A12,
		i_A13 => s_A13,
		i_A14 => s_A14,
		i_A15 => s_A15,
		i_A16 => s_A16,
		i_A17 => s_A17,
		i_A18 => s_A18,
		i_A19 => s_A19,
		i_A20 => s_A20,
		i_A21 => s_A21,
		i_A22 => s_A22,
		i_A23 => s_A23,
		i_A24 => s_A24,
		i_A25 => s_A25,
		i_A26 => s_A26,
		i_A27 => s_A27,
		i_A28 => s_A28,
		i_A29 => s_A29,
		i_A30 => s_A30,
		i_A31 => s_A31,
		i_S => i_RA0,
		o_F => o_q0
	);
	mux1 : mux32
	PORT MAP(
		i_A0 => s_A0,
		i_A1 => s_A1,
		i_A2 => s_A2,
		i_A3 => s_A3,
		i_A4 => s_A4,
		i_A5 => s_A5,
		i_A6 => s_A6,
		i_A7 => s_A7,
		i_A8 => s_A8,
		i_A9 => s_A9,
		i_A10 => s_A10,
		i_A11 => s_A11,
		i_A12 => s_A12,
		i_A13 => s_A13,
		i_A14 => s_A14,
		i_A15 => s_A15,
		i_A16 => s_A16,
		i_A17 => s_A17,
		i_A18 => s_A18,
		i_A19 => s_A19,
		i_A20 => s_A20,
		i_A21 => s_A21,
		i_A22 => s_A22,
		i_A23 => s_A23,
		i_A24 => s_A24,
		i_A25 => s_A25,
		i_A26 => s_A26,
		i_A27 => s_A27,
		i_A28 => s_A28,
		i_A29 => s_A29,
		i_A30 => s_A30,
		i_A31 => s_A31,
		i_S => i_RA1,
		o_F => o_q1
	);

END structure;