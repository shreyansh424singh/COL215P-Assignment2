library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is    
end entity; 

architecture fum of testbench is 

component Test is
    port(
        clk : in  std_logic;
        input : in std_logic_vector(7 downto 0) 
        );
end component;

    signal addr      : std_logic_vector(7 downto 0) := x"00";
    -- signal re        : std_logic := '0';
    signal clk       : std_logic := '0';
    -- signal dout      : std_logic_vector(7 downto 0) := x"00";

begin 

DUT: Test port map (clk, addr);

    process 
    begin 

        for I in 0 to 100 loop
            clk <= not(clk);
            

           if(i = 30) then
               addr <= x"02";
        
            elsif(i = 40) then
                addr <= x"0a";
            
            elsif(i = 50) then
                addr <= x"08";

            elsif(i = 60) then
                addr <= x"03";
               
           elsif(i = 70) then
               addr <= x"04";
           end if;

            wait for 10 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 
