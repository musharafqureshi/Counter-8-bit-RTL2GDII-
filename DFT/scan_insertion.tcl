#---------------------------------------------------------------#
#                                                               #
#                  TESSENT SCAN INSERTION                       #
#                                                               #
#---------------------------------------------------------------#

#===============================================================#
#       DFT SCAN INSERTION                                      #
#===============================================================#

set_logfile_handling LOGS/scan_insertion.log -rep

set_context dft -scan

read_verilog RTL/count_noscan.v
read_cell_library LIB/slow_vdd1v0.mdt
read_sdc CONSTRAINTS/count_syn.sdc


set_current_design

# Analyze clocks/resets/test controls
analyze_control_signals -auto_fix

# Enable test clock insertion
set_test_logic -clock on


# DFT analysis mode
set_system_mode analysis

analyze_scan_chains

# DFT rule checking
#check_design_rules

# Insert scan chains
insert_test_logic

write_scan_order OUTPUTS/count.scandef 

# Verify scan insertion
report_scan_chains
#verify_scan_chain

# Write scan inserted netlist
write_design -output_file OUTPUTS/count_scan.v -rep

# Generate ATPG setup files
write_atpg_setup OUTPUTS/count_scan_testproc -procfile -rep

exit

#---------------------------------------------------------------#
# END OF FLOW
#---------------------------------------------------------------#
