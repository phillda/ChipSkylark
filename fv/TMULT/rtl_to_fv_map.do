tclmode

# Generated by Genus(TM) Synthesis Solution 18.10-p003_1, revision 1.293a
# Generated on: Sun Nov 15 16:41:36 EST 2020 (Sun Nov 15 21:41:36 GMT 2020)

set lec_version [regsub {(-)[A-Za-z]} $env(LEC_VERSION) ""]

tcl_set_command_name_echo on

set_log_file fv/TMULT/rtl_to_fv_map.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/TMULT -revised fv_map

set_parallel_option -threads 4 -license "xl lp gxl lpgxl eco ecogxl" -norelease_license
set_compare_options -threads 4

set env(RC_VERSION)     "18.10-p003_1"
set env(CDN_SYNTH_ROOT) "/opt/eda/cadence/GENUS181/tools.lnx86"
set CDN_SYNTH_ROOT      "/opt/eda/cadence/GENUS181/tools.lnx86"
set env(CW_DIR) "/opt/eda/cadence/GENUS181/tools.lnx86/lib/chipware"
set CW_DIR      "/opt/eda/cadence/GENUS181/tools.lnx86/lib/chipware"

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path ../lib/ -library -both
read_library -liberty -both   /home/phillda/Documents/dallas/syn/../lib/scadv10_cln65gp_rvt_tt_1p0v_25c.lib /home/phillda/Documents/dallas/syn/../lib/tphn65gpgv2od3_sltc.lib

set_undriven_signal 0 -golden
set_naming_style rc -golden
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L\[%d\].%s" "%s" -variable -golden

# Align LEC's treatment of mismatched port widths with constant
# connections with Genus's. Genus message CDFG-467 and LEC message
# HRC3.6 may indicate the presence of this issue. This option is
# only available with LEC 17.20-d301 or later.
set lec_version_required "17.20301"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -const_port_extend
}
set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"

# Align LEC's elaboration of VHDL configurations with Genus's.
# Genus message VHDL-674 may indicate the presence of this issue.
# This option is only available with LEC 18.10-p100 or later.
set lec_version_required "18.10"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -vhdl_elab_unspecified_config off
}
add_search_path . -design -golden
read_design -rangeconstraint -configuration  -enumconstraint -golden -lastmod -noelab  -vhdl 93  ../src/TMULT.vhd
elaborate_design -golden -root {TMULT} -rootonly -rootonly  

read_design -verilog95   -revised -lastmod -noelab fv/TMULT/fv_map.v.gz
elaborate_design -revised -root {TMULT}

uniquify -all -nolib -golden

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

#add_name_alias fv/TMULT/fv_map.singlebit.original_name.alias.json.gz -revised
#set_mapping_method -alias -revised
#add_renaming_rule r1alias _reg((\\\[%w\\\])*(/U\\\$%d)*)$ @1 -type dff -both

set_analyze_option -auto

write_hier_compare_dofile hier_tmp1.lec.do -noexact_pin_match -constraint -usage -replace -balanced_extraction -input_output_pin_equivalence -prepend_string " analyze_datapath -module -verbose ; analyze_datapath   -verbose; "
run_hier_compare hier_tmp1.lec.do -dynamic_hierarchy

report_verification -hier -verbose
set_system_mode lec
puts "No of diff points    = [get_compare_points -NONequivalent -count]"
if {[get_compare_points -NONequivalent -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
}

write_verification_information
report_verification_information

exit

