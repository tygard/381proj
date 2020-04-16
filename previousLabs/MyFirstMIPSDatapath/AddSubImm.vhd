library IEEE;
use IEEE.std_logic_1164.all;

entity AddSubImm is 
    generic
	(
		N : integer := 32
	);
    port
	(
		i_dA  		: in std_logic_vector(N-1 downto 0);
        i_dB  		: in std_logic_vector(N-1 downto 0);
		imm_val		: in std_logic_vector(N-1 downto 0);
		imm_sel		: in std_logic;
		dsub_sel	: in std_logic;
        sum  		: out std_logic_vector(N-1 downto 0);
        dcarry_out  : out std_logic
	);

end AddSubImm; 

architecture structure of AddSubImm is
	component mux2_n is
		generic 
		(
			N : integer := N
		);
		port
		(
			i_A  : in std_logic_vector(N-1 downto 0);
			i_B  : in std_logic_vector(N-1 downto 0);
			i_S  : in std_logic;
			o_F  : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	component nbit_adder_sub is
		generic
		(
			N : integer := N
		);
		port
		(
			i_nA  		: in std_logic_vector(N-1 downto 0);
			i_nB  		: in std_logic_vector(N-1 downto 0);
			sub_sel		: in std_logic;
			n_out  		: out std_logic_vector(N-1 downto 0);
			carry_out  	: out std_logic
		);
		
	end component;

signal bmux 	: std_logic_vector(N-1 downto 0);
		
begin
	
	mux_inst : mux2_n
		generic map
		(
			N 	=> N
		)
		port map
		(
			i_A  	=> i_dB,
			i_B  	=> imm_val,
			i_S  	=> imm_sel,
			o_F  	=> bmux
		);	
		
	nAddSub : nbit_adder_sub
		generic map
		(
			N 	=> N
		)
		port map
		(
			i_nA  		=> i_dA,
			i_nB  		=> bmux,
			sub_sel		=> dsub_sel,
			n_out  		=> sum,
			carry_out  	=> dcarry_out
		);
	
end structure;