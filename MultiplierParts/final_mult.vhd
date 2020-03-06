library IEEE;
use IEEE.std_logic_1164.all;

entity m_N_bit is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);
		i_B         : in std_logic_vector(N-1 downto 0);
		o_S         : out std_logic_vector(63 downto 0); --I BELIEVE THE OUTPUT WILL BE 64 BITS -ADNAN
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
	   o_COUT			: out std_logic);
end component; --These are the correct ports for the component

    
  component andg2 is
    port(	i_A      : in std_logic;
			i_B      : in std_logic; 
			o_F      : out std_logic);
  end component;

type twodarray is array (0 to 31) of std_logic_vector(32 downto 0);
signal first_and_outputs  :std_logic_vector(N-1 downto 0);
signal secondlevel    :std_logic_vector(N-1 downto 0);
signal o_wire         : twodarray;




begin
--EDGE CASE FOR ROW 0
firstrowAND: for i in 0 to N-1 generate
    r0And: andg2 port map(  i_A  => i_A(i),
			                i_B  => i_B(0),              --	Q2 i generate per bit
                            o_F  => first_and_outputs(i));  --fa takes previous
end generate firstrowAND;
			  
o_S(0) <= first_and_outputs(0);  --TAKES CARE OF P0 ***Could be wrong***
secondlevel <= ('0' & first_and_outputs(31 downto 1)); 

--EGDE CASE FOR ROW 1
r0EC : Mult32t1 -- I THINK THIS IS CORRECT. -Adnan
port MAP (    i_FA_IN   => secondlevel,--treating like the fa
			  i_A       => i_A,-- M inputs
			  i_B       => i_B(1), --    Q i generate per bit
			  i_CIN     => '0',   
              o_FA      => o_wire(0)(31 downto 0),                  --fa takes previous
			  o_COUT    => o_wire(0)(32));   
			  
--CASES FOR ROWS 2-30			  
G_r2t32: for i in 2 to N-1 generate
    ADDERII: Mult32t1 port map(i_FA_IN   => o_wire(i-1)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(i),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(i)(31 downto 0),
			                     o_COUT    => o_wire(i)(32));
end generate G_r2t32;

--USE o_wire if needed. Its just a 2D array that holds all of the o_FA values we have accumulated per row.
--The final output will be 64 bits so the FA's from this row will fill the rest of the 32 slots needed to be taken up. All that will need to be done for this is o_s(next availabe index) will be filled by a FA value.
--CASE FOR ROW 32, need to select outputs
--
--
-- .........
r0EC2 : Mult32t1
port MAP (    i_FA_IN   => o_wire(30)(32 downto 1),--treating like the fa
			  i_A       => i_A,-- M inputs
			  i_B       => i_B(31), --    Q i generate per bit
			  i_CIN     => '0',   
              o_FA      => o_wire(31)(31 downto 0),                  --fa takes previous
			  o_COUT    => o_wire(31)(32)); 
			  
o_S(63) <= o_wire(30)(32);
o_S(62 downto 31) <= o_wire(30)(31 downto 0);
G_rt32: for i in 0 to 29 generate
o_S(i) <= o_wire(i)(0);
end generate G_rt32;
	  
	  -- AT THE END OF ALL OF THIS TO GET THE FINAL OUTPUT, YOU CAN MAKE A FOR LOOP THAT PULLS THE VALUE OF o_wire(index)(0) AND PUTS IN INTO THE OUTPUT o_S(i) (I believe the index should start at 1 because P0 is taken care of)
	  
end structural;
