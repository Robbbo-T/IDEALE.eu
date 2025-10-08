# EEE — ELECTRICAL · ENDOTRANSPONDERS · CIRCULATION

**Part of:** ASI-T2-INTELLIGENCE · **Domain:** EEE · **Category:** Knowledge Domain  
**Status:** Template · UTCS-anchored

---

## Overview

This domain curates the theoretical knowledge for **electrical power generation, conversion, distribution, protection, and signaling transponders** across the aircraft. It serves as a **knowledge base** (ontologies, methods, standards, models, playbooks) that **informs and governs** program deliverables via PLM/CAx skills and MAP services.

Scope spans **generation** (IDG/PMG/APU/starter-generator), **power electronics** (rectifiers, inverters, TRU, DC/DC), **AC/DC buses** (115 V 400 Hz, 28 VDC, HVDC), **distribution & protection** (relays, SSPCs, GFCI/AFDD), **energy storage** (Li-ion, supercap), **power quality** (voltage/freq/THD), **EWIS & bonding**, **EMC/lightning/HIRF**, **load-shedding & reconfiguration**, and **transponders** (Mode S/ADS-B and related electrical interfaces). “Circulation” covers bus management, load flows, and return currents throughout the airframe.

---

## Domain Definition (Canon)

**DOMAINS** are areas of **theoretical knowledge and specialization**. They are **not** program deliverables; they regulate them through PLM/CAx competencies and MAP orchestration.

---

## Directory Structure (canon paths)

```

EEE-ELECTRICAL-ENDOTRANSPONDERS-CIRCULATION/
DELS/                  # Certification & compliance deliverables (LLC-scoped)
PLM/
CAD/                 # Equipment bays, racks, breaker panels, routing keep-outs
CAE/                 # Load flow, power quality, thermal/electrical co-sim, EMC
CAO/                 # Bus budgets, load-shed trees, protection/coordination
CAM/                 # Harness build, terminations, test fixtures & procedures
CAI/                 # ICDs (power, control, discretes), bus architectures
CAV/                 # DO-160 evidence, lightning/HIRF, EWIS inspections
CAS/                 # Ops energy mgmt, dispatch, maintenance fault logs
CMP/                 # Governance, safety cases, cybersecurity posture
QUANTUM_OA/
GA/ LP/ MILP/ QAOA/ QOX/ QP/ QUBO/ SA/
PROCUREMENT/
VENDORSCOMPONENTS/   # Generators, SSPCs, batteries, contactors, converters
SUPPLIERS/
BIDS/                # Supplier proposals
SERVICES/            # Test labs (EMC/lightning), DER services, overhauls
policy/                # Design rules (EWIS, bonding/grounding, arc-tracking)
tests/                 # Test data (THD logs, surge, RTCA section results)
utcs.json              # UTCS threading configuration
META.json              # Domain metadata
domain-config.yaml     # Domain configuration

```

---

## PLM/CAx Integration

| PLM/CAx | Agentic Skill | Purpose in EEE Domain |
| :--- | :--- | :--- |
| **CAD** | Geometric Interpretation Skill | Equipment layouts, keep-outs, bonding/ground points |
| **CAE** | Predictive Modeling Skill | Load flow, power quality, thermal-electrical ROMs, EMC/HIRF |
| **CAO** | Requirements Synthesis Skill | Bus budgets, load-shedding policy, protection coordination |
| **CAM** | Manufacturing Synthesis Skill | Harness routing, terminations, panel builds, ATP/ATE |
| **CAI** | Interface Coordination Skill | Power ICDs, discretes, mode logic, transponder power interfaces |
| **CAV** | Verification & Auditing Skill | DO-160G/H, MIL-STD-704, lightning indirect effects, EWIS |
| **CAS** | Operational Forecasting Skill | Energy dispatch, battery SoH/SoC, fault/CB analytics |
| **CMP** | Strategic Governance Skill | Certification basis, cyber-safety, obsolescence strategy |

---

## TFA Flow Integration

| TFA Stage | EEE Domain Activities |
| :--- | :--- |
| **QS** (Quantum Superposition) | Explore bus topologies, source mixes, protection strategies |
| **FWD** (Forward Wave Dynamics) | Predict load flows, power quality, thermal rise, reliability |
| **UE** (Unit/Unique Element) | Capture frozen bus configs, breaker maps, ICD revisions |
| **FE** (Federation Entanglement) | Coordinate with **PPP** (power extraction), **EDI** (avionics loads), **AAA** (bonding/paths), **AAP** (GPU), **IIS/OOO** (ontologies/data) |
| **CB** (Classical Bit/Solver) | Validate MIL-STD-704, DO-160 sections, EWIS and margins |
| **QB** (Qubit-Inspired Solver) | Optimize reconfiguration, protection settings, harness routing |

---

## UTCS Anchors

All domain artifacts include UTCS threading:

```

UTCS-MI:EEE:{plm_type}:{artifact}:rev

```

**Examples**
```

UTCS-MI:EEE:CAI:PRIMARY-AC-DC-POWER-BUDGET:rev
UTCS-MI:EEE:CAE:LOAD-FLOW-115VAC-400HZ:rev
UTCS-MI:EEE:CAV:DO160G-LIGHTNING-EVIDENCE:rev
UTCS-MI:EEE:CAO:LOAD-SHED-POLICY-TREE:rev
UTCS-MI:EEE:CAS:BATTERY-FLEET-SOH-TREND:rev
UTCS-MI:EEE:QUANTUM:QUBO:BREAKER-COORDINATION:rev

```

### UTCS Threading Components
- **Context**: Aircraft variant, source set (APU/IDG), ambient/mission profile  
- **Content**: Bus/budget models, ICDs, breaker tables, EWIS plans, test matrices  
- **Cache**: Load logs, THD/voltage sag records, CB trip stats, SoH histories  
- **Structure**: ATA 24 (Electrical), 23/34 interfaces to radios/nav, EWIS mapping  
- **Style**: Electrical design rules, EWIS practices, protection coordination guides  
- **Sheet**: APIs for bus configs, protection sets, GPU/EPGS interfaces

---

## Related Services

- **MAP-EEE** — Domain orchestration service  
- **MAL-SERVICES** — QS/FWD/UE/FE/CB/QB computational services  
- Cross-domain: **PPP** (starter-generator, FADEC power), **EDI** (avionics loads), **AAA** (bonding, return paths), **AAP** (GPU/400 Hz), **IIS/OOO** (telemetry/ontologies)

---

## QUANTUM_OA — Problems ⇄ Formulations ⇄ Algorithms

| Specific Problem | Typical Formulation | Algorithm(s) | Minimum Inputs | Outputs | Key Metrics |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Bus Reconfiguration (fault/on-condition)** | **MILP/QUBO** (connectivity + limits) | MILP, QUBO/QAOA, SA | Bus graph, source/limit tables, critical loads | Switch states, load shed set | Critical load served %, margin, time-to-restore |
| **Protection Coordination** | **ILP/QP** (pickup/curve select) | ILP, QP, QUBO | CB/SSPC curves, cable limits, inrush | Settings, selectivity map | Nuisance trips ↓, I²t margin, selectivity |
| **Load Flow & Power Quality** | **NLP/QP** (AC/DC flow + THD) | QP/NLP, GA | Source/impedance, load models, harmonics | Voltages, currents, THD | THD %, sag/swell, losses |
| **Harness Routing (EWIS)** | **Steiner/MILP** | MILP, GA | Netlist, keep-outs, bend radius, EMC | Route set, lengths, clamps | Mass, EMC margin, install time |
| **Battery Dispatch & Life** | **Stochastic MILP** | MILP, SA | Mission profile, SoC/SoH, limits | Charge/discharge plan | EoL life, reserve margin |
| **Ground Power Integration (GPU/EPGS)** | **LP/MILP** | LP/MILP | Gates, GPU capacity, arrivals | Allocation schedule | Delay risk, utilization |
| **Transponder Power Integrity** | **Set-cover MILP** (redundancy) | MILP, GA | Bus dependency, failure modes | Redundant feeds plan | Availability (Ao), MTBF impact |

> **Quantum-ready cues:** large switching graphs (>20k edges), dense protection catalogs, multi-objective reconfiguration under tight timing.

---

## Variables / Constraints / Objectives

### Key Variables
- **Binary**: Switch/breaker state, load-shed flags, feed path selection  
- **Integer**: Harness clamp counts, spare channel allocations, phase indices  
- **Continuous**: Bus voltages, currents, THD, temperatures, pickup settings

### Common Constraints
- **Power quality**: MIL-STD-704 envelopes; DO-160 sags/surges/THD limits  
- **Thermal/Electrical**: Cable ampacity, equipment case temp, altitude derates  
- **Selectivity**: Upstream vs downstream trip coordination, I²t limits  
- **Safety/EWIS**: Clearance/bend radius, bonding/grounding continuity  
- **Operational**: Critical loads always served unless fault-isolated

### Typical Objectives
- Minimize unserved critical load and total losses  
- Minimize mass/length (EWIS) and nuisance trips  
- Maximize reliability/availability and power quality margin

---

## Airworthiness, Safety & Electrical Standards

- **Systems/Safety**: **ARP4754A**, **ARP4761A**  
- **Environmental/EMC**: **RTCA DO-160G/H** (incl. Sec. 16/18/19/20/22)  
- **Electrical Power Characteristics**: **MIL-STD-704**  
- **Batteries**: **RTCA DO-311A** (rechargeable Li-ion)  
- **Lightning/HIRF**: **SAE ARP5412/5414/5416**  
- **EWIS**: **14 CFR/CS-25 Subpart H (25.1701-.1733)**, **AC 25.1701-1**, **SAE AS50881**  
- **Cyber** (electrically powered avionics interfaces): **DO-326A/356A/355**

---

## Procurement & Suppliers

- **PROCUREMENT/**: Generators, SSPCs/CBs, contactors, converters, batteries, wiring & connectors  
- **SUPPLIERS/**: Test labs (EMC/lightning), DER services, maintenance/overhaul partners

---

## Development Status

🚧 **In Development** — Domain structure defined, content population in progress

---

**Maintained by**: ASI-T2 Intelligence Team  
**Last Updated**: 2025-01-27  
**Version**: v0.2 (TFA-V2 Canon Aligned)
```

