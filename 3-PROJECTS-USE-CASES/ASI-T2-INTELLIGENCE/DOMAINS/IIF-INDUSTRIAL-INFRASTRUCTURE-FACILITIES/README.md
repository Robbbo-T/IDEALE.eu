# IIF — INDUSTRIAL · INFRASTRUCTURE · FACILITIES

**Part of:** ASI-T2-INTELLIGENCE · **Domain:** IIF · **Category:** Knowledge Domain  
**Status:** Template · UTCS-anchored

---

## Overview

This domain curates the theoretical knowledge for **manufacturing plants, MRO hangars, test stands, utilities, tooling, warehousing, and site infrastructure**. It serves as a **knowledge base** (ontologies, methods, standards, models, playbooks) that **informs and governs** program deliverables via PLM/CAx skills and MAP services.

Scope includes **facility layout & line design**, **job-shop & flow-shop scheduling**, **internal logistics (AMR/AGV)**, **microgrid & utilities dispatch (electric/thermal/air)**, **HVAC & cleanrooms**, **tooling & crane/fixture capacity**, **EH&S/OSHA compliance**, **PAH/Part-21 production**, and **sustainability (ISO 50001/14001, LEED/BREEAM)**.

---

## Domain Definition (Canon)

**DOMAINS** are areas of **theoretical knowledge and specialization**. They are **not** program deliverables; they regulate them through PLM/CAx competencies and MAP orchestration.

---

## Directory Structure (canon paths)

```

IIF-INDUSTRIAL-INFRASTRUCTURE-FACILITIES/
DELS/                  # Certification & compliance deliverables (LLC-scoped)
PLM/
CAD/                 # Layouts, tools/fixtures, crane/aisle geometry
CAE/                 # Discrete-event sims, energy/thermal models, ROMs
CAO/                 # Throughput targets, takt, staffing, policy constraints
CAM/                 # Work instructions, routing sheets, special processes
CAI/                 # ICDs to utilities, MES/SCADA, WMS/TMS interfaces
CAV/                 # PAH/Part-21 evidence, OSHA/NFPA audits, NADCAP packs
CAS/                 # Ops forecasting (throughput, WIP, energy, maintenance)
CMP/                 # Capex planning, capacity strategy, ESG performance
QUANTUM_OA/
GA/ LP/ MILP/ QAOA/ QOX/ QP/ QUBO/ SA/
PROCUREMENT/
VENDORSCOMPONENTS/   # Tooling, cranes, AMRs, compressors, CHP, meters
SUPPLIERS/
BIDS/                # EPC bids, integrator proposals, service contracts
SERVICES/            # Facilities O&M, calibration, EH&S, NADCAP labs
policy/                # Safety/quality/energy policies, data stewardship
tests/                 # Load tests, airflow/balance, arc-flash, evacuation drills
utcs.json              # UTCS threading configuration
META.json              # Domain metadata
domain-config.yaml     # Domain configuration

```

---

## PLM/CAx Integration

| PLM/CAx | Agentic Skill | Purpose in IIF Domain |
| :--- | :--- | :--- |
| **CAD** | Geometric Interpretation Skill | Plant layouts, crane reach, aisle widths, fixture/tooling models |
| **CAE** | Predictive Modeling Skill | DES/queueing, thermal/HVAC, microgrid/utility flow, UQ/ROMs |
| **CAO** | Requirements Synthesis Skill | Takt/throughput, staffing, OEE/MTBF targets, safety margins |
| **CAM** | Manufacturing Synthesis Skill | Routing, work instructions, special-process plans (NADCAP) |
| **CAI** | Interface Coordination Skill | MES/SCADA/BMS/EMS ICDs, WMS/TMS, power/air/water interfaces |
| **CAV** | Verification & Auditing Skill | OSHA/NFPA/ISO audits, PAH/Part-21 production evidence |
| **CAS** | Operational Forecasting Skill | Demand → capacity, maintenance windows, seasonality, energy |
| **CMP** | Strategic Governance Skill | Capex & portfolio, site selection, resilience & ESG strategy |

---

## TFA Flow Integration

| TFA Stage | IIF Domain Activities |
| :--- | :--- |
| **QS** (Quantum Superposition) | Explore plant configurations, line balances, AMR fleet sizing, utility topologies |
| **FWD** (Forward Wave Dynamics) | Predict throughput/WIP, energy curves, HVAC loads, maintenance backlogs |
| **UE** (Unit/Unique Element) | Capture frozen layout versions, tool/fixture sets, calibrated utility models |
| **FE** (Federation Entanglement) | Coordinate with **LIB** (materials flow), **EEE** (power), **EER** (EMS/MRV), **OOO/IIS** (ICDs) |
| **CB** (Classical Bit/Solver) | Validate codes/standards, clearances, egress, arc-flash, crane ratings |
| **QB** (Qubit-Inspired Solver) | Optimize schedules, AMR routing, warehouse slotting, microgrid dispatch |

---

## UTCS Anchors

All domain artifacts include UTCS threading:

```

UTCS-MI:IIF:{plm_type}:{artifact}:rev

```

**Examples**
```

UTCS-MI:IIF:MILP:PLANT-LAYOUT-QAP:T24:rev
UTCS-MI:IIF:MILP:JOBSHOP-SCHEDULE:WING-ASSY:T24:rev
UTCS-MI:IIF:QUBO:AMR-ROUTING:SHIFT-N1:rev
UTCS-MI:IIF:QP:HVAC-MPC:SHOP-FLOOR-2:T24:rev
UTCS-MI:IIF:MILP:MICROGRID-DISPATCH:EV-H2-CHP:T24:rev
UTCS-MI:IIF:CAV:OSHA-NFPA-COMPLIANCE-PACK:FY25:rev

```

### UTCS Threading Components
- **Context**: Site, shift pattern, demand scenario, season/climate zone  
- **Content**: Layout models, schedules, microgrid schemes, safety envelopes  
- **Cache**: Historicals (OEE, WIP, outages), energy/utility logs, maintenance CMMS  
- **Structure**: Code references (OSHA/NFPA/NEC), ISO 9001/14001/50001, Part-21  
- **Style**: Auditability, traceable parameters/units, egress & clearance maps  
- **Sheet**: APIs/ICDs (MES, SCADA/BMS/EMS, WMS/TMS)

---

## Related Services

- **MAP-IIF** — Domain orchestration service  
- **MAL-SERVICES** — QS/FWD/UE/FE/CB/QB computational services  
- Cross-domain: **LIB** (internal logistics/warehouse), **EEE** (power), **EER** (energy/MRV), **OOO/IIS** (ontologies/data), **MEC/PPP/AAA** (tooling/test stands/fixtures)

---

## QUANTUM_OA — Problems ⇄ Formulations ⇄ Algorithms

| Specific Problem | Typical Formulation | Algorithm(s) | Minimum Inputs | Outputs | Key Metrics |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Plant Layout (cells/lines)** | **QAP/MILP** (adjacency, flow) | MILP, GA | Flows, areas, adjacencies, obstacles | Dept locations | Travel m, adjacency score |
| **Job-Shop Scheduling (JSSP)** | **MILP** / disjunctive graph | MILP, SA, GA | Process routes, times, machines | Start/finish times | Makespan, tardiness, WIP |
| **AMR/AGV Routing** | **VRP/QUBO** with time windows | QUBO/QAOA, GA | Graph, tasks, time windows, fleet | Routes/assignments | Distance, service rate |
| **Warehouse Slotting** | **MILP/QP** (demand × travel) | MILP, GA | SKU demand, dimensions, slots | Slot map | Travel time, pick rate |
| **Microgrid Dispatch** | **Unit commitment MILP** | MILP, SA | Load, tariffs, DER specs (PV/CHP/EV/H₂) | On/off, flows, SOC | Cost, CO₂e, resilience |
| **HVAC Control (MPC)** | **QP** (comfort vs energy) | QP, GA | Zone models, weather, bounds | Control trajectories | kWh, comfort violations |
| **Crane/Fixture Capacity** | **LP/MILP** (conflicts, reach) | MILP | Lift tasks, spans, paths | Allocation & timing | Idle time, conflicts |
| **Calibration/PM Scheduling** | **MILP** (interval & capacity) | MILP | Tool list, due windows, techs | Calendar plan | Late PM %, capacity use |
| **Egress/Clearance Planning** | **CSP/LP** (feasibility) | CSP, LP | Layout, occupancy, codes | Feasible egress plan | Compliance, travel time |

> **Quantum-ready cues:** dense AMR graphs with strict windows, large JSSP (>10⁴ ops), microgrid with many DERs & stochastic prices, high-mix slotting.

---

## Variables / Constraints / Objectives

### Key Variables
- **Binary**: Cell locations, machine assignments, AMR edge use, DER on/off, egress door use  
- **Integer**: Start times (mins), crew counts, pallets/SKU bins, shift indices  
- **Continuous**: Flow rates (m³/h, kW), temperatures (°C), SOC (%), travel distances (m)

### Common Constraints
- **Safety/Code**: Clearances, arc-flash boundaries, egress widths/times, crane limits  
- **Capacity**: Machine/fixture/tech capacity, utility/feeder/pipe sizing, HVAC bounds  
- **Temporal**: Precedence, maintenance windows, shift calendars, curfews  
- **Operational**: Takt adherence, WIP caps, aisle/traffic rules, cleanroom ISO classes  
- **Energy/Env**: Demand limits, emissions targets, noise limits, water discharge permits

### Typical Objectives
- Minimize **makespan**, **WIP**, **travel**, **energy/cost/CO₂e**  
- Maximize **OEE**, **throughput**, **resilience**, **safety margins**  
- Balance **comfort vs. energy** and **capex vs. opex** on Pareto fronts

---

## Industrial, Safety & Compliance Standards

- **Quality/Production**: **AS9100**, **ISO 9001**, **14 CFR Part 21 (PAH)**, **NADCAP** special processes  
- **Safety/Facilities**: **OSHA 29 CFR**, **NFPA 70 (NEC)**, **NFPA 70E** (arc-flash), **NFPA 101** (Life Safety), **ASME BPVC**, **ISO 14644** (cleanrooms)  
- **Environment/Energy**: **ISO 14001**, **ISO 50001**, **EPA** permits (air/water/waste), **LEED/BREEAM**  
- **Electrical/Control**: **IEC 61511/61508** (SIS), **IEC 61439**, **ISA-95** (MES), **BACnet/ASHRAE 135** (BMS)  
- **Materials/ESD**: **ANSI/ESD S20.20**, **REACH/RoHS** (as applicable)

---

## Procurement & Suppliers

- **PROCUREMENT/**: AMRs/AGVs, cranes/hoists, compressors/chillers/boilers, CHP/PV/BESS/H₂, meters/sensors, MES/SCADA/BMS/EMS  
- **SUPPLIERS/**: EPCs, system integrators, calibration & test labs, EH&S and facility O&M providers

---

## Development Status

🚧 **In Development** — Domain structure defined, content population in progress

---

**Maintained by**: ASI-T2 Intelligence Team  
**Last Updated**: 2025-01-27  
**Version**: v0.2 (TFA-V2 Canon Aligned)
```
