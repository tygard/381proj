library IEEE;
use IEEE.std_logic_1164.all;

entity nbit_adder_sub  is 
    generic
	(
		N : integer := 32
	);
    port
	(
		i_nA  		: in std_logic_vector(N-1 downto 0);
        i_nB  		: in std_logic_vector(N-1 downto 0);
		sub_sel		: in std_logic;
        n_out  		: out std_logic_vector(N-1 downto 0);
        carry_out  	: out std_logic
	);

end nbit_adder_sub; 

architecture structure of nbit_adder_sub is

	component invg
		port
		(
			i_A          : in std_logic_vector;
			o_F          : out std_logic
		);
	end component;
  
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
  
	component nadder is
		generic
		(
			N : integer := N
		);
		port
		(
			i_eA : in std_logic_vector(N-1 downto 0);
			i_eB : in std_logic_vector(N-1 downto 0);
			i_eC : in std_logic;
			o_eS : out std_logic_vector(N-1 downto 0);
			o_eC : out std_logic
		);
	end component;
	
	component ones_compliment is
		generic (
			N : integer := N
		);
		port
		(
			i_A : in std_logic_vector(N-1 downto 0);
			o_F : out std_logic_vector(N-1 downto 0)
		);
	end component;
	
signal inv_b	: std_logic_vector(N-1 downto 0);
signal mux_b	: std_logic_vector(N-1 downto 0);
  
begin
			 
	nadder_inst : nadder
		generic map
		(
			N 	=>	N
		)
		port map
		(
			i_eA 	=> i_nA,
			i_eB 	=> mux_b,
			i_eC 	=> sub_sel,
			o_eS 	=> n_out,
			o_eC 	=> carry_out
		);
				 
	
	
	ninv_inst : ones_compliment
		generic map
		(
			N 	=> N
		)
		port map(
			i_A => i_nB,
			o_F => inv_b
		);

	mux_inst : mux2_n
		generic map
		(
			N 	=> N
		)
		port map
		(
			i_A  	=> i_nB,
			i_B  	=> inv_b,
			i_S  	=> sub_sel,
			o_F  	=> mux_b
		);
	
end structure;