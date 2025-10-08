# EDI — ELECTRONICS · DIGITAL · INSTRUMENTS

**Part of:** ASI-T2-INTELLIGENCE · **Domain:** EDI · **Category:** Knowledge Domain  
**Status:** Template · UTCS-anchored

---

## Overview

This domain curates the theoretical knowledge for **avionics, flight instruments, electronic displays, and integrated modular avionics (IMA)**. It serves as a **knowledge base** (ontologies, methods, standards, models, playbooks) that **informs and governs** program deliverables via PLM/CAx skills and MAP services.

Scope spans IMA partitions, LRUs/boxes, networked avionics (ARINC 429 / AFDX), display systems (ARINC 661), sensors/instruments, data buses & timing, cyber-secure integration, DO-160 environmental qualification, and certification evidence chains (DO-178C / DO-254 / ARP4754A / ARP4761A).

---

## Domain Definition (Canon)

**DOMAINS** are areas of **theoretical knowledge and specialization**. They are **not** program deliverables; they regulate them through PLM/CAx competencies and MAP orchestration.

---

## Directory Structure (canon paths)

```

EDI-ELECTRONICS-DIGITAL-INSTRUMENTS/
DELS/                  # Certification & compliance deliverables (LLC-scoped)
PLM/
CAD/                 # Enclosures, racks, panels, connector layouts
CAE/                 # Timing/latency models, reliability, thermal, EMC/EMI
CAO/                 # Requirements synthesis (DAL targets, latency/jitter budgets)
CAM/                 # Wiring harness build, panel fab, ATE/ICT fixtures
CAI/                 # ICDs (ARINC, AFDX VLs), APEX partitions, budgets
CAV/                 # V&V evidence (DO-178C/254/160, tool qual DO-330)
CAS/                 # Ops support (fault trees, BIT/BITE, spares)
CMP/                 # Governance (change control, SQA, cyber posture)
QUANTUM_OA/
GA/ LP/ MILP/ QAOA/ QOX/ QP/ QUBO/ SA/
PROCUREMENT/
VENDORSCOMPONENTS/   # LRUs, displays, SBCs, FPGAs, sensors, connectors
SUPPLIERS/
BIDS/                # Supplier proposals
SERVICES/            # Calibration, environmental test labs, DER services
policy/                # Domain policies & design guides (coding, partitioning)
tests/                 # Test data (timing logs, EMC scans, DO-160 reports)
utcs.json              # UTCS threading configuration
META.json              # Domain metadata
domain-config.yaml     # Domain configuration

```

---

## PLM/CAx Integration

| PLM/CAx | Agentic Skill | Purpose in EDI Domain |
| :--- | :--- | :--- |
| **CAD** | Geometric Interpretation Skill | Avionics racks, display bezels, connector & keep-out zones |
| **CAE** | Predictive Modeling Skill | Worst-case latency/jitter, reliability (MTBF), thermal, EMC/EMI |
| **CAO** | Requirements Synthesis Skill | DAL allocations, partition budgets, message deadlines & SILs |
| **CAM** | Manufacturing Synthesis Skill | Panel/HMI build, wire harness routing, fixture/tooling plans |
| **CAI** | Interface Coordination Skill | ICDs: ARINC 429/664, ARINC 653 partitions, ARINC 661 widgets |
| **CAV** | Verification & Auditing Skill | DO-178C/254 evidence, coverage, HIRF/EMC per DO-160 |
| **CAS** | Operational Forecasting Skill | Fault prediction, BIT/BITE analytics, LRU sparing policies |
| **CMP** | Strategic Governance Skill | Change management, SQA, cybersecurity posture & policy |

---

## TFA Flow Integration

| TFA Stage | EDI Domain Activities |
| :--- | :--- |
| **QS** (Quantum Superposition) | Explore IMA partition placements, network topologies, display layouts |
| **FWD** (Forward Wave Dynamics) | Predict timing under load, reliability growth, thermal & EMC margins |
| **UE** (Unit/Unique Element) | Capture frozen ICDs, partition manifests, display configs, test articles |
| **FE** (Federation Entanglement) | Coordinate with **AAA** (mounts/clearances), **PPP** (FADEC/engine data), **LCC** (control laws), **EEE** (power), **IIS** (analytics), **OOO** (ontologies) |
| **CB** (Classical Bit/Solver) | Validate timing budgets, DAL/independence, memory & bandwidth limits |
| **QB** (Qubit-Inspired Solver) | Optimize partitions, message schedules, harness routes, test selection |

---

## UTCS Anchors

All domain artifacts include UTCS threading:

```

UTCS-MI:EDI:{plm_type}:{artifact}:rev

```

**Examples**
```

UTCS-MI:EDI:CAI:ICD-AFDX-VL-SCHEDULE:rev
UTCS-MI:EDI:CAV:DO178C-EVIDENCE-PFD-APP:rev
UTCS-MI:EDI:CAE:WCRT-NETWORK-ANALYSIS:rev
UTCS-MI:EDI:CAO:IMA-PARTITION-BUDGET:rev
UTCS-MI:EDI:CAD:DISPLAY-PANEL-ASSY:rev

```

### UTCS Threading Components
- **Context**: Aircraft variant, DAL mix, network type (429/664), thermal/EMC envelope  
- **Content**: ICDs, partition tables, message schedules, display layouts, test matrices  
- **Cache**: Timing logs, WCET/WCRT results, coverage, EMC scans, fault histories  
- **Structure**: ARINC/RTCA/SAE mapping; ATA 31 (Instruments), 34 (Nav), 23 (Comms)  
- **Style**: Avionics documentation & coding standards (C/ASM/Model-Based)  
- **Sheet**: APIs for partition manifests, AFDX VL config, display widget catalogs

---

## Related Services

- **MAP-EDI** — Domain orchestration service  
- **MAL-SERVICES** — QS/FWD/UE/FE/CB/QB computational services  
- Cross-domain: **AAA** (install/structure), **PPP** (FADEC/EEC), **LCC** (command/data), **EEE** (power/thermal), **IIS** (HUMS/analytics), **OOO** (ontologies/interfaces)

---

## QUANTUM_OA — Problems ⇄ Formulations ⇄ Algorithms

| Specific Problem | Typical Formulation | Algorithm(s) | Minimum Inputs | Outputs | Key Metrics |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **IMA Partition Placement & Sizing** | **MILP/ILP** (bin-packing + latency) | MILP, QUBO/QAOA | DAL targets, CPU/RAM/I/O, app comm graph | Partition map, budgets | CPU/RAM headroom, isolation, latency |
| **AFDX/ARINC-664 Message Scheduling** | **MILP** (TTS/windowing) | MILP, QUBO, SA | VLs, BAGs, frame sizes, deadlines | VL schedule, offsets | WCRT, jitter, link util (%) |
| **ARINC-429 Timeslot Assignment** | **ILP/CSP** | ILP, GA | Bus topology, rates, deadlines | Timeslot table | Bus util, deadline miss prob |
| **Display Layout Optimization (ARINC-661)** | **ILP/QP** (readability/reach) | ILP, GA | Widgets, tasks, constraints | Screen layout, binding | Task time, error risk |
| **FPGA Resource Mapping (DO-254)** | **ILP/QUBO** (packing/timing) | ILP, QUBO/QAOA | Logic blocks, timing, power | Placement/route hints | Fmax, power (W), LUT/DSP use |
| **Test Case Selection & Prioritization** | **Set-cover MILP** | MILP, QUBO | Req→test map, coverage goals | Minimal test set | Coverage %, effort, risk |
| **Wiring Harness Routing (racks/panels)** | **Steiner/MILP** | MILP, GA | Netlist, keep-outs, EMC | Routes, cut lengths | Mass, EMC margin, install time |
| **Spares/MEIO for LRUs** | **Stochastic MILP** | MILP, SA | Failure rates, lead times, pools | Stock levels | Ao, cost, MTBUR |

> **Quantum-ready cues:** large VL/message graphs (>20k edges), dense partition catalogs, or combinatorial test sets with high coverage constraints.

---

## Variables / Constraints / Objectives

### Key Variables
- **Binary**: Partition assignment, VL activation, test selection, harness segment use  
- **Integer**: Frame offsets, replication counts, timeslot indices, widget rows/cols  
- **Continuous**: Latency (ms), jitter (ms), CPU load (%), power (W), case temp (°C)

### Common Constraints
- **Safety/DAL**: Independence per DO-297/ARINC-653; memory & CPU isolation  
- **Timing**: WCET/WCRT, end-to-end deadlines, jitter bounds, BAG windows  
- **EMC/EMI & Thermal**: DO-160 sections 18/20/21, case/air inlet limits  
- **Network**: Link util ≤ thresholds; frame size & jitter per 664-P7/429 limits  
- **Installation**: Connector clearances, cable bend radius, keep-outs

### Typical Objectives
- Minimize end-to-end latency / jitter  
- Minimize mass/power and harness length  
- Maximize coverage with minimal tests  
- Maximize reliability/availability (Ao)  
- Minimize verification effort at given DAL

---

## Airworthiness, Safety & Cyber Standards

- **Systems/Safety**: **ARP4754A**, **ARP4761A**  
- **Software**: **DO-178C** (+ supplements **DO-331** Model-Based, **DO-332** OO, **DO-333** Formal), **DO-330** Tool Qualification  
- **Hardware**: **DO-254** (complex electronics)  
- **Environmental**: **DO-160** (EMC/EMI, temp, vibration, HIRF, lightning)  
- **IMA**: **DO-297**, **ARINC-653** (APEX)  
- **Networks/Displays**: **ARINC-429**, **ARINC-664 P7 (AFDX)**, **ARINC-661** (Cockpit Display), **ARINC-600/404** (LRU form factors)  
- **Cybersecurity**: **DO-326A/ED-202A**, **DO-356A**, **DO-355** (continuing airworthiness security)

---

## Procurement & Suppliers

- **PROCUREMENT/**: LRUs, SBCs/SoCs, FPGAs, displays, sensors, connectors, cables  
- **SUPPLIERS/**: Avionics vendors, calibration & test labs, DER/DO-178C service partners

---

## Development Status

🚧 **In Development** — Domain structure defined, content population in progress

---

**Maintained by**: ASI-T2 Intelligence Team  
**Last Updated**: 2025-01-27  
**Version**: v0.2 (TFA-V2 Canon Aligned)
```

