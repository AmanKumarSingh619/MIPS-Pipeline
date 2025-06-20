# MIPS-Pipeline Processor

> A simplified 5-stage pipelined MIPS processor written in Verilog, implementing IF, ID, EX, MEM, WB stages with hazard detection and forwarding.

---

## 🔧 Features
- Implements all five classic MIPS pipeline stages
- Detects and resolves data hazards (stalling and forwarding logic)
- Control hazard handling with basic branch mechanism
- Modular RTL structure for each pipeline stage
- Pure combinational plus pipeline flip-flops—ready for synthesis
