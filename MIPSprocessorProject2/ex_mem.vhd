LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ex_mem IS
	PORT (
		i_CLK : IN std_logic;
		i_RST : IN std_logic;
		i_WE : IN std_logic;

		--------------------------------------------------------------

		i_MemtoReg : IN std_logic_vector(0 DOWNTO 0);
		i_MemWrite : IN std_logic_vector(0 DOWNTO 0);
		i_Rt : IN std_logic_vector(31 DOWNTO 0);
		i_Mux4 : IN std_logic_vector(31 DOWNTO 0);
		i_Mux0 : IN std_logic_vector(31 DOWNTO 0);
		i_Inst : IN std_logic_vector(31 DOWNTO 0);
		i_ALUresult : IN std_logic_vector(63 DOWNTO 0);

		--------------------------------------------------------------

		o_MemtoReg : OUT std_logic_vector(0 DOWNTO 0);
		o_MemWrite : OUT std_logic_vector(0 DOWNTO 0);
		o_Rt : OUT std_logic_vector(31 DOWNTO 0);
		o_Mux4 : OUT std_logic_vector(31 DOWNTO 0);
		o_Mux0 : OUT std_logic_vector(31 DOWNTO 0);
		o_Inst : OUT std_logic_vector(31 DOWNTO 0);
		o_ALUresult : OUT std_logic_vector(63 DOWNTO 0)
	);

END ex_mem;

ARCHITECTURE structural OF ex_mem IS

	--components:
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
	--------------------------------------------------------------------------------------------

BEGIN

	--reg-------------------------------
	MemtoReg : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_MemtoReg,
		o_Q => o_MemtoReg
	);

	--reg-------------------------------
	ALUresult : nbit_Reg
	GENERIC MAP(N => 64)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_ALUresult,
		o_Q => o_ALUresult
	);

	--reg-------------------------------
	MemWrite : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_MemWrite,
		o_Q => o_MemWrite
	);

	--reg-------------------------------
	Rt : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_Rt,
		o_Q => o_Rt
	);

	--reg-------------------------------
	Mux4 : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_Mux4,
		o_Q => o_Mux4
	);

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
	Mux0 : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_Mux0,
		o_Q => o_Mux0
	);

END structural;