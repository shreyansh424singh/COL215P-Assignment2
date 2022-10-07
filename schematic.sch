# File saved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new Main work:Main:NOFILE -nosplit
load symbol Comparator work:Comparator:NOFILE HIERBOX pin clock input.left pin cntrl input.left pin dout output.right pinBus din input.left [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Display work:Display:NOFILE HIERBOX pin clk input.left pinBus anode output.right [3:0] pinBus answer input.left [3:0] pinBus cathode output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol control_path work:control_path:NOFILE HIERBOX pin MAC_cntrl output.right pin MAC_inp1_ctrl output.right pin MAC_inp2_ctrl output.right pin RAM_re output.right pin RAM_we output.right pin ROM_re output.right pin clk input.left pin comparator_ctrl output.right pin initializing_RAM output.right pin max_ctrl output.right pin reg_in_act_re output.right pin reg_in_act_we output.right pin reg_in_wt_re output.right pin reg_in_wt_we output.right pin reg_out_re output.right pin reg_out_we output.right pin shifter_en output.right pinBus RAM_access_addr output.right [11:0] pinBus ROM_access_addr output.right [15:0] pinBus max_location output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol MAC work:MAC:NOFILE HIERBOX pin clock input.left pin cntrl input.left pinBus dout output.right [15:0] pinBus pix input.left [15:0] pinBus weight input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Max_value work:Max_value:NOFILE HIERBOX pin clock input.left pin cntrl input.left pinBus dout output.right [3:0] pinBus location input.left [3:0] pinBus value input.left [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RAM work:RAM:NOFILE HIERBOX pin clk input.left pin re input.left pin we input.left pinBus addr input.left [11:0] pinBus din input.left [15:0] pinBus dout output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ROM_MEM work:ROM_MEM:NOFILE HIERBOX pin clk input.left pin re input.left pinBus addr input.left [15:0] pinBus dout output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Registers work:abstract:NOFILE HIERBOX pin clk input.left pin re input.left pin we input.left pinBus din input.left [15:0] pinBus dout output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Registers work:Registers:NOFILE HIERBOX pin clk input.left pin re input.left pin we input.left pinBus din input.left [15:0] pinBus dout output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Shifter work:Shifter:NOFILE HIERBOX pin clk input.left pin en input.left pinBus data_in input.left [15:0] pinBus data_out output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX work MUX pin S input.bot pinBus I0 input.left [15:0] pinBus I1 input.left [15:0] pinBus O output.right [15:0] fillcolor 1
load symbol RTL_MUX61 work MUX pin S input.bot pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] pinBus O output.right [7:0] fillcolor 1
load port clk input -pg 1 -y 440
load portBus cathode output [7:0] -attr @name cathode[7:0] -pg 1 -y 530
load portBus anode output [3:0] -attr @name anode[3:0] -pg 1 -y 510
load inst Reg_out_module Registers work:abstract:NOFILE -autohide -attr @cell(#000000) Registers -pinBusAttr din @name din[15:0] -pinBusAttr dout @name dout[15:0] -pg 1 -lvl 9 -y 430
load inst RAM_module RAM work:RAM:NOFILE -autohide -attr @cell(#000000) RAM -pinBusAttr addr @name addr[11:0] -pinBusAttr din @name din[15:0] -pinBusAttr dout @name dout[15:0] -pg 1 -lvl 11 -y 210
load inst Display_module Display work:Display:NOFILE -autohide -attr @cell(#000000) Display -pinBusAttr anode @name anode[3:0] -pinBusAttr answer @name answer[3:0] -pinBusAttr cathode @name cathode[7:0] -pg 1 -lvl 14 -y 500
load inst MAC_module MAC work:MAC:NOFILE -autohide -attr @cell(#000000) MAC -pinBusAttr dout @name dout[15:0] -pinBusAttr pix @name pix[15:0] -pinBusAttr weight @name weight[7:0] -pg 1 -lvl 5 -y 230
load inst Reg_in_wt_module Registers work:Registers:NOFILE -autohide -attr @cell(#000000) Registers -pinBusAttr din @name din[15:0] -pinBusAttr dout @name dout[15:0] -pg 1 -lvl 3 -y 530
load inst ROM_module ROM_MEM work:ROM_MEM:NOFILE -autohide -attr @cell(#000000) ROM_MEM -pinBusAttr addr @name addr[15:0] -pinBusAttr dout @name dout[7:0] -pg 1 -lvl 2 -y 370
load inst max_value_ctrl_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[15:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[15:0] -pg 1 -lvl 12 -y 490
load inst Max_module Max_value work:Max_value:NOFILE -autohide -attr @cell(#000000) Max_value -pinBusAttr dout @name dout[3:0] -pinBusAttr location @name location[3:0] -pinBusAttr value @name value[15:0] -pg 1 -lvl 13 -y 420
load inst Shifter_module Shifter work:Shifter:NOFILE -autohide -attr @cell(#000000) Shifter -pinBusAttr data_in @name data_in[15:0] -pinBusAttr data_out @name data_out[15:0] -pg 1 -lvl 6 -y 430
load inst ram_din_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[15:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[15:0] -pg 1 -lvl 10 -y 420
load inst reg_out_din_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[15:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[15:0] -pg 1 -lvl 8 -y 460
load inst mac_weight_i RTL_MUX61 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pg 1 -lvl 4 -y 380
load inst FSM_module control_path work:control_path:NOFILE -autohide -attr @cell(#000000) control_path -pinBusAttr RAM_access_addr @name RAM_access_addr[11:0] -pinBusAttr ROM_access_addr @name ROM_access_addr[15:0] -pinBusAttr max_location @name max_location[3:0] -pg 1 -lvl 1 -y 250
load inst mac_pix_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[15:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr V=B\"0000000000000001\",\ S=default -pinBusAttr O @name O[15:0] -pg 1 -lvl 4 -y 60
load inst Comparator_module Comparator work:Comparator:NOFILE -autohide -attr @cell(#000000) Comparator -pinBusAttr din @name din[15:0] -pg 1 -lvl 7 -y 250
load inst Reg_in_act_module Registers work:abstract:NOFILE -autohide -attr @cell(#000000) Registers -pinBusAttr din @name din[15:0] -pinBusAttr dout @name dout[15:0] -pg 1 -lvl 3 -y 370
load net mac_dout[5] -attr @rip dout[5] -pin MAC_module dout[5] -pin Shifter_module data_in[5]
load net rom_addr[4] -attr @rip ROM_access_addr[4] -pin FSM_module ROM_access_addr[4] -pin ROM_module addr[4]
load net fsm_max_location[2] -attr @rip max_location[2] -pin FSM_module max_location[2] -pin Max_module location[2]
load net reg_out_din[2] -attr @rip O[2] -pin Reg_out_module din[2] -pin reg_out_din_i O[2]
load net ram_din[15] -attr @rip O[15] -pin RAM_module din[15] -pin ram_din_i O[15]
load net reg_out_din[7] -attr @rip O[7] -pin Reg_out_module din[7] -pin reg_out_din_i O[7]
load net reg_out_dout[5] -attr @rip dout[5] -pin Reg_out_module dout[5] -pin ram_din_i I1[5]
load net max_dout[1] -attr @rip dout[1] -pin Display_module answer[1] -pin Max_module dout[1]
load net max_value_ctrl[10] -attr @rip O[10] -pin Max_module value[10] -pin max_value_ctrl_i O[10]
load net reg_out_din[10] -attr @rip O[10] -pin Reg_out_module din[10] -pin reg_out_din_i O[10]
load net fsm_max_ctrl -pin FSM_module max_ctrl -pin Max_module cntrl -pin max_value_ctrl_i S
netloc fsm_max_ctrl 1 1 12 370J 480 NJ 480 NJ 480 NJ 480 1820J 540 NJ 540 2370J 550 2640J 540 NJ 540 NJ 540 3440 N 3690
load net rom_addr[5] -attr @rip ROM_access_addr[5] -pin FSM_module ROM_access_addr[5] -pin ROM_module addr[5]
load net ram_din[3] -attr @rip O[3] -pin RAM_module din[3] -pin ram_din_i O[3]
load net ram_din[11] -attr @rip O[11] -pin RAM_module din[11] -pin ram_din_i O[11]
load net max_value_ctrl[9] -attr @rip O[9] -pin Max_module value[9] -pin max_value_ctrl_i O[9]
load net rom_addr[11] -attr @rip ROM_access_addr[11] -pin FSM_module ROM_access_addr[11] -pin ROM_module addr[11]
load net reg_in_wt_dout[6] -attr @rip dout[6] -pin Reg_in_wt_module dout[6] -pin mac_weight_i I1[6]
load net ram_dout[14] -attr @rip dout[14] -pin RAM_module dout[14] -pin Reg_in_act_module din[14] -pin max_value_ctrl_i I0[14]
load net rom_addr[1] -attr @rip ROM_access_addr[1] -pin FSM_module ROM_access_addr[1] -pin ROM_module addr[1]
load net shifter_data_out[9] -attr @rip data_out[9] -pin Comparator_module din[9] -pin Shifter_module data_out[9] -pin reg_out_din_i I0[9]
load net rom_dout[5] -attr @rip dout[5] -pin ROM_module dout[5] -pin Reg_in_wt_module din[5] -pin ram_din_i I0[5]
load net ram_din[14] -attr @rip O[14] -pin RAM_module din[14] -pin ram_din_i O[14]
load net fsm_max_location[3] -attr @rip max_location[3] -pin FSM_module max_location[3] -pin Max_module location[3]
load net mac_dout[8] -attr @rip dout[8] -pin MAC_module dout[8] -pin Shifter_module data_in[8]
load net reg_in_act_dout[11] -attr @rip dout[11] -pin Reg_in_act_module dout[11] -pin mac_pix_i I0[11]
load net reg_out_din[5] -attr @rip O[5] -pin Reg_out_module din[5] -pin reg_out_din_i O[5]
load net max_dout[0] -attr @rip dout[0] -pin Display_module answer[0] -pin Max_module dout[0]
load net mac_pix[10] -attr @rip O[10] -pin MAC_module pix[10] -pin mac_pix_i O[10]
load net reg_out_dout[10] -attr @rip dout[10] -pin Reg_out_module dout[10] -pin ram_din_i I1[10]
load net reg_out_dout[6] -attr @rip dout[6] -pin Reg_out_module dout[6] -pin ram_din_i I1[6]
load net rom_addr[6] -attr @rip ROM_access_addr[6] -pin FSM_module ROM_access_addr[6] -pin ROM_module addr[6]
load net ram_we -pin FSM_module RAM_we -pin RAM_module we
netloc ram_we 1 1 10 390J 300 NJ 300 NJ 300 1500J 360 NJ 360 NJ 360 NJ 360 NJ 360 NJ 360 3200
load net cathode[3] -attr @rip cathode[3] -pin Display_module cathode[3] -port cathode[3]
load net <const0> -ground -pin Reg_in_wt_module din[15] -pin Reg_in_wt_module din[14] -pin Reg_in_wt_module din[13] -pin Reg_in_wt_module din[12] -pin Reg_in_wt_module din[11] -pin Reg_in_wt_module din[10] -pin Reg_in_wt_module din[9] -pin Reg_in_wt_module din[8] -pin mac_pix_i I1[15] -pin mac_pix_i I1[14] -pin mac_pix_i I1[13] -pin mac_pix_i I1[12] -pin mac_pix_i I1[11] -pin mac_pix_i I1[10] -pin mac_pix_i I1[9] -pin mac_pix_i I1[8] -pin mac_pix_i I1[7] -pin mac_pix_i I1[6] -pin mac_pix_i I1[5] -pin mac_pix_i I1[4] -pin mac_pix_i I1[3] -pin mac_pix_i I1[2] -pin mac_pix_i I1[1] -pin mac_weight_i I0[7] -pin mac_weight_i I0[6] -pin mac_weight_i I0[5] -pin mac_weight_i I0[4] -pin mac_weight_i I0[3] -pin mac_weight_i I0[2] -pin mac_weight_i I0[1] -pin mac_weight_i I0[0] -pin max_value_ctrl_i I1[15] -pin max_value_ctrl_i I1[14] -pin max_value_ctrl_i I1[13] -pin max_value_ctrl_i I1[12] -pin max_value_ctrl_i I1[11] -pin max_value_ctrl_i I1[10] -pin max_value_ctrl_i I1[9] -pin max_value_ctrl_i I1[8] -pin max_value_ctrl_i I1[7] -pin max_value_ctrl_i I1[6] -pin max_value_ctrl_i I1[5] -pin max_value_ctrl_i I1[4] -pin max_value_ctrl_i I1[3] -pin max_value_ctrl_i I1[2] -pin max_value_ctrl_i I1[1] -pin max_value_ctrl_i I1[0] -pin ram_din_i I0[15] -pin ram_din_i I0[14] -pin ram_din_i I0[13] -pin ram_din_i I0[12] -pin ram_din_i I0[11] -pin ram_din_i I0[10] -pin ram_din_i I0[9] -pin ram_din_i I0[8] -pin reg_out_din_i I1[15] -pin reg_out_din_i I1[14] -pin reg_out_din_i I1[13] -pin reg_out_din_i I1[12] -pin reg_out_din_i I1[11] -pin reg_out_din_i I1[10] -pin reg_out_din_i I1[9] -pin reg_out_din_i I1[8] -pin reg_out_din_i I1[7] -pin reg_out_din_i I1[6] -pin reg_out_din_i I1[5] -pin reg_out_din_i I1[4] -pin reg_out_din_i I1[3] -pin reg_out_din_i I1[2] -pin reg_out_din_i I1[1] -pin reg_out_din_i I1[0]
load net MAC_inp1_ctrl -pin FSM_module MAC_inp1_ctrl -pin mac_weight_i S
netloc MAC_inp1_ctrl 1 1 3 NJ 280 NJ 280 1010
load net ram_din[10] -attr @rip O[10] -pin RAM_module din[10] -pin ram_din_i O[10]
load net rom_addr[10] -attr @rip ROM_access_addr[10] -pin FSM_module ROM_access_addr[10] -pin ROM_module addr[10]
load net reg_in_wt_dout[5] -attr @rip dout[5] -pin Reg_in_wt_module dout[5] -pin mac_weight_i I1[5]
load net comp_dout -pin Comparator_module dout -pin reg_out_din_i S
netloc comp_dout 1 7 1 2370
load net ram_addr[10] -attr @rip RAM_access_addr[10] -pin FSM_module RAM_access_addr[10] -pin RAM_module addr[10]
load net ram_din[4] -attr @rip O[4] -pin RAM_module din[4] -pin ram_din_i O[4]
load net ram_dout[13] -attr @rip dout[13] -pin RAM_module dout[13] -pin Reg_in_act_module din[13] -pin max_value_ctrl_i I0[13]
load net shifter_data_out[6] -attr @rip data_out[6] -pin Comparator_module din[6] -pin Shifter_module data_out[6] -pin reg_out_din_i I0[6]
load net rom_addr[2] -attr @rip ROM_access_addr[2] -pin FSM_module ROM_access_addr[2] -pin ROM_module addr[2]
load net ram_din[13] -attr @rip O[13] -pin RAM_module din[13] -pin ram_din_i O[13]
load net rom_dout[6] -attr @rip dout[6] -pin ROM_module dout[6] -pin Reg_in_wt_module din[6] -pin ram_din_i I0[6]
load net mac_dout[7] -attr @rip dout[7] -pin MAC_module dout[7] -pin Shifter_module data_in[7]
load net clk -pin Comparator_module clock -pin Display_module clk -pin FSM_module clk -pin MAC_module clock -pin Max_module clock -pin RAM_module clk -pin ROM_module clk -pin Reg_in_act_module clk -pin Reg_in_wt_module clk -pin Reg_out_module clk -pin Shifter_module clk -port clk
netloc clk 1 0 14 20 660 390 580 660 200 1030J 210 1560 400 1840 320 2140 400 NJ 400 2620 240 NJ 240 3180 160 NJ 160 3710 530 NJ
load net reg_in_act_dout[10] -attr @rip dout[10] -pin Reg_in_act_module dout[10] -pin mac_pix_i I0[10]
load net reg_out_din[4] -attr @rip O[4] -pin Reg_out_module din[4] -pin reg_out_din_i O[4]
load net max_value_ctrl[0] -attr @rip O[0] -pin Max_module value[0] -pin max_value_ctrl_i O[0]
load net ram_din[1] -attr @rip O[1] -pin RAM_module din[1] -pin ram_din_i O[1]
load net reg_out_dout[11] -attr @rip dout[11] -pin Reg_out_module dout[11] -pin ram_din_i I1[11]
load net reg_out_din[12] -attr @rip O[12] -pin Reg_out_module din[12] -pin reg_out_din_i O[12]
load net <const1> -power -attr @rip 0 -pin mac_pix_i I1[0]
load net reg_in_wt_dout[4] -attr @rip dout[4] -pin Reg_in_wt_module dout[4] -pin mac_weight_i I1[4]
load net cathode[4] -attr @rip cathode[4] -pin Display_module cathode[4] -port cathode[4]
load net mac_weight[4] -attr @rip O[4] -pin MAC_module weight[4] -pin mac_weight_i O[4]
load net ram_addr[11] -attr @rip RAM_access_addr[11] -pin FSM_module RAM_access_addr[11] -pin RAM_module addr[11]
load net rom_addr[13] -attr @rip ROM_access_addr[13] -pin FSM_module ROM_access_addr[13] -pin ROM_module addr[13]
load net ram_dout[1] -attr @rip dout[1] -pin RAM_module dout[1] -pin Reg_in_act_module din[1] -pin max_value_ctrl_i I0[1]
load net mac_dout[2] -attr @rip dout[2] -pin MAC_module dout[2] -pin Shifter_module data_in[2]
load net reg_in_act_dout[3] -attr @rip dout[3] -pin Reg_in_act_module dout[3] -pin mac_pix_i I0[3]
load net shifter_data_out[7] -attr @rip data_out[7] -pin Comparator_module din[7] -pin Shifter_module data_out[7] -pin reg_out_din_i I0[7]
load net mac_dout[9] -attr @rip dout[9] -pin MAC_module dout[9] -pin Shifter_module data_in[9]
load net fsm_max_location[1] -attr @rip max_location[1] -pin FSM_module max_location[1] -pin Max_module location[1]
load net ram_din[12] -attr @rip O[12] -pin RAM_module din[12] -pin ram_din_i O[12]
load net rom_dout[7] -attr @rip dout[7] -pin ROM_module dout[7] -pin Reg_in_wt_module din[7] -pin ram_din_i I0[7]
load net cathode[1] -attr @rip cathode[1] -pin Display_module cathode[1] -port cathode[1]
load net reg_out_dout[15] -attr @rip dout[15] -pin Reg_out_module dout[15] -pin ram_din_i I1[15]
load net reg_in_act_re -pin FSM_module reg_in_act_re -pin Reg_in_act_module re
netloc reg_in_act_re 1 1 2 NJ 500 680
load net reg_in_act_we -pin FSM_module reg_in_act_we -pin Reg_in_act_module we
netloc reg_in_act_we 1 1 2 NJ 520 700
load net reg_in_act_dout[13] -attr @rip dout[13] -pin Reg_in_act_module dout[13] -pin mac_pix_i I0[13]
load net max_value_ctrl[1] -attr @rip O[1] -pin Max_module value[1] -pin max_value_ctrl_i O[1]
load net reg_out_din[11] -attr @rip O[11] -pin Reg_out_module din[11] -pin reg_out_din_i O[11]
load net ram_din[2] -attr @rip O[2] -pin RAM_module din[2] -pin ram_din_i O[2]
load net reg_out_dout[12] -attr @rip dout[12] -pin Reg_out_module dout[12] -pin ram_din_i I1[12]
load net mac_weight[3] -attr @rip O[3] -pin MAC_module weight[3] -pin mac_weight_i O[3]
load net shifter_data_out[11] -attr @rip data_out[11] -pin Comparator_module din[11] -pin Shifter_module data_out[11] -pin reg_out_din_i I0[11]
load net shifter_data_out[4] -attr @rip data_out[4] -pin Comparator_module din[4] -pin Shifter_module data_out[4] -pin reg_out_din_i I0[4]
load net ram_dout[0] -attr @rip dout[0] -pin RAM_module dout[0] -pin Reg_in_act_module din[0] -pin max_value_ctrl_i I0[0]
load net rom_dout[0] -attr @rip dout[0] -pin ROM_module dout[0] -pin Reg_in_wt_module din[0] -pin ram_din_i I0[0]
load net rom_addr[12] -attr @rip ROM_access_addr[12] -pin FSM_module ROM_access_addr[12] -pin ROM_module addr[12]
load net mac_pix[2] -attr @rip O[2] -pin MAC_module pix[2] -pin mac_pix_i O[2]
load net reg_in_act_dout[7] -attr @rip dout[7] -pin Reg_in_act_module dout[7] -pin mac_pix_i I0[7]
load net mac_pix[9] -attr @rip O[9] -pin MAC_module pix[9] -pin mac_pix_i O[9]
load net mac_dout[1] -attr @rip dout[1] -pin MAC_module dout[1] -pin Shifter_module data_in[1]
load net reg_in_act_dout[4] -attr @rip dout[4] -pin Reg_in_act_module dout[4] -pin mac_pix_i I0[4]
load net fsm_max_location[0] -attr @rip max_location[0] -pin FSM_module max_location[0] -pin Max_module location[0]
load net mac_dout[0] -attr @rip dout[0] -pin MAC_module dout[0] -pin Shifter_module data_in[0]
load net reg_out_dout[14] -attr @rip dout[14] -pin Reg_out_module dout[14] -pin ram_din_i I1[14]
load net reg_in_act_dout[12] -attr @rip dout[12] -pin Reg_in_act_module dout[12] -pin mac_pix_i I0[12]
load net ram_dout[7] -attr @rip dout[7] -pin RAM_module dout[7] -pin Reg_in_act_module din[7] -pin max_value_ctrl_i I0[7]
load net cathode[2] -attr @rip cathode[2] -pin Display_module cathode[2] -port cathode[2]
load net anode[0] -attr @rip anode[0] -pin Display_module anode[0] -port anode[0]
load net max_value_ctrl[2] -attr @rip O[2] -pin Max_module value[2] -pin max_value_ctrl_i O[2]
load net mac_weight[2] -attr @rip O[2] -pin MAC_module weight[2] -pin mac_weight_i O[2]
load net ram_dout[10] -attr @rip dout[10] -pin RAM_module dout[10] -pin Reg_in_act_module din[10] -pin max_value_ctrl_i I0[10]
load net reg_out_dout[13] -attr @rip dout[13] -pin Reg_out_module dout[13] -pin ram_din_i I1[13]
load net rom_addr[9] -attr @rip ROM_access_addr[9] -pin FSM_module ROM_access_addr[9] -pin ROM_module addr[9]
load net reg_out_din[14] -attr @rip O[14] -pin Reg_out_module din[14] -pin reg_out_din_i O[14]
load net mac_pix[8] -attr @rip O[8] -pin MAC_module pix[8] -pin mac_pix_i O[8]
load net shifter_data_out[12] -attr @rip data_out[12] -pin Comparator_module din[12] -pin Shifter_module data_out[12] -pin reg_out_din_i I0[12]
load net shifter_data_out[5] -attr @rip data_out[5] -pin Comparator_module din[5] -pin Shifter_module data_out[5] -pin reg_out_din_i I0[5]
load net shifter_en -pin FSM_module shifter_en -pin Shifter_module en
netloc shifter_en 1 1 5 290J 710 660J 720 1090J 710 NJ 710 1840
load net mac_pix[3] -attr @rip O[3] -pin MAC_module pix[3] -pin mac_pix_i O[3]
load net rom_dout[1] -attr @rip dout[1] -pin ROM_module dout[1] -pin Reg_in_wt_module din[1] -pin ram_din_i I0[1]
load net reg_in_act_dout[8] -attr @rip dout[8] -pin Reg_in_act_module dout[8] -pin mac_pix_i I0[8]
load net rom_addr[15] -attr @rip ROM_access_addr[15] -pin FSM_module ROM_access_addr[15] -pin ROM_module addr[15]
load net max_value_ctrl[13] -attr @rip O[13] -pin Max_module value[13] -pin max_value_ctrl_i O[13]
load net mac_dout[4] -attr @rip dout[4] -pin MAC_module dout[4] -pin Shifter_module data_in[4]
load net ram_addr[9] -attr @rip RAM_access_addr[9] -pin FSM_module RAM_access_addr[9] -pin RAM_module addr[9]
load net reg_in_act_dout[5] -attr @rip dout[5] -pin Reg_in_act_module dout[5] -pin mac_pix_i I0[5]
load net reg_out_din[1] -attr @rip O[1] -pin Reg_out_module din[1] -pin reg_out_din_i O[1]
load net reg_out_dout[2] -attr @rip dout[2] -pin Reg_out_module dout[2] -pin ram_din_i I1[2]
load net ram_din[0] -attr @rip O[0] -pin RAM_module din[0] -pin ram_din_i O[0]
load net ram_dout[6] -attr @rip dout[6] -pin RAM_module dout[6] -pin Reg_in_act_module din[6] -pin max_value_ctrl_i I0[6]
load net mac_weight[1] -attr @rip O[1] -pin MAC_module weight[1] -pin mac_weight_i O[1]
load net anode[1] -attr @rip anode[1] -pin Display_module anode[1] -port anode[1]
load net shifter_data_out[2] -attr @rip data_out[2] -pin Comparator_module din[2] -pin Shifter_module data_out[2] -pin reg_out_din_i I0[2]
load net mac_pix[0] -attr @rip O[0] -pin MAC_module pix[0] -pin mac_pix_i O[0]
load net mac_dout[10] -attr @rip dout[10] -pin MAC_module dout[10] -pin Shifter_module data_in[10]
load net reg_in_act_dout[15] -attr @rip dout[15] -pin Reg_in_act_module dout[15] -pin mac_pix_i I0[15]
load net max_value_ctrl[3] -attr @rip O[3] -pin Max_module value[3] -pin max_value_ctrl_i O[3]
load net reg_out_din[13] -attr @rip O[13] -pin Reg_out_module din[13] -pin reg_out_din_i O[13]
load net mac_pix[7] -attr @rip O[7] -pin MAC_module pix[7] -pin mac_pix_i O[7]
load net cathode[7] -attr @rip cathode[7] -pin Display_module cathode[7] -port cathode[7]
load net rom_dout[2] -attr @rip dout[2] -pin ROM_module dout[2] -pin Reg_in_wt_module din[2] -pin ram_din_i I0[2]
load net rom_addr[14] -attr @rip ROM_access_addr[14] -pin FSM_module ROM_access_addr[14] -pin ROM_module addr[14]
load net max_value_ctrl[12] -attr @rip O[12] -pin Max_module value[12] -pin max_value_ctrl_i O[12]
load net reg_out_din[15] -attr @rip O[15] -pin Reg_out_module din[15] -pin reg_out_din_i O[15]
load net reg_in_act_dout[9] -attr @rip dout[9] -pin Reg_in_act_module dout[9] -pin mac_pix_i I0[9]
load net mac_dout[3] -attr @rip dout[3] -pin MAC_module dout[3] -pin Shifter_module data_in[3]
load net ram_addr[8] -attr @rip RAM_access_addr[8] -pin FSM_module RAM_access_addr[8] -pin RAM_module addr[8]
load net mac_pix[15] -attr @rip O[15] -pin MAC_module pix[15] -pin mac_pix_i O[15]
load net reg_out_din[0] -attr @rip O[0] -pin Reg_out_module din[0] -pin reg_out_din_i O[0]
load net reg_in_act_dout[6] -attr @rip dout[6] -pin Reg_in_act_module dout[6] -pin mac_pix_i I0[6]
load net reg_out_dout[1] -attr @rip dout[1] -pin Reg_out_module dout[1] -pin ram_din_i I1[1]
load net ram_din[9] -attr @rip O[9] -pin RAM_module din[9] -pin ram_din_i O[9]
load net reg_in_act_dout[14] -attr @rip dout[14] -pin Reg_in_act_module dout[14] -pin mac_pix_i I0[14]
load net mac_pix[6] -attr @rip O[6] -pin MAC_module pix[6] -pin mac_pix_i O[6]
load net ram_dout[9] -attr @rip dout[9] -pin RAM_module dout[9] -pin Reg_in_act_module din[9] -pin max_value_ctrl_i I0[9]
load net shifter_data_out[10] -attr @rip data_out[10] -pin Comparator_module din[10] -pin Shifter_module data_out[10] -pin reg_out_din_i I0[10]
load net shifter_data_out[3] -attr @rip data_out[3] -pin Comparator_module din[3] -pin Shifter_module data_out[3] -pin reg_out_din_i I0[3]
load net mac_pix[1] -attr @rip O[1] -pin MAC_module pix[1] -pin mac_pix_i O[1]
load net mac_dout[11] -attr @rip dout[11] -pin MAC_module dout[11] -pin Shifter_module data_in[11]
load net max_value_ctrl[4] -attr @rip O[4] -pin Max_module value[4] -pin max_value_ctrl_i O[4]
load net ram_addr[2] -attr @rip RAM_access_addr[2] -pin FSM_module RAM_access_addr[2] -pin RAM_module addr[2]
load net ram_addr[7] -attr @rip RAM_access_addr[7] -pin FSM_module RAM_access_addr[7] -pin RAM_module addr[7]
load net reg_in_wt_dout[3] -attr @rip dout[3] -pin Reg_in_wt_module dout[3] -pin mac_weight_i I1[3]
load net rom_dout[3] -attr @rip dout[3] -pin ROM_module dout[3] -pin Reg_in_wt_module din[3] -pin ram_din_i I0[3]
load net mac_pix[14] -attr @rip O[14] -pin MAC_module pix[14] -pin mac_pix_i O[14]
load net max_value_ctrl[15] -attr @rip O[15] -pin Max_module value[15] -pin max_value_ctrl_i O[15]
load net rom_addr[0] -attr @rip ROM_access_addr[0] -pin FSM_module ROM_access_addr[0] -pin ROM_module addr[0]
load net ram_dout[15] -attr @rip dout[15] -pin RAM_module dout[15] -pin Reg_in_act_module din[15] -pin max_value_ctrl_i I0[15]
load net reg_out_dout[4] -attr @rip dout[4] -pin Reg_out_module dout[4] -pin ram_din_i I1[4]
load net reg_in_wt_we -pin FSM_module reg_in_wt_we -pin Reg_in_wt_module we
netloc reg_in_wt_we 1 1 2 NJ 560 680
load net shifter_data_out[0] -attr @rip data_out[0] -pin Comparator_module din[0] -pin Shifter_module data_out[0] -pin reg_out_din_i I0[0]
load net ram_dout[8] -attr @rip dout[8] -pin RAM_module dout[8] -pin Reg_in_act_module din[8] -pin max_value_ctrl_i I0[8]
load net mac_pix[5] -attr @rip O[5] -pin MAC_module pix[5] -pin mac_pix_i O[5]
load net reg_out_re -pin FSM_module reg_out_re -pin Reg_out_module re
netloc reg_out_re 1 1 8 370J 670 700J 680 1030J 670 NJ 670 NJ 670 NJ 670 NJ 670 2620
load net reg_in_act_dout[0] -attr @rip dout[0] -pin Reg_in_act_module dout[0] -pin mac_pix_i I0[0]
load net cathode[5] -attr @rip cathode[5] -pin Display_module cathode[5] -port cathode[5]
load net mac_dout[12] -attr @rip dout[12] -pin MAC_module dout[12] -pin Shifter_module data_in[12]
load net max_value_ctrl[5] -attr @rip O[5] -pin Max_module value[5] -pin max_value_ctrl_i O[5]
load net ram_addr[1] -attr @rip RAM_access_addr[1] -pin FSM_module RAM_access_addr[1] -pin RAM_module addr[1]
load net ram_addr[6] -attr @rip RAM_access_addr[6] -pin FSM_module RAM_access_addr[6] -pin RAM_module addr[6]
load net reg_in_wt_dout[2] -attr @rip dout[2] -pin Reg_in_wt_module dout[2] -pin mac_weight_i I1[2]
load net mac_weight[7] -attr @rip O[7] -pin MAC_module weight[7] -pin mac_weight_i O[7]
load net mac_pix[13] -attr @rip O[13] -pin MAC_module pix[13] -pin mac_pix_i O[13]
load net shifter_data_out[15] -attr @rip data_out[15] -pin Comparator_module din[15] -pin Shifter_module data_out[15] -pin reg_out_din_i I0[15]
load net max_value_ctrl[14] -attr @rip O[14] -pin Max_module value[14] -pin max_value_ctrl_i O[14]
load net reg_out_dout[9] -attr @rip dout[9] -pin Reg_out_module dout[9] -pin ram_din_i I1[9]
load net ram_din[7] -attr @rip O[7] -pin RAM_module din[7] -pin ram_din_i O[7]
load net reg_out_we -pin FSM_module reg_out_we -pin Reg_out_module we
netloc reg_out_we 1 1 8 330J 690 680J 700 1070J 690 NJ 690 NJ 690 NJ 690 NJ 690 2660
load net reg_out_dout[3] -attr @rip dout[3] -pin Reg_out_module dout[3] -pin ram_din_i I1[3]
load net ram_dout[3] -attr @rip dout[3] -pin RAM_module dout[3] -pin Reg_in_act_module din[3] -pin max_value_ctrl_i I0[3]
load net mac_pix[4] -attr @rip O[4] -pin MAC_module pix[4] -pin mac_pix_i O[4]
load net shifter_data_out[1] -attr @rip data_out[1] -pin Comparator_module din[1] -pin Shifter_module data_out[1] -pin reg_out_din_i I0[1]
load net reg_out_din[8] -attr @rip O[8] -pin Reg_out_module din[8] -pin reg_out_din_i O[8]
load net mac_cntrl -pin FSM_module MAC_cntrl -pin MAC_module cntrl
netloc mac_cntrl 1 1 4 NJ 260 NJ 260 NJ 260 N
load net cathode[6] -attr @rip cathode[6] -pin Display_module cathode[6] -port cathode[6]
load net ram_addr[0] -attr @rip RAM_access_addr[0] -pin FSM_module RAM_access_addr[0] -pin RAM_module addr[0]
load net ram_addr[5] -attr @rip RAM_access_addr[5] -pin FSM_module RAM_access_addr[5] -pin RAM_module addr[5]
load net reg_in_wt_dout[1] -attr @rip dout[1] -pin Reg_in_wt_module dout[1] -pin mac_weight_i I1[1]
load net reg_in_act_dout[1] -attr @rip dout[1] -pin Reg_in_act_module dout[1] -pin mac_pix_i I0[1]
load net MAC_inp2_ctrl -pin FSM_module MAC_inp2_ctrl -pin mac_pix_i S
netloc MAC_inp2_ctrl 1 1 3 330J 240 NJ 240 990
load net mac_weight[6] -attr @rip O[6] -pin MAC_module weight[6] -pin mac_weight_i O[6]
load net mac_dout[13] -attr @rip dout[13] -pin MAC_module dout[13] -pin Shifter_module data_in[13]
load net max_value_ctrl[6] -attr @rip O[6] -pin Max_module value[6] -pin max_value_ctrl_i O[6]
load net initializing_RAM -pin FSM_module initializing_RAM -pin ram_din_i S
netloc initializing_RAM 1 1 9 410J 650 720J 660 990J 650 NJ 650 NJ 650 NJ 650 NJ 650 NJ 650 2890
load net comp_cntrl -pin Comparator_module cntrl -pin FSM_module comparator_ctrl
netloc comp_cntrl 1 1 6 350J 160 NJ 160 1070J 170 1500J 160 NJ 160 2120
load net ram_dout[2] -attr @rip dout[2] -pin RAM_module dout[2] -pin Reg_in_act_module din[2] -pin max_value_ctrl_i I0[2]
load net ram_din[8] -attr @rip O[8] -pin RAM_module din[8] -pin ram_din_i O[8]
load net reg_in_wt_re -pin FSM_module reg_in_wt_re -pin Reg_in_wt_module re
netloc reg_in_wt_re 1 1 2 NJ 540 640
load net ram_re -pin FSM_module RAM_re -pin RAM_module re
netloc ram_re 1 1 10 290J 140 NJ 140 1090J 150 1480J 140 NJ 140 NJ 140 NJ 140 NJ 140 NJ 140 3160
load net reg_out_din[9] -attr @rip O[9] -pin Reg_out_module din[9] -pin reg_out_din_i O[9]
load net cathode[0] -attr @rip cathode[0] -pin Display_module cathode[0] -port cathode[0]
load net ram_addr[4] -attr @rip RAM_access_addr[4] -pin FSM_module RAM_access_addr[4] -pin RAM_module addr[4]
load net reg_in_wt_dout[0] -attr @rip dout[0] -pin Reg_in_wt_module dout[0] -pin mac_weight_i I1[0]
load net mac_weight[0] -attr @rip O[0] -pin MAC_module weight[0] -pin mac_weight_i O[0]
load net mac_weight[5] -attr @rip O[5] -pin MAC_module weight[5] -pin mac_weight_i O[5]
load net mac_pix[11] -attr @rip O[11] -pin MAC_module pix[11] -pin mac_pix_i O[11]
load net reg_in_act_dout[2] -attr @rip dout[2] -pin Reg_in_act_module dout[2] -pin mac_pix_i I0[2]
load net shifter_data_out[13] -attr @rip data_out[13] -pin Comparator_module din[13] -pin Shifter_module data_out[13] -pin reg_out_din_i I0[13]
load net mac_dout[14] -attr @rip dout[14] -pin MAC_module dout[14] -pin Shifter_module data_in[14]
load net max_value_ctrl[7] -attr @rip O[7] -pin Max_module value[7] -pin max_value_ctrl_i O[7]
load net reg_out_dout[7] -attr @rip dout[7] -pin Reg_out_module dout[7] -pin ram_din_i I1[7]
load net max_dout[3] -attr @rip dout[3] -pin Display_module answer[3] -pin Max_module dout[3]
load net rom_addr[7] -attr @rip ROM_access_addr[7] -pin FSM_module ROM_access_addr[7] -pin ROM_module addr[7]
load net anode[2] -attr @rip anode[2] -pin Display_module anode[2] -port anode[2]
load net ram_dout[12] -attr @rip dout[12] -pin RAM_module dout[12] -pin Reg_in_act_module din[12] -pin max_value_ctrl_i I0[12]
load net ram_din[5] -attr @rip O[5] -pin RAM_module din[5] -pin ram_din_i O[5]
load net ram_dout[5] -attr @rip dout[5] -pin RAM_module dout[5] -pin Reg_in_act_module din[5] -pin max_value_ctrl_i I0[5]
load net rom_addr[3] -attr @rip ROM_access_addr[3] -pin FSM_module ROM_access_addr[3] -pin ROM_module addr[3]
load net mac_dout[6] -attr @rip dout[6] -pin MAC_module dout[6] -pin Shifter_module data_in[6]
load net reg_out_din[6] -attr @rip O[6] -pin Reg_out_module din[6] -pin reg_out_din_i O[6]
load net reg_out_din[3] -attr @rip O[3] -pin Reg_out_module din[3] -pin reg_out_din_i O[3]
load net ram_addr[3] -attr @rip RAM_access_addr[3] -pin FSM_module RAM_access_addr[3] -pin RAM_module addr[3]
load net max_dout[2] -attr @rip dout[2] -pin Display_module answer[2] -pin Max_module dout[2]
load net mac_pix[12] -attr @rip O[12] -pin MAC_module pix[12] -pin mac_pix_i O[12]
load net max_value_ctrl[11] -attr @rip O[11] -pin Max_module value[11] -pin max_value_ctrl_i O[11]
load net shifter_data_out[14] -attr @rip data_out[14] -pin Comparator_module din[14] -pin Shifter_module data_out[14] -pin reg_out_din_i I0[14]
load net mac_dout[15] -attr @rip dout[15] -pin MAC_module dout[15] -pin Shifter_module data_in[15]
load net max_value_ctrl[8] -attr @rip O[8] -pin Max_module value[8] -pin max_value_ctrl_i O[8]
load net reg_out_dout[8] -attr @rip dout[8] -pin Reg_out_module dout[8] -pin ram_din_i I1[8]
load net rom_addr[8] -attr @rip ROM_access_addr[8] -pin FSM_module ROM_access_addr[8] -pin ROM_module addr[8]
load net ram_dout[11] -attr @rip dout[11] -pin RAM_module dout[11] -pin Reg_in_act_module din[11] -pin max_value_ctrl_i I0[11]
load net anode[3] -attr @rip anode[3] -pin Display_module anode[3] -port anode[3]
load net reg_out_dout[0] -attr @rip dout[0] -pin Reg_out_module dout[0] -pin ram_din_i I1[0]
load net ram_din[6] -attr @rip O[6] -pin RAM_module din[6] -pin ram_din_i O[6]
load net reg_in_wt_dout[7] -attr @rip dout[7] -pin Reg_in_wt_module dout[7] -pin mac_weight_i I1[7]
load net rom_re -pin FSM_module ROM_re -pin ROM_module re
netloc rom_re 1 1 1 370
load net shifter_data_out[8] -attr @rip data_out[8] -pin Comparator_module din[8] -pin Shifter_module data_out[8] -pin reg_out_din_i I0[8]
load net rom_dout[4] -attr @rip dout[4] -pin ROM_module dout[4] -pin Reg_in_wt_module din[4] -pin ram_din_i I0[4]
load net ram_dout[4] -attr @rip dout[4] -pin RAM_module dout[4] -pin Reg_in_act_module din[4] -pin max_value_ctrl_i I0[4]
load netBundle @rom_addr 16 rom_addr[15] rom_addr[14] rom_addr[13] rom_addr[12] rom_addr[11] rom_addr[10] rom_addr[9] rom_addr[8] rom_addr[7] rom_addr[6] rom_addr[5] rom_addr[4] rom_addr[3] rom_addr[2] rom_addr[1] rom_addr[0] -autobundled
netbloc @rom_addr 1 1 1 N
load netBundle @fsm_max_location 4 fsm_max_location[3] fsm_max_location[2] fsm_max_location[1] fsm_max_location[0] -autobundled
netbloc @fsm_max_location 1 1 12 350J 730 640J 740 1110J 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 3730
load netBundle @shifter_data_out 16 shifter_data_out[15] shifter_data_out[14] shifter_data_out[13] shifter_data_out[12] shifter_data_out[11] shifter_data_out[10] shifter_data_out[9] shifter_data_out[8] shifter_data_out[7] shifter_data_out[6] shifter_data_out[5] shifter_data_out[4] shifter_data_out[3] shifter_data_out[2] shifter_data_out[1] shifter_data_out[0] -autobundled
netbloc @shifter_data_out 1 6 2 2160 450 NJ
load netBundle @ram_dout 16 ram_dout[15] ram_dout[14] ram_dout[13] ram_dout[12] ram_dout[11] ram_dout[10] ram_dout[9] ram_dout[8] ram_dout[7] ram_dout[6] ram_dout[5] ram_dout[4] ram_dout[3] ram_dout[2] ram_dout[1] ram_dout[0] -autobundled
netbloc @ram_dout 1 2 10 740 220 1010J 230 1480J 340 NJ 340 NJ 340 NJ 340 NJ 340 NJ 340 NJ 340 3460
load netBundle @max_value_ctrl 16 max_value_ctrl[15] max_value_ctrl[14] max_value_ctrl[13] max_value_ctrl[12] max_value_ctrl[11] max_value_ctrl[10] max_value_ctrl[9] max_value_ctrl[8] max_value_ctrl[7] max_value_ctrl[6] max_value_ctrl[5] max_value_ctrl[4] max_value_ctrl[3] max_value_ctrl[2] max_value_ctrl[1] max_value_ctrl[0] -autobundled
netbloc @max_value_ctrl 1 12 1 N
load netBundle @max_dout 4 max_dout[3] max_dout[2] max_dout[1] max_dout[0] -autobundled
netbloc @max_dout 1 13 1 3970
load netBundle @cathode 8 cathode[7] cathode[6] cathode[5] cathode[4] cathode[3] cathode[2] cathode[1] cathode[0] -autobundled
netbloc @cathode 1 14 1 NJ
load netBundle @reg_out_dout 16 reg_out_dout[15] reg_out_dout[14] reg_out_dout[13] reg_out_dout[12] reg_out_dout[11] reg_out_dout[10] reg_out_dout[9] reg_out_dout[8] reg_out_dout[7] reg_out_dout[6] reg_out_dout[5] reg_out_dout[4] reg_out_dout[3] reg_out_dout[2] reg_out_dout[1] reg_out_dout[0] -autobundled
netbloc @reg_out_dout 1 9 1 2890
load netBundle @mac_weight 8 mac_weight[7] mac_weight[6] mac_weight[5] mac_weight[4] mac_weight[3] mac_weight[2] mac_weight[1] mac_weight[0] -autobundled
netbloc @mac_weight 1 4 1 1520
load netBundle @ram_addr 12 ram_addr[11] ram_addr[10] ram_addr[9] ram_addr[8] ram_addr[7] ram_addr[6] ram_addr[5] ram_addr[4] ram_addr[3] ram_addr[2] ram_addr[1] ram_addr[0] -autobundled
netbloc @ram_addr 1 1 10 310J 180 NJ 180 1050J 190 1560J 180 NJ 180 NJ 180 NJ 180 NJ 180 NJ 180 3140
load netBundle @reg_out_din 16 reg_out_din[15] reg_out_din[14] reg_out_din[13] reg_out_din[12] reg_out_din[11] reg_out_din[10] reg_out_din[9] reg_out_din[8] reg_out_din[7] reg_out_din[6] reg_out_din[5] reg_out_din[4] reg_out_din[3] reg_out_din[2] reg_out_din[1] reg_out_din[0] -autobundled
netbloc @reg_out_din 1 8 1 N
load netBundle @reg_in_wt_dout 8 reg_in_wt_dout[7] reg_in_wt_dout[6] reg_in_wt_dout[5] reg_in_wt_dout[4] reg_in_wt_dout[3] reg_in_wt_dout[2] reg_in_wt_dout[1] reg_in_wt_dout[0] -autobundled
netbloc @reg_in_wt_dout 1 3 1 1070
load netBundle @rom_dout 8 rom_dout[7] rom_dout[6] rom_dout[5] rom_dout[4] rom_dout[3] rom_dout[2] rom_dout[1] rom_dout[0] -autobundled
netbloc @rom_dout 1 2 8 720 320 NJ 320 1540J 380 NJ 380 NJ 380 NJ 380 NJ 380 2910J
load netBundle @mac_dout 16 mac_dout[15] mac_dout[14] mac_dout[13] mac_dout[12] mac_dout[11] mac_dout[10] mac_dout[9] mac_dout[8] mac_dout[7] mac_dout[6] mac_dout[5] mac_dout[4] mac_dout[3] mac_dout[2] mac_dout[1] mac_dout[0] -autobundled
netbloc @mac_dout 1 5 1 1820
load netBundle @reg_in_act_dout 16 reg_in_act_dout[15] reg_in_act_dout[14] reg_in_act_dout[13] reg_in_act_dout[12] reg_in_act_dout[11] reg_in_act_dout[10] reg_in_act_dout[9] reg_in_act_dout[8] reg_in_act_dout[7] reg_in_act_dout[6] reg_in_act_dout[5] reg_in_act_dout[4] reg_in_act_dout[3] reg_in_act_dout[2] reg_in_act_dout[1] reg_in_act_dout[0] -autobundled
netbloc @reg_in_act_dout 1 3 1 970
load netBundle @ram_din 16 ram_din[15] ram_din[14] ram_din[13] ram_din[12] ram_din[11] ram_din[10] ram_din[9] ram_din[8] ram_din[7] ram_din[6] ram_din[5] ram_din[4] ram_din[3] ram_din[2] ram_din[1] ram_din[0] -autobundled
netbloc @ram_din 1 10 1 3180
load netBundle @anode 4 anode[3] anode[2] anode[1] anode[0] -autobundled
netbloc @anode 1 14 1 NJ
load netBundle @mac_pix 16 mac_pix[15] mac_pix[14] mac_pix[13] mac_pix[12] mac_pix[11] mac_pix[10] mac_pix[9] mac_pix[8] mac_pix[7] mac_pix[6] mac_pix[5] mac_pix[4] mac_pix[3] mac_pix[2] mac_pix[1] mac_pix[0] -autobundled
netbloc @mac_pix 1 4 1 1580
levelinfo -pg 1 0 60 500 820 1370 1670 1950 2240 2510 2740 3030 3290 3580 3830 4070 4230 -top -10 -bot 750
show
zoom 0.883883
scrollpos -48 -9
#
# initialize ictrl to current module Main work:Main:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
