-- TODO:

-- need to add zeros to useless mux out puts / need to compile
-- need to make test benches

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY f_alu IS
	GENERIC (N : INTEGER := 32);
	PORT (
		i_A : IN std_logic_vector(N - 1 DOWNTO 0); --input 1
		i_B : IN std_logic_vector(N - 1 DOWNTO 0); --input 2
		i_C : IN std_logic_vector (4 DOWNTO 0); --alu control
		o_S : OUT std_logic_vector(31 DOWNTO 0); --sum output
		o_C : OUT std_logic_vector(31 DOWNTO 0); --carry output
		o_Overflow : OUT std_logic);
END f_alu;

ARCHITECTURE structural OF f_alu IS

	--components:

	--32t1mux (one for sum one for carry)
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
			o_Q : OUT std_logic_vector(31 DOWNTO 0));
	END COMPONENT;

	COMPONENT mux32t1bit1wide IS
		PORT (
			i_D0 : IN std_logic;
			i_D1 : IN std_logic;
			i_D2 : IN std_logic;
			i_D3 : IN std_logic;
			i_D4 : IN std_logic;
			i_D5 : IN std_logic;
			i_D6 : IN std_logic;
			i_D7 : IN std_logic;
			i_D8 : IN std_logic;
			i_D9 : IN std_logic;
			i_D10 : IN std_logic;
			i_D11 : IN std_logic;
			i_D12 : IN std_logic;
			i_D13 : IN std_logic;
			i_D14 : IN std_logic;
			i_D15 : IN std_logic;
			i_D16 : IN std_logic;
			i_D17 : IN std_logic;
			i_D18 : IN std_logic;
			i_D19 : IN std_logic;
			i_D20 : IN std_logic;
			i_D21 : IN std_logic;
			i_D22 : IN std_logic;
			i_D23 : IN std_logic;
			i_D24 : IN std_logic;
			i_D25 : IN std_logic;
			i_D26 : IN std_logic;
			i_D27 : IN std_logic;
			i_D28 : IN std_logic;
			i_D29 : IN std_logic;
			i_D30 : IN std_logic;
			i_D31 : IN std_logic;
			i_S : IN std_logic_vector(4 DOWNTO 0);
			o_Q : OUT std_logic
		);
	END COMPONENT;

	--multu
	COMPONENT finaltest IS
		PORT (
			i_A : IN std_logic_vector(N - 1 DOWNTO 0);
			i_B : IN std_logic_vector(N - 1 DOWNTO 0);
			o_S : OUT std_logic_vector(63 DOWNTO 0);
			o_Cout : OUT std_logic);
	END COMPONENT;

	--add/sub
	COMPONENT add_sub_N_bit IS
		PORT (
			i_A : IN std_logic_vector(N - 1 DOWNTO 0);
			i_B : IN std_logic_vector(N - 1 DOWNTO 0);
			i_SELECT : IN std_logic;
			o_S : OUT std_logic_vector(31 DOWNTO 0);
			o_Cout : OUT std_logic;
			o_Overflow : OUT std_logic);
	END COMPONENT;

	--and
	COMPONENT andg32 IS
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			i_B : IN std_logic_vector(31 DOWNTO 0);
			o_F : OUT std_logic_vector(31 DOWNTO 0));
	END COMPONENT;

	--or
	COMPONENT org32 IS
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			i_B : IN std_logic_vector(31 DOWNTO 0);
			o_F : OUT std_logic_vector(31 DOWNTO 0));
	END COMPONENT;

	--xor
	COMPONENT xorg32 IS
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			i_B : IN std_logic_vector(31 DOWNTO 0);
			o_F : OUT std_logic_vector(31 DOWNTO 0));
	END COMPONENT;

	--nor
	COMPONENT norg32 IS
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			i_B : IN std_logic_vector(31 DOWNTO 0);
			o_F : OUT std_logic_vector(31 DOWNTO 0));
	END COMPONENT;

	--slt
	COMPONENT slt IS
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			i_B : IN std_logic_vector(31 DOWNTO 0);
			o_F : OUT std_logic);
	END COMPONENT;

	--beq
	COMPONENT beq IS
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			i_B : IN std_logic_vector(31 DOWNTO 0);
			o_F : OUT std_logic);
	END COMPONENT;

	--bne
	--(just an inverted beq)

	--invg
	COMPONENT invg32 IS
		PORT (
			i_A : IN std_logic_vector(31 DOWNTO 0);
			o_F : OUT std_logic_vector(31 DOWNTO 0));
	END COMPONENT;
	--------------------------------------------------------------------------------------------
	--architecture structural of f_alu is

	--signals:
	SIGNAL s_iS : std_logic;

	SIGNAL s_multu : std_logic_vector(63 DOWNTO 0);
	SIGNAL s_multu_first : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_multu_last : std_logic_vector(N - 1 DOWNTO 0);

	SIGNAL s_multu_carry : std_logic;

	SIGNAL s_add : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_add_carry : std_logic;
	SIGNAL s_add_ovfl : std_logic;
	SIGNAL s_sub : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_sub_carry : std_logic;
	SIGNAL s_sub_ovfl : std_logic;
	SIGNAL s_and : std_logic_vector(N - 1 DOWNTO 0);

	SIGNAL s_or : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_xor : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_nor : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_slt_bit : std_logic;
	SIGNAL s_slt : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_sltu : std_logic_vector(N - 1 DOWNTO 0);

	SIGNAL s_beq : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_bne : std_logic_vector(N - 1 DOWNTO 0);
	SIGNAL s_beq_bit : std_logic;
	SIGNAL s_bne_bit : std_logic;

BEGIN

	--arch:

	--32t1mux----------------------------------------
	g_32t1mux : mux32t1 --SUM OUTPUT MUX
	PORT MAP(
		i_D0 => x"00000000", -- sll
		i_D1 => x"00000000", -- srl
		i_D2 => x"00000000", -- sra
		i_D3 => x"00000000", -- sllv

		i_D4 => x"00000000", -- srlv
		i_D5 => x"00000000", -- srav
		i_D6 => i_A, -- jr
		i_D7 => s_multu(31 DOWNTO 0), -- multu

		i_D8 => s_add, -- add
		i_D9 => s_add, -- addu

		--NEED TO MAKE UNUSED OUTPUTS BELOW 0s
		i_D10 => s_sub, -- sub
		i_D11 => s_sub, -- subu

		i_D12 => s_and, -- and
		i_D13 => s_or, -- or
		i_D14 => s_xor, -- xor
		i_D15 => s_nor, -- nor

		i_D16 => s_slt, -- slt
		i_D17 => s_sltu, -- sltu
		i_D18 => x"00000000", -- j
		i_D19 => x"00000000", -- jal

		i_D20 => s_beq, -- beq
		i_D21 => s_bne, -- bne
		i_D22 => s_add, -- addi
		i_D23 => s_add, -- addiu

		i_D24 => s_slt, -- slti
		i_D25 => s_sltu, -- sltiu
		i_D26 => s_and, -- andi
		i_D27 => s_or, -- ori

		i_D28 => s_xor, -- xori
		i_D29 => s_add(15 DOWNTO 0) & x"0000", -- lui
		i_D30 => s_add, -- lw
		i_D31 => s_add, -- sw

		i_S => i_C,
		o_Q => o_S);
	----------------------------------------------------

	----------------------------------------------------
	--second mux that selects corresponding carry to out put
	g_32t1mux_carry : mux32t1bit1wide
	PORT MAP(
		i_D0 => '0',
		i_D1 => '0',
		i_D2 => '0',
		i_D3 => '0',

		i_D4 => '0',
		i_D5 => '0',
		i_D6 => '0',
		i_D7 => s_multu_carry,

		i_D8 => s_add_ovfl,
		i_D9 => '0',
		i_D10 => s_sub_ovfl,
		i_D11 => '0',

		i_D12 => '0',
		i_D13 => '0',
		i_D14 => '0',
		i_D15 => '0',

		i_D16 => '0',
		i_D17 => '0',
		i_D18 => '0',
		i_D19 => '0',

		i_D20 => '0',
		i_D21 => '0',
		i_D22 => s_add_ovfl,
		i_D23 => '0',

		i_D24 => '0',
		i_D25 => '0',
		i_D26 => '0',
		i_D27 => '0',

		i_D28 => '0',
		i_D29 => '0',
		i_D30 => '0',
		i_D31 => '0',

		i_S => i_C,
		o_Q => o_Overflow);

	--mult-------------------------------
	g_mult : finaltest
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		o_S => s_multu,
		o_Cout => s_multu_carry);--make 1 bit

	-- de concatenate multiplier parts

	s_multu_first <= s_multu(63 DOWNTO 32);
	s_multu_last <= s_multu(31 DOWNTO 0);
	o_C <= s_multu(63 DOWNTO 32);

	--s_add,----------------------------				
	g_add : add_sub_N_bit
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		i_SELECT => '0', -- '0'         => i_SELECT,
		o_S => s_add,
		o_Cout => s_add_carry,
		o_Overflow => s_add_ovfl);

	--s_sub,----------------------------
	g_sub : add_sub_N_bit
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		i_SELECT => '1',
		o_S => s_sub,
		o_Cout => s_sub_carry,
		o_Overflow => s_sub_ovfl);

	--and-------------------------------- CHANGE TO 32
	g_and : andg32
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		o_F => s_and);

	--or--------------------------------- CHANGE TO 32
	g_or : org32
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		o_F => s_or);

	--xor-------------------------------- CHANGE TO 32
	g_xor : xorg32
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		o_F => s_xor);

	--s_nor,----------------------------- CHANGE TO 32
	g_nor : norg32
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		o_F => s_nor);

	--s_slt,---------------------------- 
	-- g_slt: slt
	-- 		port MAP(i_A   =>  i_A,
	-- 				i_B	   =>  i_B,
	-- 				o_F  =>    s_slt_bit);
	-- 				s_slt <= x"0000000" & "000" & s_slt_bit;
	s_slt <= x"0000000" & "000" & s_sub(31);
	s_sltu <= x"0000000" & "000" & NOT s_sub_carry;

	--s_beq,------------------------- 
	g_beq : beq
	PORT MAP(
		i_A => i_A,
		i_B => i_B,
		o_F => s_beq_bit);
	s_beq <= x"0000000" & "000" & s_beq_bit;

	--s_bne,-------------------------
	-- g_invg: invg32
	-- 		port MAP( i_A  =>    s_beq,
	-- 				o_F    =>    s_bne);
	s_bne_bit <= NOT s_beq_bit;
	s_bne <= x"0000000" & "000" & s_bne_bit;

	----------------------------
END structural;