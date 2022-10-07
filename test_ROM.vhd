library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is    
end entity; 

architecture fum of testbench is 

component ROM_MEM is
    port(
        addr      : in std_logic_vector(15 downto 0);
        re        : in std_logic;
        clk       : in std_logic;
        dout      : out std_logic_vector(7 downto 0)
        );
end component;

    signal addr      : std_logic_vector(15 downto 0) := x"0000";
    signal re        : std_logic := '0';
    signal clk       : std_logic := '0';
    signal dout      : std_logic_vector(7 downto 0) := x"00";

begin 

DUT: ROM_MEM port map (addr, re, clk, dout); 

    process 
    begin 

        for I in 0 to 100 loop
            clk <= not(clk);
            

           if(i = 30) then
               re <= '1';
               addr <= x"00cc";
        
            elsif(i = 40) then
                re <= '1';
                addr <= x"0bb8";
            
            elsif(i = 50) then
                re <= '1';
                addr <= x"0cb4";

            elsif(i = 60) then
            re <= '1';
            addr <= x"0245";
               
           elsif(i = 70) then
               re <= '1';
               addr <= x"09f4";
                
           else
           	re <= '0';
           end if;

            wait for 10 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 
