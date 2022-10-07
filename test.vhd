LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

ENTITY Test IS
port(
    clk : in  std_logic;
    input : in std_logic_vector(7 downto 0) 
    );
END Test;

ARCHITECTURE behavior OF Test IS 

    COMPONENT RAM is
        port(
            addr      : in std_logic_vector(7 downto 0);
            din       : in std_logic_vector(15 downto 0);
            re        : in std_logic;
            we        : in std_logic;
            clk       : in std_logic;
            dout      : out std_logic_vector(15 downto 0)
            );
    END COMPONENT;

    signal ram_addr  : std_logic_vector(7 downto 0) := x"00";            
    signal ram_din  : std_logic_vector(15 downto 0) := x"0000";            
    signal ram_re  : std_logic := '0';
    signal ram_we  : std_logic := '0';
    signal ram_clk  : std_logic := '0';
    signal ram_dout  :  std_logic_vector(15 downto 0) := x"0000";

    component Registers is
        port(
            din       : in std_logic_vector(15 downto 0);
            re        : in std_logic;
            we        : in std_logic;
            clk       : in std_logic;
            dout      : out std_logic_vector(15 downto 0)
            );
    end component;

    signal reg_din  : std_logic_vector(15 downto 0) := x"0000";    
    signal reg_re   : std_logic := '0';    
    signal reg_we   : std_logic := '0';    
    signal reg_clk  : std_logic := '0';
    signal reg_dout :  std_logic_vector(15 downto 0) := x"0000";

begin
    dRAM : RAM port map(ram_addr, ram_din, ram_re, ram_we, ram_clk, ram_dout);
    dReg : Registers port map(reg_din, reg_re, reg_we, reg_clk, reg_dout); 

    -- process(clk) is
    -- begin


    ram_addr <= input;
    reg_we <= '1';
    reg_din <= ram_dout;
    reg_re <= '1';
    reg_clk <= clk;
    ram_clk <= clk;

end behavior;