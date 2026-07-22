# RV32I CPU

RISC-V 32-bit CPU implemented in SystemVerilog.

### Overview

---

This project implements a datapath and controller for the RV32I ISA.

Each instruction is executed over multiple clock cycles: 

```
Fetch -> Decode -> Execute -> Memory Access -> Writeback
```

### CPU Components

---

- **Register file:**  32 general-purpose 32-bit registers (x0–x31), x0 hardwired to zero
- **ALU:** performs arithmetic, logical, and shift operations
- **Immediate generator:** extract and sign-extend I/S/B/U/J type instructions.
- **Control unit:** decodes instructions and generate control signals to datapath.
- **Datapath:**  wire above components & perform data operations according to control signals.
