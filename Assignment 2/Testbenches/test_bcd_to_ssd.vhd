library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity testbench is    
end entity; 

architecture fum of testbench is 

    component BCD_to_SSD
        port(       
            val : IN unsigned(3 DOWNTO 0);
            dp  : IN std_logic;
            dis : OUT std_logic_vector(7 DOWNTO 0)
        );
    end component;

    signal dp : std_logic := '0';
    signal val   : unsigned(3 downto 0) := "0000"; 
    signal dis  : std_logic_vector(7 downto 0) := x"00";

begin 

    BCD_module : BCD_to_SSD port map(val, dp, dis);

    process 
    begin 

        dp <= '0';

        for I in 0 to 50 loop
            clk <= not(clk);

            if(i = 10) then
                val <= "0110";

            elsif(i = 20) then
                val <= "0001";

            elsif(i = 30) then
                val <= "1000";
                
            elsif(i = 40) then
                val <= "1001";
                
            end if;

            wait for 1 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 