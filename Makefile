GHDL = ghdl
FLAGS = "--std=08"
all:
	@$(GHDL) -a $(FLAGS) test_main.vhd control_path.vhd Shifter.vhd comparator.vhd main.vhd RAM.vhd ROM_MEM.vhd mac.vhd Registers.vhd max_value.vhd stopwatch.vhd bcd_to_ssd.vhd clockDivider.vhd

	@$(GHDL) -e $(FLAGS) testbench
	@$(GHDL) -r $(FLAGS) testbench --vcd=wave.vcd --stop-time=1ms --max-stack-alloc=512
