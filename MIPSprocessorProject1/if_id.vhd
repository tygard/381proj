library IEEE;
use IEEE.std_logic_1164.all;

entity if_id is
  generic(N : integer := 32); 
  port(i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		i_mem       : in std_logic_vector(N-1 downto 0); 
		i_mux1      : in std_logic_vector(N-1 downto 0); 
		o_mem	    : out std_logic_vector (N-1 downto 0); 
		o_mux1      : out std_logic_vector(N-1 downto 0)); 
	
end if_id;

architecture structural of if_id is

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
				i_D     => i_mem,
				o_Q	    =>  o_mem);
				
--reg-------------------------------
g_nbitReg2: nbit_Reg
		port MAP(i_CLK  =>  i_CLK,
				i_RST	=>  i_RST,
				i_WE    =>    i_WE,
				i_D     => i_mux1,
				o_Q	    =>  o_mux1);
end structural;
