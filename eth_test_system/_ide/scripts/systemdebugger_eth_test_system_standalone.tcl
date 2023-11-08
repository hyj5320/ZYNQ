# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\verilog\target_board\project_1\workspace2\eth_test_system\_ide\scripts\systemdebugger_eth_test_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\verilog\target_board\project_1\workspace2\eth_test_system\_ide\scripts\systemdebugger_eth_test_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
source C:/Xilinx/Vitis/2023.1/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Platform Cable USB II 00001c7348d201" && level==0 && jtag_device_ctx=="jsn-DLC10-00001c7348d201-04721093-0"}
fpga -file C:/verilog/target_board/project_1/workspace2/eth_test/_ide/bitstream/design_1_eth_test.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/verilog/target_board/project_1/workspace2/design_1_eth_test/export/design_1_eth_test/hw/design_1_eth_test.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow C:/verilog/target_board/project_1/workspace2/design_1_eth_test/export/design_1_eth_test/sw/design_1_eth_test/boot/fsbl.elf
set bp_12_2_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_12_2_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow C:/verilog/target_board/project_1/workspace2/eth_test/Debug/eth_test.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
