library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is    
end entity; 

architecture fum of testbench is 

component MAC is
    PORT (
    clock : IN std_logic;
    cntrl : IN std_logic;
    weight : IN std_logic_vector(7 DOWNTO 0);
    pix : IN std_logic_vector(15 DOWNTO 0);
    dout : OUT std_logic_vector(15 DOWNTO 0)
    );
end component;

    signal clk  : std_logic := '0';
    signal cntrl  : std_logic := '0';
    signal weight : std_logic_vector(7 DOWNTO 0) := x"00";
    signal pix    : std_logic_vector(15 DOWNTO 0) := x"0000";
    signal dout   : std_logic_vector(15 DOWNTO 0) := x"0000";

begin 

DUT: MAC port map (clk, cntrl, weight, pix, dout); 

    process 
    begin 

        for I in 0 to 50 loop
            clk <= not(clk);

            if(i = 10) then
            	cntrl <= '1';
                weight <= x"fe";
                pix <= x"0021";

            elsif(i = 20) then
                weight <= x"4e";
                pix <= x"2025";

            elsif(i = 30) then
            	cntrl <= '1';
                weight <= x"ff";
                pix <= x"f043";
                
            elsif(i = 40) then
                weight <= x"76";
                pix <= x"5343";
                
            else
            	cntrl <= '0';
            end if;

            wait for 100 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 