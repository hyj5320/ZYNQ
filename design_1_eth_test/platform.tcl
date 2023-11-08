# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\verilog\target_board\project_1\workspace2\design_1_eth_test\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\verilog\target_board\project_1\workspace2\design_1_eth_test\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {design_1_eth_test}\
-hw {C:\verilog\target_board\project_1\bin\design_1_eth_test.xsa}\
-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {C:/verilog/target_board/project_1/workspace2}

platform write
domain create -name {freertos10_xilinx_psu_cortexa53_0} -display-name {freertos10_xilinx_psu_cortexa53_0} -os {freertos10_xilinx} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {freertos_lwip_tcp_perf_server}
platform generate -domains 
platform active {design_1_eth_test}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {freertos10_xilinx_psu_cortexa53_0}
platform generate -quick
platform generate
platform active {design_1_eth_test}
domain active {zynqmp_fsbl}
bsp reload
domain active {freertos10_xilinx_psu_cortexa53_0}
bsp reload
domain active {zynqmp_pmufw}
bsp reload
domain active {zynqmp_fsbl}
bsp reload
domain active {freertos10_xilinx_psu_cortexa53_0}
bsp config use_axieth_on_zynq "1"
bsp config use_emaclite_on_zynq "1"
bsp config use_emaclite_on_zynq "0"
bsp config lwip_tcp_keepalive "false"
bsp config no_sys_no_timers "true"
bsp config sgmii_fixed_link "false"
bsp config lwip_tcp_keepalive "false"
bsp config no_sys_no_timers "true"
bsp config sgmii_fixed_link "false"
bsp config api_mode "RAW_API"
bsp config sgmii_fixed_link "false"
bsp write
bsp reload
catch {bsp regenerate}
bsp config use_emaclite_on_zynq "1"
bsp config socket_mode_thread_prio "2"
bsp write
bsp reload
catch {bsp regenerate}
bsp config api_mode "SOCKET_API"
bsp write
bsp reload
catch {bsp regenerate}
platform active {design_1_eth_test}
bsp reload
platform generate -domains freertos10_xilinx_psu_cortexa53_0 
platform active {design_1_eth_test}
domain active {zynqmp_fsbl}
domain active {freertos10_xilinx_psu_cortexa53_0}
bsp reload
bsp reload
bsp reload
platform active {design_1_eth_test}
bsp write
platform generate -domains 
bsp write
platform generate -domains 
