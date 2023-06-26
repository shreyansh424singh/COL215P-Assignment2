LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Max_value IS
PORT (
    clock : IN std_logic;
    cntrl : IN std_logic;
    value : IN std_logic_vector(15 DOWNTO 0);
    location : in unsigned(3 downto 0);
    dout : OUT unsigned(3 downto 0)
);
END Max_value;

ARCHITECTURE behavioral OF Max_value IS
signal temp_val : std_logic_vector(15 DOWNTO 0) := x"0000";
signal temp_loc : unsigned(3 downto 0) := "0000";

BEGIN
	PROCESS (clock) BEGIN
    if rising_edge(clock) then

        if cntrl = '1' and temp_val < value then
            temp_val <= value;
            temp_loc <= location;
        end if;
    end if;
	END PROCESS;
    dout <= temp_loc;
END behavioral;