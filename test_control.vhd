library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
COMPONENT control_path is
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
      max_ctrl : out std_logic;
      max_location : out unsigned(3 downto 0)
  );
end component;

signal clk: std_logic := '0';
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
signal fsm_max_location : unsigned(3 downto 0) := "0000";


begin

  -- Connect DUT
	FSM_module: control_path port map(clk, fsm_ROM_re, fsm_ROM_access_addr, fsm_RAM_re, fsm_RAM_we, fsm_RAM_access_addr, fsm_MAC_cntrl, fsm_MAC_inp1_ctrl, fsm_MAC_inp2_ctrl, fsm_reg_in_wt_re, fsm_reg_in_wt_we, fsm_reg_in_act_re, fsm_reg_in_act_we, fsm_reg_out_re, fsm_reg_out_we, fsm_shifter_en, fsm_comparator_ctrl, fsm_initializing_RAM, fsm_max_ctrl, fsm_max_location);

  process
  begin
  	clk <= '0';
	for i in 1 to 10000 loop
    	clk <= not(clk);
        wait for 2 ns;
    end loop;
    wait;
  end process;
end tb;
