set ::env(DESIGN_NAME) csa_da_openlane

set ::env(VERILOG_FILES) "\
$::env(DESIGN_DIR)/src/csa_da_openlane.v"

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk"

# Dummy clock period (OpenLane expects one)
set ::env(CLOCK_PERIOD) "30"

# Floorplan settings
#set ::env(FP_CORE_UTIL) 20
#set ::env(PL_TARGET_DENSITY) 0.25


set ::env(FP_SIZING) absolute

set ::env(DIE_AREA) "0 0 400 400"

set ::env(CORE_AREA) "20 20 360 360"

set ::env(FP_ASPECT_RATIO) 1

set ::env(FP_PDN_CORE_RING) 1

set ::env(FP_PDN_CORE_RING_VWIDTH) 3
set ::env(FP_PDN_CORE_RING_HWIDTH) 3

set ::env(FP_PDN_CORE_RING_VSPACING) 2
set ::env(FP_PDN_CORE_RING_HSPACING) 2

#pin config path
set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg


# Run synthesis with ABC
set ::env(SYNTH_STRATEGY) "DELAY 1"

# Placement settings
set ::env(PL_TARGET_DENSITY) 0.50
set ::env(CELL_PAD) 2


# Routing controls
set ::env(RT_MIN_LAYER) met1
set ::env(RT_MAX_LAYER) met5
