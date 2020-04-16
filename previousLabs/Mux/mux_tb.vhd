library IEEE;
use IEEE.std_logic_1164.all;

-- This is an empty entity so we don't need to declare ports
entity mux_tb is
--generic(N : integer := 1);
--port(
--s_F: out std_logic);
end mux_tb;

architecture behavior of mux_tb is

-- Declare the component we are going to instantiate
component mux2t1
--generic(N : integer := 32);
  port(i_A  : in std_logic;
       i_B  : in std_logic;
       i_S : in std_logic;
         o_F  : out std_logic);
		
end component;

--component n_bit_dataflow_mux
  --generic(N : integer := 32);
  --port(i_A  : in std_logic_vector(31 downto 0);
   --   o_F  : out std_logic_vector(31 downto 0));
--end component;
-- Signals to connect to the inv module

signal  s_A, s_B, s_S ,s_F : std_logic;


begin

DUT:  mux2t1
  port map(i_A  => s_A,
            i_B=> s_B,
            i_S=>s_S,
  	    o_F  => s_F);
--DUT2: n_bit_dataflow_mux
 -- port map(i_A  => s_A,
  	   --     o_F  => s_E);	        


  process
  begin

    s_A <='0';
	s_B <='0';
    s_S <='0';

    wait for 100 ns;


    s_A <='1';
	s_B <='0';
    s_S <='0';

    wait for 100 ns;
	
	s_A <='0';
	s_B <='1';
    s_S <='0';

    wait for 100 ns;
	
	s_A <='1';
	s_B <='1';
    s_S <='0';

    wait for 100 ns;
	
	s_A <='0';
	s_B <='0';
    s_S <='1';

    wait for 100 ns;
	
	s_A <='1';
	s_B <='0';
    s_S <='1';

    wait for 100 ns;
	
	s_A <='0';
	s_B <='1';
    s_S <='1';

    wait for 100 ns;
	
	s_A <='1';
	s_B <='1';
    s_S <='1';

    wait for 100 ns;
	
   -- s_A <="00000000000000000000000100000000";
    -- wait for 100 ns;

    -- s_B <="00000000000000000000000000000000";
   -- wait for 100 ns;    
 -- s_S <="00000000000000000000000000000001";
    -- wait for 100 ns;
  end process;
  


  
end behavior;

