create_library_set -name default_library_set -timing {/home/phillda/Documents/dallas/syn/../lib//scadv10_cln65gp_rvt_tt_1p0v_25c.lib /home/phillda/Documents/dallas/syn/../lib//tphn65gpgv2od3_sltc.lib}
create_rc_corner -name _default_rc_corner_ -T 25.0
create_delay_corner -name _default_delay_corner_ -library_set default_library_set -opcond tt_1p0v_25c  -opcond_library scadv10_cln65gp_rvt_tt_1p0v_25c -rc_corner _default_rc_corner_

create_constraint_mode -name _default_constraint_mode_ -sdc_files {./innovus/TMULT/TMULT._default_constraint_mode_.sdc}
 
create_analysis_view -name _default_view_  -constraint_mode _default_constraint_mode_ -delay_corner _default_delay_corner_
 
 
set_analysis_view -setup _default_view_  -hold _default_view_
 
