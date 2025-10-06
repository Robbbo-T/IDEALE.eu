---

id: ASIT-AMPEL360-AIR-T-AAA-PAX-OUT-MNT
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/OUT/mounting-specifications/README.md
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

# OUT Mounting Specifications — PAx/AAA Domain

## Purpose

This folder contains **Outboard (OUT) mounting specifications** for brackets, fasteners, and isolation hardware used on external surfaces, skins, and LE/TE installations.

## Contents

* **Surface mounting hardware** — Nutplates, doubler plates, attachment points
* **Fairing attachments** — Aerodynamic covers and access panels
* **Sensor mounts** — AOA, pitot, static port installations
* **External system brackets** — Lights, antennas, cameras
* **Sealing and environmental protection** — Gaskets, sealants, weatherproofing

## Naming Convention

Files follow the pattern: `PAX-AAA-OUT-MNT-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0078, 0213)

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
| Mounting Specs | CAD/PRT · CAM | `UTCS-MI:PAX:OUT:MNT:SPEC` |
| Load Analysis | CAE/FEA | `UTCS-MI:CAE:AAA:LOADS:EXT` |
| Sealing Specs | CAM | `UTCS-MI:PAX:OUT:SEAL` |

## Design Criteria

* **Aerodynamic loads** — Pressure distribution and dynamic loads
* **Thermal cycling** — -55°C to +85°C operational range
* **Corrosion protection** — Anodizing, primer, topcoat per spec
* **Fatigue life** — Per CS-25 requirements for external components
* **Removability** — Quick-release where applicable for maintenance

## Material Standards

* **Mounting hardware:** Corrosion-resistant steel, titanium
* **Fasteners:** Per NAS/MS/AN standards with corrosion protection
* **Sealants:** PR-1422 (faying surface), PR-1828 (fillet), or approved equivalent
* **Doublers:** AL-2024-T3, AL-7075-T6 per structural analysis

## Environmental Considerations

* **Lightning strike protection** — Bonding straps, grounding
* **Rain erosion** — Leading edge protection per AMS standards
* **UV resistance** — Material selection for long-term exposure
* **Ice accumulation** — De-icing/anti-icing provisions

## Status

🔄 In Progress — External mounting designs under review

---

**Related:** [PAx README](../../README.md) · [Routing Diagrams](../routing-diagrams/) · [Clearance Reports](../clearance-reports/)
