library IEEE;
use IEEE.std_logic_1164.all;

entity add_sub_N_bit is
  generic(N : integer := 32); 
  port(	i_A         : in std_logic_vector(N-1 downto 0);
		i_B         : in std_logic_vector(N-1 downto 0);
		i_SELECT    : in std_logic;
		o_S         : out std_logic_vector(N-1 downto 0);
    o_Cout      : out std_logic
    o_Overflow  : out std_logic);

end add_sub_N_bit;
--
architecture structural of add_sub_N_bit is


-------------------------------------------------
--ADDER
  component adder_N_bit is
    port(	i_A      : in std_logic_vector(N-1 downto 0);
			i_B      : in std_logic_vector(N-1 downto 0);
			i_Cin    : in std_logic;
			o_S      : out std_logic_vector(N-1 downto 0);
      o_Cout   : out std_logic;
      o_Ovfl   : out std_logic);
  end component;
  
  -------------------------------------------------------
  --MUX
   component mux2t1_N is
    port(	i_S          : in std_logic;
       i_D0         : in std_logic_vector (N-1 downto 0);
       i_D1         : in std_logic_vector (N-1 downto 0);
       o_O          : out std_logic_vector(N-1 downto 0));
  end component;
  
  ---------------------------------------------------------
  --OC
  component oc_p2 is
    port(i_D1         : in std_logic_vector(N-1 downto 0);
         o_O          : out std_logic_vector(N-1 downto 0));
    end component;
  
----------------------------------------------------------------


-- Signal to carry stored weight
  signal MUX_R, OC_R : std_logic_vector(N-1 downto 0);



begin

 ---------------------------------------------------------------------------
  -- OC
  ---------------------------------------------------------------------------
 
  g_OC: oc_p2
    port MAP(i_D1   =>  i_B,    
             o_O    =>  OC_R);
	
 ---------------------------------------------------------------------------
  -- mux
  ---------------------------------------------------------------------------
 g_mux1: mux2t1_N
    port MAP(i_S    =>  i_SELECT,
			 i_D0    =>  i_B,
			 i_D1    =>  OC_R,
			 o_O     =>  MUX_R);



 ---------------------------------------------------------------------------
  -- Adder
  ---------------------------------------------------------------------------

g_adder_n_bit: adder_N_bit
    port MAP(i_A      =>  i_A,
			 i_B      =>  MUX_R,
			 i_Cin    =>  i_SELECT,
			 o_S      =>  o_S,
       o_Cout   =>  o_Cout
       o_Ovfl   =>  o_Overflow);

end structural;
































