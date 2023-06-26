all:
	ghdl -a control_part.vhd
	ghdl -a control_tb.vhd
	ghdl -e control_tb
	ghdl -r control_tb --vcd=control_tbn
	gtkwave control_tbn.vcd