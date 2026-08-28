
read_libs LIB/slow_vdd1v0_basicCells.lib
read_hdl RTL/count.v
elaborate
read_sdc CONSTRAINTS/count.sdc

set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

write_hdl > OUTPUTS/count_noscan.v
write_sdc > OUTPUTS/count_syn.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > OUTPUTS/delays.sdf

report area > REPORTS/area.rpt
report power > REPORTS/power.rpt
report gates > REPORTS/gates.rpt
report summary > REPORTS/summary.rpt
