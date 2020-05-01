library IEEE;
use IEEE.std_logic_1164.all;

entity ex_mem is
  generic(N : integer := 32); 
  port(i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		
		i_memtoreg :  in std_logic_vector (N-1 downto 0); 
		i_q       : in std_logic_vector(N-1 downto 0); 
		i_mux4      : in std_logic_vector(N-1 downto 0); 
		
		o_memtoreg :  in std_logic_vector (N-1 downto 0); 
		o_q       : in std_logic_vector(N-1 downto 0); 
		o_mux4      : in std_logic_vector(N-1 downto 0)); 
	
end ex_mem;

architecture structural of ex_mem is

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
g_nbitReg1: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_memtoreg
				o_Q	    =>  o_memtoreg);
				
--reg-------------------------------
g_nbitReg2: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_q
				o_Q	    =>  o_q);
				
--reg-------------------------------
g_nbitReg3: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_mux4
				o_Q	    =>  o_mux4);
end structural;
