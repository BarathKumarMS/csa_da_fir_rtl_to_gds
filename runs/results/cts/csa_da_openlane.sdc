###############################################################################
# Created by write_sdc
# Fri Jun 26 17:20:59 2026
###############################################################################
current_design csa_da_openlane
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 30.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[0]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[1]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[2]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[3]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[4]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[5]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[6]}]
set_input_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {x[7]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[0]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[10]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[11]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[12]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[13]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[14]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[15]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[1]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[2]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[3]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[4]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[5]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[6]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[7]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[8]}]
set_output_delay 6.0000 -clock [get_clocks {clk}] -add_delay [get_ports {led[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {led[15]}]
set_load -pin_load 0.0334 [get_ports {led[14]}]
set_load -pin_load 0.0334 [get_ports {led[13]}]
set_load -pin_load 0.0334 [get_ports {led[12]}]
set_load -pin_load 0.0334 [get_ports {led[11]}]
set_load -pin_load 0.0334 [get_ports {led[10]}]
set_load -pin_load 0.0334 [get_ports {led[9]}]
set_load -pin_load 0.0334 [get_ports {led[8]}]
set_load -pin_load 0.0334 [get_ports {led[7]}]
set_load -pin_load 0.0334 [get_ports {led[6]}]
set_load -pin_load 0.0334 [get_ports {led[5]}]
set_load -pin_load 0.0334 [get_ports {led[4]}]
set_load -pin_load 0.0334 [get_ports {led[3]}]
set_load -pin_load 0.0334 [get_ports {led[2]}]
set_load -pin_load 0.0334 [get_ports {led[1]}]
set_load -pin_load 0.0334 [get_ports {led[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {x[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
