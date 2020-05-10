LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mem_wb IS
	PORT (
		i_CLK : IN std_logic;
		i_RST : IN std_logic;
		i_WE : IN std_logic;

		--------------------------------------------------------------

		i_DestReg : IN std_logic_vector(0 DOWNTO 0);
		i_Jump : IN std_logic_vector(0 DOWNTO 0);
		i_BandO : IN std_logic_vector(0 DOWNTO 0);
		i_MemtoReg : IN std_logic_vector(0 DOWNTO 0);
		i_JR : IN std_logic_vector(0 DOWNTO 0);
		i_JAL : IN std_logic_vector(0 DOWNTO 0);
		i_Rs : IN std_logic_vector(31 DOWNTO 0);
		i_Mux4 : IN std_logic_vector(31 DOWNTO 0);
		i_DMemOut : IN std_logic_vector(31 DOWNTO 0);
		i_Inst : IN std_logic_vector(31 DOWNTO 0);
		i_NextInstAddr : IN std_logic_vector(31 DOWNTO 0);

		--------------------------------------------------------------

		o_DestReg : OUT std_logic_vector(0 DOWNTO 0);
		o_Jump : OUT std_logic_vector(0 DOWNTO 0);
		o_BandO : OUT std_logic_vector(0 DOWNTO 0);
		o_MemtoReg : OUT std_logic_vector(0 DOWNTO 0);
		o_JR : OUT std_logic_vector(0 DOWNTO 0);
		o_JAL : OUT std_logic_vector(0 DOWNTO 0);
		o_Rs : OUT std_logic_vector(31 DOWNTO 0);
		o_Mux4 : OUT std_logic_vector(31 DOWNTO 0);
		o_DMemOut : OUT std_logic_vector(31 DOWNTO 0);
		o_Inst : OUT std_logic_vector(31 DOWNTO 0);
		o_NextInstAddr : OUT std_logic_vector(31 DOWNTO 0)
	);

END mem_wb;

ARCHITECTURE structural OF mem_wb IS

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
	DestReg : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_DestReg,
		o_Q => o_DestReg
	);

	--reg-------------------------------
	Jump : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_Jump,
		o_Q => o_Jump
	);

	--reg-------------------------------
	BandO : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_BandO,
		o_Q => o_BandO
	);

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
	JR : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_JR,
		o_Q => o_JR
	);

	--reg-------------------------------
	JAL : nbit_Reg
	GENERIC MAP(N => 1)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_JAL,
		o_Q => o_JAL
	);

	--reg-------------------------------
	DMemOut : nbit_Reg
	GENERIC MAP(N => 32)
	PORT MAP(
		i_CLK => i_CLK,
		i_RST => i_RST,
		i_WE => i_WE,
		i_D => i_DMemOut,
		o_Q => o_DMemOut
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