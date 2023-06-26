library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity RAM is
    port(
      addr      : in std_logic_vector(11 downto 0);
      din       : in std_logic_vector(15 downto 0);
      re        : in std_logic;
      we        : in std_logic;
      clk       : in std_logic;
      dout      : out std_logic_vector(15 downto 0)
      );
end RAM;

architecture behavioral of RAM is
    type memory is array(0 to 4095) of std_logic_vector(15 downto 0);
    signal mem : memory:= (others => X"0000");

    signal temp : integer range 0 to 256 := 0;

begin 

    process (clk) is
    begin

        if(we = '1') then
            mem(to_integer(unsigned(addr))) <= din;
        end if;

        if(re = '1') then
            dout <= mem(to_integer(unsigned(addr)));
        end if;

    end process;
    
end behavioral;