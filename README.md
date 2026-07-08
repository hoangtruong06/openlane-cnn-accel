# CNN Accelerator - RTL to GDSII Implementation (Sky130)

This repository contains the RTL source code, physical design configurations, and final signoff reports for a custom 2D Convolutional Neural Network (CNN) Accelerator. The physical design flow (RTL-to-GDSII) was successfully implemented using the open-source **OpenLane** toolchain targeting the **SkyWater 130nm PDK**.


## 🛠 Technology & Toolchain
* **Technology Node:** SkyWater 130nm (`sky130A`)
* **EDA Toolchain:** OpenLane v1 (Yosys, OpenROAD, Magic, KLayout, Netgen, TritonRoute)
* **Hardware Description Language:** Verilog

## 📐 Architecture Overview
The CNN accelerator is designed to perform efficient 2D convolution operations. Key architectural components include:
* **MAC Units:** Implemented using custom K-multipliers for optimized multiply-accumulate operations.
* **Internal Memory:** A custom DFF-based SRAM memory array (Standard Cell-based) used for data and weight buffering.

## ⚙️ How to Reproduce
To run the flow on your local OpenLane environment:
1. Clone this repository into your OpenLane `designs/` folder:
   ```bash
   git clone <your-repo-link> designs/CNN_acc
   ```
2. Launch the OpenLane Docker container:
   ```bash
   make mount
   ```
3. Run the automated RTL-to-GDSII flow:
   ```bash
   ./flow.tcl -design CNN_acc -overwrite
   ```

## ✅ Verification & Signoff
* **Synthesis:** Multi-driver net collisions resolved at the RTL stage.
* **Timing:** Single-Corner and Multi-Corner Static Timing Analysis (STA) passed.
* **Clock Tree Synthesis (CTS):** Successfully balanced with minimal skew.
* **Physical Verification:** Magic DRC and Netgen LVS clean.

---
*I am always looking to learn and improve. I would greatly appreciate any feedback, suggestions, or best practices regarding ASIC physical design from the VLSI community!*
