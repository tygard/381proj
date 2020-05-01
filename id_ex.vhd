library IEEE;
use IEEE.std_logic_1164.all;

entity id_ex is
  generic(N : integer := 32); 
  port(	i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		
		i_DestReg        : in std_logic_vector(N-1 downto 0); 
		i_jump       : in std_logic;  
		i_branch            : in std_logic;  
		i_memread          : in std_logic;  
		i_ALUop       : in std_logic_vector(5 downto 0); 
		i_memwrite         : in std_logic;  
		i_imm         : in std_logic;  
		i_regwrite         : in std_logic;  
		i_o_data0  : in std_logic_vector(N-1 downto 0);
		i_o_data1  : in std_logic_vector(N-1 downto 0);
		i_siExtend_output  : in std_logic_vector(N-1 downto 0);
		i_f1_alu_con    : in std_logic_vector(4 downto 0); 
		i_s_inst : in std_logic_vector(4 downto 0); 
	
		o_DestReg        : in std_logic_vector(N-1 downto 0); 
		o_jump       : in std_logic;  
		o_branch            : in std_logic;  
		o_memread          : in std_logic;  
		o_ALUop       : in std_logic_vector(5 downto 0); 
		o_memwrite         : in std_logic;  
		o_imm         : in std_logic;  
		o_regwrite         : in std_logic;  
		o_o_data0  : in std_logic_vector(N-1 downto 0);
		o_o_data1  : in std_logic_vector(N-1 downto 0);
		o_siExtend_output  : in std_logic_vector(N-1 downto 0);
		o_f1_alu_con    : in std_logic_vector(4 downto 0); 
		o_s_inst : in std_logic_vector(4 downto 0)); 
	
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
begin
--arch:

--reg-------------------------------
g_nbitReg1: nbit_Reg
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_DestReg,
				o_Q	 =>  o_DestReg);

--reg-------------------------------
g_nbitReg2: nbit_Reg
GENERIC (N=>1)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_jump,
				o_Q	 =>  o_jump);	
				
--reg-------------------------------
g_nbitReg3: nbit_Reg
GENERIC (N=>1)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_branch,
				o_Q	 =>  o_branch);
--reg-------------------------------
g_nbitReg4: nbit_Reg
GENERIC (N=>1)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_memread,
				o_Q	 =>  o_memread);
				

--reg-------------------------------
g_nbitReg5: nbit_Reg
GENERIC (N=>5)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_ALUop,
				o_Q	 =>  o_ALUop);	
				
--reg-------------------------------
g_nbitReg6: nbit_Reg
GENERIC (N=>1)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_memwrite,
				o_Q	 =>  o_memwrite);
--reg-------------------------------
g_nbitReg7: nbit_Reg
GENERIC (N=>1)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_imm,
				o_Q	 =>  o_imm);
				

--reg-------------------------------
g_nbitReg8: nbit_Reg
GENERIC (N=>1)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_regwrite,
				o_Q	 =>  o_regwrite);	
				
--reg-------------------------------
g_nbitReg9: nbit_Reg
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_o_data0,
				o_Q	 =>  o_o_data0);
--reg-------------------------------
g_nbitReg10: nbit_Reg
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_o_data1,
				o_Q	 =>  o_o_data1);
				

--reg-------------------------------
g_nbitReg11: nbit_Reg
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_siExtend_output,
				o_Q	 =>  o_siExtend_output);	
				
--reg-------------------------------
g_nbitReg12: nbit_Reg
GENERIC (N=>5)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_f1_alu_con,
				o_Q	 =>  o_f1_alu_con);
--reg-------------------------------
g_nbitReg13: nbit_Reg
GENERIC (N=>5)
		port MAP(i_CLK     =>  i_CLK,
				i_RST	     =>  i_RST,
				i_WE      =>    i_WE,
				i_D     => i_s_inst,
				o_Q	 =>  o_s_inst);
	
end structural;
