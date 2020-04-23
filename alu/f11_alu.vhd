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
		o_S         : out std_logic_vector(32 downto 0); --sum output
		o_C         : out std_logic_vector(32 downto 0); --carry output
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

--multu
 component m_N_bit is
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
	o_S         : out std_logic_vector(63 downto 0); 
	o_Cout      : out std_logic);
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
	signal s_add_carry : std_logic_vector(N-1 downto 0);	
	signal s_sub: std_logic_vector(N-1 downto 0);	
	signal s_sub_carry: std_logic_vector(N-1 downto 0);	
	signal s_and : std_logic_vector(N-1 downto 0);	
	
	signal s_or : std_logic_vector(N-1 downto 0);	
	signal s_xor : std_logic_vector(N-1 downto 0);	
	signal s_nor : std_logic_vector(N-1 downto 0);	
	signal s_slt : std_logic_vector(N-1 downto 0);	
	
	signal s_beq : std_logic_vector(N-1 downto 0);	
	signal s_bne : std_logic_vector(N-1 downto 0);	
  
begin

--arch:

--32t1mux----------------------------------------
g_32t1mux: mux32t1 --SUM OUTPUT MUX
		port MAP(
		i_D0   =>  s_multu_first,
		i_D1   =>  s_add,
		i_D2   =>  s_sub,
		i_D3   =>  s_and,
		
		i_D4   =>  s_or,
		i_D5   =>  s_xor,
		i_D6   =>  s_nor,
		i_D7   =>  s_slt,
		
		i_D8   =>  s_beq,
		i_D9   =>  s_bne,
		
		--NEED TO MAKE UNUSED OUTPUTS BELOW 0s
		i_D10   => X"00000000",
		i_D11   =>  X"00000000",
		
		i_D12   =>  X"00000000",
		i_D13   =>  X"00000000",
		i_D14   =>  X"00000000",
		i_D15   =>  X"00000000",
		
		i_D16   =>  X"00000000",
		i_D17   =>  X"00000000",
		i_D18   =>  X"00000000",
		i_D19   =>   X"00000000",
		
		i_D20   =>  X"00000000",
		i_D21   =>  X"00000000",
        i_D22   =>  X"00000000",
		i_D23   =>  X"00000000",
		
		i_D24   =>  X"00000000",
		i_D25   =>  X"00000000",
		i_D26   =>  X"00000000",
		i_D27   =>  X"00000000",
		
		i_D28   =>  X"00000000",
		i_D29   =>  X"00000000",
		i_D30   =>  X"00000000",
		i_D31   =>  X"00000000",
		
		i_S     =>  i_C,
        o_Q     =>  o_S);
		
		
	----------------------------------------------------

        o_C     =>  s_multu_last;

----------------------------------------------------
--third mux that selects corresponding carry to out put
	g_32t1mux_carry: mux32t1
		port MAP(
		i_D0   =>  s_multu_carry,
		i_D1   =>  s_add_carry,
		i_D2   =>  s_sub_carry,
		
		--NEED TO MAKE UNUSED OUTPUTS BELOW 0s
		i_D3   =>   X"00000000",
		
		i_D4   =>   X"00000000",
		i_D5   =>   X"00000000",
		i_D6   =>   X"00000000",
		i_D7   =>   X"00000000",
		
		i_D8   =>   X"00000000",
		i_D9   =>   X"00000000",
		i_D10   =>  X"00000000",
		i_D11   =>  X"00000000",
		
		i_D12   =>  X"00000000",
		i_D13   =>  X"00000000",
		i_D14   =>  X"00000000",
		i_D15   =>  X"00000000",
		
		i_D16   =>  X"00000000",
		i_D17   =>  X"00000000",
		i_D18   =>  X"00000000",
		i_D19   =>   X"00000000",
		
		i_D20   =>  X"00000000",
		i_D21   =>  X"00000000",
        i_D22   =>  X"00000000",
		i_D23   =>  X"00000000",
		
		i_D24   =>  X"00000000",
		i_D25   =>  X"00000000",
		i_D26   =>  X"00000000",
		i_D27   =>  X"00000000",
		
		i_D28   =>  X"00000000",
		i_D29   =>  X"00000000",
		i_D30   =>  X"00000000",
		i_D31   =>  X"00000000",
		
		i_S     =>  i_C,
        o_Q     =>  o_Overflow);

--mult-------------------------------
g_mult: m_N_bit
		port MAP(i_A     =>  i_A,
				i_B	     =>  i_B,
				o_S      =>    s_multu,
				o_Cout	 =>  s_multu_carry);--make 1 bit
				
-- de concatenate multiplier parts

	s_multu(63 downto 32) => s_multu_first;
	s_multu(31 downto 0) => s_multu_last;

--s_add,----------------------------				
g_add: add_sub_N_bit
		port MAP(i_A         => i_A,
				 i_B         => i_B,
				i_SELECT          => '0', -- '0'         => i_SELECT,
				   o_S     =>  s_add,
				o_Cout	 =>   s_add_carry);
				
--s_sub,----------------------------
g_sub: add_sub_N_bit
		port MAP(i_A         =>  i_A,
				 i_B         =>  i_B,
				i_SELECT          =>  '0',
				o_S        =>  s_sub,
				 o_Cout 	 =>  s_sub_carry);

--and-------------------------------- CHANGE TO 32
g_and: andg32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_Cout  =>    s_and);
		
--or--------------------------------- CHANGE TO 32
g_or: org32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				s_or   =>  o_Cout);	
				
--xor-------------------------------- CHANGE TO 32
g_xor: xorg32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_Cout   => s_xor );
	
--s_nor,----------------------------- CHANGE TO 32
g_nor: norg32
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_Cout   => s_nor );

--s_slt,---------------------------- 
g_slt: slt
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_F  =>    s_slt);

--s_beq,------------------------- 
g_beq: beq
		port MAP(i_A   =>  i_A,
				i_B	   =>  i_B,
				o_F  =>    s_beq);

--s_bne,-------------------------
g_invg: invg32
		port MAP( i_A  =>    s_beq,
				o_F    =>    s_bne);

----------------------------
end structural;
