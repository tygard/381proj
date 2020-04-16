library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity RegFile is
    generic(N: integer := 32);
    port(
			i_WA	in std_logic_vector(4 downto 0);
			i_WD	in std_logic_vector(31 downto 0);
			i_RA0	in std_logic_vector(4 downto 0);
			i_RA1	in std_logic_vector(4 downto 0);
			i_RST	in std_logic;
			i_CLK	in std_logic;
			o_Data0	out std_logic_vector(31 downto 0);
			o_Data1	out std_logic_vector(31 downto 0);
			);
end RegFile;

architecture structure of RegFile is

	component n_register
	    generic(N: integer := 32);
		port(
			i_CLK 	: in std_logic;
			i_RST 	: in std_logic; 
			i_WE	: in std_logic;
			i_d		: in std_logic_vector(N-1 downto 0);
			o_q		: out std_logic_vector(N-1 downto 0)
			);
	end component;
			  
	component decoder5_32
		port(
			i_A  : in std_logic_vector(4 downto 0);
			o_D  : out std_logic_vector(31 downto 0)
			);
	end component;

	component mux32
	port(
		i_A0 	: in std_logic_vector(31 downto 0);
		i_A1 	: in std_logic_vector(31 downto 0);
		i_A2 	: in std_logic_vector(31 downto 0);
		i_A3 	: in std_logic_vector(31 downto 0);
		i_A4 	: in std_logic_vector(31 downto 0);
		i_A5 	: in std_logic_vector(31 downto 0);
		i_A6 	: in std_logic_vector(31 downto 0);
		i_A7 	: in std_logic_vector(31 downto 0);
		i_A8 	: in std_logic_vector(31 downto 0);
		i_A9 	: in std_logic_vector(31 downto 0);
		i_A10 	: in std_logic_vector(31 downto 0);
		i_A11 	: in std_logic_vector(31 downto 0);
		i_A12 	: in std_logic_vector(31 downto 0);
		i_A13 	: in std_logic_vector(31 downto 0);
		i_A14 	: in std_logic_vector(31 downto 0);
		i_A15 	: in std_logic_vector(31 downto 0);
		i_A16 	: in std_logic_vector(31 downto 0);
		i_A17	: in std_logic_vector(31 downto 0);
		i_A18	: in std_logic_vector(31 downto 0);
		i_A19	: in std_logic_vector(31 downto 0);
		i_A20 	: in std_logic_vector(31 downto 0);
		i_A21 	: in std_logic_vector(31 downto 0);
		i_A22 	: in std_logic_vector(31 downto 0);
		i_A23 	: in std_logic_vector(31 downto 0);
		i_A24 	: in std_logic_vector(31 downto 0);
		i_A25 	: in std_logic_vector(31 downto 0);
		i_A26 	: in std_logic_vector(31 downto 0);
		i_A27 	: in std_logic_vector(31 downto 0);
		i_A28 	: in std_logic_vector(31 downto 0);
		i_A29 	: in std_logic_vector(31 downto 0);
		i_A30 	: in std_logic_vector(31 downto 0);
		i_A31 	: in std_logic_vector(31 downto 0);
		i_S  	: in std_logic_vector(4 downto 0);
		o_F		: out std_logic_vector(31 downto 0)
		);

end mux32;
end structure;