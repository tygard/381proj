library IEEE;
use IEEE.std_logic_1164.all;

entity finaltest is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);
		i_B         : in std_logic_vector(N-1 downto 0);
		o_S         : out std_logic_vector(63 downto 0); --I BELIEVE THE OUTPUT WILL BE 64 BITS -ADNAN
		o_Cout      : out std_logic);
end finaltest;


architecture structural of finaltest is

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
    ADDER2: Mult32t1 port map(i_FA_IN   => o_wire(0)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(2),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(1)(31 downto 0),
			                     o_COUT    => o_wire(1)(32));

    ADDER3: Mult32t1 port map(i_FA_IN   => o_wire(1)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(3),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(2)(31 downto 0),
			                     o_COUT    => o_wire(2)(32));

    ADDER4: Mult32t1 port map(i_FA_IN   => o_wire(2)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(4),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(3)(31 downto 0),
			                     o_COUT    => o_wire(3)(32));

    ADDER5: Mult32t1 port map(i_FA_IN   => o_wire(3)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(5),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(4)(31 downto 0),
			                     o_COUT    => o_wire(4)(32));

    ADDER6: Mult32t1 port map(i_FA_IN   => o_wire(4)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(6),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(5)(31 downto 0),
			                     o_COUT    => o_wire(5)(32));

    ADDER7: Mult32t1 port map(i_FA_IN   => o_wire(5)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(7),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(6)(31 downto 0),
			                     o_COUT    => o_wire(6)(32));

    ADDER8: Mult32t1 port map(i_FA_IN   => o_wire(6)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(8),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(7)(31 downto 0),
			                     o_COUT    => o_wire(7)(32));

    ADDER9: Mult32t1 port map(i_FA_IN   => o_wire(7)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(9),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(8)(31 downto 0),
			                     o_COUT    => o_wire(8)(32));

    ADDER10: Mult32t1 port map(i_FA_IN   => o_wire(8)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(10),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(9)(31 downto 0),
			                     o_COUT    => o_wire(9)(32));

    ADDER11: Mult32t1 port map(i_FA_IN   => o_wire(9)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(11),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(10)(31 downto 0),
			                     o_COUT    => o_wire(10)(32));

    ADDER12: Mult32t1 port map(i_FA_IN   => o_wire(10)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(12),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(11)(31 downto 0),
			                     o_COUT    => o_wire(11)(32));

    ADDER13: Mult32t1 port map(i_FA_IN   => o_wire(11)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(13),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(12)(31 downto 0),
			                     o_COUT    => o_wire(12)(32));

    ADDER14: Mult32t1 port map(i_FA_IN   => o_wire(12)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(14),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(13)(31 downto 0),
			                     o_COUT    => o_wire(13)(32));

    ADDER15: Mult32t1 port map(i_FA_IN   => o_wire(13)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(15),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(14)(31 downto 0),
			                     o_COUT    => o_wire(14)(32));

    ADDER16: Mult32t1 port map(i_FA_IN   => o_wire(14)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(16),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(15)(31 downto 0),
			                     o_COUT    => o_wire(15)(32));

    ADDER17: Mult32t1 port map(i_FA_IN   => o_wire(15)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(17),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(16)(31 downto 0),
			                     o_COUT    => o_wire(16)(32));

    ADDER18: Mult32t1 port map(i_FA_IN   => o_wire(16)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(18),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(17)(31 downto 0),
			                     o_COUT    => o_wire(17)(32));

    ADDER19: Mult32t1 port map(i_FA_IN   => o_wire(17)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(19),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(18)(31 downto 0),
			                     o_COUT    => o_wire(18)(32));

    ADDER20: Mult32t1 port map(i_FA_IN   => o_wire(18)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(20),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(19)(31 downto 0),
			                     o_COUT    => o_wire(19)(32));

    ADDER21: Mult32t1 port map(i_FA_IN   => o_wire(19)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(21),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(20)(31 downto 0),
			                     o_COUT    => o_wire(20)(32));

    ADDER22: Mult32t1 port map(i_FA_IN   => o_wire(20)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(22),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(21)(31 downto 0),
			                     o_COUT    => o_wire(21)(32));

    ADDER23: Mult32t1 port map(i_FA_IN   => o_wire(21)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(23),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(22)(31 downto 0),
			                     o_COUT    => o_wire(22)(32));	

    ADDER24: Mult32t1 port map(i_FA_IN   => o_wire(22)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(24),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(23)(31 downto 0),
			                     o_COUT    => o_wire(23)(32));

    ADDER25: Mult32t1 port map(i_FA_IN   => o_wire(23)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(25),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(24)(31 downto 0),
			                     o_COUT    => o_wire(24)(32));

    ADDER26: Mult32t1 port map(i_FA_IN   => o_wire(24)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(26),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(25)(31 downto 0),
			                     o_COUT    => o_wire(25)(32));

    ADDER27: Mult32t1 port map(i_FA_IN   => o_wire(25)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(27),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(26)(31 downto 0),
			                     o_COUT    => o_wire(26)(32));

    ADDER28: Mult32t1 port map(i_FA_IN   => o_wire(26)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(28),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(27)(31 downto 0),
			                     o_COUT    => o_wire(27)(32));

    ADDER29: Mult32t1 port map(i_FA_IN   => o_wire(27)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(29),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(28)(31 downto 0),
			                     o_COUT    => o_wire(28)(32));

    ADDER30: Mult32t1 port map(i_FA_IN   => o_wire(28)(32 downto 1), --Takes the inputs from previous FA + the COUT (This syntax might be wrong may have to flip it to go 1 to 32)
			                     i_A       => i_A,--original 32 bit M inputs
			                     i_B       => i_B(30),    --	Q2 i generate per bit
			                     i_CIN    => '0', --This needs to be 0 for the first FA then it takes in the COUT of the previous ***NOT DONE*** Not sure how to make this work
                                 o_FA     => o_wire(29)(31 downto 0),
			                     o_COUT    => o_wire(29)(32));
								 
--USE o_wire if needed. Its just a 2D array that holds all of the o_FA values we have accumulated per row.
--The final output will be 64 bits so the FA's from this row will fill the rest of the 32 slots needed to be taken up. All that will need to be done for this is o_s(next availabe index) will be filled by a FA value.
--CASE FOR ROW 32, need to select outputs
--
--
-- .........
r0EC2 : Mult32t1
port MAP (    i_FA_IN   => o_wire(29)(32 downto 1),--treating like the fa
			  i_A       => i_A,-- M inputs
			  i_B       => i_B(31), --    Q i generate per bit
			  i_CIN     => '0',   
              o_FA      => o_wire(30)(31 downto 0),                  --fa takes previous
			  o_COUT    => o_wire(30)(32)); 
			  
o_S(63) <= o_wire(30)(32);
o_S(62 downto 31) <= o_wire(30)(31 downto 0);
G_rt32: for i in 0 to 29 generate
o_S(i+1) <= o_wire(i)(0);
end generate G_rt32;
	  
	  -- AT THE END OF ALL OF THIS TO GET THE FINAL OUTPUT, YOU CAN MAKE A FOR LOOP THAT PULLS THE VALUE OF o_wire(index)(0) AND PUTS IN INTO THE OUTPUT o_S(i) (I believe the index should start at 1 because P0 is taken care of)
	  
end structural;
