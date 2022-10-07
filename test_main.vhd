library ieee; 
use ieee.std_logic_1164.all; 
-- USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is
end entity; 

architecture fum of testbench is 

component Main is
    PORT (
		clk : IN std_logic;
		start : IN std_logic;
        anode : OUT std_logic_vector(3 DOWNTO 0); -- Anode output for FPGA Seven Segment Display
        cathode : OUT std_logic_vector(7 DOWNTO 0) -- Cathode output for FPGA Seven Segment Display
	);
end component; 

    signal clock, start: std_logic := '0';
    signal anode : std_logic_vector(3 downto 0) := x"0";
    signal cathode : std_logic_vector(7 downto 0) := x"00";

begin 

DUT: Main port map (clock, start, anode, cathode); 

    clock <= not clock after 1 ns;

    end; 