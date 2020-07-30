create_clock -period 15.000 -name CLK -waveform {0.000 7.500} [get_ports CLK]

set_property PACKAGE_PIN V14 [get_ports {GPIO[1]}]
set_property PACKAGE_PIN M18 [get_ports CLK]
set_property PACKAGE_PIN U16 [get_ports {GPIO[3]}]
set_property PACKAGE_PIN W17 [get_ports {GPIO[9]}]
set_property PACKAGE_PIN W14 [get_ports {GPIO[5]}]
set_property PACKAGE_PIN V17 [get_ports {GPIO[11]}]
set_property PACKAGE_PIN T18 [get_ports {GPIO[15]}]
set_property PACKAGE_PIN U18 [get_ports {GPIO[13]}]
set_property PACKAGE_PIN W16 [get_ports {GPIO[10]}]
set_property PACKAGE_PIN T17 [get_ports RESET]
set_property PACKAGE_PIN V16 [get_ports {GPIO[12]}]
set_property PACKAGE_PIN V15 [get_ports {GPIO[8]}]
set_property PACKAGE_PIN W13 [get_ports {GPIO[6]}]
set_property PACKAGE_PIN V13 [get_ports {GPIO[2]}]
set_property PACKAGE_PIN U14 [get_ports {GPIO[0]}]
set_property PACKAGE_PIN U17 [get_ports {GPIO[14]}]
set_property PACKAGE_PIN W15 [get_ports {GPIO[7]}]
set_property PACKAGE_PIN U15 [get_ports {GPIO[4]}]

set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports CLK]
set_property IOSTANDARD LVCMOS18 [get_ports RESET]

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
