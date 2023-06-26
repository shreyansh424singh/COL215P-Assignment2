library ieee; 
use ieee.std_logic_1164.all; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity testbench is    
end entity; 

architecture fum of testbench is 

component Shifter is
    port(
      data_in     : in  std_logic_vector(15 downto 0);
      data_out    : out std_logic_vector(15 downto 0);
      en          : in  std_logic;
      clk         : in  std_logic
      );
end component;

    signal data_in     : std_logic_vector(15 downto 0) := x"0000";
    signal data_out    : std_logic_vector(15 downto 0) := x"0000";
    signal en          : std_logic := '0';
    signal clk         : std_logic := '0';

begin 

DUT: Shifter port map (data_in, data_out, en, clk); 

    process 
    begin 

        for I in 0 to 100 loop
            clk <= not(clk);

            if(i = 10) then
                en <= '1';
                data_in <= x"36f2";

            elsif(i = 20) then
                en <= '1';
                data_in <= x"8792";

            elsif(i = 30) then
                en <= '1';
                data_in <= x"ab34";
                
            elsif(i = 40) then
                en <= '1';
                data_in <= x"0309";
                
            else
            	en <= '0';
                en <= '0';
            end if;
            
            

            wait for 100 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 