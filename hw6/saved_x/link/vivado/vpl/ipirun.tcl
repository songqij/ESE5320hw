# This file automatically generated by vpl
# please do not modify
set local_dir ".local"
source -notrace "$local_dir/ocl_util.tcl"
source -notrace "$local_dir/log_active_task.tcl"
source -notrace "$local_dir/platform.tcl"
source -notrace "$local_dir/debug_profile.tcl"
source -notrace "$local_dir/debug_profile_util.tcl"
source -notrace "$local_dir/debug_hw.tcl"
source -notrace "$local_dir/profile.tcl"

namespace eval ::optrace {
  variable script "ipirun.tcl"
  variable category "vpl"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

OPTRACE "ipirun" START { ROLLUP_0 }
set active_task_log "../../activetask.json"
set vivado_error_file "vivado_error.txt"
set vivado_warn_file "vivado_warning.txt"
set vivado_output_dir "output"
set output_dir "output"
set vpl_output_dir "/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/link/int"
set input_dir "input"
set steps_log "../../link.steps.log"
set kernel_ip_dirs {
  {/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/link/int/xo/ip_repo/xilinx_com_hls_mmult_fpga_1_0}}
set install_ip_cache "/mnt/pollux/software/xilinx/2020.2/Vitis/2020.2/data/cache/xilinx"


set impl_xdc [dict create \
];


set synth_xdc [dict create \
];

set utilization [dict create \
  luts                   57906 \
  brams                  212 \
  registers              126854 \
  dsps                   360 \
];


set bus_sp_tags [list]
set bus_sp_indeces [list]

lappend bus_sp_tags HPC0_DDR_LOW HPC0
lappend bus_sp_indeces HPC0_DDR_LOW 0
lappend bus_sp_tags HPC1_DDR_LOW HPC1
lappend bus_sp_indeces HPC1_DDR_LOW 0
lappend bus_sp_tags HP0_DDR_LOW HP0
lappend bus_sp_indeces HP0_DDR_LOW 0
lappend bus_sp_tags HP1_DDR_LOW HP1
lappend bus_sp_indeces HP1_DDR_LOW 0
lappend bus_sp_tags HP2_DDR_LOW HP2
lappend bus_sp_indeces HP2_DDR_LOW 0
lappend bus_sp_tags HP3_DDR_LOW HP3
lappend bus_sp_indeces HP3_DDR_LOW 0

set hw_platform_info [dict create \
  hw_platform_dir              ".local/hw_platform" \
  hw_platform_file             "/mnt/seas/home1/e/ese5320/u96v2_sbc_base/hw/u96v2_sbc_base.xsa" \
  hw_platform_part             "xczu3eg-sbva484-1-i" \
  hw_platform_vbnv             "avnet.com:u96v2_sbc_base:u96v2_sbc_base:1.0" \
  bb_locked_dcp                "" \
  bb_synth_dcp                 "" \
  hw_platform_uses_pr           false \
  uses_pr_shell_dcp             false \
  pr_shell_dcp                 "" \
  hw_platform_state            "pre_synth" \
  ocl_region                   "" \
  dr_bd_name                   "u96v2_sbc_base.bd" \
  utilization                   $utilization \
  hw_platform_dr_bd            "" \
  hw_platform_rebuild_tcl      ".local/hw_platform/prj/rebuild.tcl" \
  pre_sys_link_tcl               "" \
  post_sys_link_tcl              "" \
  pre_sys_link_overlay_tcl       "" \
  post_sys_link_overlay_tcl      "" \
  post_debug_profile_overlay_tcl "" \
  pre_create_project_tcl         "" \
  user_pre_create_project_tcl    "" \
  user_pre_sys_link_tcl          "" \
  user_post_sys_link_tcl         "" \
  user_pre_sys_link_overlay_tcl  "" \
  user_post_sys_link_overlay_tcl "" \
  user_post_debug_profile_overlay_tcl "" \
  synth_xdc                     $synth_xdc \
  impl_xdc                      $impl_xdc \
  hw_platform_ip_repo          ".local/hw_platform/iprepo" \
  hw_platform_ip_cache         ".local/hw_platform/ipcache" \
  emu_user_ip_repo             "" \
  emu_src_dir                  "" \
  emu_pfm_metadata_version     "Legacy" \
  contains_emu_dir              false \
  hw_platform_board_repo       ".local/hw_platform/board" \
  hw_platform_bconn_locked      {} \
  hw_platform_bconn_unlocked    {} \
  hw_platform_board_part       "avnet.com:ultra96v2:part0:1.2" \
  link_output_format           "bitstream" \
  xpfm_file                    "/mnt/seas/home1/e/ese5320/u96v2_sbc_base/u96v2_sbc_base.xpfm" \
  bus_sp_tags                   $bus_sp_tags \
  bus_sp_indeces                $bus_sp_indeces\
  design_intent_server_managed  false \
  design_intent_external_host   false \
  design_intent_datacenter      false \
  design_intent_embedded        true \
];


set config_info [dict create \
  proj_name                "prj" \
  emu_proj_name            "prj" \
  design_name              "dr" \
  out_partial_bitstream    "$vpl_output_dir/partial.bit" \
  out_partial_pdi          "$vpl_output_dir/partial.pdi" \
  out_partial_clear_bit    "$vpl_output_dir/partial_clear.bit" \
  out_full_bitstream       "$vpl_output_dir/system.bit" \
  out_full_pdi             "$vpl_output_dir/system.pdi" \
  out_mcs                  "$vpl_output_dir/system.mcs" \
  out_primary_mcs          "$vpl_output_dir/system_primary.mcs" \
  out_secondary_mcs        "$vpl_output_dir/system_secondary.mcs" \
  enable_dont_partition     true \
  enable_util_report        true \
  utilization_threshold     0.8 \
  generate_script_only      false \
  run_script_map_file      "" \
  clbinary_name            "kernel" \
  kernels                  "mmult_fpga" \
  steps_log                 $steps_log \
  impl_from_step           "" \
  impl_to_step             "" \
  num_jobs_synth            8 \
  num_jobs_impl             0 \
  lsf_string_synth         {} \
  lsf_string_impl          {} \
  strategies_impl          {} \
  wait_on_all_impl_runs     false \
  optimize_level            0 \
  is_hw_emu                 false \
  is_hw_emu_rebuild_flow    false \
  user_ip_repo              {} \
  kernel_ip_dirs            $kernel_ip_dirs \
  no_hw_platform_ip_cache   false \
  no_install_ip_cache       false \
  install_ip_cache          $install_ip_cache \
  no_ip_cache               false \
  remote_ip_cache          "/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/.ipcache" \
  user_board_repo           {} \
  user_bconn                {} \
  dr_bd_tcl                ".local/dr.bd.tcl" \
  webtalk_flag             "Vitis" \
  encrypt_impl_dcp          false \
  encrypt_key_file         "" \
  enable_pr_verify          false \
  return_pre_sys_link_tcl   false \
  return_pre_synth          false \
  return_post_synth         false \
  return_pre_impl           false \
  disable_run_configs       false \
  protocol_checker          false \
  hw_emu_profiling          true \
  kernel_tlm_model_instances none \
  scripts_dir              "scripts" \
  output_dir               "$output_dir" \
  vivado_output_dir        "$vivado_output_dir" \
  vpl_output_dir           "$vpl_output_dir" \
  input_dir                "$input_dir" \
  local_dir                "$local_dir" \
  tclhook_prefix           "_vpl" \
  partition_def            "my_pd" \
  reconfig_module          "" \
  pr_config_name           "config_1" \
  failfast_config          {} \
  enable_explicit_emu_data  false \
  is_debug_enabled           "1" \
  aie_archive_file         "/mnt/castor/seas_home/s/songqij/ese532_code/hw6/apps/mmult/_x/link/int/system.aieprj" \
  system_dpa_enabled       "1" \
  is_hw_export              false \
  fixed_xsa                "vpl_gen_fixed.xsa" \
  gen_fixed_xsa_in_top_prj "0" \
  is_incr_hw_emu           "0" \
  nifd_enabled             "0" \
  is_versal                false \
  ip_param_tcl             "$vpl_output_dir/ip_param.tcl" \
  isNewXSa 0 \
];


set kernel_clock_freqs [dict create \
];

set system_clock_freqs [dict create \
];

set clk_info [dict create \
  kernel_clock_freqs         $kernel_clock_freqs \
  system_clock_freqs         $system_clock_freqs \
  worst_negative_slack      0 \
  max_frequency             650 \
  min_frequency             10 \
  error_on_hold_violation   true \
  skip_timing_and_scaling   false \
  enable_auto_freq_scale    false \
];

set dict_debug [dict create \
  version "1.0" \
];
dict set dict_debug kernel_debug false
set dict_profile [dict create \
  NAME profile_monitors \
  FIFO "8192" \
  AIE [list] \
  DATA [list] \
  STALL [list] \
  EXEC [list] \
  AIE_TRACE_EVENT_PACKET_RATE "0" \
  AIE_TRACE_PROFILE_STREAMS "0" \
];
set debug_profile_info [dict create debug $dict_debug profile $dict_profile]

dict set config_info synth_props_tcl "scripts/_vivado_synth_props.tcl"
dict set config_info impl_props_tcl "scripts/_vivado_impl_props.tcl"
dict set config_info report_commands_tcl "scripts/_vivado_report_commands.tcl"

OPTRACE "ipirun" END { }

