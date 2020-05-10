LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY RegFile IS
	GENERIC (N : INTEGER := 32);
	PORT (
		i_WA0 : IN std_logic_vector(4 DOWNTO 0);
		i_WA1 : IN std_logic_vector(4 DOWNTO 0);
		i_WD0 : IN std_logic_vector(31 DOWNTO 0);
		i_WD1 : IN std_logic_vector(31 DOWNTO 0);
		i_RA0 : IN std_logic_vector(4 DOWNTO 0);
		i_RA1 : IN std_logic_vector(4 DOWNTO 0);
		i_WE0 : IN std_logic;
		i_WE1 : IN std_logic;
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

	SIGNAL s_WE0 : std_logic;
	SIGNAL s_WE1 : std_logic;
	SIGNAL s_Data0 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_Data1 : std_logic_vector(31 DOWNTO 0);
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

	SIGNAL s_WD_Reg1 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg2 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg3 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg4 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg5 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg6 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg7 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg8 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg9 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg10 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg11 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg12 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg13 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg14 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg15 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg16 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg17 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg18 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg19 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg20 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg21 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg22 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg23 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg24 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg25 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg26 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg27 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg28 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg29 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg30 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_WD_Reg31 : std_logic_vector(31 DOWNTO 0);

BEGIN

	s_WD_Reg1 <=
		i_WD0 WHEN (s_Data0(1) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(1) AND i_WE1) ELSE
		x"00000BAD"; -- should map the WD to the proper port, or helpful signal 0xBAD if something bad happens

	s_WD_Reg2 <=
		i_WD0 WHEN (s_Data0(2) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(2) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg3 <=
		i_WD0 WHEN (s_Data0(3) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(3) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg4 <=
		i_WD0 WHEN (s_Data0(4) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(4) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg5 <=
		i_WD0 WHEN (s_Data0(5) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(5) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg6 <=
		i_WD0 WHEN (s_Data0(7) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(7) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg7 <=
		i_WD0 WHEN (s_Data0(8) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(8) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg8 <=
		i_WD0 WHEN (s_Data0(9) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(9) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg9 <=
		i_WD0 WHEN (s_Data0(10) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(10) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg10 <=
		i_WD0 WHEN (s_Data0(11) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(11) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg11 <=
		i_WD0 WHEN (s_Data0(12) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(12) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg12 <=
		i_WD0 WHEN (s_Data0(13) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(13) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg13 <=
		i_WD0 WHEN (s_Data0(14) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(14) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg14 <=
		i_WD0 WHEN (s_Data0(15) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(15) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg15 <=
		i_WD0 WHEN (s_Data0(16) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(16) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg17 <=
		i_WD0 WHEN (s_Data0(17) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(17) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg18 <=
		i_WD0 WHEN (s_Data0(18) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(18) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg19 <=
		i_WD0 WHEN (s_Data0(19) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(19) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg20 <=
		i_WD0 WHEN (s_Data0(20) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(20) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg21 <=
		i_WD0 WHEN (s_Data0(21) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(21) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg22 <=
		i_WD0 WHEN (s_Data0(22) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(22) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg23 <=
		i_WD0 WHEN (s_Data0(23) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(23) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg24 <=
		i_WD0 WHEN (s_Data0(24) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(24) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg25 <=
		i_WD0 WHEN (s_Data0(25) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(25) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg26 <=
		i_WD0 WHEN (s_Data0(26) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(26) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg27 <=
		i_WD0 WHEN (s_Data0(27) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(27) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg28 <=
		i_WD0 WHEN (s_Data0(28) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(28) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg29 <=
		i_WD0 WHEN (s_Data0(29) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(29) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg30 <=
		i_WD0 WHEN (s_Data0(30) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(30) AND i_WE1) ELSE
		x"00000BAD";

	s_WD_Reg31 <=
		i_WD0 WHEN (s_Data0(31) AND i_WE0) ELSE
		i_WD1 WHEN (s_Data1(31) AND i_WE1) ELSE
		x"00000BAD";

	decode0 : Decoder
	PORT MAP(
		i_S => i_WA0,
		o_F => s_Data0
	);

	decode1 : Decoder
	PORT MAP(
		i_S => i_WA1,
		o_F => s_Data1
	);

	reg0 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => '0',
		i_d => x"00000000",
		o_q => s_D0
	);
	reg1 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0(1) AND i_WE0) OR (s_Data1(1) AND i_WE1),
		i_d => s_WD_Reg1,
		o_q => s_D1
	);
	reg2 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0(2) AND i_WE0) OR (s_Data1(2) AND i_WE1),
		i_d => s_WD_Reg2,
		o_q => s_D2
	);
	reg3 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0(3) AND i_WE0) OR (s_Data1(3) AND i_WE1),
		i_d => s_WD_Reg3,
		o_q => s_D3
	);
	reg4 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0(1) AND i_WE0) OR (s_Data1(1) AND i_WE1),
		i_d => s_WD_Reg4,
		o_q => s_D4
	);
	reg5 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((5)) AND i_WE0) OR (s_Data1((5)) AND i_WE1),
		i_d => s_WD_Reg5,
		o_q => s_D5
	);
	reg6 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((6)) AND i_WE0) OR (s_Data1((6)) AND i_WE1),
		i_d => s_WD_Reg6,
		o_q => s_D6
	);
	reg7 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((7)) AND i_WE0) OR (s_Data1((7)) AND i_WE1),
		i_d => s_WD_Reg7,
		o_q => s_D7
	);
	reg8 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((8)) AND i_WE0) OR (s_Data1((8)) AND i_WE1),
		i_d => s_WD_Reg8,
		o_q => s_D8
	);
	reg9 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((9)) AND i_WE0) OR (s_Data1((9)) AND i_WE1),
		i_d => s_WD_Reg9,
		o_q => s_D9
	);
	reg10 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((10)) AND i_WE0) OR (s_Data1((10)) AND i_WE1),
		i_d => s_WD_Reg10,
		o_q => s_D10
	);
	reg11 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((11)) AND i_WE0) OR (s_Data1((11)) AND i_WE1),
		i_d => s_WD_Reg11,
		o_q => s_D11
	);
	reg12 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((12)) AND i_WE0) OR (s_Data1((12)) AND i_WE1),
		i_d => s_WD_Reg12,
		o_q => s_D12
	);
	reg13 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((13)) AND i_WE0) OR (s_Data1((13)) AND i_WE1),
		i_d => s_WD_Reg13,
		o_q => s_D13
	);
	reg14 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((14)) AND i_WE0) OR (s_Data1((14)) AND i_WE1),
		i_d => s_WD_Reg14,
		o_q => s_D14
	);
	reg15 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((15)) AND i_WE0) OR (s_Data1((15)) AND i_WE1),
		i_d => s_WD_Reg15,
		o_q => s_D15
	);
	reg16 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((16)) AND i_WE0) OR (s_Data1((16)) AND i_WE1),
		i_d => s_WD_Reg16,
		o_q => s_D16
	);
	reg17 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((17)) AND i_WE0) OR (s_Data1((17)) AND i_WE1),
		i_d => s_WD_Reg17,
		o_q => s_D17
	);
	reg18 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((18)) AND i_WE0) OR (s_Data1((18)) AND i_WE1),
		i_d => s_WD_Reg18,
		o_q => s_D18
	);
	reg19 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((19)) AND i_WE0) OR (s_Data1((19)) AND i_WE1),
		i_d => s_WD_Reg19,
		o_q => s_D19
	);
	reg20 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((20)) AND i_WE0) OR (s_Data1((20)) AND i_WE1),
		i_d => s_WD_Reg20,
		o_q => s_D20
	);
	reg21 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((21)) AND i_WE0) OR (s_Data1((21)) AND i_WE1),
		i_d => s_WD_Reg21,
		o_q => s_D21
	);
	reg22 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((22)) AND i_WE0) OR (s_Data1((22)) AND i_WE1),
		i_d => s_WD_Reg22,
		o_q => s_D22
	);
	reg23 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((23)) AND i_WE0) OR (s_Data1((23)) AND i_WE1),
		i_d => s_WD_Reg23,
		o_q => s_D23
	);
	reg24 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((24)) AND i_WE0) OR (s_Data1((24)) AND i_WE1),
		i_d => s_WD_Reg24,
		o_q => s_D24
	);
	reg25 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((25)) AND i_WE0) OR (s_Data1((25)) AND i_WE1),
		i_d => s_WD_Reg25,
		o_q => s_D25
	);
	reg26 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((26)) AND i_WE0) OR (s_Data1((26)) AND i_WE1),
		i_d => s_WD_Reg26,
		o_q => s_D26
	);
	reg27 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((27)) AND i_WE0) OR (s_Data1((27)) AND i_WE1),
		i_d => s_WD_Reg27,
		o_q => s_D27
	);
	reg28 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((28)) AND i_WE0) OR (s_Data1((28)) AND i_WE1),
		i_d => s_WD_Reg28,
		o_q => s_D28
	);
	reg29 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((29)) AND i_WE0) OR (s_Data1((29)) AND i_WE1),
		i_d => s_WD_Reg29,
		o_q => s_D29
	);
	reg30 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((30)) AND i_WE0) OR (s_Data1((30)) AND i_WE1),
		i_d => s_WD_Reg30,
		o_q => s_D30
	);
	reg31 : nbit_Reg
	GENERIC MAP(N => N)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => (s_Data0((31)) AND i_WE0) OR (s_Data1((31)) AND i_WE1),
		i_d => s_WD_Reg31,
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