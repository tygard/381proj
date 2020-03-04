library IEEE;
use IEEE.std_logic_1164.all;

entity fetch_logic_tb is
	generic(N : integer := 32);
	--port(
		--o_Sum : out std_logic_vector(31 downto 0) just troubleshooting delete later
	--);
end fetch_logic_tb;

architecture structure of fetch_logic_tb is
	component fetch_logic is
	--generic(S : integer := 32);
	port(
		i_Branch: in std_logic;
		i_Jump  : in std_logic;
		i_instr	: in std_logic_vector(31 downto 0); -- 32 instruction
		i_PC	: in std_logic_vector(31 downto 0); -- the PC value
		o_PC	: out std_logic_vector(31 downto 0) -- output to the PC register
	);
  end component;
  
  signal i_tBranch 	: std_logic;
  signal i_tJump 	: std_logic;
  signal i_tinstr	: std_logic_vector(31 downto 0);
  signal i_tPC 		: std_logic_vector(31 downto 0);
  signal o_tPC 		: std_logic_vector(31 downto 0);


begin

  DUT: fetch_logic 
	generic MAP(S => N)
	port MAP(
		i_Branch 	=> i_tBranch,
		i_Jump  	=> i_tJump,
		i_instr		=> i_tinstr,
		i_PC		=> i_tPC,
		o_PC		=> o_tPC
	);
  process
    begin
	-- test run command fo modelsim: vsim -voptargs="+acc" fetch_logic_tb
	-- TEST 1: INCREMENT THE PC
	i_tBranch 	<= '0';			-- disable branch
	i_tJump 	<= '0';			-- disable jump
	-- when both jump and branch are diabled we just increment the PC by 4
	
	i_tPC		<= x"00000000";	-- PC = 0 for easy testing
	i_tinstr 	<= x"33333333";	-- for this test inst doesnt matter, just PC+4
	-- ^^^ instruction input (when branch the address is lower 16 bits, when jump is lower 26 bits)
	
	wait for 100 ns;
	
  end process;
end structure;