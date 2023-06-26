library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Shifter is
  port(
    data_in     : in  std_logic_vector(15 downto 0);
    data_out    : out std_logic_vector(15 downto 0);
    en          : in  std_logic;
    clk         : in  std_logic
    );
end Shifter;

architecture behavioral of Shifter is

begin

    process (clk) is
    begin

        if(en = '1') then
            if(data_in(15) = '0') then 
                data_out <= "00000" & data_in(15 downto 5);
            else 
                data_out <= "11111" & data_in(15 downto 5);
             end if;
        end if;

    end process;
    
end Behavioral;