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
    id 79 \
    name result5 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_result5 \
    op interface \
    ports { result5_dout { I 32 vector } result5_empty_n { I 1 bit } result5_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name b2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_b2 \
    op interface \
    ports { m_axi_b2_AWVALID { O 1 bit } m_axi_b2_AWREADY { I 1 bit } m_axi_b2_AWADDR { O 64 vector } m_axi_b2_AWID { O 1 vector } m_axi_b2_AWLEN { O 32 vector } m_axi_b2_AWSIZE { O 3 vector } m_axi_b2_AWBURST { O 2 vector } m_axi_b2_AWLOCK { O 2 vector } m_axi_b2_AWCACHE { O 4 vector } m_axi_b2_AWPROT { O 3 vector } m_axi_b2_AWQOS { O 4 vector } m_axi_b2_AWREGION { O 4 vector } m_axi_b2_AWUSER { O 1 vector } m_axi_b2_WVALID { O 1 bit } m_axi_b2_WREADY { I 1 bit } m_axi_b2_WDATA { O 512 vector } m_axi_b2_WSTRB { O 64 vector } m_axi_b2_WLAST { O 1 bit } m_axi_b2_WID { O 1 vector } m_axi_b2_WUSER { O 1 vector } m_axi_b2_ARVALID { O 1 bit } m_axi_b2_ARREADY { I 1 bit } m_axi_b2_ARADDR { O 64 vector } m_axi_b2_ARID { O 1 vector } m_axi_b2_ARLEN { O 32 vector } m_axi_b2_ARSIZE { O 3 vector } m_axi_b2_ARBURST { O 2 vector } m_axi_b2_ARLOCK { O 2 vector } m_axi_b2_ARCACHE { O 4 vector } m_axi_b2_ARPROT { O 3 vector } m_axi_b2_ARQOS { O 4 vector } m_axi_b2_ARREGION { O 4 vector } m_axi_b2_ARUSER { O 1 vector } m_axi_b2_RVALID { I 1 bit } m_axi_b2_RREADY { O 1 bit } m_axi_b2_RDATA { I 512 vector } m_axi_b2_RLAST { I 1 bit } m_axi_b2_RID { I 1 vector } m_axi_b2_RUSER { I 1 vector } m_axi_b2_RRESP { I 2 vector } m_axi_b2_BVALID { I 1 bit } m_axi_b2_BREADY { O 1 bit } m_axi_b2_BRESP { I 2 vector } m_axi_b2_BID { I 1 vector } m_axi_b2_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name output_r \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_r \
    op interface \
    ports { output_r_dout { I 64 vector } output_r_empty_n { I 1 bit } output_r_read { O 1 bit } } \
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


