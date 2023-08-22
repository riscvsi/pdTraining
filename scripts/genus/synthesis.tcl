#### Template Script for RTL->Gate-Level Flow (generated from GENUS 19.10-p001_1) 

source setup.tcl
set synthDir "synthesis"
if {![file exists $synthDir]} {
  file mkdir "synthesis"
  puts "Creating directory $synthDir"
}
catch {cd $synthDir}

if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"

##############################################################################
## Preset global variables and attributes
##############################################################################


set DESIGN $designName
set GEN_EFF $effort
set MAP_OPT_EFF $effort
set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH outputs_${DATE}
set _OUTPUTS_PATH outputs
set _REPORTS_PATH reports
set _LOG_PATH logs
##set ET_WORKDIR <ET work directory>
set_db / .init_lib_search_path {.} 
set_db / .script_search_path {.} 
set_db / .init_hdl_search_path {.} 
##Uncomment and specify machine names to enable super-threading.
##set_db / .super_thread_servers {<machine names>} 
##For design size of 1.5M - 5M gates, use 8 to 16 CPUs. For designs > 5M gates, use 16 to 32 CPUs
##set_db / .max_cpus_per_server 8

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_value 0 | 1 | x | none

set_db / .information_level 7 

###############################################################
## Library setup
###############################################################



if {$designName == "scr1_pipe_top"} {
lappend libFiles ../riscvCoreSyntaCore1/ramInputs/sram_32_1024_max_1p8V_25C.lib
lappend libFiles ../riscvCoreSyntaCore1/ramInputs/i2c_top.lib
lappend libFiles ../riscvCoreSyntaCore1/ramInputs/uart.lib
}
read_libs  $libFiles


if {$designName == "scr1_pipe_top"} {
lappend lefFiles ../riscvCoreSyntaCore1/ramInputs/sram_32_1024.lef
lappend lefFiles ../riscvCoreSyntaCore1/ramInputs/i2c_top.lef
lappend lefFiles ../riscvCoreSyntaCore1/ramInputs/uart.lef
}
read_physical -lef $lefFiles


#" ../LEF/gsclib045_tech.lef ../LEF/gsclib045_macro.lef ../LEF/pll.lef   ../LEF/CDK_S128x16.lef  ../LEF/CDK_S256x16.lef ../LEF/CDK_R512x16.lef " 

## Provide either cap_table_file or the qrc_tech_file
##set_db / .cap_table_file <file> 
##read_qrc <qrcTechFile name>
##generates <signal>_reg[<bit_width>] format
##set_db / .hdl_array_naming_style %s\[%d\] 
## 





### clock gating variable
#set_db / .lp_insert_clock_gating true 

## Power root attributes
#set_db / .lp_clock_gating_prefix <string>
#set_db / .lp_power_analysis_effort <high> 
#set_db / .lp_power_unit mW 
#set_db / .lp_toggle_rate_unit /ns 
## The attribute has been set to default value "medium"

## you can try setting it to high to explore MVT QoR for low power optimization
#set_db / .leakage_power_effort medium 


####################################################################
## Load Design
####################################################################


read_hdl -sv $RTLFile
elaborate $DESIGN
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration



check_design -unresolved

####################################################################
## Constraints Setup
####################################################################

read_sdc $sdcFile
puts "The number of exceptions is [llength [vfind "design:$DESIGN" -exception *]]"

###########
# upf file read
if {[file exists ../scripts/genus/block.upf]} {
read_power_intent -1801 ../scripts/genus/block.upf -module $DESIGN
apply_power_intent
commit_power_intent
}
#
###########
#set_db "design:$DESIGN" .force_wireload <wireload name> 

if {![file exists ${_LOG_PATH}]} {
  file mkdir ${_LOG_PATH}
  puts "Creating directory ${_LOG_PATH}"
}

if {![file exists ${_OUTPUTS_PATH}]} {
  file mkdir ${_OUTPUTS_PATH}
  puts "Creating directory ${_OUTPUTS_PATH}"
}

if {![file exists ${_REPORTS_PATH}]} {
  file mkdir ${_REPORTS_PATH}
  puts "Creating directory ${_REPORTS_PATH}"
}
check_timing_intent


###################################################################################
## Define cost groups (clock-clock, clock-output, input-clock, input-output)
###################################################################################

## Uncomment to remove already existing costgroups before creating new ones.
## delete_obj [vfind /designs/* -cost_group *]

if {[llength [all_registers]] > 0} { 
  define_cost_group -name I2C -design $DESIGN
  define_cost_group -name C2O -design $DESIGN
  define_cost_group -name C2C -design $DESIGN
  path_group -from [all_registers] -to [all_registers] -group C2C -name C2C
  path_group -from [all_registers] -to [all_outputs] -group C2O -name C2O
  path_group -from [all_inputs]  -to [all_registers] -group I2C -name I2C
}

define_cost_group -name I2O -design $DESIGN
path_group -from [all_inputs]  -to [all_outputs] -group I2O -name I2O
foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] >> $_REPORTS_PATH/${DESIGN}_pretim.rpt
}
#######################################################################################
## Leakage/Dynamic power/Clock Gating setup.
#######################################################################################

#set_db "design:$DESIGN" .lp_clock_gating_cell [vfind /lib* -lib_cell <cg_libcell_name>]
#set_db "design:$DESIGN" .max_leakage_power 0.0 
#set_db "design:$DESIGN" .lp_power_optimization_weight <value from 0 to 1> 
#set_db "design:$DESIGN" .max_dynamic_power <number> 
## read_tcf <TCF file name>
## read_saif <SAIF file name>
## read_vcd <VCD file name>



#### To turn off sequential merging on the design 
#### uncomment & use the following attributes.
##set_db / .optimize_merge_flops false 
##set_db / .optimize_merge_latches false 
#### For a particular instance use attribute 'optimize_merge_seqs' to turn off sequential merging. 



####################################################################################################
## Synthesizing to generic 
####################################################################################################

set_db / .syn_generic_effort $GEN_EFF
syn_generic
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
report_dp > $_REPORTS_PATH/generic/${DESIGN}_datapath.rpt
write_snapshot -outdir $_REPORTS_PATH -tag generic
report_summary -directory $_REPORTS_PATH


#### Build RTL power models
##build_rtl_power_models -design $DESIGN -clean_up_netlist [-clock_gating_logic] [-relative <hierarchical instance>]
#report power -rtl



####################################################################################################
## Synthesizing to gates
####################################################################################################


set_db / .syn_map_effort $MAP_OPT_EFF
syn_map
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED
write_snapshot -outdir $_REPORTS_PATH -tag map
report_summary -directory $_REPORTS_PATH
report_dp > $_REPORTS_PATH/map/${DESIGN}_datapath.rpt


foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_map.rpt
}


write_do_lec -revised_design fv_map -logfile ${_LOG_PATH}/rtl2intermediate.lec.log > ${_OUTPUTS_PATH}/rtl2intermediate.lec.do

## ungroup -threshold <value>

#######################################################################################################
## Optimize Netlist
#######################################################################################################

## Uncomment to remove assigns & insert tiehilo cells during Incremental synthesis
##set_db / .remove_assigns true 
##set_remove_assign_options -buffer_or_inverter <libcell> -design <design|subdesign> 
##set_db / .use_tiehilo_for_const <none|duplicate|unique> 

set_db / .syn_opt_effort $MAP_OPT_EFF
syn_opt
write_snapshot -outdir $_REPORTS_PATH -tag syn_opt
report_summary -directory $_REPORTS_PATH

puts "Runtime & Memory after 'syn_opt'"
time_info OPT

foreach cg [vfind / -cost_group *] {
  report_timing -group [list $cg] > $_REPORTS_PATH/${DESIGN}_[vbasename $cg]_post_opt.rpt
}



######################################################################################################
## write backend file set (verilog, SDC, config, etc.)
######################################################################################################



report_clock_gating > $_REPORTS_PATH/${DESIGN}_clockgating.rpt
report_power -depth 0 > $_REPORTS_PATH/${DESIGN}_power.rpt
report_gates -power > $_REPORTS_PATH/${DESIGN}_gates_power.rpt

report_dp > $_REPORTS_PATH/${DESIGN}_datapath_incr.rpt
report_messages > $_REPORTS_PATH/${DESIGN}_messages.rpt
write_snapshot -outdir $_REPORTS_PATH -tag final
report_summary -directory $_REPORTS_PATH
write_hdl  > ${_OUTPUTS_PATH}/${DESIGN}_synth.v
## write_script > ${_OUTPUTS_PATH}/${DESIGN}_m.script
write_sdc > ${_OUTPUTS_PATH}/${DESIGN}_synth.sdc
write_power_intent -1801 -base_name ${_OUTPUTS_PATH}/${DESIGN}_synth
 write_lib_lef -lib ${_OUTPUTS_PATH}/${DESIGN}
#################################
### write_do_lec
#################################


write_do_lec -golden_design fv_map -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile  ${_LOG_PATH}/intermediate2final.lec.log > ${_OUTPUTS_PATH}/intermediate2final.lec.do
##Uncomment if the RTL is to be compared with the final netlist..
write_do_lec -revised_design ${_OUTPUTS_PATH}/${DESIGN}_m.v -logfile ${_LOG_PATH}/rtl2final.lec.log > ${_OUTPUTS_PATH}/rtl2final.lec.do

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

exit
##quit
