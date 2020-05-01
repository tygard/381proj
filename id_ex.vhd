library IEEE;
use IEEE.std_logic_1164.all;

entity id_ex is
  generic(N : integer := 32); 
  port(	i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		i_DestReg        : in std_logic_vector(N-1 downto 0); 
		i_jump       : in std_logic;  
		i_branch
		i_memread
		i_ALUop
		i_memwrite
		i_imm
		i_regwrite
		i_o_data0
		i_o_data1
		i_siExtend_output
		i_WHAT?
		i_WHAT?
		o_DestReg        : in std_logic_vector(N-1 downto 0); 
		o_jump       : in std_logic;  
		o_branch
		o_memread
		o_ALUop
		o_memwrite
		o_imm
		o_regwrite
		o_o_data0
		o_o_data1
		o_siExtend_output
		o_WHAT?
		o_WHAT?
		
		
		
		
		o_mem	     : out std_logic_vector (N-1 downto 0); 
		o_mux1       : out std_logic); 
	
end id_ex;

architecture structural of id_ex is

--components:
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
	
end structural;
