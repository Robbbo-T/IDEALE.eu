---

id: ASIT-AMPEL360-AIR-T-AAA-PAX
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/README.md
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

# Packaging (PAx) for AAA Domain — AMPEL360‑AIR‑T

This folder manages documentation, analysis, and specifications related to **Packaging (PAx)**: the physical placement, routing, protection, and space allocation of internal systems within the **AMPEL360‑AIR‑T** airframe (BWB architecture).

The core focus of PAx within AAA is ensuring that components, harnessing, and pipes fit the structural envelope without causing stress concentrations, thermal conflicts, EMI issues, or violating structural integrity. This is particularly complex in BWB due to tight spatial constraints and coupled aero‑structural loads.

---

## Contents Overview

Documents here verify practical fit and integration requirements, tying component data (**PLM/CAD/PRT**) and assembly definitions (**PLM/CAD/ASSY**) back to the physical airframe structure.

1. **Component Space Allocation** — Reserved volumes for critical equipment (e.g., flight computers, hydraulic reservoirs) relative to frames/stringers/ribs.
2. **Harness & Pipe Routing** — Diagrams/specs and clash reports for pathways of electrical harnesses, fluid lines, and ventilation ducts.
3. **Vibration/Shock Isolation** — Specs for mounting hardware/isolators to protect sensitive components from vibration or shock loads.

---

## Traceability Mandate

Accurate PAx records are critical for manufacturing feasibility, maintenance access, and interference checks.

* **TFA Flow Relevance:** PAx artifacts are produced and consumed across the canonical flow **QS→FWD→UE→FE→CB→QB**:

  * **QS** — Global context/provenance of geometry and constraints (UTCS‑threaded).
  * **FWD** — Predictive studies on installation/turn‑time and maintainability impacts.
  * **UE** — Deterministic fit states (as‑routed/as‑installed snapshots) for review.
  * **FE** — Cross‑subsystem decision chains for installation sequencing and access trade‑offs.
  * **CB** — Constraint satisfaction on space, clearances, and access rules.
  * **QB** — Search/optimization for dense layout problems when the space explodes combinatorially.

* **CAI Linkage:** PAx outputs feed **Computer‑Aided Integration** workflows (`PLM/CAI/INS`) and assembly checks (`PLM/CAD/ASSY/interference-checks`).

* **UTCS Anchors:** Reference all geometry, reports, and decisions via **UTCS‑MI** anchors (no raw paths) to preserve provenance.

---

## PAx Conventions

* **Orientation markers:**

  * `ONB/` = **Onboard** (internal to fuselage/wing volume)
  * `OUT/` = **Outboard** (skins, LE/TE, service areas)

* **File Code Template:** `PAX-AAA-{ZONE}-{KIND}-{IDX}`

  * `{ZONE}` ∈ `{ONB|OUT}`
  * `{KIND}` ∈ `{ROUTE|CLR|MNT|SHOCK}`
  * `{IDX}` = 4‑digit serial
  * Example: `PAX-AAA-ONB-ROUTE-0027.md` (ONB wiring route #27)

* **Geometry References:** Always cite CAD/CAE via UTCS anchors, e.g. `UTCS-MI:CAD:AAA:ASSY:57-10:revC`.

---

## Required Artifacts (Minimum for CI)

| Artifact                             | Source (CAx)       | TFA Stage | Evidence (UTCS)          | Status |
| :----------------------------------- | :----------------- | :-------: | :----------------------- | :----: |
| ONB Wiring Routes (rev‑aligned)      | CAD/ASSY · CAI/INS |   UE→CB   | `UTCS-MI:PAX:ONB:ROUTE`  |   🔄   |
| Pipe/Duct Routing & Clash Report     | CAD/ASSY · CAE     |   UE→CB   | `UTCS-MI:PAX:CLR:PIPE`   |   🔄   |
| Clearance Matrices (by station/zone) | CAI/INS            |   UE→CB   | `UTCS-MI:PAX:CLR:MATRIX` |   🔄   |
| Mounting Specs (brackets, isolators) | CAD/PRT · CAM      |   FE→CB   | `UTCS-MI:PAX:MNT:SPEC`   |   🔄   |
| Maintainability Study (access times) | CAI · FWD (sim)    |   FWD→FE  | `UTCS-MI:PAX:MNT:TIME`   |   🔄   |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

---

## KPIs (tracked via CI)

* **Minimum clearance by zone** (mm)
* **Clash count** → target **0**
* **Access time P95** (min)
* **Added mass** (kg) vs baseline
* **Thermal margin** (°C) near heat sources
* **EMI margin** (dB)
* **Shock/Vibe transmissibility** (ζ)

---

## Directory Index (Hyperlinkable)

| Folder | Description |
| :--- | :--- |
| [Current Folder (`./`)](#) | PAx master plans, component exclusion maps, spatial budgets. |
| [`ONB/routing-diagrams/`](./ONB/routing-diagrams/) | Final ONB routes for wiring/piping/ducts. |
| [`ONB/clearance-reports/`](./ONB/clearance-reports/) | ONB clearance matrices & clash exports. |
| [`ONB/mounting-specifications/`](./ONB/mounting-specifications/) | ONB brackets, isolators, fasteners. |
| [`ONB/access-panels-layout/`](./ONB/access-panels-layout/) | ONB maintenance access layouts. |
| [`OUT/routing-diagrams/`](./OUT/routing-diagrams/) | OUT routes across skins and LE/TE systems. |
| [`OUT/clearance-reports/`](./OUT/clearance-reports/) | OUT clearances and clash checks. |
| [`OUT/mounting-specifications/`](./OUT/mounting-specifications/) | OUT mounts & isolation specs. |
| [`OUT/access-panels-layout/`](./OUT/access-panels-layout/) | OUT access panels and hatches. |

---

## Governance & Reviews

* **Approvals:** AAA Integration Lead (design), CAI Lead (install), QA (evidence), Safety (clearances near critical zones).
* **Reviews:** Design reviews at Milestones M2/M4; installation readiness at M5; maintainability check at pre‑EIS.
* **Change Control:** All updates via PR with UTCS evidence links; CI enforces link/path validation and PAX code format.

---

## References

* **TFA Flow:** QS→FWD→UE→FE→CB→QB (canon)
* **Standards:** EASA CS‑25 (applicable sections), ATA iSpec 2200, S1000D 6.0 (for IPD/AMM cross‑refs)
* **Cross‑Links:** `PLM/CAI/INS`, `PLM/CAD/ASSY/interference-checks`, domain AAA CAD baselines.
```
