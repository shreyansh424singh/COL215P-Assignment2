library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use std.textio.all;


entity ROM_MEM is
    generic (
        ADDR_WIDTH : integer := 10;
        DATA_WIDTH : integer := 8;
        IMAGE_SIZE : integer := 784;
        IMAGE_FILE_NAME : string :="imgdata.mif";
        WEIGHT_FILE_NAME : string :="weights_bias.mif";
        WEIGHT_SIZE : integer := 50890
    );
    port (
      addr      : in std_logic_vector(15 downto 0);
      re        : in std_logic;
      clk       : in std_logic;
      dout      : out std_logic_vector(7 downto 0)
    );
end ROM_MEM;

architecture Behavioral of ROM_MEM is
    TYPE mem_type IS ARRAY(0 TO 65535) OF std_logic_vector((DATA_WIDTH-1) DOWNTO 0);
--    TYPE img_mem_type IS ARRAY(0 TO IMAGE_SIZE) OF std_logic_vector((DATA_WIDTH-1) DOWNTO 0);
--    TYPE weight_mem_type IS ARRAY(0 TO WEIGHT_SIZE) OF std_logic_vector((DATA_WIDTH-1) DOWNTO 0);
    
    impure function init_mem(im_mif_file_name : in string; wt_mif_file_name : in string) return mem_type is
        file im_mif_file : text open read_mode is im_mif_file_name;
        file wt_mif_file : text open read_mode is wt_mif_file_name;
        variable mif_line : line;
        variable temp_bv : bit_vector(DATA_WIDTH-1 downto 0);
        variable temp_mem : mem_type;
    begin
        for i in 0 to IMAGE_SIZE - 1 loop
            readline(im_mif_file, mif_line);
            read(mif_line, temp_bv);
            temp_mem(i) := to_stdlogicvector(temp_bv);
        end loop;
        for i in 1024 to 51913 loop
            readline(wt_mif_file, mif_line);
            read(mif_line, temp_bv);
            temp_mem(i) := to_stdlogicvector(temp_bv);
        end loop;
    return temp_mem;
end function;

    signal rom_block: mem_type := init_mem(IMAGE_FILE_NAME, WEIGHT_FILE_NAME);
begin

    process (clk) is
    begin

        if(re = '1') then
            dout <= rom_block(to_integer(unsigned(addr)));
        end if;

    end process;
    
end Behavioral;