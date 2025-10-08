# Landing Gear Bays — Sub-Assemblies

This directory contains CAD models, metadata, and documentation for **integration bays for landing gear systems** belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Landing gear bays provide structural support and retraction space for the landing gear assemblies. This folder manages sub-assembly artifacts for:

* Main landing gear bay structures (left and right)
* Nose landing gear bay structure
* Bay door mechanisms and actuator mounts
* Structural reinforcement and load paths
* System integration provisions (hydraulics, electrical, sensors)

## Contents

* **CAD/DMU sources** — STEP files and native CAD models for landing gear bays
* **Interface Control Definitions (ICD)** — Interfaces with airframe and landing gear systems
* **Sub‑Assembly BOMs** — Component lists for bay structures
* **Load analysis results** — Landing loads and retraction loads documentation
* **Clearance studies** — Gear retraction envelope verification

## Naming Convention

Files follow the template: `SA-AAA-LGBAY-{IDX}.{ext}`

* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{stp|md|csv|pdf}`

**Examples:**
* `SA-AAA-LGBAY-001.stp` — Main landing gear bay (left)
* `SA-AAA-LGBAY-002.stp` — Main landing gear bay (right)
* `SA-AAA-LGBAY-003.stp` — Nose landing gear bay
* `SA-AAA-LGBAY-004.md` — Bay door mechanism documentation

## TFA Context

* **Primary Loop:** FE→CB→UE
* **UTCS Anchors:** `UTCS-MI:CAD:AAA:ASSY:LGBAY-{IDX}:revX`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Cross-Domain:** LLL (Landing, Lighting, Life-support) for landing gear integration

## Key Considerations

* **Structural Integrity:** Bay must withstand landing loads and dynamic retraction forces
* **Kinematic Clearances:** Retraction and extension paths must be verified via DMU
* **Door Sealing:** Aerodynamic smoothness when doors are closed
* **Access Requirements:** Maintenance access for gear servicing
* **Emergency Extension:** Manual/gravity extension capability

## Related Directories

* `../` — Parent sub-assemblies directory
* `../icd/` — Interface Control Definitions
* `../boms/` — Module BOMs
* `../utcs/` — Canonical UTCS YAML records
* `../../interference-checks/` — Kinematic clash verification

## Status

🔄 In Progress — Landing gear bay definitions under development

---

**Maintainer:** AAA Integration Team  
**Last Updated:** 2025-01-26
