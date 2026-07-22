# rtl_2_dgsii


RTL to GDSII ASIC implementation using OpenLane and the Sky130.

### Overview

---

This project walks through the stages of taking an RTL design 
**(RV32I CPU RTL Design)** through to a physical chip layout file
**(GDSII or OASIS)** that can be manufactured by a semiconductor fabrication plant **(fab)**.

```text
RTL
 ↓
Logic Synthesis
 ↓
Floorplanning
 ↓
Placement
 ↓
Clock Tree Synthesis (CTS)
 ↓
Routing
 ↓
Static Timing Analysis (STA)
 ↓
Physical Verification (DRC/LVS)
 ↓
GDSII / OASIS
```
