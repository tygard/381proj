LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY if_id IS
	PORT (
		i_CLK : IN std_logic;
		i_RST : IN std_logic;
		i_WE : IN std_logic;

		--------------------------------------------------------------

		i_Inst : IN std_logic_vector(31 DOWNTO 0);
		i_NextInstAddr : IN std_logic_vector(31 DOWNTO 0);

		--------------------------------------------------------------

		o_Inst : OUT std_logic_vector(31 DOWNTO 0);
		o_NextInstAddr : OUT std_logic_vector(31 DOWNTO 0)
	);

END if_id;

ARCHITECTURE structural OF if_id IS

	--components:
	COMPONENT nbit_Reg IS
		GENERIC (N : INTEGER := 32);
		PORT (
			i_CLK : IN std_logic;
			i_RST : IN std_logic;
			i_WE : IN std_logic;
			i_D : IN std_logic_vector(N - 1 DOWNTO 0);
			o_Q : OUT std_logic_vector(N - 1 DOWNTO 0));
	END COMPONENT;
	--------------------------------------------------------------------------------------------
BEGIN
	--reg-------------------------------
	Inst : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_Inst,
		o_Q => o_Inst
		);

	--reg-------------------------------
	NextInstAddr : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_NextInstAddr,
		o_Q => o_NextInstAddr
		);

END structural;