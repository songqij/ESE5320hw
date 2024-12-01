# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 15 \
    name hash_table \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename hash_table \
    op interface \
    ports { hash_table_address0 { O 15 vector } hash_table_ce0 { O 1 bit } hash_table_we0 { O 1 bit } hash_table_d0 { O 33 vector } hash_table_q0 { I 33 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hash_table'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 16 \
    name assoc_mem_quarter_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename assoc_mem_quarter_0 \
    op interface \
    ports { assoc_mem_quarter_0_address0 { O 5 vector } assoc_mem_quarter_0_ce0 { O 1 bit } assoc_mem_quarter_0_we0 { O 1 bit } assoc_mem_quarter_0_d0 { O 64 vector } assoc_mem_quarter_0_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'assoc_mem_quarter_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 17 \
    name assoc_mem_quarter_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename assoc_mem_quarter_1 \
    op interface \
    ports { assoc_mem_quarter_1_address0 { O 5 vector } assoc_mem_quarter_1_ce0 { O 1 bit } assoc_mem_quarter_1_we0 { O 1 bit } assoc_mem_quarter_1_d0 { O 64 vector } assoc_mem_quarter_1_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'assoc_mem_quarter_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 18 \
    name assoc_mem_quarter_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename assoc_mem_quarter_2 \
    op interface \
    ports { assoc_mem_quarter_2_address0 { O 5 vector } assoc_mem_quarter_2_ce0 { O 1 bit } assoc_mem_quarter_2_we0 { O 1 bit } assoc_mem_quarter_2_d0 { O 64 vector } assoc_mem_quarter_2_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'assoc_mem_quarter_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 19 \
    name assoc_mem_quarter_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename assoc_mem_quarter_3 \
    op interface \
    ports { assoc_mem_quarter_3_address0 { O 5 vector } assoc_mem_quarter_3_ce0 { O 1 bit } assoc_mem_quarter_3_we0 { O 1 bit } assoc_mem_quarter_3_d0 { O 64 vector } assoc_mem_quarter_3_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'assoc_mem_quarter_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 20 \
    name assoc_mem_value \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename assoc_mem_value \
    op interface \
    ports { assoc_mem_value_address0 { O 6 vector } assoc_mem_value_ce0 { O 1 bit } assoc_mem_value_we0 { O 1 bit } assoc_mem_value_d0 { O 12 vector } assoc_mem_value_q0 { I 12 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'assoc_mem_value'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name assoc_mem_fill_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_assoc_mem_fill_read \
    op interface \
    ports { assoc_mem_fill_read { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name key \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_key \
    op interface \
    ports { key { I 20 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name nextCode \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_nextCode \
    op interface \
    ports { nextCode { I 12 vector } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


