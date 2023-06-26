library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity testbench is    
end entity; 

architecture fum of testbench is 

    component ClockDivider
        port(
            clk: IN std_logic;
            clk_freq: IN natural;
            clk10hz: OUT std_logic;
            clk400hz: OUT std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal clk10hz : std_logic := '0';
    signal clk400hz : std_logic := '0';
    signal clk_freq: natural := 100000;

begin 

    Clock_divider_module : ClockDivider port map(clk, clk_freq, clk10hz, clk400hz);

    process 
    begin 

        clk_freq <= 100000;

        for I in 0 to 5000 loop
            clk <= not(clk);

            wait for 1 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 