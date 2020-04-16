library IEEE;
use IEEE.std_logic_1164.all;

entity AddSubImmTB is
  generic(N : integer := 8);

end AddSubImmTB;

architecture structure of AddSubImmTB is

component AddSubImm  is 
    generic
	(
		N : integer := N
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

end component; 
  
signal	i_SdA  		: std_logic_vector(N-1 downto 0);
signal  i_SdB  		: std_logic_vector(N-1 downto 0);
signal	imm_Sval	: std_logic_vector(N-1 downto 0);
signal	imm_Ssel	: std_logic;
signal	dsub_Ssel	: std_logic;
signal  Ssum  		: std_logic_vector(N-1 downto 0);
signal  dcarry_Sout : std_logic;

begin


  g_datapath: AddSubImm
    generic map(
		N	 => N)
    port map
		(
		i_dA  		=> i_SdA,
        i_dB  		=> i_SdB,
		imm_val		=> imm_Sval,
		imm_sel		=> imm_Ssel,
		dsub_sel	=> dsub_Ssel,
        sum  		=> Ssum,
        dcarry_out  => dcarry_Sout
		);
  process
    begin
	
		i_SdA  		<= "11111111"; -- -1 + 1 = 0,
        i_SdB  		<= "00000001";
		imm_Sval	<= "00000000";
		imm_Ssel	<= '0';
		dsub_Ssel	<= '0';
		wait for 100 ns;


		i_SdA  		<= x"0F"; -- 15 + 48 = 63,
        i_SdB  		<= x"30";
		imm_Sval	<= "00000000";
		imm_Ssel	<= '0';
		dsub_Ssel	<= '0';
		wait for 100 ns;


		i_SdA  		<= x"0F"; -- 15 - 48 = -33,
        i_SdB  		<= x"30";
		imm_Sval	<= "00000000";
		imm_Ssel	<= '0';
		dsub_Ssel	<= '1';
		wait for 100 ns;


		i_SdA  		<= "00001111"; -- 15 + 3imm = 18,
        i_SdB  		<= "11110001";
		imm_Sval	<= "00000011";
		imm_Ssel	<= '1';
		dsub_Ssel	<= '0';
		wait for 100 ns;


		i_SdA  		<= "00010000"; -- 16 - 32imm = -16,
        i_SdB  		<= "00000001";
		imm_Sval	<= "00100000";
		imm_Ssel	<= '1';
		dsub_Ssel	<= '1';
		wait for 100 ns;
      
  end process;
  
end structure;