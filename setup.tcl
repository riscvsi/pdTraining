set  designName  "usbh_host" 
#set  designName  "aes_cipher_top" 
set  technology  "45"



if {$designName == "sdc_controller" } {
    set  RTLFile  "../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_bd.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_clock_divider.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_cmd_master.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_cmd_serial_host.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_controller_wb.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_crc_16.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_crc_7.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_data_master.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_data_serial_host.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_defines.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_fifo_rx_filler.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_fifo_tx_filler.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_rx_fifo.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_rx_fifo_tb.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sd_tx_fifo.v \
../riscvCoreSyntaCore1/ips/design/sdc_controller/verilog/sdc_controller.v "
    set  sdcFile  "../riscvCoreSyntaCore1/ips/design/sdc_controller/constraints/sdc_controller.sdc"
}


if {$designName == "videoController" } {
    set  RTLFile  "../riscvCoreSyntaCore1/ips/design/videoController/design/Beha_BitStream_ram.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/BitStream_buffer.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/BitStream_controller.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/bitstream_gclk_gen.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/BitStream_parser_FSM_gating.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/bs_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/cavlc_consumed_bits_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/cavlc_decoder.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/CodedBlockPattern_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/dependent_variable_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/DF_mem_ctrl.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/DF_pipeline.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/DF_reg_ctrl.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/DF_top.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/end_of_blk_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/exp_golomb_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/ext_frame_RAM0_wrapper.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/ext_frame_RAM1_wrapper.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/ext_RAM_ctrl.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/heading_one_detector.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/hybrid_pipeline_ctrl.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Inter_mv_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Inter_pred_CPE.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Inter_pred_LPE.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Inter_pred_pipeline.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Inter_pred_reg_ctrl.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Inter_pred_sliding_window.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Inter_pred_top.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Intra4x4_PredMode_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Intra_pred_PE.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Intra_pred_pipeline.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Intra_pred_reg_ctrl.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/Intra_pred_top.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/IQIT.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/level_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/nC_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/nova_defines.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/nova_tb.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/NumCoeffTrailingOnes_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/pc_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/QP_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/ram_async_1r_sync_1w.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/ram_sync_1r_sync_1w.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/rec_DF_RAM_ctrl.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/rec_gclk_gen.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/reconstruction.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/run_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/sum.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/syntax_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/timescale.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/total_zeros_decoding.v \
../riscvCoreSyntaCore1/ips/design/videoController/design/videoController.v "
    set  sdcFile  "../riscvCoreSyntaCore1/ips/design/videoController/constraints/videoController.sdc" 
}



if {$designName == "usbh_host" } {
    set  RTLFile  "../riscvCoreSyntaCore1/ips/design/usb2.1FunctionalCore/verilog/usbh_crc16.v \
../riscvCoreSyntaCore1/ips/design/usb2.1FunctionalCore/verilog/usbh_crc5.v \
../riscvCoreSyntaCore1/ips/design/usb2.1FunctionalCore/verilog/usbh_host_defs.v \
../riscvCoreSyntaCore1/ips/design/usb2.1FunctionalCore/verilog/usbh_fifo.v \
../riscvCoreSyntaCore1/ips/design/usb2.1FunctionalCore/verilog/usbh_host.v \
../riscvCoreSyntaCore1/ips/design/usb2.1FunctionalCore/verilog/usbh_sie.v "
    set  sdcFile  "../riscvCoreSyntaCore1/ips/design/usb2.1FunctionalCore/constraints/usbf_host.sdc" 
}


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




set  effort  "low" 
set  libFiles  "../technology/${technology}/lib/max/MEM2_4096X32_slow.lib ../technology/${technology}/lib/max/MEM2_2048X32_slow.lib ../technology/${technology}/lib/max/pdkIO.lib ../technology/${technology}/lib/max/MEM2_512X32_slow.lib ../technology/${technology}/lib/max/MEM2_136X32_slow.lib ../technology/${technology}/lib/max/MEM2_128X16_slow.lib ../technology/${technology}/lib/max/MEM2_1024X32_slow.lib ../technology/${technology}/lib/max/MEM1_4096X32_slow.lib ../technology/${technology}/lib/max/MEM1_256X32_slow.lib ../technology/${technology}/lib/max/MEM1_1024X32_slow.lib ../technology/${technology}/lib/max/slow.lib ../technology/${technology}/lib/max/MEM2_128X32_slow.lib" 
set  libMinFiles  "../technology/${technology}/lib/min/pdkIO.lib ../technology/${technology}/lib/min/MEM2_512X32_slow.lib ../technology/${technology}/lib/min/MEM2_4096X32_slow.lib ../technology/${technology}/lib/min/MEM2_2048X32_slow.lib ../technology/${technology}/lib/min/MEM2_136X32_slow.lib ../technology/${technology}/lib/min/MEM2_128X16_slow.lib ../technology/${technology}/lib/min/MEM2_1024X32_slow.lib ../technology/${technology}/lib/min/MEM1_4096X32_slow.lib ../technology/${technology}/lib/min/MEM1_256X32_slow.lib ../technology/${technology}/lib/min/MEM1_1024X32_slow.lib ../technology/${technology}/lib/min/fast.lib ../technology/${technology}/lib/min/MEM2_128X32_slow.lib" 
set  lefFiles  "../technology/${technology}/lef/gsclib045.fixed2.lef ../technology/${technology}/lef/MEM2_128X32.lef ../technology/${technology}/lef/MEM1_256X32.lef ../technology/${technology}/lef/pads.lef" 
set  capTableMin  "../technology/${technology}/captbl/best/capTable" 
set  capTableMax  "../technology/${technology}/captbl/worst/capTable" 
set  qxMapFile  "../technology/${technology}/qx/mapFile" 
set  qxTechFile  "../technology/${technology}/qx/qrcTechFile" 
set  qxConfFile  "../technology/${technology}/qx/qrc.conf" 
 
