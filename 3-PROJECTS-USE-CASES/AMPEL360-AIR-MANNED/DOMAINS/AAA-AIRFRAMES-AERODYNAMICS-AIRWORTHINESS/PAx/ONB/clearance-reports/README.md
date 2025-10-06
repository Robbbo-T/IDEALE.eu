---

id: ASIT-AMPEL360-AIR-T-AAA-PAX-ONB-CLR
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/ONB/clearance-reports/README.md
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

# ONB Clearance Reports — PAx/AAA Domain

## Purpose

This folder contains **Onboard (ONB) clearance matrices and clash export reports** documenting spatial separation between components, systems, and structural elements within the internal airframe volume.

## Contents

* **Clearance matrices** — Minimum clearance values by zone and station
* **Clash detection reports** — Interference analysis from CAE tools
* **Deviation tracking** — Documented exceptions and approved variances
* **Thermal clearances** — Heat source proximity analysis

## Naming Convention

Files follow the pattern: `PAX-AAA-ONB-CLR-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0042, 0188)

## Required Artifacts

| Artifact | Source | Evidence |
| :--- | :--- | :--- |
| Clearance Matrices | CAI/INS | `UTCS-MI:PAX:CLR:MATRIX` |
| Clash Reports | CAD/ASSY · CAE | `UTCS-MI:PAX:CLR:PIPE` |

## Minimum Clearance Standards

* **Electrical harness to structure:** ≥ 15mm
* **Hydraulic lines to hot zones:** ≥ 50mm
* **Moving parts envelope:** ≥ 25mm
* **Maintenance access paths:** ≥ 600mm width

## KPIs Tracked

* **Clash count** → Target: 0
* **Minimum clearance by zone** (mm)
* **Thermal margin** (°C) near heat sources
* **EMI margin** (dB)

## Status

🔄 In Progress — Initial clearance validation underway

---

**Related:** [PAx README](../../README.md) · [Routing Diagrams](../routing-diagrams/) · [Mounting Specs](../mounting-specifications/)
