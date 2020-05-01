library IEEE;
use IEEE.std_logic_1164.all;

entity if_id is
  generic(N : integer := 32); 
  port(	i_mem       : in std_logic_vector(N-1 downto 0); 
		i_mux1      : in std_logic_vector(N-1 downto 0); 
		i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		o_mem	    : out std_logic_vector (N-1 downto 0); 
		o_mux1      : out std_logic_vector(N-1 downto 0)); 
	
end if_id;

architecture structural of if_id is

--components:
  
--nbit_Reg
component nbit_Reg  is
	port(
		i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		i_D        : in std_logic_vector(N-1 downto 0);
		o_Q         : out std_logic_vector(N-1 downto 0));
  end component;

--------------------------------------------------------------------------------------------
--architecture structural of f_alu is

--signals:							
		
	signal s_multu : std_logic_vector(63 downto 0);
	signal s_multu_carry : std_logic;
  
begin

--arch:

--mult-------------------------------
g_mult: m_N_bit
		port MAP(i_A     =>  i_A,
				i_B	     =>  i_B,
				o_S      =>    s_multu,
				o_Cout	 =>  s_multu_carry);--make 1 bit
				
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
	
----------------------------
end structural;