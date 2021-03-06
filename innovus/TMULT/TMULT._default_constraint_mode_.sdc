# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.10-p003_1 on Sun Nov 15 16:41:38 EST 2020

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design TMULT

create_clock -name "X_CLK" -period 7.143 -waveform {0.0 3.5715} [get_ports X_CLK]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[0]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[1]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[2]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[3]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[0]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[1]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[2]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_A[3]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[0]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[1]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[2]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[3]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[0]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[1]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[2]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_B[3]}]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports X_R]
set_input_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports X_R]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[0]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[1]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[2]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[3]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[4]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[5]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[6]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[7]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[0]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[1]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[2]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[3]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[4]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[5]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[6]}]
set_output_delay -clock [get_clocks X_CLK] -add_delay 0.5 [get_ports {X_P[7]}]
set_max_fanout 20.000 [current_design]
set_wire_load_selection_group "WireAreaForQA" -library "tphn65gpgv2od3_sltc"
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/DFFYQX1MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/DFFYQX2MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/DFFYQX3MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/DFFYQX4MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX0P5BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX0P6BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX0P7BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX0P8BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX11BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX13BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX16BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX1BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX1P2BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX1P4BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX1P7BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX2BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX2P5BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX3BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX3P5BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX4BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX5BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX6BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX7P5BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/POSTICGX9BA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF1R1WSX1MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF1R1WSX1P4MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF1R1WSX2MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF1R2WSX1MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF1R2WSX1P4MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF1R2WSX2MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF2R1WSX1MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF2R1WSX1P4MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF2R1WSX2MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF2R2WSX1MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF2R2WSX1P4MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/RF2R2WSX2MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/SDFFYQX1MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/SDFFYQX2MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/SDFFYQX3MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/SDFFYQX4MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/TIEHIX1MA10TR]
set_dont_use [get_lib_cells scadv10_cln65gp_rvt_tt_1p0v_25c/TIELOX1MA10TR]
