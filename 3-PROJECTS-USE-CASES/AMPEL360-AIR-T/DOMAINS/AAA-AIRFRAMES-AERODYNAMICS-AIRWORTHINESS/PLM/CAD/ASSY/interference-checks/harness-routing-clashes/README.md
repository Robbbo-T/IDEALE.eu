# Harness Routing Clashes — Interference Checks

This folder documents interference checks between electrical harnesses, hydraulic/pneumatic pipes, ducts, and structural components, ensuring proper routing and installation clearances (PAx verification).

---

## Purpose

Harness and pipe routing is critical for manufacturability and maintainability. This folder tracks physical conflicts between flexible routing (cables, wires, hoses, tubes) and rigid structures, as well as between different routing bundles.

---

## Contents

* **Harness-to-structure clash reports**
* **Pipe/duct-to-structure interference analyses**
* **Bundle-to-bundle conflicts**
* **Installation path verification**
* **Routing clearance compliance** vs. minimum bend radius and thermal limits

---

## Naming Convention

Files follow the template: `INT-AAA-{ZONE}-HARNESS-{IDX}.{ext}`

* `{ZONE}` ∈ `{ONB|OUT}`
* `{IDX}` = 4‑digit serial (e.g., `0001`, `0038`)
* `{ext}` ∈ `{md|csv|pdf|png}`

**Examples:**
* `INT-AAA-ONB-HARNESS-0007.md` — Electrical harness routing report
* `INT-AAA-OUT-HARNESS-0015.csv` — Hydraulic line clash summary
* `INT-AAA-ONB-HARNESS-0023.pdf` — Duct routing visualization

---

## Required Content

Each routing report must include:

* **UTCS Anchor**: Route ID, affected harness/pipe, structural components
* **Routing System**: Electrical (CAI/INS), hydraulic, pneumatic, fuel, air conditioning
* **Clash Description**: Type (pinch point, bend radius violation, thermal proximity)
* **As-Routed Configuration**: CAD reference and revision
* **Clearance Requirement**: Minimum spacing per standard (e.g., MIL-STD-1472, ATA iSpec 2200)
* **Actual Clearance**: Measured gap
* **Installation Sequence**: Impact on assembly/removal process
* **Mitigation**: Re-routing, bracket relocation, protection (sleeving, heat shield)

---

## Common Routing Systems

* **Electrical Harnesses**: Power, data, avionics
* **Hydraulic Lines**: Flight controls, landing gear, brakes
* **Pneumatic Lines**: Air conditioning, de-icing
* **Fuel Lines**: Tank-to-engine feed systems
* **Ducting**: Environmental control, ventilation

---

## TFA Stage

**FE** (cross-subsystem coordination) → **CB** (routing rule enforcement)

Routing clashes require **FE** coordination between structural and systems teams, with **CB** enforcement of routing rules.

---

## Integration with PAx

This folder is tightly coupled with:
* `domains/AAA/PAx/ONB/routing-diagrams/`
* `domains/AAA/PAx/OUT/routing-diagrams/`
* `PLM/CAI/INS/` (installation planning)

---

## KPIs

* **Harness route clashes** (count)
* **Resolution percentage** (%)
* **Installation impact** (added time/complexity)

---

## Status

🔄 **In Progress** — Electrical harness routing underway

---

## References

* Parent: [../README.md](../README.md)
* Related: [../../../../../../PAx/](../../../../../../PAx/)
* Standards: MIL-STD-1472, ATA iSpec 2200, S1000D 6.0
