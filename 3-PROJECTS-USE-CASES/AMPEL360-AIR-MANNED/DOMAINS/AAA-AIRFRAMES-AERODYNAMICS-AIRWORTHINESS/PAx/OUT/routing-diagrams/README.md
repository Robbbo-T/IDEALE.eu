---

id: ASIT-AMPEL360-AIR-T-AAA-PAX-OUT-ROUTE
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/OUT/routing-diagrams/README.md
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

# OUT Routing Diagrams — PAx/AAA Domain

## Purpose

This folder contains **Outboard (OUT) routing diagrams** for wiring, piping, and systems across external skins, leading edge (LE), trailing edge (TE), and service areas of the AMPEL360‑AIR‑T BWB architecture.

## Contents

* **Skin-mounted routes** — Wiring and sensor harnesses on external surfaces
* **LE/TE systems routing** — Anti-ice, control surface actuators, sensors
* **External service connections** — Ground service panels and connectors
* **Environmental protection** — Weatherproofing and drainage provisions

## Naming Convention

Files follow the pattern: `PAX-AAA-OUT-ROUTE-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0035, 0198)

## Required Artifacts

| Artifact | Source | Evidence |
| :--- | :--- | :--- |
| OUT Wiring Routes | CAD/ASSY · CAI/INS | `UTCS-MI:PAX:OUT:ROUTE` |
| Environmental Protection | CAE | `UTCS-MI:PAX:OUT:ENV` |

## Design Considerations

* **Lightning protection** — Bonding and grounding requirements
* **Ice/rain protection** — Heater blanket routing, drainage
* **UV/thermal exposure** — Material selection for external environment
* **Aerodynamic impact** — Minimal surface disruption, fairing requirements
* **EMI shielding** — Antenna and sensor interference mitigation

## Traceability

All routing diagrams must reference:
* **CAD Assembly** via UTCS anchors (e.g., `UTCS-MI:CAD:AAA:ASSY:SKIN:revB`)
* **Environmental analysis** in PLM/CAE
* **Clearance reports** in `../clearance-reports/`

## Status

🔄 In Progress — External routing plans under development

---

**Related:** [PAx README](../../README.md) · [Clearance Reports](../clearance-reports/) · [Mounting Specs](../mounting-specifications/)
