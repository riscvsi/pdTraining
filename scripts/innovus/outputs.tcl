


source setup.tcl



set pnrDir "pnr"
if {![file exists $pnrDir]} {
  file mkdir "pnr"
  puts "Creating directory $pnrDir"
}
catch {cd $pnrDir}
read_db postroute.inn

write_lef_abstract ${designName}.lef -top_layer 9 -stripe_pins 
extract_rc
write_parasitics -spef_file ${designName}.spef -rc_corner rc_worst

cp ../synthesis/outputs/${designName}.lib .

exit
