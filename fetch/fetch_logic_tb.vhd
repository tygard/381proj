LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY fetch_logic_tb IS
	GENERIC (N : INTEGER := 32);
	--port(
	--o_Sum : out std_logic_vector(31 downto 0) just troubleshooting delete later
	--);
END fetch_logic_tb;

ARCHITECTURE structure OF fetch_logic_tb IS
	COMPONENT fetch_logic IS
		PORT (
			i_Branch : IN std_logic;
			i_Jump : IN std_logic;
			i_instr : IN std_logic_vector(31 DOWNTO 0); -- 32 instruction
			i_PC : IN std_logic_vector(31 DOWNTO 0); -- the PC value
			o_PC : OUT std_logic_vector(31 DOWNTO 0) -- output to the PC register
		);
	END COMPONENT;

	SIGNAL i_tBranch : std_logic;
	SIGNAL i_tJump : std_logic;
	SIGNAL i_tinstr : std_logic_vector(31 DOWNTO 0);
	SIGNAL i_tPC : std_logic_vector(31 DOWNTO 0);
	SIGNAL o_tPC : std_logic_vector(31 DOWNTO 0);
BEGIN

	DUT : fetch_logic
	GENERIC MAP(S => N)
	PORT MAP(
		i_Branch => i_tBranch,
		i_Jump => i_tJump,
		i_instr => i_tinstr,
		i_PC => i_tPC,
		o_PC => o_tPC
	);
	PROCESS
	BEGIN
		-- test run command for modelsim: vsim -voptargs="+acc" fetch_logic_tb

		-- TEST 1: INCREMENT THE PC
		i_tBranch <= '0'; -- disable branch
		i_tJump <= '0'; -- disable jump
		-- when both jump and branch are disabled we just increment the PC by 4

		i_tPC <= x"00000000"; -- PC = 0 for easy testing
		i_tinstr <= x"33333333"; -- for this test inst doesnt matter, just PC+4
		-- ^^^ instruction input (when branch the address is lower 16 bits, when jump is lower 26 bits)
		WAIT FOR 100 ns;

		-- TEST 2: BRANCH
		i_tBranch <= '1'; -- enable branch
		i_tJump <= '0'; -- disable jump
		-- branch using the 16 bit immediate 

		i_tPC <= x"00000000"; -- PC = 0 for easy testing
		i_tinstr <= x"00001111"; -- branch address is 16 bit imm, o_PC should be driven to i_PC+4 + 0x00004444 = 0x00004448 
		-- ^^^ instruction input (when branch the address is lower 16 bits, when jump is lower 26 bits)
		WAIT FOR 100 ns;

		-- TEST 3: BRANCH
		i_tBranch <= '1'; -- enable branch
		i_tJump <= '0'; -- disable jump
		-- branch using the 16 bit immediate 

		i_tPC <= x"00000000"; -- PC = 0 for easy testing
		i_tinstr <= x"00001010"; -- branch address is 16 bit imm, o_PC should be driven to i_PC+4 + 0x00004040 = 0x00004044 
		-- ^^^ instruction input (when branch the address is lower 16 bits, when jump is lower 26 bits)
		WAIT FOR 100 ns;

		-- TEST 4: JUMP
		i_tBranch <= '0'; -- disable branch
		i_tJump <= '1'; -- enable jump
		-- jump using the 26 bit immediate 

		i_tPC <= x"F0000000"; -- top 4 bits are set to 1's to test concatenation
		i_tinstr <= x"02222222"; -- jump address is 26 bit imm, o_PC should be driven to i_instr(31-28) & 0x08888888 = 0xF8888888
		-- ^^^ instruction input (when jump the address is lower 26 bits, when jump is lower 26 bits)
		WAIT FOR 100 ns;

		-- TEST 5:	BRANCH AND JUMP
		i_tBranch <= '1'; -- enable branch
		i_tJump <= '1'; -- enable jump
		-- jump using the 26 bit immediate 

		i_tPC <= x"E1111111"; -- PC = 0 for easy testing
		i_tinstr <= x"11111111"; -- jump address is 26 bit imm, o_PC should be driven to i_instr(31-28) & 0x01111111 = 0xE4444444
		-- ^^^ instruction input (when branch the address is lower 16 bits, when jump is lower 26 bits)
		WAIT FOR 100 ns;

	END PROCESS;
END structure;