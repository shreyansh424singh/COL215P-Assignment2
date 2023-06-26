LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Max_value IS
PORT (
    clock : IN std_logic;
    cntrl : IN std_logic;
    value : IN std_logic_vector(15 DOWNTO 0);
    location : in integer;
    dout : OUT integer
);
END Max_value;

ARCHITECTURE behavioral OF Max_value IS
signal temp_val : std_logic_vector(15 DOWNTO 0) := x"0000";
signal temp_loc : integer := 0;

BEGIN
	PROCESS (clock) BEGIN
        if cntrl = '1' and (to_integer(unsigned(temp_val)) < to_integer(unsigned(value))) then
            temp_val <= value;
            temp_loc <= location;
        end if;
	END PROCESS;
    dout <= temp_loc;
END behavioral;