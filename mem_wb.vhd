library IEEE;
use IEEE.std_logic_1164.all;

entity mem_wb is
  generic(N : integer := 32); 
  port(i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		
		
		i_branch     : in std_logic_vector(N-1 downto 0); 
		i_memtoreg      : in std_logic_vector(N-1 downto 0); 
		i_memWrite    : in std_logic_vector(N-1 downto 0);
		i_ALU_overflow    : in std_logic_vector(N-1 downto 0); 
		i_ALU_result    : in std_logic_vector(N-1 downto 0);
		i_data_1   : in std_logic_vector(N-1 downto 0);
		i_mux4  : in std_logic_vector(N-1 downto 0);
		
		o_branch     : out std_logic_vector(N-1 downto 0); 
		o_memtoreg      : out std_logic_vector(N-1 downto 0); 
		o_memWrite    : out std_logic_vector(N-1 downto 0);
		o_ALU_overflow    : out std_logic_vector(N-1 downto 0); 
		o_ALU_result    : out std_logic_vector(N-1 downto 0);
		o_data_1   : out std_logic_vector(N-1 downto 0);
		o_mux4  : out std_logic_vector(N-1 downto 0));
	
end mem_wb;

architecture structural of mem_wb is

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

--reg-------------------------------
g_nbitReg1 : nbit_Reg
GENERIC MAP(N => 1)
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_branch,
				o_Q	    =>  o_branch);
				
--reg-------------------------------
g_nbitReg2 : nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_memtoreg,
				o_Q	    =>  o_memtoreg);
				
--reg-------------------------------
g_nbitReg3: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_memWrite,
				o_Q	    =>  o_memWrite);
				
--reg-------------------------------
g_nbitReg4: nbit_Reg
GENERIC MAP(N=>1)
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_ALU_overflow,
				o_Q	    =>  o_ALU_overflow);
				
--reg-------------------------------
g_nbitReg5: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_ALU_result,
				o_Q	    =>  o_ALU_result);
				
--reg-------------------------------
g_nbitReg6: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_data_1,
				o_Q	    =>  o_data_1);
				
--reg-------------------------------
g_nbitReg7: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_mux4,
				o_Q	    =>  o_mux4);

end structural;
