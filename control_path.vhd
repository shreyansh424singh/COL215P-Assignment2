LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

ENTITY control_path IS
port(
    clk : in std_logic;
    ROM_re  : out std_logic;
    ROM_access_addr  : out std_logic_vector(15 DOWNTO 0);
    
    RAM_re  : out std_logic;
    RAM_we  : out std_logic;
    RAM_access_addr  : out std_logic_vector(11 DOWNTO 0);

    MAC_cntrl : out std_logic;
    MAC_inp1_ctrl : out std_logic;
    MAC_inp2_ctrl : out std_logic;

    reg_in_wt_re : out std_logic;
    reg_in_wt_we : out std_logic;
    reg_in_act_re : out std_logic;
    reg_in_act_we : out std_logic;
    reg_out_re : out std_logic;
    reg_out_we : out std_logic;

    shifter_en : out std_logic;
    comparator_ctrl : out std_logic;

    initializing_RAM : out std_logic;

    max_ctrl : out std_logic;
    max_location : out unsigned(3 downto 0)
);
end control_path;

ARCHITECTURE behavior OF control_path IS 

signal ROM_bias_addr : std_logic_vector(15 DOWNTO 0) := x"0000";
signal bias_addition : std_logic := '0';
signal RAM_read_addr  : std_logic_vector(11 DOWNTO 0) := x"000";
signal RAM_write_addr  : std_logic_vector(11 DOWNTO 0) := x"000";
signal ROM_read_addr  : std_logic_vector(15 DOWNTO 0) := x"0000";
signal layer: std_logic := '0';
signal state : integer range 0 to 200 := 100;
signal i : integer range 0 to 1000 := 0;
signal j : integer range 0 to 1000 := 0;
signal ii : unsigned(3 downto 0) := "0000";
signal RAM_we_copy :std_logic := '1';
signal wait_next : integer range 0 to 200 := 0;
    
begin
    
    process(clk)
    
    begin
    if rising_edge(clk) then
    case state is  
        -- Copy image activation from ROM to RAM (state 1-4)
        -- Set ROM address to be read
        when 1 => 
            initializing_RAM <= '1';
            if i = 0 then
                RAM_write_addr <= x"000";
                ROM_re <= '1';
                ROM_read_addr <= x"0000";
                
                RAM_re <= '0';
                RAM_we <= '0';
                RAM_we_copy <= '0';
                RAM_write_addr <= x"000";
                    
                state <= 2;
            elsif i = 784 then
                ROM_re <= '0';
                
                RAM_re <= '0';
                RAM_we <= '0';
                RAM_we_copy <= '0';
                state <= 5;
                i <= 0;
    
            else    
                ROM_re <= '1';
                RAM_re <= '0';
                RAM_we <= '0';
                RAM_we_copy <= '0';
                state <= 2;
            end if;
            
        -- wait cycle for ROM to complete it's read 
        when 2 =>
            initializing_RAM <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            wait_next <= 3;
            state <= 100;
            
        -- Write enable in RAM
        when 3 =>
            initializing_RAM <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '1';
            RAM_we_copy <= '1';
            state <= 4;
        
        -- Update ROM address for next read and wait for RAM to complete it's write
        when 4 =>
            initializing_RAM <= '1';
            ROM_re <= '0';
            ROM_read_addr <= std_logic_vector(unsigned(ROM_read_addr) + 1);
            
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            RAM_write_addr <= std_logic_vector(unsigned(RAM_write_addr) + 1);
            
            wait_next <= 1;
            state <= 100;
            i <= i+1;
            
        -- Read weight from ROM
        -- Read image from RAM
        when 5 =>
            initializing_RAM <= '0';
            RAM_write_addr <= x"400";
            RAM_read_addr <= x"000";
            ROM_read_addr <= x"0400";
            i <= 0;
            j <= 0;
            state <= 6;
            layer <= '0';
            ROM_bias_addr <= x"c800";
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '0';
            MAC_inp2_ctrl <= '0';
            reg_in_wt_re <='0';
            reg_in_wt_we <='0';
            reg_in_act_re <='0';
            reg_in_act_we <='0';
            reg_out_re <='0';
            reg_out_we <='0';
            
        -- Start reading from RAM and ROM
        when 6 =>
            initializing_RAM <= '0';
            -- Layer 1 completed
            if j = 64 then 
                layer <= '0';
                state <= 15;    
            -- Start of new column   
            elsif i = 0 then
                MAC_cntrl <= '1';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                RAM_we_copy <= '0';
                RAM_read_addr <= x"000";

                state <= 7;
            -- End of one column write MAC output to RAM (state 25)
            elsif i = 784 then
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                state <= 25;
                i <= 0;
            
            else
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';

                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                RAM_we_copy <= '0';
                state <= 7;
            end if;
        
        -- At the end of an column read and add bias (state 25-29)
        when 25 => 
            bias_addition <= '1';
            ROM_re <= '1';
            state <= 26;
        
        -- Wait cycle for bias to be read from ROM
        when 26 =>
            ROM_re <= '0';
            wait_next <= 27;
            state <= 100;
        
        -- Write bias in register
        when 27 =>
            reg_in_wt_we <= '1';
            state <= 28;

        -- Read bias from register
        when 28 =>
            reg_in_wt_we <= '0';
            reg_in_wt_re <= '1';
            state <= 29;

        -- Pass register output to MAC
        when 29 =>
            reg_in_wt_we <= '0';
            reg_in_wt_re <= '0';
            MAC_inp1_ctrl <= '0';
            MAC_inp2_ctrl <= '1';
            ROM_bias_addr <= std_logic_vector(unsigned(ROM_bias_addr) + 1);
            state <= 11;
        
        -- Wait cycle for RAM and ROM read to be completed
        when 7 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            state <= 100;
            wait_next <= 8;
        
        -- Write ROM and RAM output to regiters
        when 8 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';

            reg_in_wt_re <= '0';
            reg_in_wt_we <= '1';
            reg_in_act_re <= '0';
            reg_in_act_we <= '1';
            state <= 9;
        
        -- Read image and weight from registers
        when 9 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';

            reg_in_wt_re <= '1';
            reg_in_wt_we <= '0';
            reg_in_act_re <= '1';
            reg_in_act_we <= '0';
            state <= 10;

        -- Pass the weigth and image to MAC and update RAM and ROM address to be read
        when 10 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '0';
            MAC_inp2_ctrl <= '0';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            reg_in_wt_re <= '0';
            reg_in_wt_we <= '0';
            reg_in_act_re <= '0';
            reg_in_act_we <= '0';
            i <= i + 1;
            ROM_read_addr <= std_logic_vector(unsigned(ROM_read_addr) + 1);
            RAM_read_addr <= std_logic_vector(unsigned(RAM_read_addr) + 1);
            if layer = '0' then 
                state <= 6;
            else
                state <= 16;
            end if;
            
        -- Pass MAC output to shifter
        when 11 => 
            bias_addition <= '0';
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '1';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            state <= 12;

        -- Pass Shifter output to comparator
        when 12 => 
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '1';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            state <= 17;
        
        -- Write comparator output to register
        when 17 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            state <= 18;
            reg_out_we <= '1';
            reg_out_re <= '0';
        
        -- Read from the output register
        when 18 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            state <= 13;
            reg_out_we <= '0';
            reg_out_re <= '1';
        
        -- Write output register value to RAM
        when 13 => 
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '1';
            RAM_we_copy <= '1';
            state <= 14;
            reg_out_we <= '0';
            reg_out_re <= '0';
        
        -- Wait cycle for RAM write to be completed and update RAM write address
        when 14 => 
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            RAM_write_addr <= std_logic_vector(unsigned(RAM_write_addr) + 1);
            j <= j+1;
            state <= 100;
            if layer = '0' then 
                wait_next <= 6;
            else
                wait_next <= 16;
            end if;
            i <= 0;
        
        -- Initialise values for second layer
        when 15 =>
            ROM_bias_addr <= x"CAC0";
            initializing_RAM <= '0';
            RAM_write_addr <= x"800";
            RAM_read_addr <= x"400";
            ROM_read_addr <= x"C840";
            i <= 0;
            j <= 0;
            state <= 16;
            layer <= '1';
            
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            reg_in_wt_re <='0';
            reg_in_wt_we <='0';
            reg_in_act_re <='0';
            reg_in_act_we <='0';
            reg_out_re <='0';
            reg_out_we <='0';

        -- Start reading from RAM and ROM
        when 16 =>
            layer <= '1';
            initializing_RAM <= '0';
            -- Layer 2 is completed 
            if j = 10 then 
                layer <= '1';
                state <= 19;
            -- Start of new column
            elsif i = 0 then
                MAC_cntrl <= '1';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                RAM_we_copy <= '0';
                RAM_read_addr <= x"400";
                state <= 7;
            -- End of one column write MAC output to RAM
            elsif i = 64 then
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                -- j <= j+1;
                state <= 25;
                i <= 0;

            else
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';

                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                RAM_we_copy <= '0';
                state <= 7;
            end if;
        
        -- Find the maximum value (state 19-23)
        -- Initialise Values
        when 19 =>
            ii <= "0000";
            max_ctrl <= '0';
            state <= 20;
            RAM_re <= '0';
            RAM_read_addr <= x"800";

        -- Start reading from RAM
        when 20 =>
            max_ctrl <= '0';
            if ii = "1010" then
                state <= 24;
            else
                RAM_re <= '1';
                state <= 21;    
            end if;

        -- wait cycle for RAM to complete it's read 
        when 21 =>
            RAM_re <= '0';
            max_ctrl <= '0';
            RAM_read_addr <= std_logic_vector(unsigned(RAM_read_addr) + 1);
            state <= 100;
            wait_next <= 22;

        -- Compare this value
        when 22 =>
            max_ctrl <= '1';
            state <= 23;
        
        -- Loop to check next value
        when 23 =>
            max_ctrl <= '0';
            ii <= ii + 1; 
            state <= 20;

        when 24 =>
            state <= 24;
        when 100 =>
            state <= wait_next;
        -- when 101 =>
        --     state <= 102;
        -- when 102 =>
        --     state <= 103;
        -- when 103 =>
        --     state <= wait_next;
        
        
        when others =>
            bias_addition <= '0';
            layer <= '0';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_we_copy <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '0';           
            MAC_inp2_ctrl <= '0';    
            reg_in_wt_re <='0';
            reg_in_wt_we <='0';
            reg_in_act_re <='0';
            reg_in_act_we <='0';
            reg_out_re <='0';
            reg_out_we <='0';
            state <= 1;

        end case;
    end if;
    end process;
    
    RAM_access_addr <= RAM_write_addr when RAM_we_copy = '1'
                    else RAM_read_addr;
    ROM_access_addr <= ROM_read_addr when bias_addition = '0'
                    else ROM_bias_addr;
    max_location <= ii;
    
end behavior;