#---------------------------------------------------------------#
#                                                               #
#             TRANSITION ATPG FLOW                              #
#                                                               #
#---------------------------------------------------------------#

set_logfile_handling LOGS/atpg.log -rep

set_context patterns -scan

read_verilog OUTPUTS/count_scan.v
read_cell_library LIB/slow_vdd1v0.mdt

set_current_design

#add_black_boxes -auto 

# Load generated test procedure file
dofile OUTPUTS/count_scan_testproc_verify_scan_modes.dofile


# Add faults
add_faults -all

# Generate ATPG patterns
create_patterns

# ATPG reports
report_statistics
report_faults -summary

# Export generated patterns
write_patterns OUTPUTS/patterns_ascii.v -Verilog  -rep

exit

#---------------------------------------------------------------#
# END OF FLOW
#---------------------------------------------------------------#
