---

id: ASIT-AMPEL360-AIR-T-AAA-SUB
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/sub-assemblies/README.md
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

# Sub‑Assemblies for AAA Domain — AMPEL360‑AIR‑T

This folder holds the CAD models, metadata, and documentation for predefined, complex modular **Sub‑Assemblies** belonging to the primary airframe structure and aerodynamic elements of **AMPEL360‑AIR‑T** (AAA Domain).

Sub‑assemblies serve as building blocks for the main airframe, enabling parallel design, manufacturing, and integration workflows. They must have a clear internal **Bill of Materials (BOM)** and well‑defined **external interfaces** governed by **PAx** (packaging/clearances) and **Interference** domains.

---

## Contents Overview

1. **Modular Assembly Files** — CAD/DMU sources (STEP + native) for major structural modules (e.g., wing‑box sections, stabilizer units, specialized ribs).
2. **Interface Control Definitions (ICD)** — Mating conditions, fastener patterns, tolerances, datum schemes, and allowable gaps.
3. **Sub‑Assembly BOMs** — Module‑level component lists derived from the top‑level BOM (`PLM/CAD/ASSY`).
4. **Handling & Lifting Plans** — Fixtures, slings, COG data, and permissible orientations.
5. **Fastener Schedules** — Torque, order, and pattern for critical joints within the module.
6. **Tolerance Stack‑ups** — Sequential effects on key dimensions, metrology correlation.

---

## TFA Context & Modular Flow

All work is orchestrated within the canonical TFA flow **QS→FWD→UE→FE→CB→QB**:

* **QS** — Provenance ledger of module geometry, ICDs, BOM, tools, and schedules (UTCS‑threaded).
* **FWD** — Predictive sims for takt‑time, WIP, and schedule risk across parallel module lines.
* **UE** — Deterministic snapshots at module freeze/release (as‑modeled / as‑built).
* **FE** — Coordination of multiple module **UEs** into the master structure; dependency management.
* **CB** — Enforcement of PAx clearances, interface tolerances, cure windows, and tooling constraints.
* **QB** — Optimization of module sequencing/line balancing and change‑impact scheduling under constraints.

> **Primary loop for sub‑assemblies:** **FE→CB→UE**, backed by **QS** provenance and **FWD** schedule assessment.

---

## Traceability Mandate

* **UTCS Anchors:** Every master module, ICD, BOM, and evidence item must be referenced via **UTCS‑MI** (no raw paths). Example anchors: `UTCS-MI:CAD:AAA:ASSY:WINGBOX-001:revB`, `UTCS-MI:CAV:QIP:AAA:SUB-WINGBOX-001:v1`.
* **Quality Gates:** Embed **CAV/QIP** hold points inside module docs; map nonconformances to ECR/Deviation records.
* **Change Control:** All updates via PR with UTCS links; CI enforces link/path validation and code naming.

---

## Conventions

* **File Code Template:** `SA-AAA-{MODULE}-{IDX}`

  * `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
  * `{IDX}` = 3‑digit serial (e.g., `001`)
  * Examples: `SA-AAA-WINGBOX-001.stp`, `SA-AAA-LGBAY-002.md`, `SA-AAA-STAB-003.bom.csv`

* **Zones (when applicable):** `ONB` (onboard/internal) and `OUT` (outboard/skins/LE‑TE/service). Include in filenames if zone‑specific (e.g., `SA-AAA-WINGBOX-001-ONB.md`).

* **Geometry & Evidence:** Always via UTCS anchors (CAD/DMU/CAE/QIP). Cross‑link to **PAx** and **Interference** artifacts for clearances and clashes.

---

## Required Artifacts (Minimum for CI)

| Artifact | Source (CAx) | TFA Stage | Evidence (UTCS) | Status |
| :--- | :--- | :---: | :--- | :----: |
| Master Module CAD/ASSY | CAD/DMU | QS→UE | `UTCS-MI:CAD:AAA:ASSY:{MODULE}-{IDX}:revX` | 🔄 |
| Interface Control Definition (ICD) | CAD/CAI | FE→CB | `UTCS-MI:ICD:AAA:{MODULE}-{IDX}:v1` | 🔄 |
| Sub‑Assembly BOM | CAD/ASSY | QS→UE | `UTCS-MI:BOM:AAA:{MODULE}-{IDX}:v1` | 🔄 |
| PAx Clearance & Clash Check | CAD/DMU · PAx/INT | CB→UE | `UTCS-MI:INT:CLASH:{MODULE}-{IDX}:v1` | 🔄 |
| Tolerance Stack‑up Report | CAE · Metrology | CB→UE | `UTCS-MI:SUB:TSTACK:{MODULE}-{IDX}:v1` | 🔄 |
| Fastener Torque/Pattern Schedule | CAM · QIP | FE→CB | `UTCS-MI:SUB:FASTENER:{MODULE}-{IDX}:v1` | 🔄 |
| Handling & Lifting Plan | CAI · Safety | FE→CB | `UTCS-MI:SUB:HANDLE:{MODULE}-{IDX}:v1` | 🔄 |
| QIP Hold Points & Inspection Plan | CAV/QIP | FE | `UTCS-MI:CAV:QIP:AAA:{MODULE}-{IDX}:v1` | 🔄 |
| ECR/Deviation Resolution Log | Change Control | FE | `UTCS-MI:SUB:RESLOG:{MODULE}-{IDX}:v1` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

---

## KPIs (tracked via CI)

* **Interface nonconformance rate** (ppm)
* **Mass delta vs. baseline** (kg) and **CG shift** (mm)
* **Open clash count** (count) → target **0** at release
* **Schedule maturity index** (%) and **rework rate** (%)
* **ICD compliance** (%) and **fastener torque NC rate** (ppm)
* **Change churn** (changes/week) and **lead time** (days)

---

## Directory Index (Hyperlinkable)

| Folder | Description |
| :--- | :--- |
| [Current Folder (`./`)](#) | Top‑level index of all major structural sub‑assemblies (e.g., `SA-AAA-WINGBOX-001.stp`). |
| [`wing-structure/`](./wing-structure/) | Wing‑box internals, spars, ribs, composite panels. |
| [`stabilizer-units/`](./stabilizer-units/) | Vertical/horizontal stabilizer modules. |
| [`fuselage-sections/`](./fuselage-sections/) | Pressure/payload sections of the BWB fuselage. |
| [`landing-gear-bays/`](./landing-gear-bays/) | Integration bays for landing gear systems. |
| [`pylon-interfaces/`](./pylon-interfaces/) | Interfaces between airframe and propulsion systems (PPP cross‑link). |
| [`handling-and-lifting/`](./handling-and-lifting/) | Fixture reach, sling data, COG tables, orientation limits. |
| [`fastener-schedules/`](./fastener-schedules/) | Torque, order, and pattern docs for critical joints. |
| [`tolerance-stackups/`](./tolerance-stackups/) | Stack‑up analyses and metrology correlation. |
| [`icd/`](./icd/) | Interface control definitions and datum schemes. |
| [`boms/`](./boms/) | Module BOMs and ABoM extracts. |
| [`resolution-logs/`](./resolution-logs/) | ECR/Deviation mapping and approvals. |

---

## Governance & Reviews

* **Approvals:** AAA Integration Lead (design), CAI Lead (interfaces), QA (evidence/QIP), Safety (handling/lifting).
* **Reviews:** Module freeze at M3; design freeze at M4; release at M5; deltas tracked via ECR.
* **Change Control:** PRs must carry UTCS anchors for all artifacts; CI enforces link/path validation and code naming.

---

## References

* **TFA Flow:** QS→FWD→UE→FE→CB→QB (canon)
* **Standards:** EASA CS‑25 (structures & manufacturing), ATA iSpec 2200, S1000D 6.0
* **Cross‑Links:** `domains/AAA/pax/`, `domains/AAA/interference/`, `domains/AAA/assembly/`, `PLM/CAM/OPR`, `PLM/CAV/QIP`.
```
