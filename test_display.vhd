library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity testbench is    
end entity; 

architecture fum of testbench is 

component Display is
    port(
        clk     : IN std_logic; -- master clock used for synchronous processes
        answer : in unsigned(3 DOWNTO 0);
        anode : OUT std_logic_vector(3 DOWNTO 0); -- Anode output for FPGA Seven Segment Display
        cathode : OUT std_logic_vector(7 DOWNTO 0) -- Cathode output for FPGA Seven Segment Display
    );
    end component;

    signal clk : std_logic := '0';
    signal answer   : unsigned(3 downto 0) := "0000"; 
    signal anode    : std_logic_vector(3 downto 0) := x"0";
    signal cathode  : std_logic_vector(7 downto 0) := x"00";

begin 

    Display_module : Display port map(clk, answer, anode, cathode);

    process 
    begin 

        for I in 0 to 5000 loop
            clk <= not(clk);

            if(i = 100) then
                answer <= "0110";

            elsif(i = 2000) then
                answer <= "0001";

            elsif(i = 2500) then
                answer <= "1000";
                
            elsif(i = 4000) then
                answer <= "1001";
                
            end if;

            wait for 1 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 