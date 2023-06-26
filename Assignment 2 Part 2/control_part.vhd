LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

ENTITY control_part IS
port(
    -- state: out integer range 0 to 20;
    
    -- layer : out std_logic;
    -- out_ctr : out integer range 0 to 100;
    -- in_ctr : out integer range 0 to 1000;
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
    max_location : out integer
);
end control_part;

ARCHITECTURE behavioral OF control_part IS 

signal RAM_read_addr  : unsigned(11 DOWNTO 0) := x"000";
signal RAM_write_addr  : unsigned(11 DOWNTO 0) := x"000";
signal ROM_read_addr  : unsigned(15 DOWNTO 0) := x"0000";
signal layer: std_logic := '0';
signal state : integer range 0 to 200 := 100;
signal i : integer range 0 to 790 := 0;
signal j : integer range 0 to 70 := 0;
-- variable RAM_read_addr  : std_logic_vector(11 DOWNTO 0);
-- variable RAM_write_addr  : std_logic_vector(11 DOWNTO 0);
-- variable ROM_read_addr  : std_logic_vector(15 DOWNTO 0);
signal wait_next : integer range 0 to 200 := 0;
    
begin
    
    process(clk)
    begin
    case state is  
        -- Copy image activation from ROM to RAM
        when 1 => 
            initializing_RAM <= '1';
            if i = 0 then
                RAM_write_addr <= x"000";
                ROM_re <= '1';
                ROM_read_addr <= x"0000";
                
                RAM_re <= '0';
                RAM_we <= '0';
                RAM_write_addr <= x"000";
                    
                state <= 2;
            elsif i = 784 then
                ROM_re <= '0';
                
                RAM_re <= '0';
                RAM_we <= '0';
                
                state <= 5;
                i <= 0;
    
            else    
                ROM_re <= '1';
                -- ROM_read_addr <= ROM_read_addr + 1;
                
                RAM_re <= '0';
                RAM_we <= '0';
                -- RAM_write_addr <= RAM_write_addr;
                
                -- wait_next <= 2;
                state <= 2;
            end if;
            
        when 2 =>
            initializing_RAM <= '1';
            ROM_re <= '0';
            -- ROM_read_addr <= ROM_read_addr;
            
            RAM_re <= '0';
            RAM_we <= '0';
            -- RAM_write_addr <= RAM_write_addr;

            wait_next <= 3;
            state <= 100;
            
        when 3 =>
            initializing_RAM <= '1';
            ROM_re <= '0';
            -- ROM_read_addr <= ROM_read_addr;
            
            RAM_re <= '0';
            RAM_we <= '1';
            -- RAM_write_addr <= RAM_write_addr;
            
            -- wait_next <= 3;
            state <= 4;
        
        when 4 =>
            initializing_RAM <= '1';
            ROM_re <= '0';
            ROM_read_addr <= ROM_read_addr + 1;
            
            RAM_re <= '0';
            RAM_we <= '0';
            RAM_write_addr <= RAM_write_addr + 1;
            
            wait_next <= 1;
            state <= 100;
            i <= i+1;
            
        when 5 =>
            initializing_RAM <= '0';
            RAM_write_addr <= x"400";
            RAM_read_addr <= x"000";
            ROM_read_addr <= x"0400";
            i <= 0;
            j <= 0;
            state <= 6;
            layer <= '0';
            
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '0';
            MAC_inp2_ctrl <= '0';
            reg_in_wt_re <='0';
            reg_in_wt_we <='0';
            reg_in_act_re <='0';
            reg_in_act_we <='0';
            reg_out_re <='0';
            reg_out_we <='0';


        when 6 =>
            initializing_RAM <= '0';
            if j = 64 then 
                layer <= '0';
                state <= 15;                
            elsif i = 0 then
                MAC_cntrl <= '1';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                
                
                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                RAM_read_addr <= x"000";

                state <= 7;
                
            elsif i = 784 then
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                -- j <= j+1;
                state <= 11;
                i <= 0;

            else
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';

                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                state <= 7;
            end if;
        
        when 7 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';
            state <= 100;
            wait_next <= 8;
        
        when 8 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';

            reg_in_wt_re <= '0';
            reg_in_wt_we <= '1';
            reg_in_act_re <= '0';
            reg_in_act_we <= '1';
            state <= 9;
        
        when 9 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';

            reg_in_wt_re <= '1';
            reg_in_wt_we <= '0';
            reg_in_act_re <= '1';
            reg_in_act_we <= '0';
            state <= 10;

        when 10 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '0';
            MAC_inp2_ctrl <= '0';
            ROM_re <= '0';
            RAM_re <= '0';
            RAM_we <= '0';

            reg_in_wt_re <= '0';
            reg_in_wt_we <= '0';
            reg_in_act_re <= '0';
            reg_in_act_we <= '0';
            i <= i + 1;
            ROM_read_addr <= ROM_read_addr + 1;
            RAM_read_addr <= RAM_read_addr + 1;
            if layer = '0' then 
                state <= 6;
            else
                state <= 16;
            end if;
            
        when 11 => 
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '1';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            state <= 12;

        when 12 => 
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '1';
            RAM_we <= '0';
            state <= 17;
            -- wait_next <= 13;
        
        when 17 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            state <= 18;
            reg_out_we <= '1';
            reg_out_re <= '0';
            -- wait_next <= 13;
        
        when 18 =>
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            state <= 13;
            reg_out_we <= '0';
            reg_out_re <= '1';
            -- wait_next <= 13;
        
        when 13 => 
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '1';
            state <= 14;
            reg_out_we <= '0';
            reg_out_re <= '0';
        
        when 14 => 
            initializing_RAM <= '0';
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            shifter_en <= '0';
            comparator_ctrl <= '0';
            RAM_we <= '0';
            RAM_write_addr <= RAM_write_addr + 1;
            j <= j+1;
            state <= 100;
            if layer = '0' then 
                wait_next <= 6;
            else
                wait_next <= 16;
            end if;
            i <= 0;
        
        when 15 =>
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
            MAC_cntrl <= '0';
            MAC_inp1_ctrl <= '1';
            MAC_inp2_ctrl <= '1';
            reg_in_wt_re <='0';
            reg_in_wt_we <='0';
            reg_in_act_re <='0';
            reg_in_act_we <='0';
            reg_out_re <='0';
            reg_out_we <='0';

        when 16 =>
            layer <= '1';
            initializing_RAM <= '0';
            if j = 10 then 
                layer <= '1';
                state <= 17;
            elsif i = 0 then
                MAC_cntrl <= '1';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                
                
                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                RAM_read_addr <= x"400";

                state <= 7;
                
            elsif i = 64 then
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';
                -- j <= j+1;
                state <= 11;
                i <= 0;

            else
                MAC_cntrl <= '0';
                MAC_inp1_ctrl <= '1';
                MAC_inp2_ctrl <= '1';

                ROM_re <= '1';
                RAM_re <= '1';
                RAM_we <= '0';
                state <= 7;
            end if;
        
        when 19 =>
            i <= 0;
            max_ctrl <= '0';
            state <= 20;
            RAM_re <= '0';
            RAM_read_addr <= x"800";
        when 20 =>
            max_ctrl <= '0';
            if i = 10 then
                state <= 24;
            else
                RAM_re <= '1';
                state <= 21;    
            end if;
        when 21 =>
            RAM_re <= '0';
            max_ctrl <= '0';
            -- max_location <= max_location; 
            RAM_read_addr <= RAM_read_addr + 1;
            state <= 100;
            wait_next <= 22;
        when 22 =>
            -- max_location <= max_location; 
            max_ctrl <= '1';
            state <= 23;
        when 23 =>
            max_ctrl <= '0';
            i <= i + 1; 
            state <= 20;
        when 24 =>
            state <= 24;
        when 100 =>
            state <= wait_next;
        when 101 =>
            state <= 102;
        when 102 =>
            state <= 103;
        when 103 =>
            state <= wait_next;
        
        when others =>
            layer <= '0';
            -- out_ctr <= 0;
            -- in_ctr <= 0;
            ROM_re <= '0';
            -- ROM_access_addr <= x"0000";
            RAM_re <= '0';
            RAM_we <= '0';
            -- RAM_access_addr <= x"000";
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
        
    end process;
    RAM_access_addr <= std_logic_vector(RAM_write_addr) when RAM_we = '1'
                    else std_logic_vector(RAM_read_addr);
    ROM_access_addr <= std_logic_vector(ROM_read_addr);
    max_location <= i;
    -- state_out <= state;
    -- cti <= i;
    -- ctj <= j;
    
end behavioral;