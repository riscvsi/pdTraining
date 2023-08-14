set  designName  "scr1_pipe_top" 
set  designName  "aes_cipher_top" 
set  technology  "45"

if {$designName == "scr1_pipe_top" } {
    set  RTLFile  "../riscvCoreSyntaCore1/src/includes/scr1_ahb.svh ../riscvCoreSyntaCore1/src/includes/scr1_arch_description.svh ../riscvCoreSyntaCore1/src/includes/scr1_arch_types.svh ../riscvCoreSyntaCore1/src/includes/scr1_csr.svh ../riscvCoreSyntaCore1/src/includes/scr1_dm.svh ../riscvCoreSyntaCore1/src/includes/scr1_hdu.svh ../riscvCoreSyntaCore1/src/includes/scr1_ipic.svh ../riscvCoreSyntaCore1/src/includes/scr1_memif.svh ../riscvCoreSyntaCore1/src/includes/scr1_riscv_isa_decoding.svh ../riscvCoreSyntaCore1/src/includes/scr1_scu.svh ../riscvCoreSyntaCore1/src/includes/scr1_search_ms1.svh ../riscvCoreSyntaCore1/src/includes/scr1_tapc.svh ../riscvCoreSyntaCore1/src/includes/scr1_tdu.svh ../riscvCoreSyntaCore1/src/core/pipeline/scr1_pipe_exu.sv ../riscvCoreSyntaCore1/src/core/pipeline/scr1_pipe_ialu.sv ../riscvCoreSyntaCore1/src/core/pipeline/scr1_pipe_idu.sv ../riscvCoreSyntaCore1/src/core/pipeline/scr1_pipe_ifu.sv ../riscvCoreSyntaCore1/src/core/pipeline/scr1_pipe_lsu.sv ../riscvCoreSyntaCore1/src/core/pipeline/scr1_pipe_mprf.sv ../riscvCoreSyntaCore1/src/core/pipeline/scr1_pipe_top.sv ../riscvCoreSyntaCore1/src/core/scr1_core_top.sv" 
    set  sdcFile  "../riscvCoreSyntaCore1/constraints/scr1_pipe_top.sdc" 
}


if {$designName == "ethmac" } {
    set  RTLFile  "../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_clockgen.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_cop.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_crc.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_fifo.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_maccontrol.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_macstatus.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_miim.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_outputcontrol.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_random.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_receivecontrol.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_register.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_registers.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_rxaddrcheck.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_rxcounters.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_rxethmac.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_rxstatem.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_shiftreg.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_spram_256x32.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_top.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_transmitcontrol.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_txcounters.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_txethmac.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_txstatem.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/eth_wishbone.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/ethmac.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/ethmac_defines.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/timescale.v \
    ../riscvCoreSyntaCore1/ips/design/ethernet/verilog/xilinx_dist_ram_16x32.v "
    set  sdcFile  "../riscvCoreSyntaCore1/ips/design/ethernet/constraints/ethmac.sdc" 
}


if {$designName == "i2c_master_top" } {
    set  RTLFile  "../riscvCoreSyntaCore1/ips/design/i2cMasterSlave/verilog/i2c_master_bit_ctrl.v \
../riscvCoreSyntaCore1/ips/design/i2cMasterSlave/verilog/i2c_master_byte_ctrl.v \
../riscvCoreSyntaCore1/ips/design/i2cMasterSlave/verilog/i2c_master_defines.v \
../riscvCoreSyntaCore1/ips/design/i2cMasterSlave/verilog/i2c_master_top.v \
../riscvCoreSyntaCore1/ips/design/i2cMasterSlave/verilog/timescale.v "
    set  sdcFile  "../riscvCoreSyntaCore1/ips/design/i2cMasterSlave/constraints/i2c_master_top.sdc" 
}


if {$designName == "aes_cipher_top" } {
    set  RTLFile  "../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_cipher_top.v \
../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_key_expand_128.v \
../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_rcon.v \
../riscvCoreSyntaCore1/ips/design/aes_cipher_top/verilog/aes_sbox.v "
    set  sdcFile  "../riscvCoreSyntaCore1/ips/design/aes_cipher_top/constraints/aes_cipher_top.sdc" 
}




set  effort  "medium" 
set  libFiles  "../technology/${technology}/lib/max/MEM2_4096X32_slow.lib ../technology/${technology}/lib/max/MEM2_2048X32_slow.lib ../technology/${technology}/lib/max/pdkIO.lib ../technology/${technology}/lib/max/MEM2_512X32_slow.lib ../technology/${technology}/lib/max/MEM2_136X32_slow.lib ../technology/${technology}/lib/max/MEM2_128X16_slow.lib ../technology/${technology}/lib/max/MEM2_1024X32_slow.lib ../technology/${technology}/lib/max/MEM1_4096X32_slow.lib ../technology/${technology}/lib/max/MEM1_256X32_slow.lib ../technology/${technology}/lib/max/MEM1_1024X32_slow.lib ../technology/${technology}/lib/max/slow.lib ../technology/${technology}/lib/max/MEM2_128X32_slow.lib" 
set  libMinFiles  "../technology/${technology}/lib/min/pdkIO.lib ../technology/${technology}/lib/min/MEM2_512X32_slow.lib ../technology/${technology}/lib/min/MEM2_4096X32_slow.lib ../technology/${technology}/lib/min/MEM2_2048X32_slow.lib ../technology/${technology}/lib/min/MEM2_136X32_slow.lib ../technology/${technology}/lib/min/MEM2_128X16_slow.lib ../technology/${technology}/lib/min/MEM2_1024X32_slow.lib ../technology/${technology}/lib/min/MEM1_4096X32_slow.lib ../technology/${technology}/lib/min/MEM1_256X32_slow.lib ../technology/${technology}/lib/min/MEM1_1024X32_slow.lib ../technology/${technology}/lib/min/fast.lib ../technology/${technology}/lib/min/MEM2_128X32_slow.lib" 
set  lefFiles  "../technology/${technology}/lef/gsclib045.fixed2.lef ../technology/${technology}/lef/MEM2_128X32.lef ../technology/${technology}/lef/MEM1_256X32.lef ../technology/${technology}/lef/pads.lef" 
set  capTableMin  "../technology/${technology}/captbl/best/capTable" 
set  capTableMax  "../technology/${technology}/captbl/worst/capTable" 
set  qxMapFile  "../technology/${technology}/qx/mapFile" 
set  qxTechFile  "../technology/${technology}/qx/qrcTechFile" 
set  qxConfFile  "../technology/${technology}/qx/qrc.conf" 
 
