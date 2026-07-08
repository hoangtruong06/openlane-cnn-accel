# ========================================================================
# 1. DESIGN SPECIFICATION & SOURCE FILES
# ========================================================================

set ::env(DESIGN_NAME) "conv2d_accel"

# List of all RTL source files. 
set ::env(VERILOG_FILES) [list \
    $::env(DESIGN_DIR)/src/simple_sram.v \
    $::env(DESIGN_DIR)/src/conv_engine.v \
    $::env(DESIGN_DIR)/src/conv2d_accel.v \
]

# ========================================================================
# 2. TIMING & CLOCK CONSTRAINTS
# ========================================================================

# Defines the primary clock port of the design
set ::env(CLOCK_PORT) "clk"

# Target clock period in nanoseconds. (10.0 ns)
set ::env(CLOCK_PERIOD) 10.0

# Expected clock jitter and manufacturing margin (0.25 ns adds a safe buffer for timing checks)
set ::env(CLOCK_UNCERTAINTY) 0.25

# ========================================================================
# 3. SYNTHESIS STRATEGY
# ========================================================================

# optimize for speed/timing along the CNN datapath
set ::env(SYNTH_STRATEGY) "DELAY 0"

# ========================================================================
# 4. FLOORPLAN & PHYSICAL DIMENSIONS
# ========================================================================

# Core utilization percentage. 
# Set to 20% to leave plenty of empty routing tracks for the dense multiplier matrix.
set ::env(FP_CORE_UTIL) 20

# Shape of the chip.
set ::env(FP_ASPECT_RATIO) 1.0

# ========================================================================
# 5. PLACEMENT & CONGESTION CONTROL
# ========================================================================

# Target density for standard cell placement. 
# Aligned at 0.25 to prevent cells from packing too tightly and causing routing blocks.
set ::env(PL_TARGET_DENSITY) 0.25

# Increase padding between standard cells (Create space for wire routing)
set ::env(CELL_PAD) 4

# Pre-define congestion levels to help the tool detour
set ::env(GLB_ADJUSTMENT) 0.2

# Enables timing-driven optimizations 
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 1

# ========================================================================
# 6. ROUTING & METAL LAYERS
# ========================================================================

# signal routing up to Metal 5. 
set ::env(RT_MAX_LAYER) "met5"

# Enables automatic hold time fixing by inserting delay cells during the routing phase
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.05

# ========================================================================
# 7. FLOW CONTROL & DEBUGGING
# ========================================================================

# Set to 0 to prevent the flow from crashing midway if there are minor timing violations.
set ::env(QUIT_ON_TIMING_VIOLATIONS) 0
