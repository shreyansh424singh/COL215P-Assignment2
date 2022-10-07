library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Display is
    port(
        -- Inputs
        clk     : IN std_logic; -- master clock used for synchronous processes
        answer : in unsigned(3 DOWNTO 0);
    
        -- Outputs
        anode : OUT std_logic_vector(3 DOWNTO 0); -- Anode output for FPGA Seven Segment Display
        cathode : OUT std_logic_vector(7 DOWNTO 0) -- Cathode output for FPGA Seven Segment Display
    );
    end entity;
    

    architecture DisplayArch of Display is
        
        constant clk_freq : natural := 100000; -- constant which stores the clock frequency.
        -- Divided clocks: Value is attained from ClockDivider component.
        signal clk10hz   : std_logic; -- For keeping track of time
        signal clk400hz : std_logic; -- For display refresh. A 10ms refresh rate is selected. 4 digits per refresh means 2.5ms clocking is required. This requires a 400Hz clock.
    
        signal setAnode : unsigned(3 DOWNTO 0) := "1101"; -- Tracks the position of the selected digit. 0 indicates the display position in the bit string.
        signal digit : unsigned(3 DOWNTO 0) := "1111"; -- Tracks the value of the digit (0-9) to be displayed at the selected position. 
        -- Any value other than 0-9 displays no digit at that position. Used to create blink effect.
        signal dp : std_logic; -- Tracks whether a DP is to be displayed at the position along with the digit.
    
        -- Components
        -- ClockDivider: divides the master clock into various clocks(1Hz, 400Hz)
        component ClockDivider
            port(
                clk: IN std_logic;
                clk_freq: IN natural;
                clk10hz: OUT std_logic;
                clk400hz: OUT std_logic
            );
        end component;
    
        -- BCD2SSD: Converts the bcd digit to the cathode output format.
        component BCD_to_SSD
            port(       
                val : IN unsigned(3 DOWNTO 0);
                dp  : IN std_logic;
                dis : OUT std_logic_vector(7 DOWNTO 0)
            );
        end component;
    
    
    begin
        divideClocks : ClockDivider port map(clk => clk, clk_freq => clk_freq, clk10hz => clk10hz, clk400hz => clk400hz);
    
        displayTime : BCD_to_SSD port map(val => digit, dp => dp, dis => cathode); 

        -- 400Hz clock used for display refresh. It sets the cathode and anode values.
        -- setAnode is used to track States. In every cycle, state transitions to the next one.
        -- 0111 -> 1011 -> 1101 -> 1110 -> 0111.. and so on
        process(clk400hz)
        begin
        
            if(clk400hz = '1' and clk400hz'event) then
                -- State Transition
                case setAnode is
                    when "0111" => setAnode <= "1011";
                    when "1011" => setAnode <= "1101";
                    when "1101" => setAnode <= "1110";
                    when "1110" => setAnode <= "0111";
                    when others => setAnode <= "0111";
                end case;
                
                -- Using the setAnode state to determine anode and cathode. (Basically signifies the position of the digit on the display)
                -- Based on the setAnode state, after accounting for blinking, the current digit(BCD) which has to be encoded to cathode signal and sent along with the appropriate anode signal is determined.
                if(setAnode = "0111") then digit <= "0000";
                elsif(setAnode = "1011") then digit <= "0000"; 
                elsif(setAnode = "1101") then digit <= "0000";
                elsif(setAnode = "1110") then digit <= answer;
                end if;
                -- Based on the setAnode state, the current DP state which has to be encoded to cathode signal and sent along with the appropriate anode signal is determined.
                -- Set dp according to the value tracked by each decimal point bit
                if(setAnode = "0111")    then dp <= '0';
                elsif(setAnode = "1011") then dp <= '1';
                elsif(setAnode = "1101") then dp <= '0';
                elsif(setAnode = "1110") then dp <= '1';
                else dp <='1';
                end if;
                -- assign anode 
                anode <= std_logic_vector(setAnode);
                -- cathode assigned in component BCD2SSD
            end if;
            
        end process;
        
    end architecture;