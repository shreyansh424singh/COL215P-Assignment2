LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY Main IS
	PORT (
		clock : IN std_logic;
		start : IN std_logic;
	);
	
END Main;

ARCHITECTURE behavior of Main IS

-- Signals for mapping to MAC
signal mac_cntrl  : std_logic := '0';
signal mac_weight : std_logic_vector(7 DOWNTO 0) := x"00";
signal mac_pix    : std_logic_vector(15 DOWNTO 0) := x"0000";
signal mac_dout   : std_logic_vector(15 DOWNTO 0) := x"0000";


-- Signals for mapping to ROM
signal rom_addr      : std_logic_vector(15 downto 0) := x"0000";
signal rom_re        : std_logic := '0';
signal rom_dout      : std_logic_vector(7 downto 0) := x"00";


-- Signals for mapping to RAM
signal ram_addr      : std_logic_vector(11 downto 0) := x"0000";
signal ram_din       : std_logic_vector(15 downto 0) := x"0000";
signal ram_re        : std_logic := '0';
signal ram_we        : std_logic := '0';
signal ram_dout      : std_logic_vector(15 downto 0) := x"0000";

-- Signals for mapping to Register_in_wt
signal reg_in_wt_din  : std_logic_vector(15 downto 0) := x"0000";    
signal reg_in_wt_re   : std_logic := '0';    
signal reg_in_wt_we   : std_logic := '0';    
signal reg_in_wt_dout :  std_logic_vector(15 downto 0) := x"0000";

-- Signals for mapping to Register_in_act
signal reg_in_act_din  : std_logic_vector(15 downto 0) := x"0000";    
signal reg_in_act_re   : std_logic := '0';    
signal reg_in_act_we   : std_logic := '0';    
signal reg_in_act_dout :  std_logic_vector(15 downto 0) := x"0000";

-- Signals for mapping to Register_out
signal reg_out_din  : std_logic_vector(15 downto 0) := x"0000";    
signal reg_out_re   : std_logic := '0';    
signal reg_out_we   : std_logic := '0';    
signal reg_out_dout :  std_logic_vector(15 downto 0) := x"0000";

-- Signals for mapping to Shifter
signal shifter_data_in     : std_logic_vector(15 downto 0) := x"0000";
signal shifter_data_out    : std_logic_vector(15 downto 0) := x"0000";
signal shifter_en          : std_logic := '0';

-- Signals for mapping to Comparator
signal comp_cntrl : std_logic := '0';
signal comp_din   :   std_logic_vector(15 DOWNTO 0) := x"0000";
signal comp_dout :  std_logic := '0';

-- Signals for mapping to Control Part
signal fsm_ROM_re          : std_logic := '0';
signal fsm_ROM_access_addr : std_logic_vector(15 DOWNTO 0) := x"0000";
signal fsm_RAM_re          : std_logic := '0';
signal fsm_RAM_we          : std_logic := '0';
signal fsm_RAM_access_addr : std_logic_vector(11 DOWNTO 0) := x"000";
signal fsm_MAC_cntrl       : std_logic := '0';
signal fsm_MAC_inp1_ctrl   : std_logic := '0';
signal fsm_MAC_inp2_ctrl   : std_logic := '0';
signal fsm_reg_in_wt_re    : std_logic := '0';
signal fsm_reg_in_wt_we    : std_logic := '0';
signal fsm_reg_in_act_re   : std_logic := '0';
signal fsm_reg_in_act_we   : std_logic := '0';
signal fsm_reg_out_re      : std_logic := '0';
signal fsm_reg_out_we      : std_logic := '0';
signal fsm_initializing_RAM : std_logic := '0';
signal fsm_shifter_en : std_logic := '0';
signal fsm_comparator_ctrl  : std_logic := '0';
signal fsm_max_ctrl  : std_logic := '0';
signal fsm_cd   : integer := 0;

-- Signals for mapping to Max Value
signal max_cntrl : std_logic := '0';
signal max_value : std_logic_vector(15 DOWNTO 0) := x"0000";
signal max_location : integer := 0;
signal max_dout : integer := 0; 


-- Add COMPONENTs
component RAM IS
	port(
        addr      : in std_logic_vector(11 downto 0);
        din       : in std_logic_vector(15 downto 0);
        re        : in std_logic;
        we        : in std_logic;
        clk       : in std_logic;
        dout      : out std_logic_vector(15 downto 0)
    );
end component;

component ROM_MEM IS
	port (
        addr      : in std_logic_vector(15 downto 0);
        re        : in std_logic;
        clk       : in std_logic;
        dout      : out std_logic_vector(7 downto 0)
      );
end component;

component MAC IS
	PORT (
        clock : IN std_logic;
        cntrl : IN std_logic;
        weight : IN std_logic_vector(7 DOWNTO 0);
        pix : IN std_logic_vector(15 DOWNTO 0);
        dout : OUT std_logic_vector(15 DOWNTO 0)
    );
end component;

component Registers is
    port(
        din       : in std_logic_vector(15 downto 0);
        re        : in std_logic;
        we        : in std_logic;
        clk       : in std_logic;
        dout      : out std_logic_vector(15 downto 0)
    );
end component;

component Shifter is
    port(
        data_in     : in  std_logic_vector(15 downto 0);
        data_out    : out std_logic_vector(15 downto 0);
        en          : in  std_logic;
        clk         : in  std_logic
    );
end component;

component Comparator is
    PORT (
        clock : IN std_logic;
        cntrl : IN std_logic;
        din : IN std_logic_vector(15 DOWNTO 0);
        dout : OUT std_logic
    );
end component;

component Max_value is
    PORT (
        clock : IN std_logic;
        cntrl : IN std_logic;
        value : IN std_logic_vector(15 DOWNTO 0);
        location : in integer;
        dout : OUT integer
    );
end component;

COMPONENT control_part is
    port(
        clk : in std_logic;
        ROM_re  : out std_logic;
        ROM_access_addr  : out std_logic_vector(15 DOWNTO 0);
        RAM_re  : out std_logic;
        RAM_we  : out std_logic;
        RAM_access_addr : out std_logic_vector(11 DOWNTO 0);
        MAC_cntrl     : out std_logic;
        MAC_inp1_ctrl : out std_logic;
        MAC_inp2_ctrl : out std_logic;
        reg_in_wt_re  : out std_logic;
        reg_in_wt_we  : out std_logic;
        reg_in_act_re : out std_logic;
        reg_in_act_we : out std_logic;
        reg_out_re    : out std_logic;
        reg_out_we    : out std_logic;
        shifter_en : out std_logic;
        comparator_ctrl  : out std_logic;
        initializing_RAM : out std_logic;
        max_cntrl : out std_logic;
        max_location : out integer
    );
end component;

begin
	ROM_module: ROM_MEM port map(rom_addr, rom_re, clk, rom_dout); 
	RAM_module: RAM port map(ram_addr, ram_din, ram_re, ram_we, clk, ram_dout);
	MAC_module: MAC port map(clk, mac_cntrl, mac_weight, mac_pix, mac_dout);
    Shifter_module: Shifter port map(shifter_data_in, shifter_data_out, shifter_en, clk);
    Comparator_module: Comparator port map(clk, comp_cntrl, comp_din, comp_dout);
    Reg_in_wt_module: Registers port map(reg_in_wt_din, reg_in_wt_re, reg_in_wt_we, clk, reg_in_wt_dout);
    Reg_in_act_module: Registers port map(reg_in_act_din, reg_in_act_re, reg_in_act_we, clk, reg_in_act_dout);
    Reg_out_module: Registers port map(reg_out_din, reg_out_re, reg_out_we, clk, reg_out_dout);
    FSM_module: control_part port map(clk, fsm_ROM_re, fsm_ROM_access_addr, fsm_RAM_re, fsm_RAM_we, 
                            fsm_RAM_access_addr, fsm_MAC_cntrl, fsm_MAC_inp1_ctrl, fsm_MAC_inp2_ctrl, 
                            fsm_reg_in_wt_re, fsm_reg_in_wt_we, fsm_reg_in_act_re, fsm_reg_in_act_we, 
                            fsm_reg_out_re, fsm_reg_out_we, fsm_shifter_en, fsm_comparator_ctrl, 
                            fsm_initializing_RAM, fsm_max_ctrl, fsm_max_location);
    Max_module : Max_value port map(clk, max_cntrl, max_value, max_location, max_dout);               


    -- MAC
    mac_cntrl <= fsm_MAC_cntrl;
    mac_weight <= x"00" when (fsm_MAC_inp1_ctrl = '1')
            else  reg_in_wt_dout(7 downto 0);
    mac_pix <= reg_in_act_dout when fsm_MAC_inp2_ctrl = '0'
            else x"0001";

    
    -- RAM
    ram_we <= fsm_RAM_we;
    ram_re <= fsm_RAM_re;
    ram_din <= x"00" & rom_dout when fsm_initializing_RAM = '1'
            else mac_dout;
    ram_addr <= fsm_RAM_access_addr;

    -- ROM
    rom_re <= fsm_ROM_re;
    rom_addr <= fsm_ROM_access_addr;

    -- Shifter
    shifter_data_in <= mac_dout;
    shifter_en <= fsm_shifter_en;

    -- Comparator
    comp_din <= shifter_data_out;
    comp_cntrl <= fsm_comparator_ctrl;

    -- Register_in_wt
    reg_in_wt_din <= x"00" & rom_dout;
    reg_in_wt_re <= fsm_reg_in_wt_re;
    reg_in_wt_we <= fsm_reg_in_wt_we;

    -- Register_in_act
    reg_in_act_din <= ram_dout;
    reg_in_act_re <= fsm_reg_in_act_re;
    reg_in_act_we <= fsm_reg_in_act_we;

    -- Register_out
    reg_out_din <= comp_din when comp_dout = '1'
            else   x"0000";
    reg_out_re <= fsm_reg_out_re;
    reg_out_we <= fsm_reg_out_we;

    -- Max Value
    max_cntrl <= fsm_max_ctrl;
    max_value <= ram_dout when fsm_max_ctrl = '1'
            else x"0000";
    max_location <= fsm_max_location;

end behavior;