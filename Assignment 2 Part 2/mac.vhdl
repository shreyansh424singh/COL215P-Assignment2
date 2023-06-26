LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY MAC IS
PORT (
    clock : IN std_logic;
    cntrl : IN std_logic;
    weight : IN std_logic_vector(7 DOWNTO 0);
    pix : IN std_logic_vector(15 DOWNTO 0);
    dout : OUT std_logic_vector(15 DOWNTO 0)
);
END MAC;

ARCHITECTURE Mac_arch OF MAC IS
BEGIN
	PROCESS (clock) 
    	variable sum : signed (15 DOWNTO 0);
    	variable product : signed (23 DOWNTO 0);
    begin
    	product := signed (weight) * signed (pix);
		IF rising_edge (clock) THEN
			IF (cntrl = '1') THEN
				sum := product(23 DOWNTO 8);
			ELSE
				sum := product(23 DOWNTO 8) + sum;
			END IF;
		END IF;
		dout <= std_logic_vector(sum);
	END PROCESS;
--     dout <= std_logic_vector(sum);
END Mac_arch;