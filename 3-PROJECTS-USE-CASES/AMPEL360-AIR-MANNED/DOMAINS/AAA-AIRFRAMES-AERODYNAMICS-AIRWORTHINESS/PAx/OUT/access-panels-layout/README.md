---

id: ASIT-AMPEL360-AIR-T-AAA-PAX-OUT-ACCESS
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/OUT/access-panels-layout/README.md
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

# OUT Access Panels and Hatches — PAx/AAA Domain

## Purpose

This folder contains **Outboard (OUT) access panel and hatch layouts** for external inspection, service, and maintenance openings on skins, leading edges, trailing edges, and service areas.

## Contents

* **Access panel locations** — External inspection and service points
* **Hatch specifications** — Size, type, fastener schedules, sealing
* **Service door layouts** — Ground service access (fuel, hydraulic, electrical)
* **Aerodynamic fairings** — Quick-access covers with minimal drag penalty
* **Maintenance procedures** — Cross-references to AMM/IPC

## Naming Convention

Files follow the pattern: `PAX-AAA-OUT-ACCESS-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0049, 0132)

## UTCS Canon Format

Each artifact should include a YAML file following the **UTCS Canon** (UiX Threading Context/Content/Cache & Structure/Style/Sheet) schema for complete traceability:

* **Threading** — Context (mission/env/refs), Content (summary/refs), Cache (exports/thumbnails)
* **Structure** — Schema definition with domain-specific fields
* **Style** — Naming conventions, units, notation standards
* **Sheet** — File manifest with roles (spec/geometry/evidence)
* **Evidence** — Requirements, checks, and UTCS anchor links
* **Security** — Classification and access controls
* **Integrity** — Hash and signature for provenance

## Required Artifacts

| Artifact | Source | Evidence |
| :--- | :--- | :--- |
| Access Panel Layouts | CAD/ASSY | `UTCS-MI:PAX:OUT:ACCESS:LAYOUT` |
| Service Access Study | CAI · FWD | `UTCS-MI:PAX:OUT:SERVICE` |
| Aero Impact Analysis | CAE/CFD | `UTCS-MI:AERO:DRAG:PANEL` |

## Design Standards

* **Flush-mount panels:** ≤ 2mm surface protrusion
* **Quick-access fasteners:** Dzus, Camloc, or equivalent (≤ 1min removal)
* **Sealing effectiveness:** Water/air leak test per spec
* **Panel density:** Minimize count for reduced weight and drag
* **Ground access:** ≤ 3m ladder height for routine service

## Panel Types

* **Type A — Inspection:** Small panels for visual checks (300mm × 300mm)
* **Type B — Service:** Medium panels for fluid/electrical service (500mm × 500mm)
* **Type C — Removal:** Large hatches for component R&R (≥ 800mm × 800mm)
* **Type D — Emergency:** Quick-removal panels for AOG situations

## Aerodynamic Considerations

* **Drag penalty:** ≤ 0.5 counts per panel
* **Surface smoothness:** Gap/step tolerances per laminar flow requirements
* **Flush alignment:** ±0.5mm surface tolerance
* **Sealing:** No leakage at cruise pressure differential

## Cross-References

* **AMM (Aircraft Maintenance Manual)** — Access procedures
* **IPC (Illustrated Parts Catalog)** — Panel part numbers
* **SRM (Structural Repair Manual)** — Damage inspection access

## Status

🔄 In Progress — External access panel designs in review

---

**Related:** [PAx README](../../README.md) · [Mounting Specs](../mounting-specifications/) · [Clearance Reports](../clearance-reports/)
