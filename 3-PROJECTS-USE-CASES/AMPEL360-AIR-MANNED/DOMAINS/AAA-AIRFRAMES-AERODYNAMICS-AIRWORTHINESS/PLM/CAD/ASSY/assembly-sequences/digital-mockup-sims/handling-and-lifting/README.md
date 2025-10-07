# Handling and Lifting — Sub-Assemblies

This directory contains documentation for **fixture reach, sling data, COG tables, and orientation limits** for sub-assemblies belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Proper handling and lifting procedures are critical for safety and preventing damage to aircraft structures during manufacturing, assembly, and maintenance operations. This folder manages:

* Lifting fixture designs and specifications
* Sling attachment point locations and load ratings
* Center of Gravity (COG) calculations for various assembly states
* Permissible orientation limits during handling
* Transportation and storage requirements

## Contents

* **Lifting Plans** — Detailed procedures for lifting each sub-assembly
* **COG Tables** — Center of gravity data for different configurations
* **Fixture Drawings** — CAD models and drawings of specialized lifting fixtures
* **Load Calculations** — Structural verification of lifting points
* **Safety Requirements** — Personnel safety and structural protection guidelines

## Naming Convention

Files follow the template: `HANDLE-AAA-{MODULE}-{IDX}.{ext}`

* `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{md|pdf|xlsx|dwg}`

**Examples:**
* `HANDLE-AAA-WINGBOX-001.pdf` — Wing box lifting procedure
* `HANDLE-AAA-FUSE-002.xlsx` — Fuselage section COG table
* `HANDLE-AAA-STAB-001.md` — Stabilizer handling requirements

## TFA Context

* **Primary Loop:** FE→CB
* **UTCS Anchors:** `UTCS-MI:SUB:HANDLE:{MODULE}-{IDX}:v1`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Safety Critical:** All procedures require safety review and approval

## Required Information

Each handling plan must include:

1. **Weight and COG Data**
   - Total assembly weight
   - Center of gravity location (X, Y, Z coordinates)
   - COG variations for different component states

2. **Lifting Point Specifications**
   - Attachment point locations
   - Load ratings and safety factors
   - Structural verification references

3. **Fixture Requirements**
   - Special tools and equipment needed
   - Fixture installation procedures
   - Inspection requirements

4. **Orientation Limits**
   - Maximum tilt angles
   - Prohibited orientations
   - Stability requirements

5. **Safety Precautions**
   - Personnel clearance zones
   - Ground support equipment requirements
   - Emergency procedures

## Related Directories

* `../` — Parent sub-assemblies directory
* `../utcs/` — Canonical UTCS YAML records
* `../../sub-assemblies/` — Source CAD models for weight/COG calculations

## Standards and References

* **CS-25 Subpart C** — Structure (Ground Handling Loads)
* **MIL-STD-209** — Lifting and Tiedown Provisions
* **Company Safety Manual** — Handling procedures and safety requirements

## Status

🔄 In Progress — Handling and lifting plans under development

---

**Maintainer:** AAA Integration Team & Safety Engineering  
**Approval Required:** Safety Officer, Structural Analysis Lead  
**Last Updated:** 2025-01-26
