########
# set Design vhdl files
set D_FILES "../src/zedboard.vhd"
set D_ENTITY "zed"
########


# allow lib vs lef comparison
set_attribute lib_lef_consistency_check_enable true

# set dir location for library location
set_attribute lib_search_path ../lib/

# set library file name in lib_search_path directory
set_attribute library {scadv10_cln65gp_rvt_tt_1p0v_25c.lib tphn65gpgv2od3_sltc.lib}

# set lef file names from lib_search_path directory
set_attribute lef_library {tsmc_cln65_a10_6X1Z1U_tech.lef tsmc65_rvt_sc_adv10_macro.lef tphn65gpgv2od3_sl_9lm.lef tpbn65v_9lm.lef}



# read in design files
read_hdl -vhdl $D_FILES

# Do preliminary timing analysis to make sure constraints are realistic
# before synthesis
set_attribute map_timing true

# elaborate designs
elaborate

ungroup -flatten -all

# set clock period in picoseconds [ps]
# 120.0 MHz => 8.333 ns (8333 ps)
# 140.0 MHz => 7.143 ns (7143 ps)     -- 20 MHz buffer
set clock_D [define_clock -design $D_ENTITY -period 7143 X_CLK ] 

# set internal/external delays in picoseconds
external_delay -input 500 -clock $clock_D -edge_rise {X_A[*]}
external_delay -input 500 -clock $clock_D -edge_rise {X_B[*]}
external_delay -input 500 -clock $clock_D -edge_rise {X_R}

external_delay -output 500 -clock $clock_D -edge_rise {X_P[*]} 

# set output pin capacitance loads for buffering [fF]
set_attribute max_fanout 20 $D_ENTITY 

# set output pin capacitance loads for buffering [fF]
#set_attribute external_pin_cap 10000 CLKTXOUT

# set output pin resistance (KOhms)
#set_attribute external_resistance 1.0 signal

# set output wire capacitance loads (fF)
#set_attribute external_wire_cap 10 signal

# set output wire resistance (KOhms)
#set_attribute external_wire_res 10 signal

# Fixes the minimum design rule costs based on calculations in the
# library, (min capacitance, transmition, fanout, etc..)
#set_attribute fix_min_drcs true

####Synthesis Optimizations######

# Automatic Retiming after synthesis
#set_attribute retime true $D_ENTITY

# Achieves area gain by adder optimization
#set_attribute dp_area_mode true

# Performs architecture downsizing after mapping without
# degrading timing
#set_attribute dp_postmap_downsize true

# Performs architecture upsizing after mapping to improve timing
#set_attribute dp_postmap_upsize true

# Single-bit cells are mapped to an appropriate multi-bit cell
# from the technology library (eg. 4 single FF mapped into 1 quad FF)
#set_attribute use_multibit_cells true

####END Synthesis Optimizations######

# synthesize the circuit
#synthesize -to_mapped -effort medium -csa_effort medium
#synthesize $D_ENTITY -to_mapped -effort high -csa_effort high
#set_attr syn_generic_effort low
set_attr syn_generic_effort high
syn_generic $D_ENTITY 
write_snapshot -outdir . -tag syn_gen 
#set_attr syn_map_effort low
set_attr syn_map_effort high
syn_map $D_ENTITY 
write_snapshot -outdir . -tag syn_map 
#set_attr syn_opt_effort low
set_attr syn_opt_effort high
syn_opt $D_ENTITY
write_snapshot -outdir . -tag syn_opt

# Automatic Retiming after synthesis
#set_attribute dont_retime true [all::all_seqs -clock test_clock ]
#set_attribute dont_retime true [all::all_seqs -clock clock_div ]
#set_attribute dont_retime false [all::all_seqs -clock clock]
#retime -prepare  //Optional
#retime -min_delay  // retimes clock
#set_attribute dont_retime false [all::all_seqs -clock clock_div]
#set_attribute dont_retime true [all::all_seqs -clock test_clock ]
#set_attribute dont_retime true [all::all_seqs -clock clock]
#retime -prepare  //Optional
#retime -min_delay  // retimes clock_div
#set_attribute dont_retime true [all::all_seqs -clock clock_div]
#set_attribute dont_retime false [all::all_seqs -clock test_clock ]
#set_attribute dont_retime true [all::all_seqs -clock clock]
#retime -prepare  //Optional
#retime -min_delay  // retimes test_clock

# Physically aware flow with quality of silicon (QoS) prediction
#predict_qos

cd designs
cd $D_ENTITY

# Write report files
report clocks > $D_ENTITY.clocks
report gates > $D_ENTITY.gates
report area > $D_ENTITY.area
report power > $D_ENTITY.power
#report power -clock_tree $clock > $D_ENTITY.power_clk
##report power -clock_tree $clock_div > $D_ENTITY.power_clk_div
report timing -worst 7 > $D_ENTITY.timing
report timing -verbose -lint > $D_ENTITY.lint_verbose_timing

# Write output files
write $D_ENTITY -mapped > $D_ENTITY.v
write_set_load $D_ENTITY > $D_ENTITY.loads
write_sdc $D_ENTITY > $D_ENTITY.sdc
write_script $D_ENTITY > $D_ENTITY.tcl

# Write encounter configuration files
write_encounter design $D_ENTITY -basename ./innovus/$D_ENTITY/$D_ENTITY

quit

