######################################################################

# Created by Genus(TM) Synthesis Solution 18.10-p003_1 on Sun Nov 15 16:41:38 EST 2020

# This file contains the RC script for /designs/TMULT

######################################################################

if {![get_attribute_status wlec_internal_to_write_lec_db_for_invocation -type root]} {define_attribute -obj_type root -category lec -data_type string -help_string {Capture internal write_lec variables.} wlec_internal_to_write_lec_db_for_invocation}
if {![get_attribute_status wlec_internal_to_write_lec_db_for_label -type root]} {define_attribute -obj_type root -category lec -data_type string -help_string {Capture internal write_lec variables.} wlec_internal_to_write_lec_db_for_label}
if {![get_attribute_status wlec_internal_to_write_lec_label_data -type root]} {define_attribute -obj_type root -category lec -data_type string -help_string {Capture internal write_lec variables.} wlec_internal_to_write_lec_label_data}
::legacy::set_attribute -quiet init_lib_search_path ../lib/ /
::legacy::set_attribute -quiet common_ui false /
::legacy::set_attribute -quiet design_mode_process 90.0 /
::legacy::set_attribute -quiet phys_assume_met_fill 0.0 /
::legacy::set_attribute -quiet map_placed_for_hum false /
::legacy::set_attribute -quiet phys_use_invs_extraction true /
::legacy::set_attribute -quiet phys_route_time_out 120.0 /
::legacy::set_attribute -quiet capacitance_per_unit_length_mmmc {} /
::legacy::set_attribute -quiet resistance_per_unit_length_mmmc {} /
::legacy::set_attribute -quiet runtime_by_stage {{PBS_Generic-Start 0 7 0.0 6.0} {to_generic 0 7 0 6} {first_condense 1 8 0 6} {PBS_Generic_Opt-Post 1 8 0.9528059999999998 6.952806} {{PBS_Generic-Postgen HBO Optimizations} 0 8 0.0 6.952806} {PBS_TechMap-Start 0 8 0.0 6.952806} {{PBS_TechMap-Premap HBO Optimizations} 0 8 0.0 6.952806} {second_condense 0 8 0 7} {reify 1 9 0 7} {global_incr_map 0 9 0 7} {{PBS_Techmap-Global Mapping} 1 9 -0.1273249999999999 6.825481} {{PBS_TechMap-Datapath Postmap Operations} 0 9 1.0 7.825481} {{PBS_TechMap-Postmap HBO Optimizations} 0 9 0.0 7.825481} {{PBS_TechMap-Postmap Clock Gating} 0 9 0.0 7.825481} {{PBS_TechMap-Postmap Cleanup} 0 9 0.0 7.825481} {PBS_Techmap-Post_MBCI 0 10 0.0 7.825481} {incr_opt 0 10 0 7} } /
::legacy::set_attribute -quiet tinfo_tstamp_file .rs_phillda.tstamp /
::legacy::set_attribute -quiet metric_page_cfg {} /
::legacy::set_attribute -quiet use_area_from_lef true /
::legacy::set_attribute -quiet syn_generic_effort high /
::legacy::set_attribute -quiet compensative_dpul_driver 0 /
::legacy::set_attribute -quiet phys_use_segment_parasitics true /
::legacy::set_attribute -quiet probabilistic_extraction true /
::legacy::set_attribute -quiet ple_correlation_factors {1.9000 2.0000} /
::legacy::set_attribute -quiet maximum_interval_of_vias inf /
::legacy::set_attribute -quiet layer_aware_buffer true /
::legacy::set_attribute -quiet ple_mode global /
::legacy::set_attribute -quiet wireload_selection /libraries/tphn65gpgv2od3_sltc/wireload_selections/WireAreaForQA /
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/scadv10_cln65gp_rvt_tt_1p0v_25c/operating_conditions/tt_1p0v_25c
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/scadv10_cln65gp_rvt_tt_1p0v_25c/operating_conditions/_nominal_
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/tphn65gpgv2od3_sltc/operating_conditions/NCCOM
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/tphn65gpgv2od3_sltc/operating_conditions/_nominal_
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name X_CLK -domain domain_1 -period 7143.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -remove -design /designs/TMULT {/designs/TMULT/ports_out/X_CLK /designs/TMULT/ports_in/X_CLK}
external_delay -accumulate -input {500.0 500.0 500.0 500.0} -clock /designs/TMULT/timing/clock_domains/domain_1/X_CLK -name in_del_1 {{/designs/TMULT/ports_in/X_A[0]} {/designs/TMULT/ports_in/X_A[1]} {/designs/TMULT/ports_in/X_A[2]} {/designs/TMULT/ports_in/X_A[3]} {/designs/TMULT/ports_in/X_A[0]} {/designs/TMULT/ports_in/X_A[1]} {/designs/TMULT/ports_in/X_A[2]} {/designs/TMULT/ports_in/X_A[3]}}
external_delay -accumulate -input {500.0 500.0 500.0 500.0} -clock /designs/TMULT/timing/clock_domains/domain_1/X_CLK -name in_del_2 {{/designs/TMULT/ports_in/X_B[0]} {/designs/TMULT/ports_in/X_B[1]} {/designs/TMULT/ports_in/X_B[2]} {/designs/TMULT/ports_in/X_B[3]} {/designs/TMULT/ports_in/X_B[0]} {/designs/TMULT/ports_in/X_B[1]} {/designs/TMULT/ports_in/X_B[2]} {/designs/TMULT/ports_in/X_B[3]}}
external_delay -accumulate -input {500.0 500.0 500.0 500.0} -clock /designs/TMULT/timing/clock_domains/domain_1/X_CLK -name in_del_3 {/designs/TMULT/ports_in/X_R /designs/TMULT/ports_in/X_R}
external_delay -accumulate -output {500.0 500.0 500.0 500.0} -clock /designs/TMULT/timing/clock_domains/domain_1/X_CLK -name ou_del_1 {{/designs/TMULT/ports_out/X_P[0]} {/designs/TMULT/ports_out/X_P[1]} {/designs/TMULT/ports_out/X_P[2]} {/designs/TMULT/ports_out/X_P[3]} {/designs/TMULT/ports_out/X_P[4]} {/designs/TMULT/ports_out/X_P[5]} {/designs/TMULT/ports_out/X_P[6]} {/designs/TMULT/ports_out/X_P[7]} {/designs/TMULT/ports_out/X_P[0]} {/designs/TMULT/ports_out/X_P[1]} {/designs/TMULT/ports_out/X_P[2]} {/designs/TMULT/ports_out/X_P[3]} {/designs/TMULT/ports_out/X_P[4]} {/designs/TMULT/ports_out/X_P[5]} {/designs/TMULT/ports_out/X_P[6]} {/designs/TMULT/ports_out/X_P[7]}}
# BEGIN DFT SECTION
::legacy::set_attribute -quiet dft_scan_style muxed_scan /
::legacy::set_attribute -quiet dft_scanbit_waveform_analysis false /
# END DFT SECTION
::legacy::set_attribute -quiet max_fanout 20.000 /designs/TMULT
::legacy::set_attribute -quiet qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 61302} {cell_count 134} {utilization  0.00} {runtime 0 7 0 6} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 61329} {cell_count 135} {utilization  0.00} {runtime 1 8 0 6} }{second_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 61338} {cell_count 137} {utilization  0.00} {runtime 0 8 0 7} }{reify {wns 4736} {tns 0} {vep 0} {area 60952} {cell_count 67} {utilization  0.00} {runtime 1 9 0 7} }{global_incr_map {wns 4736} {tns 0} {vep 0} {area 60952} {cell_count 67} {utilization  0.00} {runtime 0 9 0 7} }{incr_opt {wns 214748365} {tns 0} {vep 0} {area 60952} {cell_count 67} {utilization  0.00} {runtime 0 10 0 7} }} /designs/TMULT
::legacy::set_attribute -quiet seq_mbci_coverage 0.0 /designs/TMULT
::legacy::set_attribute -quiet hdl_filelist {{default -vhdl1993 {SYNTHESIS} {../src/TMULT.vhd} {} {}}} /designs/TMULT
::legacy::set_attribute -quiet hdl_user_name TMULT /designs/TMULT
::legacy::set_attribute -quiet verification_directory fv/TMULT /designs/TMULT
::legacy::set_attribute -quiet original_name {X_A[3]} {/designs/TMULT/ports_in/X_A[3]}
::legacy::set_attribute -quiet original_name {X_A[2]} {/designs/TMULT/ports_in/X_A[2]}
::legacy::set_attribute -quiet original_name {X_A[1]} {/designs/TMULT/ports_in/X_A[1]}
::legacy::set_attribute -quiet original_name {X_A[0]} {/designs/TMULT/ports_in/X_A[0]}
::legacy::set_attribute -quiet original_name {X_B[3]} {/designs/TMULT/ports_in/X_B[3]}
::legacy::set_attribute -quiet original_name {X_B[2]} {/designs/TMULT/ports_in/X_B[2]}
::legacy::set_attribute -quiet original_name {X_B[1]} {/designs/TMULT/ports_in/X_B[1]}
::legacy::set_attribute -quiet original_name {X_B[0]} {/designs/TMULT/ports_in/X_B[0]}
::legacy::set_attribute -quiet original_name X_CLK /designs/TMULT/ports_in/X_CLK
::legacy::set_attribute -quiet original_name X_R /designs/TMULT/ports_in/X_R
::legacy::set_attribute -quiet original_name {X_P[7]} {/designs/TMULT/ports_in/X_P[7]}
::legacy::set_attribute -quiet original_name {X_P[6]} {/designs/TMULT/ports_in/X_P[6]}
::legacy::set_attribute -quiet original_name {X_P[5]} {/designs/TMULT/ports_in/X_P[5]}
::legacy::set_attribute -quiet original_name {X_P[4]} {/designs/TMULT/ports_in/X_P[4]}
::legacy::set_attribute -quiet original_name {X_P[3]} {/designs/TMULT/ports_in/X_P[3]}
::legacy::set_attribute -quiet original_name {X_P[2]} {/designs/TMULT/ports_in/X_P[2]}
::legacy::set_attribute -quiet original_name {X_P[1]} {/designs/TMULT/ports_in/X_P[1]}
::legacy::set_attribute -quiet original_name {X_P[0]} {/designs/TMULT/ports_in/X_P[0]}
::legacy::set_attribute -quiet original_name {X_A[3]} {/designs/TMULT/ports_out/X_A[3]}
::legacy::set_attribute -quiet original_name {X_A[2]} {/designs/TMULT/ports_out/X_A[2]}
::legacy::set_attribute -quiet original_name {X_A[1]} {/designs/TMULT/ports_out/X_A[1]}
::legacy::set_attribute -quiet original_name {X_A[0]} {/designs/TMULT/ports_out/X_A[0]}
::legacy::set_attribute -quiet original_name {X_B[3]} {/designs/TMULT/ports_out/X_B[3]}
::legacy::set_attribute -quiet original_name {X_B[2]} {/designs/TMULT/ports_out/X_B[2]}
::legacy::set_attribute -quiet original_name {X_B[1]} {/designs/TMULT/ports_out/X_B[1]}
::legacy::set_attribute -quiet original_name {X_B[0]} {/designs/TMULT/ports_out/X_B[0]}
::legacy::set_attribute -quiet original_name X_CLK /designs/TMULT/ports_out/X_CLK
::legacy::set_attribute -quiet original_name X_R /designs/TMULT/ports_out/X_R
::legacy::set_attribute -quiet original_name {X_P[7]} {/designs/TMULT/ports_out/X_P[7]}
::legacy::set_attribute -quiet original_name {X_P[6]} {/designs/TMULT/ports_out/X_P[6]}
::legacy::set_attribute -quiet original_name {X_P[5]} {/designs/TMULT/ports_out/X_P[5]}
::legacy::set_attribute -quiet original_name {X_P[4]} {/designs/TMULT/ports_out/X_P[4]}
::legacy::set_attribute -quiet original_name {X_P[3]} {/designs/TMULT/ports_out/X_P[3]}
::legacy::set_attribute -quiet original_name {X_P[2]} {/designs/TMULT/ports_out/X_P[2]}
::legacy::set_attribute -quiet original_name {X_P[1]} {/designs/TMULT/ports_out/X_P[1]}
::legacy::set_attribute -quiet original_name {X_P[0]} {/designs/TMULT/ports_out/X_P[0]}
::legacy::set_attribute -quiet original_name IO_A0 /designs/TMULT/instances_comb/IO_A0
::legacy::set_attribute -quiet single_bit_orig_name IO_A0 /designs/TMULT/instances_comb/IO_A0
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_A0
::legacy::set_attribute -quiet original_name IO_A0/PAD /designs/TMULT/instances_comb/IO_A0/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_A0/C /designs/TMULT/instances_comb/IO_A0/pins_out/C
::legacy::set_attribute -quiet original_name IO_A1 /designs/TMULT/instances_comb/IO_A1
::legacy::set_attribute -quiet single_bit_orig_name IO_A1 /designs/TMULT/instances_comb/IO_A1
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_A1
::legacy::set_attribute -quiet original_name IO_A1/PAD /designs/TMULT/instances_comb/IO_A1/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_A1/C /designs/TMULT/instances_comb/IO_A1/pins_out/C
::legacy::set_attribute -quiet original_name IO_A2 /designs/TMULT/instances_comb/IO_A2
::legacy::set_attribute -quiet single_bit_orig_name IO_A2 /designs/TMULT/instances_comb/IO_A2
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_A2
::legacy::set_attribute -quiet original_name IO_A2/PAD /designs/TMULT/instances_comb/IO_A2/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_A2/C /designs/TMULT/instances_comb/IO_A2/pins_out/C
::legacy::set_attribute -quiet original_name IO_A3 /designs/TMULT/instances_comb/IO_A3
::legacy::set_attribute -quiet single_bit_orig_name IO_A3 /designs/TMULT/instances_comb/IO_A3
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_A3
::legacy::set_attribute -quiet original_name IO_A3/PAD /designs/TMULT/instances_comb/IO_A3/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_A3/C /designs/TMULT/instances_comb/IO_A3/pins_out/C
::legacy::set_attribute -quiet original_name IO_B0 /designs/TMULT/instances_comb/IO_B0
::legacy::set_attribute -quiet single_bit_orig_name IO_B0 /designs/TMULT/instances_comb/IO_B0
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_B0
::legacy::set_attribute -quiet original_name IO_B0/PAD /designs/TMULT/instances_comb/IO_B0/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_B0/C /designs/TMULT/instances_comb/IO_B0/pins_out/C
::legacy::set_attribute -quiet original_name IO_B1 /designs/TMULT/instances_comb/IO_B1
::legacy::set_attribute -quiet single_bit_orig_name IO_B1 /designs/TMULT/instances_comb/IO_B1
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_B1
::legacy::set_attribute -quiet original_name IO_B1/PAD /designs/TMULT/instances_comb/IO_B1/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_B1/C /designs/TMULT/instances_comb/IO_B1/pins_out/C
::legacy::set_attribute -quiet original_name IO_B2 /designs/TMULT/instances_comb/IO_B2
::legacy::set_attribute -quiet single_bit_orig_name IO_B2 /designs/TMULT/instances_comb/IO_B2
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_B2
::legacy::set_attribute -quiet original_name IO_B2/PAD /designs/TMULT/instances_comb/IO_B2/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_B2/C /designs/TMULT/instances_comb/IO_B2/pins_out/C
::legacy::set_attribute -quiet original_name IO_B3 /designs/TMULT/instances_comb/IO_B3
::legacy::set_attribute -quiet single_bit_orig_name IO_B3 /designs/TMULT/instances_comb/IO_B3
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_B3
::legacy::set_attribute -quiet original_name IO_B3/PAD /designs/TMULT/instances_comb/IO_B3/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_B3/C /designs/TMULT/instances_comb/IO_B3/pins_out/C
::legacy::set_attribute -quiet original_name IO_CLK /designs/TMULT/instances_comb/IO_CLK
::legacy::set_attribute -quiet single_bit_orig_name IO_CLK /designs/TMULT/instances_comb/IO_CLK
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_CLK
::legacy::set_attribute -quiet original_name IO_CLK/PAD /designs/TMULT/instances_comb/IO_CLK/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_CLK/C /designs/TMULT/instances_comb/IO_CLK/pins_out/C
::legacy::set_attribute -quiet original_name IO_P0 /designs/TMULT/instances_comb/IO_P0
::legacy::set_attribute -quiet single_bit_orig_name IO_P0 /designs/TMULT/instances_comb/IO_P0
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P0
::legacy::set_attribute -quiet original_name IO_P0/PAD /designs/TMULT/instances_comb/IO_P0/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P0/C /designs/TMULT/instances_comb/IO_P0/pins_out/C
::legacy::set_attribute -quiet original_name IO_P1 /designs/TMULT/instances_comb/IO_P1
::legacy::set_attribute -quiet single_bit_orig_name IO_P1 /designs/TMULT/instances_comb/IO_P1
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P1
::legacy::set_attribute -quiet original_name IO_P1/PAD /designs/TMULT/instances_comb/IO_P1/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P1/C /designs/TMULT/instances_comb/IO_P1/pins_out/C
::legacy::set_attribute -quiet original_name IO_P2 /designs/TMULT/instances_comb/IO_P2
::legacy::set_attribute -quiet single_bit_orig_name IO_P2 /designs/TMULT/instances_comb/IO_P2
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P2
::legacy::set_attribute -quiet original_name IO_P2/PAD /designs/TMULT/instances_comb/IO_P2/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P2/C /designs/TMULT/instances_comb/IO_P2/pins_out/C
::legacy::set_attribute -quiet original_name IO_P3 /designs/TMULT/instances_comb/IO_P3
::legacy::set_attribute -quiet single_bit_orig_name IO_P3 /designs/TMULT/instances_comb/IO_P3
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P3
::legacy::set_attribute -quiet original_name IO_P3/PAD /designs/TMULT/instances_comb/IO_P3/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P3/C /designs/TMULT/instances_comb/IO_P3/pins_out/C
::legacy::set_attribute -quiet original_name IO_P4 /designs/TMULT/instances_comb/IO_P4
::legacy::set_attribute -quiet single_bit_orig_name IO_P4 /designs/TMULT/instances_comb/IO_P4
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P4
::legacy::set_attribute -quiet original_name IO_P4/PAD /designs/TMULT/instances_comb/IO_P4/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P4/C /designs/TMULT/instances_comb/IO_P4/pins_out/C
::legacy::set_attribute -quiet original_name IO_P5 /designs/TMULT/instances_comb/IO_P5
::legacy::set_attribute -quiet single_bit_orig_name IO_P5 /designs/TMULT/instances_comb/IO_P5
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P5
::legacy::set_attribute -quiet original_name IO_P5/PAD /designs/TMULT/instances_comb/IO_P5/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P5/C /designs/TMULT/instances_comb/IO_P5/pins_out/C
::legacy::set_attribute -quiet original_name IO_P6 /designs/TMULT/instances_comb/IO_P6
::legacy::set_attribute -quiet single_bit_orig_name IO_P6 /designs/TMULT/instances_comb/IO_P6
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P6
::legacy::set_attribute -quiet original_name IO_P6/PAD /designs/TMULT/instances_comb/IO_P6/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P6/C /designs/TMULT/instances_comb/IO_P6/pins_out/C
::legacy::set_attribute -quiet original_name IO_P7 /designs/TMULT/instances_comb/IO_P7
::legacy::set_attribute -quiet single_bit_orig_name IO_P7 /designs/TMULT/instances_comb/IO_P7
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_P7
::legacy::set_attribute -quiet original_name IO_P7/PAD /designs/TMULT/instances_comb/IO_P7/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_P7/C /designs/TMULT/instances_comb/IO_P7/pins_out/C
::legacy::set_attribute -quiet original_name IO_R /designs/TMULT/instances_comb/IO_R
::legacy::set_attribute -quiet single_bit_orig_name IO_R /designs/TMULT/instances_comb/IO_R
::legacy::set_attribute -quiet dont_touch false /designs/TMULT/instances_comb/IO_R
::legacy::set_attribute -quiet original_name IO_R/PAD /designs/TMULT/instances_comb/IO_R/pins_out/PAD
::legacy::set_attribute -quiet original_name IO_R/C /designs/TMULT/instances_comb/IO_R/pins_out/C
::legacy::set_attribute -quiet original_name {{P[6]}} {/designs/TMULT/instances_seq/P_reg[6]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[6]}
::legacy::set_attribute -quiet single_bit_orig_name {P[6]} {/designs/TMULT/instances_seq/P_reg[6]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[6]}
::legacy::set_attribute -quiet original_name {P[6]/q} {/designs/TMULT/instances_seq/P_reg[6]/pins_out/Q}
::legacy::set_attribute -quiet original_name {{P[7]}} {/designs/TMULT/instances_seq/P_reg[7]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[7]}
::legacy::set_attribute -quiet single_bit_orig_name {P[7]} {/designs/TMULT/instances_seq/P_reg[7]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[7]}
::legacy::set_attribute -quiet original_name {P[7]/q} {/designs/TMULT/instances_seq/P_reg[7]/pins_out/Q}
::legacy::set_attribute -quiet original_name {{P[5]}} {/designs/TMULT/instances_seq/P_reg[5]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[5]}
::legacy::set_attribute -quiet single_bit_orig_name {P[5]} {/designs/TMULT/instances_seq/P_reg[5]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[5]}
::legacy::set_attribute -quiet original_name {P[5]/q} {/designs/TMULT/instances_seq/P_reg[5]/pins_out/Q}
::legacy::set_attribute -quiet original_name {{P[4]}} {/designs/TMULT/instances_seq/P_reg[4]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[4]}
::legacy::set_attribute -quiet single_bit_orig_name {P[4]} {/designs/TMULT/instances_seq/P_reg[4]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[4]}
::legacy::set_attribute -quiet original_name {P[4]/q} {/designs/TMULT/instances_seq/P_reg[4]/pins_out/Q}
::legacy::set_attribute -quiet original_name {{P[3]}} {/designs/TMULT/instances_seq/P_reg[3]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[3]}
::legacy::set_attribute -quiet single_bit_orig_name {P[3]} {/designs/TMULT/instances_seq/P_reg[3]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[3]}
::legacy::set_attribute -quiet original_name {P[3]/q} {/designs/TMULT/instances_seq/P_reg[3]/pins_out/Q}
::legacy::set_attribute -quiet original_name {{P[2]}} {/designs/TMULT/instances_seq/P_reg[2]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[2]}
::legacy::set_attribute -quiet single_bit_orig_name {P[2]} {/designs/TMULT/instances_seq/P_reg[2]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[2]}
::legacy::set_attribute -quiet original_name {P[2]/q} {/designs/TMULT/instances_seq/P_reg[2]/pins_out/Q}
::legacy::set_attribute -quiet original_name {{P[1]}} {/designs/TMULT/instances_seq/P_reg[1]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[1]}
::legacy::set_attribute -quiet single_bit_orig_name {P[1]} {/designs/TMULT/instances_seq/P_reg[1]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[1]}
::legacy::set_attribute -quiet original_name {P[1]/q} {/designs/TMULT/instances_seq/P_reg[1]/pins_out/Q}
::legacy::set_attribute -quiet original_name {{P[0]}} {/designs/TMULT/instances_seq/P_reg[0]}
::legacy::set_attribute -quiet orig_hdl_instantiated false {/designs/TMULT/instances_seq/P_reg[0]}
::legacy::set_attribute -quiet single_bit_orig_name {P[0]} {/designs/TMULT/instances_seq/P_reg[0]}
::legacy::set_attribute -quiet gint_phase_inversion false {/designs/TMULT/instances_seq/P_reg[0]}
::legacy::set_attribute -quiet original_name {P[0]/q} {/designs/TMULT/instances_seq/P_reg[0]/pins_out/Q}
# BEGIN PMBIST SECTION
# END PMBIST SECTION
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
#############################################################
#####   FLOW WRITE   ########################################
##
## Written by Genus(TM) Synthesis Solution version 18.10-p003_1
## flowkit v18.10-p001_1
## Written on 16:41:38 15-Nov 2020
#############################################################
#####   Flow Definitions   ##################################

#############################################################
#####   Step Definitions   ##################################


#############################################################
#####   Attribute Definitions   #############################

if {[is_attribute flow_edit_wildcard_end_steps -obj_type root]} {set_flowkit_db flow_edit_wildcard_end_steps {}}
if {[is_attribute flow_edit_wildcard_start_steps -obj_type root]} {set_flowkit_db flow_edit_wildcard_start_steps {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_flowkit_db flow_footer_tcl {}}
if {[is_attribute flow_header_tcl -obj_type root]} {set_flowkit_db flow_header_tcl {}}
if {[is_attribute flow_metadata -obj_type root]} {set_flowkit_db flow_metadata {}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_flowkit_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_flowkit_db flow_step_check_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_flowkit_db flow_step_end_tcl {}}
if {[is_attribute flow_step_order -obj_type root]} {set_flowkit_db flow_step_order {}}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_flowkit_db flow_summary_tcl {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_flowkit_db flow_template_feature_definition {}}
if {[is_attribute flow_template_type -obj_type root]} {set_flowkit_db flow_template_type {}}
if {[is_attribute flow_template_version -obj_type root]} {set_flowkit_db flow_template_version {}}
if {[is_attribute flow_user_templates -obj_type root]} {set_flowkit_db flow_user_templates {}}


#############################################################
#####   Flow History   ######################################

if {[is_attribute flow_branch -obj_type root]} {set_flowkit_db flow_branch {}}
if {[is_attribute flow_caller_data -obj_type root]} {set_flowkit_db flow_caller_data {}}
if {[is_attribute flow_current -obj_type root]} {set_flowkit_db flow_current {}}
if {[is_attribute flow_hier_path -obj_type root]} {set_flowkit_db flow_hier_path {}}
if {[is_attribute flow_db_directory -obj_type root]} {set_flowkit_db flow_db_directory dbs}
if {[is_attribute flow_exit_when_done -obj_type root]} {set_flowkit_db flow_exit_when_done false}
if {[is_attribute flow_history -obj_type root]} {set_flowkit_db flow_history {}}
if {[is_attribute flow_log_directory -obj_type root]} {set_flowkit_db flow_log_directory logs}
if {[is_attribute flow_mail_on_error -obj_type root]} {set_flowkit_db flow_mail_on_error false}
if {[is_attribute flow_mail_to -obj_type root]} {set_flowkit_db flow_mail_to {}}
if {[is_attribute flow_metrics_file -obj_type root]} {set_flowkit_db flow_metrics_file {}}
if {[is_attribute flow_metrics_snapshot_parent_uuid -obj_type root]} {set_flowkit_db flow_metrics_snapshot_parent_uuid {}}
if {[is_attribute flow_metrics_snapshot_uuid -obj_type root]} {set_flowkit_db flow_metrics_snapshot_uuid {}}
if {[is_attribute flow_overwrite_db -obj_type root]} {set_flowkit_db flow_overwrite_db false}
if {[is_attribute flow_report_directory -obj_type root]} {set_flowkit_db flow_report_directory reports}
if {[is_attribute flow_run_tag -obj_type root]} {set_flowkit_db flow_run_tag {}}
if {[is_attribute flow_schedule -obj_type root]} {set_flowkit_db flow_schedule {}}
if {[is_attribute flow_script -obj_type root]} {set_flowkit_db flow_script {}}
if {[is_attribute flow_starting_db -obj_type root]} {set_flowkit_db flow_starting_db {}}
if {[is_attribute flow_status_file -obj_type root]} {set_flowkit_db flow_status_file {}}
if {[is_attribute flow_step_canonical_current -obj_type root]} {set_flowkit_db flow_step_canonical_current {}}
if {[is_attribute flow_step_current -obj_type root]} {set_flowkit_db flow_step_current {}}
if {[is_attribute flow_step_last -obj_type root]} {set_flowkit_db flow_step_last {}}
if {[is_attribute flow_step_last_msg -obj_type root]} {set_flowkit_db flow_step_last_msg {}}
if {[is_attribute flow_step_last_status -obj_type root]} {set_flowkit_db flow_step_last_status not_run}
if {[is_attribute flow_step_next -obj_type root]} {set_flowkit_db flow_step_next {}}
if {[is_attribute flow_working_directory -obj_type root]} {set_flowkit_db flow_working_directory .}

#############################################################
#####   User Defined Attributes   ###########################

