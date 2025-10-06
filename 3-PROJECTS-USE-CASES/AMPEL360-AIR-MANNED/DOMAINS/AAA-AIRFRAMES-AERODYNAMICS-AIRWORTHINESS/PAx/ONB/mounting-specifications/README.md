---

id: ASIT-AMPEL360-AIR-T-AAA-PAX-ONB-MNT
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/ONB/mounting-specifications/README.md
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

# ONB Mounting Specifications — PAx/AAA Domain

## Purpose

This folder contains **Onboard (ONB) mounting specifications** for brackets, isolators, and fasteners used to secure components, systems, and routing within the internal airframe structure.

## Contents

* **Bracket specifications** — Custom and standard mounting hardware
* **Vibration isolators** — Shock and vibration protection specs
* **Fastener schedules** — Bolt/rivet/clamp specifications by location
* **Load analysis** — Mounting point load cases and margins
* **Installation procedures** — Assembly sequences and torque specs

## Naming Convention

Files follow the pattern: `PAX-AAA-ONB-MNT-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0089, 0234)

## UTCS Canon Format

Each artifact should include a YAML file following the **UTCS Canon** (UiX Threading Context/Content/Cache & Structure/Style/Sheet) schema. See [`PAX-AAA-ONB-MNT-0001.yaml`](./PAX-AAA-ONB-MNT-0001.yaml) for a complete example with:

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
| Mounting Specs | CAD/PRT · CAM | `UTCS-MI:PAX:MNT:SPEC` |
| Load Analysis | CAE/FEA | `UTCS-MI:CAE:AAA:LOADS` |
| Vibration Isolators | CAD/PRT | `UTCS-MI:PAX:MNT:SHOCK` |

## Design Criteria

* **Shock/Vibe transmissibility** (ζ) — Isolation effectiveness
* **Static load margins** — Minimum 1.5× ultimate load
* **Fatigue life** — Per CS-25 requirements
* **Accessibility** — Tool clearance for installation/removal
* **Weight budget** — Track added mass (kg) vs baseline

## Material Standards

* **Brackets:** AL-7075-T6, titanium (high-temp zones)
* **Fasteners:** Per NAS/AN standards
* **Isolators:** Barry Controls, LORD Corporation approved types

## Status

🔄 In Progress — Mounting designs under review

---

**Related:** [PAx README](../../README.md) · [Routing Diagrams](../routing-diagrams/) · [Access Panels](../access-panels-layout/)
