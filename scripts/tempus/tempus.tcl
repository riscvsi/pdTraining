###############################################################
# Purpose:  Show a simple Tempus STA script
# Purpose:  Hightlight the order of operations and simple commands
# Author:   John Schritz   Nov 2015
################################################################
source setup.tcl
################################
# Setup threading and client counts
################################
set_multi_cpu_usage -localCpu 8

################################
# Setup some global variables or report settings
################################
set_table_style -no_frame_fix_width -nosplit

################################
# Read the libraries
################################
#

if {$designName == "scr1_pipe_top"} {
    lappend libFiles ../riscvCoreSyntaCore1/ramInputs/sram_32_1024_max_1p8V_25C.lib
    lappend libMinFiles ../riscvCoreSyntaCore1/ramInputs/sram_32_1024_max_1p8V_25C.lib
    lappend libFiles ../riscvCoreSyntaCore1/ramInputs/i2c_top.lib
    lappend libFiles ../riscvCoreSyntaCore1/ramInputs/uart.lib
    lappend libMinFiles ../riscvCoreSyntaCore1/ramInputs/i2c_top.lib
    lappend libMinFiles ../riscvCoreSyntaCore1/ramInputs/uart.lib
}

foreach lib $libFiles {
read_lib     ${lib}
#../../libs/liberty/FreePDK45_lib_v1.0_worst.lib
}
#read_lib     ../../libs/MACRO/LIBERTY/pllclk.lib
#read_lib     ../../libs/MACRO/LIBERTY/ram_256x16A.lib   ../../libs/MACRO/LIBERTY/rom_512x16A.lib

################################
# Read the netlist in a gzipped format
################################
read_verilog "../../design/ECO_INIT_11_optSetup.enc.dat/dtmf_recvr_core.v.gz" ; # 8269 instances

################################
# Link the design
################################
set_top_module dtmf_recvr_core -ignore_undefined_cell

################################
# Check the size of the testcase
################################
set cellCnt [sizeof_collection [get_cells -hier *]]
puts "Your design has: $cellCnt instances"

################################
# Load netlist parasitics
################################
read_spef  ../../design/SPEF/corner_worst_CMAX.spef.gz

################################
# Add constraints
################################
read_sdc ../../design/dtmf_recvr_core.pr.sdc

################################
# Adjust timer settings
################################
set_delay_cal_mode -siAware true    ;# Turn on SI when true

################################################################
#To dump aggressor info in report_delay_calculation -si command
#################################################################

set_si_mode -enable_delay_report true

##########################################
#enable the glitch reports to be generated
##########################################
set_si_mode -enable_glitch_report true

##########################
#Enable glitch propagation
##########################
set_si_mode -enable_glitch_propagation true
set_global timing_pba_exhaustive_path_nworst_limit 2
set_global timing_path_based_exhaustive_max_paths_limit 1000
#set_global timing_path_based_enable_exhaustive_depth_bounded_by_gba false

###################################
# Run timing
###################################
update_timing -full

###################################
# Run reports
###################################
report_timing
#report_timing -max_paths 9 -retime path_slew_propagation -retime_mode exhaustive -max_slack 0.200 > epba.rpt
report_timing -max_paths 10000000 -retime path_slew_propagation -retime_mode exhaustive -max_slack 0.200 > epba.rpt
return

###################################
set reportDir reports
file mkdir $reportDir
source ../scripts/tempus/reports.tcl

Puts "All done"
###################################
# If in interactive session, return to the Tempus prompt
# If in batch session, return to the Linux prompt
###################################
exit
