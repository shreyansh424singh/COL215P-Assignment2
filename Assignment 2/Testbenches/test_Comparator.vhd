library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is    
end entity; 

architecture fum of testbench is 

component Comparator is
    PORT (
    clock : IN std_logic;
    cntrl : IN std_logic;
    din : IN std_logic_vector(15 DOWNTO 0);
    dout : OUT std_logic
);
end component;

    signal clk  : std_logic := '0';
    signal cntrl  : std_logic := '0';
    signal din    : std_logic_vector(15 DOWNTO 0) := x"0000";
    signal dout   : std_logic := '0';

begin 

DUT: Comparator port map (clk, cntrl, din, dout); 

    process 
    begin 

        for I in 0 to 50 loop
            clk <= not(clk);

            cntrl <= '1';

            if(i = 10) then
                cntrl <= '1';
                din <= x"d021";

            elsif(i = 20) then
                cntrl <= '1';
                din <= x"2025";

            elsif(i = 30) then
            	cntrl <= '1';
                din <= x"f043";
                
            elsif(i = 40) then
                cntrl <= '1';
                din <= x"5343";
                
            else
                cntrl <= '0';
            end if;

            wait for 100 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 