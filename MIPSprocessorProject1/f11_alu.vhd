-- TODO:

-- need to add zeros to useless mux out puts / need to compile
-- need to make test benches

library IEEE;
use IEEE.std_logic_1164.all;

entity f_alu is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);  --input 1
		i_B         : in std_logic_vector(N-1 downto 0);  --input 2
		i_C	        : in std_logic_vector (4 downto 0);   --alu control
		o_S         : out std_logic_vector(31 downto 0); --sum output
		o_C         : out std_logic_vector(31 downto 0); --carry output
		o_Overflow  : out std_logic);
end f_alu;

architecture structural of f_alu is

--components:

--32t1mux (one for sum one for carry)
 component mux32t1 is
	port(
        i_D0: in std_logic_vector(31 downto 0);
		i_D1: in std_logic_vector(31 downto 0);
		i_D2: in std_logic_vector(31 downto 0);
		i_D3: in std_logic_vector(31 downto 0);
		i_D4: in std_logic_vector(31 downto 0);
		i_D5: in std_logic_vector(31 downto 0);
		i_D6: in std_logic_vector(31 downto 0);
		i_D7: in std_logic_vector(31 downto 0);
		i_D8: in std_logic_vector(31 downto 0);
		i_D9: in std_logic_vector(31 downto 0);
		i_D10: in std_logic_vector(31 downto 0);
		i_D11: in std_logic_vector(31 downto 0);
		i_D12: in std_logic_vector(31 downto 0);
		i_D13: in std_logic_vector(31 downto 0);
		i_D14: in std_logic_vector(31 downto 0);
		i_D15: in std_logic_vector(31 downto 0);
		i_D16: in std_logic_vector(31 downto 0);
		i_D17: in std_logic_vector(31 downto 0);
		i_D18: in std_logic_vector(31 downto 0);
		i_D19: in std_logic_vector(31 downto 0);
		i_D20: in std_logic_vector(31 downto 0);
		i_D21: in std_logic_vector(31 downto 0);
		i_D22: in std_logic_vector(31 downto 0);
		i_D23: in std_logic_vector(31 downto 0);
		i_D24: in std_logic_vector(31 downto 0);
		i_D25: in std_logic_vector(31 downto 0);
		i_D26: in std_logic_vector(31 downto 0);
		i_D27: in std_logic_vector(31 downto 0);
		i_D28: in std_logic_vector(31 downto 0);
		i_D29: in std_logic_vector(31 downto 0);
		i_D30: in std_logic_vector(31 downto 0);
		i_D31: in std_logic_vector(31 downto 0);
		i_S: in std_logic_vector(4 downto 0);
        o_Q  : out std_logic_vector(31 downto 0));
  end component;
  
  component mux32t1bit1wide is
	port(
		i_D0: in std_logic;
		i_D1: in std_logic;
		i_D2: in std_logic;
		i_D3: in std_logic;
		i_D4: in std_logic;
		i_D5: in std_logic;
		i_D6: in std_logic;
		i_D7: in std_logic;
		i_D8: in std_logic;
		i_D9: in std_logic;
		i_D10: in std_logic;
		i_D11: in std_logic;
		i_D12: in std_logic;
		i_D13: in std_logic;
		i_D14: in std_logic;
		i_D15: in std_logic;
		i_D16: in std_logic;
		i_D17: in std_logic;
		i_D18: in std_logic;
		i_D19: in std_logic;
		i_D20: in std_logic;
		i_D21: in std_logic;
		i_D22: in std_logic;
		i_D23: in std_logic;
		i_D24: in std_logic;
		i_D25: in std_logic;
		i_D26: in std_logic;
		i_D27: in std_logic;
		i_D28: in std_logic;
		i_D29: in std_logic;
		i_D30: in std_logic;
		i_D31: in std_logic;
		i_S: in std_logic_vector(4 downto 0);
        o_Q  : out std_logic
	);
  end component;

--multu
 component finaltest is
	port(
  	i_A         : in std_logic_vector(N-1 downto 0);
	i_B         : in std_logic_vector(N-1 downto 0);
	o_S         : out std_logic_vector(63 downto 0); 
	o_Cout      : out std_logic);
  end component;
  
--add/sub
component add_sub_N_bit  is
	port(
  	i_A         : in std_logic_vector(N-1 downto 0);
	i_B         : in std_logic_vector(N-1 downto 0);
	i_SELECT    : in std_logic;
	o_S         : out std_logic_vector(31 downto 0); 
	o_Cout      : out std_logic;
	o_Overflow  : out std_logic);
  end component;

--and
 component andg32 is
    port(	i_A      : in std_logic_vector(31 downto 0);
			i_B      : in std_logic_vector(31 downto 0); 
			o_F      : out std_logic_vector(31 downto 0));
  end component;
  
  --or
  component org32 is
    port(	i_A          : in std_logic_vector(31 downto 0);
            i_B          : in std_logic_vector(31 downto 0);
            o_F          : out std_logic_vector(31 downto 0));
  end component;
  
  --xor
   component xorg32 is
    port(	i_A          : in std_logic_vector(31 downto 0);
            i_B          : in std_logic_vector(31 downto 0);
            o_F          : out std_logic_vector(31 downto 0));
  end component;
  
  --nor
   component norg32 is
    port(	i_A          : in std_logic_vector(31 downto 0);
            i_B          : in std_logic_vector(31 downto 0);
            o_F          : out std_logic_vector(31 downto 0));
  end component;
  
  --slt
   component slt is
    port(	i_A          : in std_logic_vector(31 downto 0);
            i_B          : in std_logic_vector(31 downto 0);
            o_F          : out std_logic);
  end component;
  
  --beq
   component beq is
    port(	i_A          : in std_logic_vector(31 downto 0);
            i_B          : in std_logic_vector(31 downto 0);
            o_F          : out std_logic);
  end component;
  
  --bne
  --(just an inverted beq)
  
  --invg
 component invg32 is
    port(	i_A          : in std_logic_vector(31 downto 0);
            o_F          : out std_logic_vector(31 downto 0));
  end component;
--------------------------------------------------------------------------------------------
--architecture structural of f_alu is

--signals:
	signal s_iS : std_logic;							
		
	signal s_multu : std_logic_vector(63 downto 0);
	signal s_multu_first : std_logic_vector(N-1 downto 0);
	signal s_multu_last : std_logic_vector(N-1 downto 0);
	
	signal s_multu_carry : std_logic;
	
	signal s_add : std_logic_vector(N-1 downto 0);	
	signal s_add_carry : std_logic;	
	signal s_add_ovfl : std_logic;	
	signal s_sub: std_logic_vector(N-1 downto 0);	
	signal s_sub_carry: std_logic;	
	signal s_sub_ovfl: std_logic;	
	signal s_and : std_logic_vector(N-1 downto 0);	
	
	signal s_or : std_logic_vector(N-1 downto 0);	
	signal s_xor : std_logic_vector(N-1 downto 0);	
	signal s_nor : std_logic_vector(N-1 downto 0);	
	signal s_slt_bit : std_logic;	
	signal s_slt : std_logic_vector(N-1 downto 0);	
	signal s_sltu : std_logic_vector(N-1 downto 0);	

	signal s_beq : std_logic_vector(N-1 downto 0);	
	signal s_bne : std_logic_vector(N-1 downto 0);
	signal s_beq_bit : std_logic;	
	signal s_bne_bit : std_logic;	
  
begin

--arch:

--32t1mux----------------------------------------
g_32t1mux: mux32t1 --SUM OUTPUT MUX
		port MAP(
		i_D0   => x"00000000",	-- sll
		i_D1   => x"00000000",	-- srl
		i_D2   => x"00000000",	-- sra
		i_D3   => x"00000000",	-- sllv
		
		i_D4   => x"00000000",	-- srlv
		i_D5   => x"00000000",	-- srav
		i_D6   => i_A,		-- jr
		i_D7   => s_multu(31 downto 0),	-- multu
		
		i_D8   => s_add,	-- add
		i_D9   => s_add,	-- addu
		
		--NEED TO MAKE UNUSED OUTPUTS BELOW 0s
		i_D10   => s_sub,	-- sub
		i_D11   => s_sub,	-- subu

		i_D12   => s_and,	-- and
		i_D13   => s_or,	-- or
		i_D14   => s_xor,	-- xor
		i_D15   => s_nor,	-- nor
		
		i_D16   => s_slt,	-- slt
		i_D17   => s_sltu,	-- sltu
		i_D18   => x"00000000",	-- j
		i_D19   => x"00000000",	-- jal
		
		i_D20   => s_beq,	-- beq
		i_D21   => s_bne,	-- bne
        i_D22   => s_add,	-- addi
		i_D23   => s_add,	-- addiu
		
		i_D24   => s_slt,	-- slti
		i_D25   => s_sltu,	-- sltiu
		i_D26   => s_and,	-- andi
		i_D27   => s_or,	-- ori
		
		i_D28   => s_xor,	-- xori
		i_D29   => s_add(15 downto 0) & x"0000",	-- lui
		i_D30   => s_add,	-- lw
		i_D31   => s_add,	-- sw
		
		i_S     =>  i_C,
        o_Q     =>  o_S);
		
		
----------------------------------------------------

      

----------------------------------------------------
--second mux that selects corresponding carry to out put
	g_32t1mux_carry: mux32t1bit1wide
		port MAP(
		i_D0   =>  '0',
		i_D1   =>  '0',
		i_D2   =>  '0',
		i_D3   =>   '0',
		
		i_D4   =>   '0',
		i_D5   =>  '0',
		i_D6   => '0',
		i_D7   =>  s_multu_carry,
		
		i_D8   =>  s_add_ovfl,
		i_D9   =>   '0',
		i_D10   =>  s_sub_ovfl,
		i_D11   =>  '0',
		
		i_D12   =>  '0',
		i_D13   => '0',
		i_D14   =>  '0',
		i_D15   => '0',
		
		i_D16   =>  '0',
		i_D17   => '0',
		i_D18   =>  '0',
		i_D19   =>   '0',
		
		i_D20   =>  '0',
		i_D21   => '0',
        i_D22   => s_add_ovfl,
		i_D23   =>  '0',
		
		i_D24   =>  '0',
		i_D25   =>  '0',
		i_D26   => '0',
		i_D27   =>  '0',
		
		i_D28   =>  '0',
		i_D29   =>  '0',
		i_D30   =>  '0',
		i_D31   =>  '0',
		
		i_S     =>  i_C,
        o_Q     =>  o_Overflow);

--mult-------------------------------
g_mult: finaltest
		port MAP(i_A     =>  i_A,
				i_B	     =>  i_B,
				o_S      =>    s_multu,
				o_Cout	 =>  s_multu_carry);--make 1 bit
				
-- de concatenate multiplier parts

	s_multu(63 downto 32) <= s_multu_first;
	s_multu(31 downto 0) <= s_multu_last;
	
	
	  o_C     <=  s_multu(63 downto 32);

--s_add,----------------------------				
g_add: add_sub_N_bit
		port MAP(i_A         => i_A,
				 i_B         => i_B,
				i_SELECT          => '0', -- '0'         => i_SELECT,
				   o_S     =>  s_add,
				o_Cout	 =>   s_add_carry,
				o_Overflow => s_add_ovfl);
				
--s_sub,----------------------------
g_sub: add_sub_N_bit
		port MAP(i_A =>  i_A,
				 i_B =>  i_B,
				i_SELECT =>  '1',
				o_S => s_sub,
				 o_Cout =>  s_sub_carry,
				 o_Overflow => s_sub_ovfl);

--and-------------------------------- CHANGE TO 32
g_and: andg32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_F  =>    s_and);
		
--or--------------------------------- CHANGE TO 32
g_or: org32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_F   =>  s_or);	
				
--xor-------------------------------- CHANGE TO 32
g_xor: xorg32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_F   => s_xor );
	
--s_nor,----------------------------- CHANGE TO 32
g_nor: norg32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_F   => s_nor );

--s_slt,---------------------------- 
-- g_slt: slt
-- 		port MAP(i_A   =>  i_A,
-- 				i_B	   =>  i_B,
-- 				o_F  =>    s_slt_bit);
-- 				s_slt <= x"0000000" & "000" & s_slt_bit;
s_slt <= x"0000000" & "000" & s_sub(31);
s_sltu <= x"0000000" & "000" & not s_sub_carry;

--s_beq,------------------------- 
g_beq: beq
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_F  =>    s_beq_bit);
				s_beq <= x"0000000" & "000" & s_beq_bit;

--s_bne,-------------------------
-- g_invg: invg32
-- 		port MAP( i_A  =>    s_beq,
-- 				o_F    =>    s_bne);
s_bne_bit <= not s_beq_bit;
	s_bne <= x"0000000" & "000" & s_bne_bit;

----------------------------
end structural;
