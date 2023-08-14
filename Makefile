## name of your block
block = RISCV

## technology used 130 / 45
#### tool definition
synthTool = \genus
pnrTool = \innovus -stylus
############
.PHONY: all_targets
all_targets: synth fp pmesh place cts route output


getLibrary: 
	echo "get the libraries into your area"
	git clone https://github.com/riscvsi/technology.git
	echo "point to the cadence library area LIBS directory"
	./gunzipQrc.csh
	echo "copying the qrc tech files and creating the area"
	echo "libraries copied to main area"

getNetlist: 
	echo "get the netlist into your area"
	git clone https://github.com/riscvsi/riscvCoreSyntaCore1.git
	echo "netlist copied"

soc:
	echo "SOC initialised"
	$(pnrTool) -file scripts/innovus/topSoc.tcl
	echo "top database generated"

synth: 
	echo "Synthesis started"
	rm -rf synthesis
	$(synthTool) -file scripts/genus/synthesis.tcl
	touch synthCompleted

fp : synthCompleted
	echo "Synthesis completed"
	$(pnrTool) -file scripts/innovus/floorplan.tcl
	touch fpCompleted

pmesh: fpCompleted
	echo "floorplan completed starting power planning"
	echo "innovus -stylus -file scripts/innovus/power_stripe.tcl"
	$(pnrTool) -file scripts/innovus/power_stripe.tcl
	touch pmeshCompleted

place: pmeshCompleted
	echo "power mesh completed starting placement"
	echo "innovus -stylus -file scripts/innovus/placement.tcl"
	$(pnrTool) -file scripts/innovus/placement.tcl
	touch placementCompleted

cts: placementCompleted
	echo "cts completed";
	echo "innovus -stylus -file scripts/innovus/cts.tcl"
	$(pnrTool) -file scripts/innovus/cts.tcl
	touch ctsCompleted

route: ctsCompleted
	echo "route completed"
	echo "innovus -stylus -file scripts/innovus/route.tcl"
	$(pnrTool) -file scripts/innovus/route.tcl 
	touch routeCompleted

output: routeCompleted 
	echo "dump files"
	$(pnrTool) -file scripts/innovus/outputs.tcl
	touch outputCompleted 


iterminal:
	echo "getting a innovus terminal"
	$(pnrTool)


gterminal:
	echo "getting a genus terminal"
	$(synthTool)


all: synth fp pmesh place cts route

clean:
	rm pvsUI_ipvs.log synthCompleted fpCompleted pmeshCompleted placeCompleted ctsCompleted routeCompleted innovus.log* innovus.cmd* genus.log* genus.cmd*


#######################
