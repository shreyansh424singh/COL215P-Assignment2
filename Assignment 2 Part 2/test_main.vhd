library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is    
end entity; 

architecture fum of testbench is 

component Main is
    PORT (
		clock : IN std_logic;
		start : IN std_logic;
	);
end component; 

    signal clock, start: std_logic := '0';

begin 

DUT: Main port map (clock, start); 

    process 
    begin 

    reset <= '0';
    status <= '0';
    input <= "00000000";
    for I in 0 to 220 loop
    clock <= not(clock);
    wait for 100 ns;
    end loop;


    ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
    wait;
    end process; 
    end; 