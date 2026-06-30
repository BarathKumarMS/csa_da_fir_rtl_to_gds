# CSA-Based Distributed Arithmetic FIR Filter: RTL-to-GDS Implementation using OpenLane and SKY130

A complete RTL-to-GDS implementation of a **16-Tap Carry Save Adder (CSA) based Distributed Arithmetic (DA) FIR Filter** using the OpenLane ASIC flow and the SKY130 Open PDK. The project demonstrates the complete open-source ASIC implementation flow, starting from synthesizable Verilog RTL and ending with the generation of the final GDSII layout.

---

## Overview

Finite Impulse Response (FIR) filters are fundamental components of Digital Signal Processing (DSP) systems and are widely used in image processing, wireless communication, biomedical instrumentation, radar, and audio processing. Traditional FIR filters require multiple hardware multipliers, which increase silicon area, power consumption, and propagation delay.

This project presents a **hardware-efficient FIR filter** that combines three optimization techniques:

- **Distributed Arithmetic (DA)** to eliminate hardware multipliers
- **Carry Save Adders (CSA)** to accelerate multi-operand accumulation
- **Deep Pipelining** to reduce the critical path and improve timing performance

The complete design has been synthesized, floorplanned, placed, routed, and physically verified using the **OpenLane RTL-to-GDS flow** targeting the **SKY130 HD Standard Cell Library**.

---

# Key Features

- 16-Tap FIR Filter
- Multiplier-less implementation using Distributed Arithmetic
- Multi-stage Carry Save Adder accumulation
- Deep pipelined architecture
- Fully synthesizable Verilog RTL
- Functional verification using Verilog testbench
- Complete RTL-to-GDS implementation
- Open-source ASIC implementation using OpenLane
- Physical verification using DRC, LVS and STA

---

# Hardware Optimizations

| Optimization | Description |
|--------------|-------------|
| Distributed Arithmetic | Eliminates conventional multipliers using bit-level coefficient accumulation |
| Carry Save Adder | Reduces carry propagation delay during accumulation |
| Pipelining | Registers inserted after major computation stages to improve operating frequency |

---

# Design Architecture

```
                Input Sample
                     │
                     ▼
          16-Tap Shift Register
                     │
                     ▼
     Distributed Arithmetic Unit
      (Bit-Level Partial Sum Generation)
                     │
                     ▼
          Bit Weight Scaling
                     │
                     ▼
            CSA Stage 1
                     │
                     ▼
            CSA Stage 2
                     │
                     ▼
            CSA Stage 3
                     │
                     ▼
            CSA Stage 4
                     │
                     ▼
            CSA Stage 5
                     │
                     ▼
      Final Carry Propagate Adder
                     │
                     ▼
            Output Register
                     │
                     ▼
                FIR Output
```

The architecture combines **Distributed Arithmetic**, **Carry Save Adders**, and **multi-stage pipelining** to achieve a hardware-efficient implementation with improved timing characteristics.

---

# ASIC Design Flow

```
RTL Design
     │
     ▼
Functional Verification
     │
     ▼
Logic Synthesis
     │
     ▼
Floorplanning
     │
     ▼
Placement
     │
     ▼
Clock Tree Synthesis
     │
     ▼
Global & Detailed Routing
     │
     ▼
Static Timing Analysis
     │
     ▼
DRC / LVS Verification
     │
     ▼
GDSII Generation
```

---

# Repository Structure

```
csa_da_fir_rtl_to_gds/
│
├── csa_da_fir/
│   ├── src/
│   ├── csa_tb.v
│   ├── csa_da_openlane.vcd
│   ├── config.tcl
│   ├── pin_order.cfg
│   ├── schematic.pdf
│   └── README.md
│
├── images/
│   ├── floorplan.png
│   ├── placement.png
│   ├── cts.png
│   ├── routing.png
│   ├── gds.png
│   └── README.md
│
├── runs/
│   ├── reports/
│   ├── results/
│   └── README.md
│
├── LICENSE
└── README.md
```

---

# Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| OpenLane | RTL-to-GDS Flow |
| OpenROAD | Physical Design |
| Yosys | Logic Synthesis |
| OpenSTA | Static Timing Analysis |
| Magic | DRC & Layout |
| Netgen | LVS Verification |
| GTKWave | Functional Simulation |

---

# Technology

- SKY130 HD Standard Cell Library
- OpenLane
- OpenROAD

---

# Physical Design Flow

## Floorplanning

<p align="center">
<img src="images/floorplan.png" width="700">
</p>

Defines the die dimensions, core utilization, power distribution network, and I/O pin placement before physical implementation.

---

## Placement

<p align="center">
<img src="images/placement.png" width="700">
</p>

Places all synthesized standard cells while minimizing congestion and wire length.

---

## Clock Tree Synthesis

<p align="center">
<img src="images/cts.png" width="700">
</p>

Distributes the clock using inserted buffers to minimize skew and balance clock latency.

---

## Routing

<p align="center">
<img src="images/routing.png" width="700">
</p>

Performs global and detailed routing to establish all signal connections while satisfying routing and manufacturing constraints.

---

## Final GDSII Layout

<p align="center">
<img src="images/gds.png" width="700">
</p>

Final physical layout generated after successful routing, timing closure, DRC, LVS, and antenna verification.

---

# Implementation Summary

| Parameter | Value |
|-----------|--------|
| Design | CSA-Based Distributed Arithmetic FIR Filter |
| Top Module | `csa_da_openlane` |
| Filter Type | 16-Tap FIR |
| RTL Language | Verilog HDL |
| Arithmetic Technique | Distributed Arithmetic |
| Accumulation Architecture | Carry Save Adder |
| Pipeline Architecture | Multi-stage Pipelined |
| Technology | SKY130 HD Standard Cell Library |
| ASIC Flow | OpenLane RTL-to-GDS |
| Standard Cells | **4,657** |
| Sequential Cells | **438 Flip-Flops** |
| Total Physical Cells | **14,798** |
| Number of Wires | **4,645** |
| Number of Wire Bits | **4,667** |
| Core Area | **114,499.81 μm²** |
| Total Wire Length | **122,911 μm** |
| Total Vias | **35,500** |
| Timing Analysis | OpenSTA |
| Worst Negative Slack (WNS) | **0.00 ns** |
| Total Negative Slack (TNS) | **0.00 ns** |
| Worst Setup Slack | **22.65 ns** |
| Worst Hold Slack | **0.22 ns** |
| Critical Path Delay | **1.48 ns** |
| Estimated Total Power | **3.25 mW** |
| Functional Verification | Verilog Testbench |
| Physical Verification | DRC, LVS, STA |
| Generated Outputs | DEF, LEF, GDSII, LIB, SDF, SPEF, SPICE, Gate-Level Netlist |

---

# Performance Summary

| Metric | Result |
|--------|-------:|
| Standard Cells | **4,657** |
| Total Physical Cells | **14,798** |
| Flip-Flops | **438** |
| Core Area | **114,499.81 μm²** |
| Total Wire Length | **122,911 μm** |
| Total Vias | **35,500** |
| Critical Path Delay | **1.48 ns** |
| Worst Negative Slack | **0.00 ns** |
| Total Negative Slack | **0.00 ns** |
| Worst Setup Slack | **22.65 ns** |
| Worst Hold Slack | **0.22 ns** |
| Estimated Total Power | **3.25 mW** |

---

# Physical Verification

The design successfully completed the complete OpenLane RTL-to-GDS flow.

| Verification | Status |
|--------------|:------:|
| RTL Simulation | ✔ Passed |
| Logic Synthesis | ✔ Passed |
| Floorplanning | ✔ Completed |
| Placement | ✔ Completed |
| Clock Tree Synthesis | ✔ Completed |
| Routing | ✔ Completed |
| Static Timing Analysis | ✔ Passed |
| Magic DRC | ✔ Passed |
| LVS | ✔ Passed |
| Antenna Check | ✔ Passed |
| GDSII Generation | ✔ Completed |

---

# Generated Outputs

The OpenLane implementation generates the following design artifacts.

- GDSII Layout
- DEF
- LEF
- Liberty Timing Library
- Gate-Level Verilog Netlist
- SDF
- SPEF
- SPICE Netlist
- Magic Layout
- OpenDB Database

---

# Applications

- Digital Signal Processing
- Image Processing
- Audio Processing
- Biomedical Signal Analysis
- Wireless Communication
- FPGA and ASIC Accelerators
- Embedded DSP Systems

---

# Conclusion

This project demonstrates the complete RTL-to-GDS implementation of a **pipelined Carry Save Adder based Distributed Arithmetic FIR Filter** using the OpenLane ASIC flow and the SKY130 technology. By replacing conventional multipliers with Distributed Arithmetic, accelerating accumulation using a multi-stage Carry Save Adder architecture, and introducing pipeline registers throughout the datapath, the design achieves an area-efficient and timing-optimized hardware implementation. The successful completion of synthesis, floorplanning, placement, routing, timing analysis, DRC, LVS, and GDSII generation validates the proposed architecture for efficient ASIC-based digital signal processing applications.

---

# License

This project is licensed under the **MIT License**.
