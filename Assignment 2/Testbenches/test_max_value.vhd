library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;


entity testbench is    
end entity; 

architecture fum of testbench is 

    component Max_value is
        PORT (
            clock : IN std_logic;
            cntrl : IN std_logic;
            value : IN std_logic_vector(15 DOWNTO 0);
            location : in unsigned(3 downto 0);
            dout : OUT unsigned(3 downto 0)
        );
    end component;

    signal clk : std_logic := '0';
    signal cntrl : std_logic := '0';
    signal location   : unsigned(3 downto 0) := "0000"; 
    signal dout    : unsigned(3 downto 0) := x"0";
    signal value  : std_logic_vector(15 downto 0) := x"0000";

begin 

    Max_value_module : Max_value port map(clk, cntrl, value, location, dout);

    process 
    begin         

        for I in 0 to 50 loop
            clk <= not(clk);

            if(i = 10) then
                cntrl <= '1';
                location <= "0001";
                value <= x"0110";

            elsif(i = 20) then
                location <= "0010";
                cntrl <= '1';
                value <= x"0001";

            elsif(i = 30) then
                location <= "0011";
                cntrl <= '1';
                value <= x"1000";
                
            elsif(i = 40) then
                location <= "0100";
                cntrl <= '1';
                value <= x"1001";

            else
                cntrl <= '0';
                
            end if;

            wait for 1 ns;
        end loop;

        ASSERT FALSE REPORT "Test done. Open EPWave to see signals." SEVERITY NOTE;
        wait;
    end process; 
    end; 