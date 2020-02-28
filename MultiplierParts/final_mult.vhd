library IEEE;
use IEEE.std_logic_1164.all;

entity m_N_bit is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);
		i_B         : in std_logic_vector(N-1 downto 0);
		o_S         : out std_logic_vector(N-1 downto 0);
		o_Cout      : out std_logic);
end m_N_bit;


architecture structural of m_N_bit is

component Mult32t1 is

  port(
       i_A 				: in std_logic_vector(31 downto 0); -- M
	   i_B				: in std_logic; -- q 
	   i_CIN			: in std_logic; -- cin
	   i_FA_IN			: in std_logic_vector(31 downto 0); -- FA A port
       o_FA 		    : out std_logic_vector(31 downto 0);
	   o_FA_P			: out std_logic;			
	   o_COUT			: out std_logic);
end component;

    
  component andg2 is
    port(	i_A      : in std_logic;
			i_B      : in std_logic; 
			o_F      : out std_logic);
  end component;

type twodarray is array 0 to 31 of std_logic_vector(31 downto 0);
signal first_and_outputs  :std_logic_vector(N-1 downto 0);
signal secondlevel    :std_logic_vector(N-1 downto 0);
signal o_wire         : twodarray;
signal s_c_out_array  :std_logic_vector(N-1 downto 0);
signal s_temp_fa_out  :std_logic_vector(N-1 downto 0);




begin
--EDGE CASE FOR ROW 0
firstrowAND: for i in 1 to N-1 generate
    r0And: andg2 port map(  i_A  => i_A(i),
			                i_B  => i_B(0),              --	Q2 i generate per bit
                            o_F  => first_and_outputs(i));  --fa takes previous
end generate firstrowAND;
			  
secondlevel <= '0' & first_and_outputs(N-1 downto 1);  --TAKES CARE OF P0	  

--EGDE CASE FOR ROW 1
r0EC : Mult32t1
port MAP (    i_FA_IN   => secondlevel,--treating like the fa
			  i_A       => i_A,-- M inputs
			  i_B       => i_B(1), --    Q i generate per bit
			  i_CIN     => '0',   
              o_FA      => o_wire(0)(31 downto 0),                  --fa takes previous
			  o_COUT    => o_wire(0)(32),   
			  o_FA_P    =>  o_FA(0));--- or can  i it in here>
			  
o_S(1) <= o_FA_P;  --TAKES CARE OF P1	  

--CASES FOR ROWS 2-30			  
G_r2t32: for i in 1 to N-1 generate
    ADDERII: new_entity port map(i_FA_IN   => s_temp_fa_out, --treating like the fa
			                     i_A       => i_A(i),--original 32 bit M inputs
			                     i_B       => i_B(i),    --	Q2 i generate per bit
			                     i_CIN    => s_c_out_array(i-1),  
                                 s_temp_fa_out     => o_FA,      --fa takes previous
			                     o_COUT    => s_c_out_array(i),
			                     o_S(i)    => o_FA_P(i));
end generate G_r2t32;

--CASE FOR ROW 32, need to select outputs
--
--
-- .........

end structural;