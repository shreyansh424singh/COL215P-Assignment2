library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is    
end entity; 

architecture fum of testbench is 

component RAM is
    port(
        addr      : in std_logic_vector(7 downto 0);
        din       : in std_logic_vector(15 downto 0);
        re        : in std_logic;
        we        : in std_logic;
        clk       : in std_logic;
        dout      : out std_logic_vector(15 downto 0)
        );
end component;

    signal addr      : std_logic_vector(7 downto 0) := x"00";
    signal din       : std_logic_vector(15 downto 0) := x"0000";
    signal re        : std_logic := '0';
    signal we        : std_logic := '0';
    signal clk       : std_logic := '0';
    signal dout      : std_logic_vector(15 downto 0) := x"0000";

begin 

DUT: RAM port map (addr, din, re, we, clk, dout); 

    process 
    begin 

        for I in 0 to 100 loop
            clk <= not(clk);

            if(i = 10) then
                we <= '1';
                addr <= x"00";
                din <= x"0543";

            elsif(i = 20) then
                we <= '1';
                addr <= x"03";
                din <= x"0439";

            elsif(i = 30) then
                re <= '1';
                addr <= x"00";
                
            elsif(i = 40) then
                re <= '1';
                addr <= x"03";
                
            else
            	re <= '0';
                we <= '0';
            end if;
            
            

            wait for 100 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 