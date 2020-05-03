-- fetch_logic.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains the fetch logic for the single-cycle MIPS Processor

-- 02/29/2020 by tygard:Design created.
-------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
-- Branch & Jump = Jump
-- Branch uses 16 bit imm, left shift 2 is taken care of in this component : 1 binary bit per address
-- Jump uses 26 bit imm, left shift 2 is taken care of in this component : 1 binary bit per address
-- if neither jump or branch is selected then we increment the PC by 4 : one address location
ENTITY fetch_logic IS
	GENERIC (N : INTEGER := 32);
	PORT (
		i_Branch : IN std_logic;
		i_Jump : IN std_logic;
		i_instr : IN std_logic_vector(31 DOWNTO 0); -- 32 instruction
		i_PC : IN std_logic_vector(31 DOWNTO 0); -- the PC value
		o_PC : OUT std_logic_vector(31 DOWNTO 0) -- output to the PC register
	);
END fetch_logic;

ARCHITECTURE structure OF fetch_logic IS

	COMPONENT adder_N_bit IS
		GENERIC (N : INTEGER := 32);
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			i_B : IN std_logic_vector(31 DOWNTO 0);
			i_Cin : IN std_logic;
			o_S : OUT std_logic_vector(31 DOWNTO 0);
			o_Cout : OUT std_logic
		);
	END COMPONENT;

	COMPONENT mux2t1_N IS
		GENERIC (N : INTEGER := 32);
		PORT (
			i_S : IN std_logic;
			i_D0 : IN std_logic_vector(31 DOWNTO 0);
			i_D1 : IN std_logic_vector(31 DOWNTO 0);
			o_O : OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT extender IS
		GENERIC (Y : INTEGER := 16);
		PORT (
			input : IN std_logic_vector(15 DOWNTO 0);
			sign : IN std_logic;
			output : OUT std_logic_vector(31 DOWNTO 0));
	END COMPONENT;

	SIGNAL s_SEBA : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_SEBASL2 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_Mux0 : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_JA : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_BA : std_logic_vector(31 DOWNTO 0);
	SIGNAL s_JASL2 : std_logic_vector(27 DOWNTO 0);
	SIGNAL s_PC4 : std_logic_vector(31 DOWNTO 0);

BEGIN
	extender0 : extender
	PORT MAP(
		input => i_instr(15 DOWNTO 0),
		sign => '0',
		output => s_SEBA
	);

	-- shift left SEBA, store in SEABSL2
	s_SEBASL2(31 DOWNTO 0) <= s_SEBA(29 DOWNTO 0) & "00";

	adder0 : adder_N_bit
	PORT MAP(
		i_A => i_PC,
		i_B => x"00000004", -- add 4 to the PC
		i_Cin => '0', -- no carry in
		o_S => s_PC4,
		o_Cout => OPEN -- we dont use the Cout because the PC will never have its MSB increased
	);

	-- shift left inst[25:0] by 2 bits, store in JASL2
	s_JASL2 <= i_instr(25 DOWNTO 0) & "00";

	-- concatenate PC+4 and JASL2
	s_JA <= s_PC4(31 DOWNTO 28) & s_JASL2(27 DOWNTO 0);

	adder1 : adder_N_bit
	PORT MAP(
		i_A => s_SEBASL2,
		i_B => s_PC4, -- branch address after shift left 2 in overall design		
		i_Cin => '0', -- no carry in
		o_S => s_BA,
		o_Cout => OPEN -- we dont use the Cout because the PC will never have its MSB increased
	);

	mux0 : mux2t1_N
	PORT MAP(
		i_S => i_Branch, -- select branch address when this bit is set, D0 when not
		i_D0 => s_PC4, -- just the PC+4
		i_D1 => s_BA, -- output from adder1, branch address
		o_O => s_Mux0 -- either next instruction address or branch address
	);

	mux1 : mux2t1_N
	PORT MAP(
		i_S => i_Jump, -- select either next instr addr or BA when this bit is set, JA when not
		i_D0 => s_Mux0, -- 32 bit branch or PC+4 address	
		i_D1 => s_JA, -- JA
		o_O => o_PC -- next PC value
	);

END structure;