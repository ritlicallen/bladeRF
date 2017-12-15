

package require -exact qsys 13.0
source ../scripts/adi_env.tcl
source ../scripts/adi_ip_alt.tcl

set_module_property NAME axi_hdmi_tx
set_module_property DESCRIPTION "AXI HDMI Transmit Interface"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME axi_hdmi_tx

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL axi_hdmi_tx
add_fileset_file MULT_MACRO.v             VERILOG PATH $ad_hdl_dir/library/common/altera/MULT_MACRO.v
add_fileset_file ad_mem.v                 VERILOG PATH $ad_hdl_dir/library/common/ad_mem.v
add_fileset_file ad_rst.v                 VERILOG PATH $ad_hdl_dir/library/common/ad_rst.v
add_fileset_file ad_csc_1_mul.v           VERILOG PATH $ad_hdl_dir/library/common/ad_csc_1_mul.v
add_fileset_file ad_csc_1_add.v           VERILOG PATH $ad_hdl_dir/library/common/ad_csc_1_add.v
add_fileset_file ad_csc_1.v               VERILOG PATH $ad_hdl_dir/library/common/ad_csc_1.v
add_fileset_file ad_csc_RGB2CrYCb.v       VERILOG PATH $ad_hdl_dir/library/common/ad_csc_RGB2CrYCb.v
add_fileset_file ad_ss_444to422.v         VERILOG PATH $ad_hdl_dir/library/common/ad_ss_444to422.v
add_fileset_file up_axi.v                 VERILOG PATH $ad_hdl_dir/library/common/up_axi.v
add_fileset_file up_xfer_cntrl.v          VERILOG PATH $ad_hdl_dir/library/common/up_xfer_cntrl.v
add_fileset_file up_xfer_status.v         VERILOG PATH $ad_hdl_dir/library/common/up_xfer_status.v
add_fileset_file up_clock_mon.v           VERILOG PATH $ad_hdl_dir/library/common/up_clock_mon.v
add_fileset_file up_hdmi_tx.v             VERILOG PATH $ad_hdl_dir/library/common/up_hdmi_tx.v
add_fileset_file axi_hdmi_tx_vdma.v       VERILOG PATH axi_hdmi_tx_vdma.v
add_fileset_file axi_hdmi_tx_es.v         VERILOG PATH axi_hdmi_tx_es.v
add_fileset_file axi_hdmi_tx_core.v       VERILOG PATH axi_hdmi_tx_core.v
add_fileset_file axi_hdmi_tx.v            VERILOG PATH axi_hdmi_tx.v TOP_LEVEL_FILE
add_fileset_file ad_axi_ip_constr.sdc     SDC     PATH $ad_hdl_dir/library/common/ad_axi_ip_constr.sdc
add_fileset_file axi_hdmi_tx_constr.sdc   SDC     PATH axi_hdmi_tx_constr.sdc

# parameters

add_parameter ID INTEGER 0
set_parameter_property ID DEFAULT_VALUE 0
set_parameter_property ID DISPLAY_NAME ID
set_parameter_property ID TYPE INTEGER
set_parameter_property ID UNITS None
set_parameter_property ID HDL_PARAMETER true

add_parameter CR_CB_N INTEGER 0
set_parameter_property CR_CB_N DEFAULT_VALUE 0
set_parameter_property CR_CB_N DISPLAY_NAME CR_CB_N
set_parameter_property CR_CB_N TYPE INTEGER
set_parameter_property CR_CB_N UNITS None
set_parameter_property CR_CB_N HDL_PARAMETER true

add_parameter DEVICE_TYPE INTEGER 0
set_parameter_property DEVICE_TYPE DEFAULT_VALUE 16
set_parameter_property DEVICE_TYPE DISPLAY_NAME DEVICE_TYPE
set_parameter_property DEVICE_TYPE TYPE INTEGER
set_parameter_property DEVICE_TYPE UNITS None
set_parameter_property DEVICE_TYPE HDL_PARAMETER true

add_parameter EMBEDDED_SYNC INTEGER 0
set_parameter_property EMBEDDED_SYNC DEFAULT_VALUE 0
set_parameter_property EMBEDDED_SYNC DISPLAY_NAME EMBEDDED_SYNC
set_parameter_property EMBEDDED_SYNC TYPE INTEGER
set_parameter_property EMBEDDED_SYNC UNITS None
set_parameter_property EMBEDDED_SYNC HDL_PARAMETER true

# axi4 slave

add_interface s_axi_clock clock end
add_interface_port s_axi_clock s_axi_aclk clk Input 1

add_interface s_axi_reset reset end
set_interface_property s_axi_reset associatedClock s_axi_clock
add_interface_port s_axi_reset s_axi_aresetn reset_n Input 1

add_interface s_axi axi4lite end
set_interface_property s_axi associatedClock s_axi_clock
set_interface_property s_axi associatedReset s_axi_reset
add_interface_port s_axi s_axi_awvalid awvalid Input 1
add_interface_port s_axi s_axi_awaddr awaddr Input 16
add_interface_port s_axi s_axi_awprot awprot Input 3
add_interface_port s_axi s_axi_awready awready Output 1
add_interface_port s_axi s_axi_wvalid wvalid Input 1
add_interface_port s_axi s_axi_wdata wdata Input 32
add_interface_port s_axi s_axi_wstrb wstrb Input 4
add_interface_port s_axi s_axi_wready wready Output 1
add_interface_port s_axi s_axi_bvalid bvalid Output 1
add_interface_port s_axi s_axi_bresp bresp Output 2
add_interface_port s_axi s_axi_bready bready Input 1
add_interface_port s_axi s_axi_arvalid arvalid Input 1
add_interface_port s_axi s_axi_araddr araddr Input 16
add_interface_port s_axi s_axi_arprot arprot Input 3
add_interface_port s_axi s_axi_arready arready Output 1
add_interface_port s_axi s_axi_rvalid rvalid Output 1
add_interface_port s_axi s_axi_rresp rresp Output 2
add_interface_port s_axi s_axi_rdata rdata Output 32
add_interface_port s_axi s_axi_rready rready Input 1

# hdmi interface

add_interface hdmi_clock clock end
add_interface_port hdmi_clock hdmi_clk clk Input 1

add_interface hdmi_if conduit end
set_interface_property hdmi_if associatedClock hdmi_clock
add_interface_port hdmi_if hdmi_out_clk h_clk Output 1
add_interface_port hdmi_if hdmi_16_hsync h16_hsync Output 1
add_interface_port hdmi_if hdmi_16_vsync h16_vsync Output 1
add_interface_port hdmi_if hdmi_16_data_e h16_data_e Output 1
add_interface_port hdmi_if hdmi_16_data h16_data Output 16
add_interface_port hdmi_if hdmi_16_es_data h16_es_data Output 16
add_interface_port hdmi_if hdmi_24_hsync h24_hsync Output 1
add_interface_port hdmi_if hdmi_24_vsync h24_vsync Output 1
add_interface_port hdmi_if hdmi_24_data_e h24_data_e Output 1
add_interface_port hdmi_if hdmi_24_data h24_data Output 24
add_interface_port hdmi_if hdmi_36_hsync h36_hsync Output 1
add_interface_port hdmi_if hdmi_36_vsync h36_vsync Output 1
add_interface_port hdmi_if hdmi_36_data_e h36_data_e Output 1
add_interface_port hdmi_if hdmi_36_data h36_data Output 36

# avalon streaming dma

add_interface vdma_clock  clock end
add_interface_port vdma_clock vdma_clk clk Input 1

add_interface vdma_if avalon_streaming end
set_interface_property vdma_if associatedClock vdma_clock
add_interface_port vdma_if vdma_valid valid Input 1
add_interface_port vdma_if vdma_data data Input 64
add_interface_port vdma_if vdma_ready ready Output 1

# frame sync

ad_alt_intf signal  vdma_fs       output  1
ad_alt_intf signal  vdma_fs_ret   input   1

