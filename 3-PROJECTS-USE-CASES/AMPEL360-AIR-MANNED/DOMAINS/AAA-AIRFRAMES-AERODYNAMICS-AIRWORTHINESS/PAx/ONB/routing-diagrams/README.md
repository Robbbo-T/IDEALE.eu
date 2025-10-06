---

id: ASIT-AMPEL360-AIR-T-AAA-PAX-ONB-ROUTE
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/ONB/routing-diagrams/README.md
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

# ONB Routing Diagrams — PAx/AAA Domain

## Purpose

This folder contains **Onboard (ONB) routing diagrams** for wiring, piping, and duct systems within the internal fuselage/wing volume of the AMPEL360‑AIR‑T BWB architecture.

## Contents

* **Wiring routes** — Electrical harness pathways through structural frames and zones
* **Pipe routes** — Hydraulic, fuel, and pneumatic line routing
* **Duct routes** — Environmental control and ventilation duct layouts
* **Integration notes** — Cross-references to assembly drawings and interference checks

## Naming Convention

Files follow the pattern: `PAX-AAA-ONB-ROUTE-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0027, 0152)

## Required Artifacts

| Artifact | Source | Evidence |
| :--- | :--- | :--- |
| ONB Wiring Routes | CAD/ASSY · CAI/INS | `UTCS-MI:PAX:ONB:ROUTE` |
| Clash Reports | CAE | `UTCS-MI:PAX:CLR:PIPE` |

## Traceability

All routing diagrams must reference:
* **CAD Assembly** via UTCS anchors (e.g., `UTCS-MI:CAD:AAA:ASSY:57-10:revC`)
* **Parent systems** in PLM/CAI/INS
* **Clearance reports** in `../clearance-reports/`

## Status

🔄 In Progress — Initial routing plans under development

---

**Related:** [PAx README](../../README.md) · [Clearance Reports](../clearance-reports/) · [Mounting Specs](../mounting-specifications/)
