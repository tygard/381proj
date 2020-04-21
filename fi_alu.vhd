library IEEE;
use IEEE.std_logic_1164.all;

entity f_alu is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);--input 1
		i_B         : in std_logic_vector(N-1 downto 0);--input 2
		i_C			: in std_logic_vector (4 downto 0);--alu control
		o_S         : out std_logic_vector(63 downto 0)); --I BELIEVE THE OUTPUT WILL BE 64 BITS -ADNAN
end f_alu;

architecture structural of f_alu is
--32t1mux
 component mux32t1 is
  port (i_D0: in std_logic_vector(31 downto 0);
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
--sll
--srl
component barrelshift_32 is
	port (
  i_SHAMT           : in std_logic_vector(4 downto 0);		 -- Shift amount input
       i_D	        : in std_logic;     					 -- Shift direction input (0: right, 1: left)
       i_T          : in std_logic;     					 -- Shift type input (0: logical, 1: arith.)
	   i_X          : in std_logic_vector(31 downto 0);     -- Data value input
       o_Y          : out std_logic_vector(31 downto 0));
  end component;
--sra

--sllv

--srlv

--srav

--jr

--multu
 component m_N_bit is
	port(
  	i_A         : in std_logic_vector(N-1 downto 0);
	i_B         : in std_logic_vector(N-1 downto 0);
	o_S         : out std_logic_vector(63 downto 0); --I BELIEVE THE OUTPUT WILL BE 64 BITS -ADNAN
	o_Cout      : out std_logic);
  end component;
--add

--addu --taken care of by add immediate mux?

--sub

--subu  --taken care of by add immediate mux?

--and
 component andg2 is
    port(	i_A      : in std_logic;
			i_B      : in std_logic; 
			o_F      : out std_logic);
  end component;
  
  --or
  component org2 is
    port(	i_A          : in std_logic;
            i_B          : in std_logic;
            o_F          : out std_logic
  end component;
  --xor
   component xorg2 is
    port(	i_A          : in std_logic;
            i_B          : in std_logic;
            o_F          : out std_logic
  end component;
  --nor
  
  --slt
  
  --sltu  --taken care of by add immediate mux?

  
  --jr
  
  --jal
  
  --beq
  
  --bne
  
  --addi  --taken care of by add immediate mux?

  
  --addiu  --taken care of by add immediate mux?

  
  --slti  --taken care of by add immediate mux?

  
  --sltiu  --taken care of by add immediate mux?

  
  --andi  --taken care of by add immediate mux?

  
  --ori  --taken care of by add immediate mux?

  
  --xori  --taken care of by add immediate mux?
  
  --lui --pass through?
  
  --lw --pass through?
  
  --sv  --pass through?
  
--------------------------------------------------------------------------------------------
architecture structural of f_alu is

	signal s_iS : std_logic;							
	
	signal s_sll : std_logic_vector(N-1 downto 0);	
	signal s_srl : std_logic_vector(N-1 downto 0);	
	signal s_sra : std_logic_vector(N-1 downto 0);	
	signal s_sllv : std_logic_vector(N-1 downto 0);	
	
	signal s_srlv : std_logic_vector(N-1 downto 0);	
	signal s_srav : std_logic_vector(N-1 downto 0);	
	signal s_jr : std_logic_vector(N-1 downto 0);	
	signal s_multu : std_logic_vector(N-1 downto 0);
	
	signal s_add : std_logic_vector(N-1 downto 0);	
	signal s_addu : std_logic_vector(N-1 downto 0);	
	signal s_sub: std_logic_vector(N-1 downto 0);	
	signal s_subu : std_logic_vector(N-1 downto 0);	
	
	signal s_and : std_logic_vector(N-1 downto 0);	
	signal s_or : std_logic_vector(N-1 downto 0);	
	signal s_xor : std_logic_vector(N-1 downto 0);	
	signal s_nor : std_logic_vector(N-1 downto 0);
	
	signal s_slt : std_logic_vector(N-1 downto 0);	
	signal s_srtu : std_logic_vector(N-1 downto 0);	
	signal s_j: std_logic_vector(N-1 downto 0);	
	signal s_jal : std_logic_vector(N-1 downto 0);	
	
	signal s_beq : std_logic_vector(N-1 downto 0);	
	signal s_bne : std_logic_vector(N-1 downto 0);	
	signal s_addi : std_logic_vector(N-1 downto 0);	
	signal s_addiu : std_logic_vector(N-1 downto 0);
	
	signal s_slti : std_logic_vector(N-1 downto 0);	
	signal s_srtiu : std_logic_vector(N-1 downto 0);	
	signal s_andi : std_logic_vector(N-1 downto 0);	
	signal s_ori: std_logic_vector(N-1 downto 0);	
	
	signal s_xori : std_logic_vector(N-1 downto 0);	
	signal s_lui : std_logic_vector(N-1 downto 0);	
	signal s_lw : std_logic_vector(N-1 downto 0);	
	signal s_sv : std_logic_vector(N-1 downto 0);	
  
begin
--32t1mux----------------------------------------
g_32t1mux: mux32t1
		port MAP(
		i_D0   =>  s_sll,
		i_D1   =>  s_srl,
		i_D2   =>  s_sra,
		i_D3   =>  s_sllv,
		
		i_D4   =>  s_srlv,
		i_D5   =>  s_srav,
		i_D6   =>  s_jr,
		i_D7   =>  s_multu,
		
		i_D8   =>  s_add,
		i_D9   =>  s_addu,
		i_D10   => s_sub,
		i_D11   => s_subu,
		
		i_D12   => s_and,
		i_D13   => s_or,
		i_D14   => s_xor,
		i_D15   => s_nor,
		
		i_D16   => s_slt,
		i_D17   => s_sltu,
		i_D18   => s_j,
		i_D19   =>  s_jal,
		
		i_D20   => s_beq,
		i_D21   => s_bne,
		i_D22   => s_addi,
		i_D23   => s_addiu,
		
		i_D24   => s_slti,
		i_D25   => s_sltiu,
		i_D26   => s_andi,
		i_D27   => s_ori,
		
		i_D28   => s_xori,
		i_D29   => s_lui,
		i_D30   => s_lw,
		i_D31   => s_sv,
		
		i_S     =>  i_C,
        o_Q     =>  o_S);
--sll--------------------------------
g_barrel_sll: barrelshift_32
		port MAP(i_A   =>  i_SHAMT,
				'1'	   =>  i_D,
				'0'    =>  i_T,
				i_B	   =>  i_X,
				s_sll  =>  o_Y);
--srl--------------------------------
g_barrel_srl: barrelshift_32
		port MAP(i_A   =>  i_SHAMT,
				'0'	   =>  i_D,
				'0'    =>  i_T,
				i_B	   =>  i_X,
				s_srl  =>  o_Y);
				
--  s_sra,----------------------------

--  s_sllv,---------------------------

--- s_srlv,---------------------------

--  s_srav,---------------------------

--- s_jr,-----------------------------

--mult--------------------------------
g_mult: m_N_bit
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				'0'    =>  o_S,
				s_multu	   =>  o_Cout);
--and--------------------------------
g_and: andg2
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				s_and	   =>  o_Cout);
				
--s_addu,---------------------------

--s_sub,----------------------------

--s_subu,---------------------------
		
--or--------------------------------
g_or: org2
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				s_or	   =>  o_Cout);	
				
--xor--------------------------------
g_xor: xorg2
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				s_xor	   =>  o_Cout);
	

--s_nor,--------------------------
		
-- s_slt,-------------------------
-- s_sltu,------------------------
-- s_j,---------------------------
--  s_jal,------------------------
		
-- s_beq,-------------------------
-- s_bne,-------------------------
-- s_addi,------------------------
-- s_addiu,-----------------------
		
-- s_slti,------------------------
-- s_sltiu,-----------------------
-- s_andi,------------------------
-- s_ori,-------------------------
		
--> s_xori,-----------------------
-- s_lui,-------------------------
-- s_lw,--------------------------
-- s_sv,--------------------------
----------------------------
end structural;