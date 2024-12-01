# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name compressed_size_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_compressed_size_stream \
    op interface \
    ports { compressed_size_stream_dout { I 32 vector } compressed_size_stream_empty_n { I 1 bit } compressed_size_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name output_hw_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_hw_stream \
    op interface \
    ports { output_hw_stream_dout { I 8 vector } output_hw_stream_empty_n { I 1 bit } output_hw_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name aximm2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_aximm2 \
    op interface \
    ports { m_axi_aximm2_AWVALID { O 1 bit } m_axi_aximm2_AWREADY { I 1 bit } m_axi_aximm2_AWADDR { O 64 vector } m_axi_aximm2_AWID { O 1 vector } m_axi_aximm2_AWLEN { O 32 vector } m_axi_aximm2_AWSIZE { O 3 vector } m_axi_aximm2_AWBURST { O 2 vector } m_axi_aximm2_AWLOCK { O 2 vector } m_axi_aximm2_AWCACHE { O 4 vector } m_axi_aximm2_AWPROT { O 3 vector } m_axi_aximm2_AWQOS { O 4 vector } m_axi_aximm2_AWREGION { O 4 vector } m_axi_aximm2_AWUSER { O 1 vector } m_axi_aximm2_WVALID { O 1 bit } m_axi_aximm2_WREADY { I 1 bit } m_axi_aximm2_WDATA { O 8 vector } m_axi_aximm2_WSTRB { O 1 vector } m_axi_aximm2_WLAST { O 1 bit } m_axi_aximm2_WID { O 1 vector } m_axi_aximm2_WUSER { O 1 vector } m_axi_aximm2_ARVALID { O 1 bit } m_axi_aximm2_ARREADY { I 1 bit } m_axi_aximm2_ARADDR { O 64 vector } m_axi_aximm2_ARID { O 1 vector } m_axi_aximm2_ARLEN { O 32 vector } m_axi_aximm2_ARSIZE { O 3 vector } m_axi_aximm2_ARBURST { O 2 vector } m_axi_aximm2_ARLOCK { O 2 vector } m_axi_aximm2_ARCACHE { O 4 vector } m_axi_aximm2_ARPROT { O 3 vector } m_axi_aximm2_ARQOS { O 4 vector } m_axi_aximm2_ARREGION { O 4 vector } m_axi_aximm2_ARUSER { O 1 vector } m_axi_aximm2_RVALID { I 1 bit } m_axi_aximm2_RREADY { O 1 bit } m_axi_aximm2_RDATA { I 8 vector } m_axi_aximm2_RLAST { I 1 bit } m_axi_aximm2_RID { I 1 vector } m_axi_aximm2_RUSER { I 1 vector } m_axi_aximm2_RRESP { I 2 vector } m_axi_aximm2_BVALID { I 1 bit } m_axi_aximm2_BREADY { O 1 bit } m_axi_aximm2_BRESP { I 2 vector } m_axi_aximm2_BID { I 1 vector } m_axi_aximm2_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name gmem \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem \
    op interface \
    ports { m_axi_gmem_AWVALID { O 1 bit } m_axi_gmem_AWREADY { I 1 bit } m_axi_gmem_AWADDR { O 64 vector } m_axi_gmem_AWID { O 1 vector } m_axi_gmem_AWLEN { O 32 vector } m_axi_gmem_AWSIZE { O 3 vector } m_axi_gmem_AWBURST { O 2 vector } m_axi_gmem_AWLOCK { O 2 vector } m_axi_gmem_AWCACHE { O 4 vector } m_axi_gmem_AWPROT { O 3 vector } m_axi_gmem_AWQOS { O 4 vector } m_axi_gmem_AWREGION { O 4 vector } m_axi_gmem_AWUSER { O 1 vector } m_axi_gmem_WVALID { O 1 bit } m_axi_gmem_WREADY { I 1 bit } m_axi_gmem_WDATA { O 32 vector } m_axi_gmem_WSTRB { O 4 vector } m_axi_gmem_WLAST { O 1 bit } m_axi_gmem_WID { O 1 vector } m_axi_gmem_WUSER { O 1 vector } m_axi_gmem_ARVALID { O 1 bit } m_axi_gmem_ARREADY { I 1 bit } m_axi_gmem_ARADDR { O 64 vector } m_axi_gmem_ARID { O 1 vector } m_axi_gmem_ARLEN { O 32 vector } m_axi_gmem_ARSIZE { O 3 vector } m_axi_gmem_ARBURST { O 2 vector } m_axi_gmem_ARLOCK { O 2 vector } m_axi_gmem_ARCACHE { O 4 vector } m_axi_gmem_ARPROT { O 3 vector } m_axi_gmem_ARQOS { O 4 vector } m_axi_gmem_ARREGION { O 4 vector } m_axi_gmem_ARUSER { O 1 vector } m_axi_gmem_RVALID { I 1 bit } m_axi_gmem_RREADY { O 1 bit } m_axi_gmem_RDATA { I 32 vector } m_axi_gmem_RLAST { I 1 bit } m_axi_gmem_RID { I 1 vector } m_axi_gmem_RUSER { I 1 vector } m_axi_gmem_RRESP { I 2 vector } m_axi_gmem_BVALID { I 1 bit } m_axi_gmem_BREADY { O 1 bit } m_axi_gmem_BRESP { I 2 vector } m_axi_gmem_BID { I 1 vector } m_axi_gmem_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name compressed_data \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_compressed_data \
    op interface \
    ports { compressed_data_dout { I 64 vector } compressed_data_empty_n { I 1 bit } compressed_data_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name compressed_size \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_compressed_size \
    op interface \
    ports { compressed_size_dout { I 64 vector } compressed_size_empty_n { I 1 bit } compressed_size_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


