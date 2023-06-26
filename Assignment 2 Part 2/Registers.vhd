library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity Registers is
    port(
      din       : in std_logic_vector(15 downto 0);
      re        : in std_logic;
      we        : in std_logic;
      clk       : in std_logic;
      dout      : out std_logic_vector(15 downto 0)
      );
end Registers;

architecture behavioral of Registers is
    signal reg : std_logic_vector(15 downto 0) := x"0000";

begin 

    process (clk) is
    begin

        if(we = '1') then
            reg <= din;
        end if;

        if(re = '1') then
            dout <= reg;
        end if;

    end process;
end behavioral;