LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY id_ex IS
	PORT (
		i_CLK : IN std_logic;
		i_RST : IN std_logic;
		i_WE : IN std_logic;

		--------------------------------------------------------------

		i_MemtoReg : IN std_logic_vector(0 DOWNTO 0);
		i_ALUOp : IN std_logic_vector(5 DOWNTO 0);
		i_MemWrite : IN std_logic_vector(0 DOWNTO 0);
		i_immEn : IN std_logic_vector(0 DOWNTO 0);
		i_Rs : IN std_logic_vector(31 DOWNTO 0);
		i_Rt : IN std_logic_vector(31 DOWNTO 0);
		i_SEout : IN std_logic_vector(31 DOWNTO 0);
		i_Inst : IN std_logic_vector(31 DOWNTO 0);

		--------------------------------------------------------------

		o_MemtoReg : OUT std_logic_vector(0 DOWNTO 0);
		o_ALUOp : OUT std_logic_vector(5 DOWNTO 0);
		o_MemWrite : OUT std_logic_vector(0 DOWNTO 0);
		o_immEn : OUT std_logic_vector(0 DOWNTO 0);
		o_Rs : OUT std_logic_vector(31 DOWNTO 0);
		o_Rt : OUT std_logic_vector(31 DOWNTO 0);
		o_SEout : OUT std_logic_vector(31 DOWNTO 0);
		o_Inst : OUT std_logic_vector(31 DOWNTO 0)
	);

END id_ex;

ARCHITECTURE structural OF id_ex IS

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
	ALUOp : nbit_Reg
	GENERIC MAP(N => 6)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_ALUOp,
		o_Q => o_ALUOp
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
	immEn : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_immEn,
		o_Q => o_immEn
	);

	--reg-------------------------------
	Rs : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_Rs,
		o_Q => o_Rs
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
	SEout : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_SEout,
		o_Q => o_SEout
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

END structural;