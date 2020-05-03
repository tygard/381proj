-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- mipsfinaldesign.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a processing
-- element for the systolic matrix-vector multiplication array inspired 
-- by Google's TPU.
--
--
-- NOTES:
-- 1/14/19 by H3::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity mipsfinaldesign is

  port(iCLK                 : in std_logic;
	   i_reg_reset          : in std_logic;
       i_DS 				: in std_logic_vector(4 downto 0);
	   i_RR1				: in std_logic_vector(4 downto 0);
	   i_RR2				: in std_logic_vector(4 downto 0);
	   i_data				: in std_logic_vector(31 downto 0);
       o_M1 		            : out std_logic_vector(31 downto 0);
       o_M2 		            : out std_logic_vector(31 downto 0));

end mipsfinaldesign;

architecture structure of mipsfinaldesign is
  
  -- Describe the component entities as defined in Adder.vhd, Reg.vhd,
  -- Multiplier.vhd, RegLd.vhd (not strictly necessary).
  component Decoder
    port(
         i_S             : in std_logic_vector (4 downto 0);
         o_F             : out std_logic_vector (31 downto 0));
  end component;

  component mux32t1
    port(
		
		
		i_D0: in std_logic_vector(31 downto 0);
		i_D1: in std_logic_vector(31 downto 0);
		i_D2: in std_logic_vector(31 downto 0);
		i_D3: in std_logic_vector(31 downto 0);
		i_D4: in std_logic_vector(31 downto 0);
		i_D5: in std_logic_vector(31 downto 0);
		i_D6: in std_logic_vector(31 downto 0);
		i_D7: in std_logic_vector(31 downto 0);
		i_D8: in std_logic_vector(31 downto 0);
		i_D9: in std_logic_vector(31 downto 0);
		i_D10: in std_logic_vector(31 downto 0);
		i_D11: in std_logic_vector(31 downto 0);
		i_D12: in std_logic_vector(31 downto 0);
		i_D13: in std_logic_vector(31 downto 0);
		i_D14: in std_logic_vector(31 downto 0);
		i_D15: in std_logic_vector(31 downto 0);
		i_D16: in std_logic_vector(31 downto 0);
		i_D17: in std_logic_vector(31 downto 0);
		i_D18: in std_logic_vector(31 downto 0);
		i_D19: in std_logic_vector(31 downto 0);
		i_D20: in std_logic_vector(31 downto 0);
		i_D21: in std_logic_vector(31 downto 0);
		i_D22: in std_logic_vector(31 downto 0);
		i_D23: in std_logic_vector(31 downto 0);
		i_D24: in std_logic_vector(31 downto 0);
		i_D25: in std_logic_vector(31 downto 0);
		i_D26: in std_logic_vector(31 downto 0);
		i_D27: in std_logic_vector(31 downto 0);
		i_D28: in std_logic_vector(31 downto 0);
		i_D29: in std_logic_vector(31 downto 0);
		i_D30: in std_logic_vector(31 downto 0);
		i_D31: in std_logic_vector(31 downto 0);
		i_S: in std_logic_vector(4 downto 0);
        o_Q  : out std_logic_vector(31 downto 0));
		

  end component;

  component nbit_Reg
  generic(N : integer := 32);
    port(		
		i_CLK       : in std_logic;
		i_RST		: in std_logic;
		i_WE		: in std_logic;
		i_D        	: in std_logic_vector(N-1 downto 0);
		o_Q         : out std_logic_vector(N-1 downto 0));
  end component;

--Signal for the Decoder
  signal s_o_D		: std_logic_vector(31 downto 0);
  
--Signal for Reg files
  signal s_o_RF0 	: std_logic_vector(31 downto 0);
  signal s_o_RF1	: std_logic_vector(31 downto 0);
  signal s_o_RF2 	: std_logic_vector(31 downto 0);
  signal s_o_RF3	: std_logic_vector(31 downto 0);
  signal s_o_RF4 	: std_logic_vector(31 downto 0);
  signal s_o_RF5	: std_logic_vector(31 downto 0);
  signal s_o_RF6 	: std_logic_vector(31 downto 0);
  signal s_o_RF7	: std_logic_vector(31 downto 0);
  signal s_o_RF8 	: std_logic_vector(31 downto 0);
  signal s_o_RF9	: std_logic_vector(31 downto 0);
  signal s_o_RF10 	: std_logic_vector(31 downto 0);
  signal s_o_RF11	: std_logic_vector(31 downto 0);
  signal s_o_RF12	: std_logic_vector(31 downto 0);
  signal s_o_RF13	: std_logic_vector(31 downto 0);
  signal s_o_RF14	: std_logic_vector(31 downto 0);
  signal s_o_RF15	: std_logic_vector(31 downto 0);
  signal s_o_RF16	: std_logic_vector(31 downto 0);
  signal s_o_RF17	: std_logic_vector(31 downto 0);
  signal s_o_RF18	: std_logic_vector(31 downto 0);
  signal s_o_RF19	: std_logic_vector(31 downto 0);
  signal s_o_RF20	: std_logic_vector(31 downto 0);
  signal s_o_RF21	: std_logic_vector(31 downto 0);
  signal s_o_RF22	: std_logic_vector(31 downto 0);
  signal s_o_RF23	: std_logic_vector(31 downto 0);
  signal s_o_RF24	: std_logic_vector(31 downto 0);
  signal s_o_RF25	: std_logic_vector(31 downto 0);
  signal s_o_RF26	: std_logic_vector(31 downto 0);
  signal s_o_RF27	: std_logic_vector(31 downto 0);
  signal s_o_RF28	: std_logic_vector(31 downto 0);
  signal s_o_RF29	: std_logic_vector(31 downto 0);
  signal s_o_RF30	: std_logic_vector(31 downto 0);
  signal s_o_RF31	: std_logic_vector(31 downto 0);

--Signal for Mux
--  signal s_o_M1		: out std_logic_vector (31 downto 0);
--  signal s_o_M2		: out std_logic_vector (31 downto 0));

begin

  ---------------------------------------------------------------------------
  -- DECODER
  ---------------------------------------------------------------------------
  g_decoder: Decoder
    port MAP(i_S 	=> i_DS,        
             o_F  	=> s_o_D);        
  ---------------------------------------------------------------------------
  -- REGISTER
  ---------------------------------------------------------------------------
  
  s_o_RF0 <= X"00000000"; -- register 1 0 value
  
  g_reg0: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(0),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF0); 
			 
g_reg1: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(1),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF1); 
			 
			  g_reg2: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(2),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF2); 
			 
g_reg3: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(3),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF3); 
			 
			 
			   g_reg4: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(4),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF4); 
			 
g_reg5: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(5),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF5); 
			 
			  g_reg6: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(6),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF6); 
			 
g_reg7: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(7),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF7); 
			 
			 
			   g_reg8: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(8),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF8); 
			 
g_reg9: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(9),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF9); 
			 
			  g_reg10: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(10),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF10); 
			 
g_reg11: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(11),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF11); 
			 
			 
			   g_reg12: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(12),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF12); 
			 
g_reg13: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(13),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF13); 
			 
			  g_reg14: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(14),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF14); 
			 
g_reg15: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(15),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF15); 
			 
			 
			 
			   g_reg16: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(16),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF16); 
			 
g_reg17: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(17),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF17); 
			 
			  g_reg18: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(18),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF18); 
			 
g_reg19: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(19),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF19);
			 
			   g_reg20: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(20),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF20); 
			 
g_reg21: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(21),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF21); 
			 
			  g_reg22: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(22),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF22); 
			 
g_reg23: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(23),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF23); 
			 
			 
			   g_reg24: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(24),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF24); 
			 
g_reg25: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(25),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF25); 
			 
			  g_reg26: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(26),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF26); 
			 
g_reg27: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(27),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF27); 
			 
			 
			   g_reg28: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(28),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF28); 
			 
g_reg29: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(29),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF29); 
			 
			  g_reg30: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(30),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF30); 
			 
g_reg31: nbit_Reg
    port MAP(i_CLK	=> iCLK,
		     i_RST	=> i_reg_reset, --might need a 32 bit input for reset???
		     i_WE	=> s_o_D(31),
		     i_D    => i_data,    	
		     o_Q    => s_o_RF31); 
			 

  ---------------------------------------------------------------------------
  -- 32MUX
  ---------------------------------------------------------------------------
  g_mux1: mux32t1
port MAP(i_D0  => s_o_RF0,
		i_D1  => s_o_RF1,
		i_D2  => s_o_RF2,
		i_D3  => s_o_RF3,
		i_D4  => s_o_RF4,
		i_D5  => s_o_RF5,
		i_D6  => s_o_RF6,
		i_D7  => s_o_RF7,
		i_D8  => s_o_RF8,
		i_D9  => s_o_RF9,
		i_D10  => s_o_RF10,
		i_D11  => s_o_RF11,
		i_D12  => s_o_RF12,
		i_D13  => s_o_RF13,
		i_D14  => s_o_RF14,
		i_D15  => s_o_RF15,
		i_D16  => s_o_RF16,
		i_D17  => s_o_RF17,
		i_D18  => s_o_RF18,
		i_D19  => s_o_RF19,
		i_D20  => s_o_RF20,
		i_D21  => s_o_RF21,
		i_D22  => s_o_RF22,
		i_D23  => s_o_RF23,
		i_D24  => s_o_RF24,
		i_D25  => s_o_RF25,
		i_D26  => s_o_RF26,
		i_D27  => s_o_RF27,
		i_D28  => s_o_RF28,
		i_D29  => s_o_RF29,
		i_D30  => s_o_RF30,
		i_D31  => s_o_RF31,
		i_S  => i_RR1,
        o_Q  => o_M1);
		
		
  g_mux2: mux32t1
port MAP(i_D0  => s_o_RF0,
		i_D1  => s_o_RF1,
		i_D2  => s_o_RF2,
		i_D3  => s_o_RF3,
		i_D4  => s_o_RF4,
		i_D5  => s_o_RF5,
		i_D6  => s_o_RF6,
		i_D7  => s_o_RF7,
		i_D8  => s_o_RF8,
		i_D9  => s_o_RF9,
		i_D10  => s_o_RF10,
		i_D11  => s_o_RF11,
		i_D12  => s_o_RF12,
		i_D13  => s_o_RF13,
		i_D14  => s_o_RF14,
		i_D15  => s_o_RF15,
		i_D16  => s_o_RF16,
		i_D17  => s_o_RF17,
		i_D18  => s_o_RF18,
		i_D19  => s_o_RF19,
		i_D20  => s_o_RF20,
		i_D21  => s_o_RF21,
		i_D22  => s_o_RF22,
		i_D23  => s_o_RF23,
		i_D24  => s_o_RF24,
		i_D25  => s_o_RF25,
		i_D26  => s_o_RF26,
		i_D27  => s_o_RF27,
		i_D28  => s_o_RF28,
		i_D29  => s_o_RF29,
		i_D30  => s_o_RF30,
		i_D31  => s_o_RF31,
		i_S  => i_RR2,
        o_Q  => o_M2);
  end structure;
