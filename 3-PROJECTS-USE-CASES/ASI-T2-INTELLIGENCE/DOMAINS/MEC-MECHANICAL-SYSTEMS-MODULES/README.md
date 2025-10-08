# MEC — Mechanical Systems & Modules

**Part of:** ASI-T2-INTELLIGENCE · **Domain:** MEC · **Category:** Knowledge Domain
**Status:** Template · **UTCS-anchored**

---

## Overview

MEC curates the theoretical knowledge for **non-propulsion mechanical systems**: electromechanical/hydraulic/pneumatic actuators (EMA/HYD/PNE), landing-gear & door mechanisms, slat/flap drive trains, latches/hinges, brakes, gearboxes, bearings/seals, and installation/assembly processes. It governs sizing, kinematics, tolerance control, assembly planning, reliability, and compliance across design → build → service.

---

## Domain Definition (Canon)

**DOMAINS** are areas of **theoretical knowledge and specialization** (ontologies, methods, models, standards, playbooks). They are **not** program deliverables; they **inform & govern** deliverables via PLM/CAx competencies and MAP orchestration.

---

## Directory Structure (canon paths)

```
MEC-MECHANICAL-SYSTEMS-MODULES/
  DELs/                  # Certification & compliance deliverables (LLC-scoped)
  PLM/
    CAD/                 # Mechanism geometry, joints, clearances, envelopes
    CAE/                 # Loads/kinematics/thermal/friction models, ROMs
    CAO/                 # Requirements & trade studies (mass, duty, life)
    CAM/                 # Assembly plans, torque specs, jigs/fixtures, NC/AM
    CAI/                 # ICDs to LCC/EEE/PPP; interface budgets & fits
    CAV/                 # V&V evidence, test plans, sign-offs, audits
    CAS/                 # Ops/MRO behavior, wear/MTBUR, dispatch policies
    CMP/                 # Governance: risk, ESG, sourcing, roadmap
  QUANTUM_OA/
    GA/ LP/ MILP/ QAOA/ QOX/ QP/ QUBO/ SA/
  PROCUREMENT/
    VENDORSCOMPONENTS/   # Catalogs (actuators, bearings, fasteners)
  SUPPLIERS/
    BIDS/  SERVICES/
  policy/
  tests/
  utcs.json
  META.json
  domain-config.yaml
```

---

## PLM/CAx Integration

| PLM/CAx | Agentic Skill            | Purpose in MEC Domain                                       |
| ------- | ------------------------ | ----------------------------------------------------------- |
| **CAD** | Geometric Interpretation | Parametrics, joints, collision envelopes, clearances        |
| **CAE** | Predictive Modeling      | Kinematics/dynamics, thermal, friction, fatigue ROMs        |
| **CAO** | Requirements Synthesis   | Duty cycles, load spectra, service targets, margins         |
| **CAM** | Manufacturing Synthesis  | Assembly sequencing, fixtures, torque & seal procedures     |
| **CAI** | Interface Coordination   | Fits/fasteners, ICDs with LCC/EEE/PPP, space/weight budgets |
| **CAV** | Verification & Auditing  | Rig tests, environmental DO-160, compliance sign-offs       |
| **CAS** | Operational Forecasting  | Wear & MTBUR, maintenance intervals, spares                 |
| **CMP** | Strategic Governance     | Make/buy, supplier risk, cost & weight targets              |

---

## TFA Flow Integration

| TFA Stage | MEC Domain Activities                                                                                                     |
| --------- | ------------------------------------------------------------------------------------------------------------------------- |
| **QS**    | Explore actuator types, linkages, gearbox ratios, latch topologies                                                        |
| **FWD**   | Propagate duty/loads/thermal to life & margin forecasts                                                                   |
| **UE**    | Capture **as-designed / as-built / as-tested** mechanism snapshots                                                        |
| **FE**    | Coordinate with **LCC** (controls), **PPP** (reverser interfaces), **EEE** (power), **AAA** (structure), **LIB** (spares) |
| **CB**    | Validate margins, clearances, safety & environmental limits                                                               |
| **QB**    | Optimize actuator selection, sequencing, routing, fastener patterns                                                       |

---

## UTCS Anchors

```
UTCS-MI:MEC:{plm_type}:{artifact}:rev[X]
```

**Examples**

```
UTCS-MI:MEC:SCHEMA:ACT-SIZE:rev[A]
UTCS-MI:MEC:SCHEMA:TOL-STACK:rev[A]
UTCS-MI:MEC:SCHEMA:ASM-SEQ:rev[A]
UTCS-MI:MEC:MILP:ASM-SEQUENCE:DOOR-BAY4:T24:rev[A]
UTCS-MI:MEC:QP:LATCH-JOINT-LOAD:V2:rev[B]
```

---

## QUANTUM_OA — Problems ⇄ Formulations ⇄ Algorithms

| Problem (MEC)                                | Typical Formulation                           | Algorithm(s)                                            | Min Inputs                          | Outputs                      | Key Metrics                      |
| -------------------------------------------- | --------------------------------------------- | ------------------------------------------------------- | ----------------------------------- | ---------------------------- | -------------------------------- |
| **Actuator sizing & selection**              | Mixed **MILP** (catalog) + thermal **QP/NLP** | MILP, QP/NLP; GA warm-start; **QUBO** at large catalogs | Load/speed/duty, catalog, thermal R | Selected PN, margins, mass   | Stall margin, temp rise, mass    |
| **Tolerance stack-up**                       | RSS / Worst-case; **QP** w/ interval bounds   | QP, interval; CSP                                       | Feature dims/tols, fit codes        | Gap/interference stats       | Ppk/Cpk, pass rate               |
| **Assembly sequencing (fixtures/resources)** | Precedence **MILP** (multi-resource)          | MILP, Tabu; **QUBO** >400 tasks                         | Tasks, precedence, bays/tools       | Start times, bay/tool assign | Makespan, critical path          |
| **Kinematics & clearance**                   | **NLP** + collision constraints               | NLP, SA; QAOA if massive checks                         | Joints, paths, envelopes            | Feasible motion, stops       | Min clearance, force peaks       |
| **Fastener pattern optimization**            | Compliance **QP** under load cases            | QP; GA                                                  | Load cases, pattern bounds          | Pattern & torque             | Weight, max stress, safety       |
| **Hose/cable routing (mech)**                | Shortest-path **MILP** w/ clearance           | MILP; **QUBO** at scale                                 | Obstacles, bend radius, clamps      | Route, clamp points          | Length, min radius, install time |
| **Reliability allocation**                   | **ILP** (RBD/k-out-of-n)                      | ILP                                                     | Failure rates, redundancy           | Allocation plan              | MTBUR, cost                      |

---

## Variables · Constraints · Objectives

**Key Variables**
Binary: part selection, fixture/bay use, step activation · Integer: sequence indices, fastener counts · Continuous: torques, tensions, clearances, temps.

**Common Constraints**
Load & torque margins · Thermal rise ≤ limit · Clearance ≥ min · Precedence & resource capacity · Fit classes (ISO 286) · Environmental DO-160 exposures.

**Typical Objectives**
Minimize mass, makespan, cost, or energy; maximize margins, reliability, serviceability.

---

## FE Interfaces — Data Contracts (examples)

| Producer → Consumer | Topic                   | Payload                      | Cadence     | Purpose         |
| ------------------- | ----------------------- | ---------------------------- | ----------- | --------------- |
| **EEE → MEC**       | `eee.power_budget.v1`   | `Power{voltage, peak, duty}` | on-change   | EMA feasibility |
| **LCC → MEC**       | `lcc.load_env.v1`       | `Loads{profiles, rates}`     | per program | Sizing inputs   |
| **PPP → MEC**       | `ppp.reverser_iface.v1` | `Clearance{path, locks}`     | per cycle   | Kinematics      |
| **CAS → MEC**       | `cas.mtbur_update.v1`   | `Reliability{pn, mtbur}`     | monthly     | Allocation      |
| **LIB → MEC**       | `lib.spares_pool.v1`    | `Pool{pn, qty, lead}`        | weekly      | Serviceability  |

All messages carry UTCS headers and `$schema` URIs (see `MEC/utcs-schema/`).

---

## Standards & Compliance (selected)

* **Airworthiness**: CS/FAR-25. **Doors** (§25.783), **Landing gear** (§25.729), **Brakes/Wheels** (§25.735), **Control system components** (§25.697), **Emergency loads** (§25.561), **Fatigue/Damage tolerance** (§25.571).
* **Environmental**: **DO-160** (temp, vib, fluids, sand/dust, icing).
* **Geometry & Fits**: **ASME Y14.5** (GD&T), **ISO 286** (fits), **ISO 8015** (GPS).
* **Fasteners/Threads**: NAS/MS/AS standards (program-specific).
* **Quality**: **AS9100**, **NADCAP** (special processes).

**Evidence (CAV):** actuator bench tests, thermal derating, rig motion/collision checks, tolerance audits, endurance cycles, DO-160 exposures.

---

## Related Services

* **[MAP-MEC](../../MAP-SERVICES/MAP-MEC/)** — Domain orchestration
* **[MAL-SERVICES](../../MAL-SERVICES/)** — QS/FWD/UE/FE/CB/QB computation
* Cross-domain: **LCC** (controls & requirements), **EEE** (power/harness), **PPP** (reverser interfaces), **AAA** (structure), **LIB** (spares/logistics)

---

## Quantum Optimization (focus)

Applied where catalogs/graphs/sequences explode: **actuator catalog MILPs**, **large assembly schedules**, and **routing with dense obstacles** (QUBO/QAOA candidates under MEC QR policy).

---

## Procurement & Suppliers

* **PROCUREMENT/**: Actuator/bearing/vendor master, qual data, derating curves
* **SUPPLIERS/**: Contracts, repair agreements, service bulletins

---

## Development Status

🚧 **In Development** — Domain structure defined, content population in progress

---

**Maintained by**: ASI-T2 Intelligence Team
**Last Updated**: 2025-01-27
**Version**: v0.2 (TFA-V2 Canon Aligned)
