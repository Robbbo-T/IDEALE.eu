---

id: ASIT-AMPEL360-AIR-T-AAA-ASM
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/assembly/README.md
llc: SYSTEMS
classification: INTERNAL–EVIDENCE-REQUIRED
version: "1.0.0"
release_date: 2025-10-07
maintainer: "AAA Integration Team"
bridge: "QS→FWD→UE→FE→CB→QB"
ethics_guard: MAL-EEM
utcs_mi: v5.0
canonical_hash: "TBD"

---

# Assembly Sequences for AAA Domain — AMPEL360‑AIR‑T

This folder contains plans, simulations, and documentation defining the chronological steps required to assemble complex airframe components and sub‑assemblies for the **AAA (Airframes, Aerodynamics, Airworthiness)** domain of **AMPEL360‑AIR‑T**.

Assembly sequences are critical inputs for manufacturing planning (**PLM/CAM/OPR**) and are constrained by tool access, component geometry (**PAx** inputs), and quality assurance (**PLM/CAV/QIP**). In a BWB design, sequencing complexity increases due to large composite structures, limited access, and coupled aero‑structural behaviour.

---

## Contents Overview

1. **Work Breakdown Structure (WBS)** — Hierarchical decomposition of assembly tasks and dependencies.
2. **Digital Mock‑Up (DMU) Animations** — Visual simulations validating feasibility and collision avoidance.
3. **Tolerance Stack‑up Validation** — Sequential tolerance propagation and impact on critical dimensions.
4. **Tool Access & Reposition Plans** — Fixture reach, crane/AGV paths, and allowable repositions.
5. **Fastener Schedules** — Torque, order, and pattern for critical structural joints.

---

## TFA Context & Constraints

All sequencing is governed by the canonical TFA flow **QS→FWD→UE→FE→CB→QB**.

* **QS** — Global context (geometry, resources, takt time, hazards) threaded via UTCS.
* **FWD** — Predictive analyses (cycle‑time models, access risk, queueing effects).
* **UE** — Deterministic sequence snapshots (as‑planned / as‑built states) for gates.
* **FE** — Cross‑subsystem orchestration (e.g., close‑out vs. system routing).
* **CB** — Constraint enforcement (clearances, cure windows, tool availability, QIP holds).
* **QB** — Combinatorial optimization (resource‑constrained scheduling, line balancing, buffer sizing).

> **Primary coupling for assembly:** **FE→CB→QB** within the overarching **QS→FWD→UE→FE→CB→QB**.

---

## Traceability Mandate

Each sequence is linked to master assembly models and quality plans using **UTCS‑MI** anchors. Inspection hold points from **CAV/QIP** are embedded as sequence gates, with hazard log references for large‑structure manipulation and lifting operations.

* **UTCS References:** Use UTCS anchors for CAD/DMU/CAE/QIP; avoid raw file paths. All UTCS YAML records for this directory's artifacts are stored in the `./utcs/` subdirectory.
* **Interfaces:** Strong coupling with **PAx** (clearances, access) and **CAM/OPR** (tooling, takt).

---

## Conventions

* **Zones:** `ONB` (onboard/internal) and `OUT` (outboard/skins/LE‑TE/service).

* **File Code Template:** `ASM-AAA-{ZONE}-{KIND}-{IDX}`

  * `{ZONE}` ∈ `{ONB|OUT}`
  * `{KIND}` ∈ `{JOIN|SYS|DMU|TSTACK|FASTENER|TOOL}`
  * `{IDX}` = 4‑digit serial
  * Example: `ASM-AAA-ONB-JOIN-0012.md` (ONB center‑body join sequence #12)

* **Geometry & Evidence:** Reference via UTCS anchors (e.g., `UTCS-MI:CAD:AAA:ASSY:57-10:revC`, `UTCS-MI:CAV:QIP:AAA:JOIN-0012:v1`).

---

## Required Artifacts (Minimum for CI)

| Artifact | Source (CAx) | TFA Stage | Evidence (UTCS) | Status |
| :--- | :--- | :---: | :--- | :----: |
| Master Assembly Sequence (WBS) | CAI/INS · CAD/ASSY | FE→CB→QB | `UTCS-MI:ASM:WBS:AAA:v1` | 🔄 |
| DMU Simulation Package | CAD/DMU | UE→FE | `UTCS-MI:ASM:DMU:JOIN-xxxx:v1` | 🔄 |
| Tool Access & Reposition Plan | CAI · CAM | CB | `UTCS-MI:ASM:TOOL:ACCESS-xxxx:v1` | 🔄 |
| Tolerance Stack‑up Report | CAE · Metrology | CB→UE | `UTCS-MI:ASM:TSTACK:xxxx:v1` | 🔄 |
| Fastener Torque/Order Schedule | CAM · QIP | FE→CB | `UTCS-MI:ASM:FASTENER:xxxx:v1` | 🔄 |
| Inspection Hold Points (QIP) | CAV/QIP | FE | `UTCS-MI:CAV:QIP:AAA:JOIN-xxxx:v1` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

---

## KPIs (tracked via CI)

* **Total cycle time** (min) and **critical path float** (min)
* **Repositions** (count) and **tool changes** (count)
* **First‑time‑right** (%) and **rework rate** (%)
* **Residual gap / OOT** (mm) on key joints
* **Torque nonconformance rate** (ppm)
* **Interference events caught pre‑assembly** (count)
* **Safety**: near‑miss incidents (count) → target **0**

---

## Directory Index (Hyperlinkable)

| Folder | Description |
| :--- | :--- |
| [Current Folder (`./`)](#) | Top‑level assembly master sequence plans and WBS documents. |
| [`major-section-joins/`](./major-section-joins/) | Joining procedures for main BWB sections (e.g., center body ↔ outer wing). |
| [`system-installation-steps/`](./system-installation-steps/) | Sequences for integrating large mechanical/electrical systems (e.g., landing gear insertion, main duct installation). |
| [`tool-access-plans/`](./tool-access-plans/) | Fixture reach studies, crane/AGV paths, and reposition budgets (formerly included in content overview). |
| [`digital-mockup-sims/`](./digital-mockup-sims/) | CAD animation sequences and rendered videos of validated processes. |
| [`fastener-schedules/`](./fastener-schedules/) | Torque and order schedules for critical joints. |
| [`tolerance-stackups/`](./tolerance-stackups/) | Stack‑up analyses and metrology correlation. |
| [`qip-hold-points/`](./qip-hold-points/) | Inspection gates, checklists, and acceptance criteria. |
| [`resolution-logs/`](./resolution-logs/) | Issue tracking with ECR/Deviation approvals. |
| [`utcs/`](./utcs/) | **Canonical UTCS YAML records** for all sequence artifacts in this directory. |
| [`thumbnails/`](./thumbnails/) | Visual previews or key frame images associated with DMU simulations. |

---

## Governance & Reviews

* **Approvals:** AAA Integration Lead (design), CAI Lead (assembly/ops), QA (evidence/QIP), Safety (handling/lifting).
* **Reviews:** Gate reviews at M2/M4; installation readiness at M5; PPAP/FAI sign‑off prior to EIS.
* **Change Control:** All updates via PR with UTCS evidence links; CI enforces link/path validation and `ASM-AAA` code format.

---

## References

* **TFA Flow:** QS→FWD→UE→FE→CB→QB (canon)
* **Standards:** EASA CS‑25 sections (manufacturing quality), ATA iSpec 2200, S1000D 6.0 (for QIP/IPD cross‑refs)
* **Cross‑Links:** `PLM/CAI/INS`, `PLM/CAM/OPR`, `PLM/CAV/QIP`, `domains/AAA/pax/` (clearances & access).
```
