LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Comparator IS
PORT (
    clock : IN std_logic;
    cntrl : IN std_logic;
    din : IN std_logic_vector(15 DOWNTO 0);
    dout : OUT std_logic
);
END Comparator;

ARCHITECTURE Cmp_arch OF Comparator IS
BEGIN
	PROCESS (clock) BEGIN
		IF rising_edge (clock) and cntrl = '1' THEN
            dout <= not(din(15));
        END IF;		
	END PROCESS;
END Cmp_arch;