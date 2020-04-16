library IEEE;
use IEEE.std_logic_1164.all;


entity RegFile is
    generic(N: integer := 32);
    port (
		i_CLK  	:	in std_logic;
        i_RST  	: 	in std_logic; 
        i_WArd  : 	in std_logic_vector(4 downto 0);
		i_RArs  : 	in std_logic_vector(4 downto 0);
		i_RArt  : 	in std_logic_vector(4 downto 0);
		i_D		: 	in std_logic_vector(N-1 downto 0);
        o_Drs 	: 	out std_logic_vector(N-1 downto 0);
        o_Drt 	: 	out std_logic_vector(N-1 downto 0);
end RegFile;