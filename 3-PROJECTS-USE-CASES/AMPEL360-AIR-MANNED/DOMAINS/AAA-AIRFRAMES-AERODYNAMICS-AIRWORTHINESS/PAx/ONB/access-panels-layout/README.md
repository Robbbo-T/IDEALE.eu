---

id: ASIT-AMPEL360-AIR-T-AAA-PAX-ONB-ACCESS
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/pax/ONB/access-panels-layout/README.md
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

# ONB Access Panels Layout — PAx/AAA Domain

## Purpose

This folder contains **Onboard (ONB) maintenance access panel layouts** documenting inspection points, service openings, and accessibility provisions within the internal airframe structure.

## Contents

* **Access panel locations** — Coordinates and zone assignments
* **Panel specifications** — Size, type, fastener count, seal requirements
* **Maintainability studies** — Access time analysis and tool clearance
* **Inspection procedures** — Cross-references to AMM/IPC documentation
* **Human factors** — Ergonomic constraints and worker envelope clearances

## Naming Convention

Files follow the pattern: `PAX-AAA-ONB-ACCESS-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0067, 0145)

## Required Artifacts

| Artifact | Source | Evidence |
| :--- | :--- | :--- |
| Access Panel Layouts | CAD/ASSY | `UTCS-MI:PAX:ACCESS:LAYOUT` |
| Maintainability Study | CAI · FWD (sim) | `UTCS-MI:PAX:MNT:TIME` |
| Human Factors Analysis | CAI | `UTCS-MI:HF:ACCESS` |

## Design Standards

* **Panel size minimum:** 300mm × 300mm (standard inspection)
* **Access frequency zones:**
  * Daily/Preflight: ≤ 2min access time
  * 100-hour: ≤ 5min access time
  * Major inspection: ≤ 15min access time
* **Tool clearance:** ≥ 150mm for common hand tools
* **Worker envelope:** Per CS-25 Appendix D human factors

## KPIs Tracked

* **Access time P95** (min)
* **Panel count by zone**
* **Seal integrity test results**
* **Fastener removal time** (per panel)

## Cross-References

* **AMM (Aircraft Maintenance Manual)** — ATA Chapter references
* **IPC (Illustrated Parts Catalog)** — Panel part numbers
* **SRM (Structural Repair Manual)** — Access for structural inspection

## Status

🔄 In Progress — Maintainability reviews scheduled

---

**Related:** [PAx README](../../README.md) · [Mounting Specs](../mounting-specifications/) · [Clearance Reports](../clearance-reports/)
