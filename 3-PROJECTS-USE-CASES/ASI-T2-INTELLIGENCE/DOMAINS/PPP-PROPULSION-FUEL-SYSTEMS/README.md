# PPP — PROPULSION & FUEL SYSTEMS

**Part of:** ASI-T2-INTELLIGENCE · **Domain:** PPP · **Category:** Knowledge Domain
**Status:** Template · **UTCS-anchored**

---

## Overview

PPP curates the theoretical corpus for **engines**, **fuel & oil systems**, **propulsion integration**, **nacelle/reverser**, **APU**, **bleed air**, **fire detection/suppression**, **thermal management**, **HUMS**, and **emissions/ESG**. It governs models, standards, ontologies, and solver formulations that inform MAP/MAL services and downstream deliverables.

---

## Domain Definition (Canon)

**DOMAINS** are areas of **theoretical knowledge and specialization** (ontologies, methods, models, standards, playbooks). They are **not** program deliverables; they **inform & govern** deliverables via PLM/CAx competencies and MAP orchestration.

---

## Directory Structure (canon paths)

```
PPP-PROPULSION-FUEL-SYSTEMS/
  DELs/                      # Certification & compliance deliverables (CS-33, emissions)
  PLM/
    CAD/                     # Engine/nacelle geometry, mounts, reverser kinematics
    CAE/                     # Thrust, thermals, acoustics, ROMs, operability
    CAO/                     # Requirement/goal trees, trade studies (SFC/NOx/weight)
    CAM/                     # MRO/process planning, rig builds, test stand setup
    CAI/                     # ICDs (airframe↔propulsion), bleed/power budgets
    CAV/                     # V&V evidence, rig/engine tests, emissions & fire trials
    CAS/                     # Ops forecasting, HUMS, maintenance policies
    CMP/                     # Program strategy, ESG metrics, risk & capital
  QUANTUM_OA/
    GA/ LP/ MILP/ QAOA/ QOX/ QP/ QUBO/ SA/
  PROCUREMENT/
    VENDORSCOMPONENTS/       # Pumps, valves, sensors, FADEC/EEC, nacelle hardware
  SUPPLIERS/
    BIDS/  SERVICES/
  policy/                    # Certification basis, acceptance gates, solver policy
  tests/                     # Engine/fuel rig datasets, ingestion/bird/fire evidence
  utcs.json
  META.json
  domain-config.yaml
```

---

## PLM/CAx Integration

| PLM/CAx | Agentic Skill            | Purpose in PPP Domain                                              |
| ------- | ------------------------ | ------------------------------------------------------------------ |
| **CAD** | Geometric Interpretation | Engine & nacelle geometry, mounts, reverser kinematics             |
| **CAE** | Predictive Modeling      | Multiphysics (thermo-fluid/structural/acoustic), ROMs, operability |
| **CAO** | Requirements Synthesis   | SFC/NOₓ/weight trades, bleed budgets, reliability targets          |
| **CAM** | Manufacturing Synthesis  | MRO process routing, APU rig planning, service tooling             |
| **CAI** | Interface Coordination   | ICDs with AAA/EEE/MEC; bleed/power/fuel interfaces                 |
| **CAV** | Verification & Auditing  | CS-33/CS-25.997+ compliance, fire/emissions/ingestion tests        |
| **CAS** | Operational Forecasting  | HUMS policy, maintenance intervals, dispatch reliability           |
| **CMP** | Strategic Governance     | ESG roadmap (SAF/H₂), certification strategy, risk/CapEx           |

---

## TFA Flow Integration

| TFA Stage | PPP Domain Activities                                                                 |
| --------- | ------------------------------------------------------------------------------------- |
| **QS**    | Explore engine cycles, fuel architectures, reverser layouts, SAF/H₂ options           |
| **FWD**   | Predict SFC/NOₓ/thermal margins, operability, maintenance risk                        |
| **UE**    | Capture baselines (as-designed/built/flown), rig/engine test snapshots                |
| **FE**    | Coordinate with AAA (mounts/loads), EEE (power/bleed), MEC (reverser), LCC (commands) |
| **CB**    | Validate against CS-33, CS-25.997+, DO-160, safety limits & margins                   |
| **QB**    | Optimize thrust–emissions, fuel topology, maintenance schedules                       |

---

## UTCS Anchors

```
UTCS-MI:PPP:{plm_type}:{artifact}:rev[X]
```

**Examples**

```
UTCS-MI:PPP:NLP:THRUST-EMISSIONS:T24:rev[A]
UTCS-MI:PPP:MILP:FUEL-ARCH:TRIAX-REDUND:v1:rev[A]
UTCS-MI:PPP:ILP:HUMS-SENSOR-PLACEMENT:WING-NAC:v2:rev[B]
UTCS-MI:PPP:MILP:FIRE-ZONE:ZONE-2:v1:rev[A]
UTCS-MI:PPP:QP:ESG-SCORE:SAF-70:rev[A]
UTCS-MI:PPP:SCHEMA:THRUST-EMISSIONS:rev[A]
```

All artifacts embed UTCS headers and `$schema` URIs; schemas live in `PPP/utcs-schema/`.

---

## Related Services

* **[MAP-PPP](../../MAP-SERVICES/MAP-PPP/)** — Propulsion domain orchestration
* **[MAL-SERVICES](../../MAL-SERVICES/)** — QS/FWD/UE/FE/CB/QB integration
* Cross-domain touchpoints: **AAA**, **EEE**, **MEC**, **LCC**, **EER**, **LIB**, **IIS**

---

## QUANTUM_OA — Problems ⇄ Formulations ⇄ Algorithms

| Specific Problem                         | Typical Formulation         | Algorithm(s)        | Minimum Inputs                                     | Outputs                   | Key Metrics                   |
| ---------------------------------------- | --------------------------- | ------------------- | -------------------------------------------------- | ------------------------- | ----------------------------- |
| **Thrust–Fuel–Emissions Trade**          | Multi-obj **NLP/QP**        | NLP (IPOPT), QP; GA | Mission profile, OPR/TET bounds, SAF blend, limits | Optimal schedules & blend | SFC, NOₓ index, thrust margin |
| **Fuel System Architecture**             | **MILP** (mass+reliability) | MILP; SA            | Components/capacity, k-of-n, ΔP limits             | Pump/valve topology       | Mass, reliability, ΔP         |
| **Thermal Integration (oil/fuel/bleed)** | **NLP** (energy+ΔP)         | NLP; rulebook       | HX catalog, flow paths, temp limits                | HX sizes/flows            | Max temp, ΔP, weight          |
| **HUMS Sensor Layout**                   | **ILP** (coverage/cost)     | ILP + ML            | Fault modes, sensor options, SNR                   | Sensor set & thresholds   | MTBUR, FAR, latency           |
| **Fire Zone Segmentation**               | Set-cover **MILP**          | MILP; greedy        | Zone vols, detector/suppressor perf                | Layout & bill             | Suppression time, coverage    |
| **APU Sizing & Duty**                    | **QP** (fuel+mass)          | QP; DES             | Load profile, altitude/temps                       | APU rating & schedule     | Fuel/hr, mass, start margin   |
| **Reverser Kinematics**                  | **MILP+NLP**                | MILP+NLP; SA        | Linkages, clearances, loads                        | Actuator placement/path   | Deploy time, forces           |
| **Bleed Extraction Budget**              | **LP**                      | LP; heuristic       | Port constraints, ECS loads                        | Port sizes/flows          | Loss %, temp margin           |
| **ESG Scoring**                          | **QP** (weighted)           | QP                  | Mission data, emissions factors                    | ESG score                 | CO₂e, NOₓ, contrail risk      |

**QR cues:** discrete catalogs >20k, fault trees >50k, MILPs >100k vars; enable **QAOA/QUBO** where indicated.

---

## Variables · Constraints · Objectives

**Key Variables**
Binary: component selection, detector placement, door lock states, port usage
Integer: redundancy level, sensor count, APU start cycles
Continuous: fuel flow, bleed flow, torque/speed, HX area, temperatures/pressures

**Common Constraints**
Certification & safety margins (CS-33, CS-25.997+), ΔP/temperature limits, surge/stall margins, redundancy (k-of-n), clearance/kinematics, emissions caps, maintainability (access & time)

**Typical Objectives**
Minimize SFC/mass/ESG cost; minimize deploy time/ΔP; maximize reliability/coverage; balance NOₓ vs thrust

---

## FE Interfaces — Data Contracts (examples)

| Producer → Consumer | Topic                   | Payload (ontology)                       | Cadence      | Purpose                 |
| ------------------- | ----------------------- | ---------------------------------------- | ------------ | ----------------------- |
| **LCC → PPP**       | `lcc.thrust_cmd.v1`     | `ThrustProfile{phase,T_req,rate_max}`    | per flight   | Engine control envelope |
| **EEE → PPP**       | `eee.bleed_load.v1`     | `BleedRequest{port,P_min,flow}`          | on-demand    | ECS/power extraction    |
| **EER → PPP**       | `eer.saf_data.v1`       | `SAF{blend,cetane,freeze_pt}`            | daily        | Fuel property updates   |
| **LIB → PPP**       | `lib.h2_logistics.v1`   | `H2Supply{purity,pressure,availability}` | weekly       | Hydrogen readiness      |
| **MEC → PPP**       | `mec.reverser_iface.v1` | `ReverserClearance{path,lock_pts}`       | per LG cycle | Kinematic coordination  |
| **IIS → PPP**       | `iis.hums_alert.v1`     | `Anomaly{sensor_id,score,class}`         | real-time    | Predictive maintenance  |

All messages carry UTCS headers and `$schema` URIs.

---

## Standards & Compliance Focus

* **Airworthiness:** **CS-33/14 CFR 33** (engines), **CS-25.997+** (fuel systems), **ARP4754A/ARP4761** (development & safety)
* **Environmental:** **ICAO Annex 16 Vol II / CAEP**, **DO-160** (EEC env.), **ASTM D7566/D4054** (SAF)
* **Digital/Safety:** **DO-178C/DO-254** (FADEC/EEC SW/HW), **DO-330** (tool qual)
* **Evidence (CAV):** endurance/cycle tests, bird/hail/ice ingestion, fire suppression trials, emissions certification, HUMS validation

---

## Procurement & Suppliers

* **PROCUREMENT/**: Engine & APU components, pumps/valves/filters, sensors, FADEC/EEC, HX, reverser actuators
* **SUPPLIERS/**: OEM contracts, overhaul/MRO services, fuel/SAF/H₂ providers, emissions labs

---

## Development Status

🚧 **In Development** — Domain structure defined, content population in progress

---

**Maintained by**: ASI-T2 Intelligence Team
**Last Updated**: 2025-01-27
**Version**: v0.2 (TFA-V2 Canon Aligned)

