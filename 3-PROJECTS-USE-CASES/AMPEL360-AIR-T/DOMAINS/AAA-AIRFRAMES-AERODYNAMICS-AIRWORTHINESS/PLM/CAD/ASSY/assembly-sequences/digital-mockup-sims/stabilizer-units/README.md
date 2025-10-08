# Stabilizer Units — Sub-Assemblies

This directory contains CAD models, metadata, and documentation for **vertical and horizontal stabilizer modules** belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Stabilizer units are critical control surfaces that provide directional and pitch stability for the aircraft. This folder manages the sub-assembly artifacts for both vertical and horizontal stabilizers, including:

* Vertical stabilizer structure and integration points
* Horizontal stabilizer sections (left and right)
* Control surface mounting interfaces
* Actuator attachment provisions

## Contents

* **CAD/DMU sources** — STEP files and native CAD models for stabilizer modules
* **Interface Control Definitions (ICD)** — Mating conditions with fuselage and control surfaces
* **Sub‑Assembly BOMs** — Component lists for stabilizer modules
* **Structural analysis results** — Load paths and stress distributions
* **Assembly sequence documentation** — Installation procedures and tooling requirements

## Naming Convention

Files follow the template: `SA-AAA-STAB-{IDX}.{ext}`

* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{stp|md|csv|pdf}`

**Examples:**
* `SA-AAA-STAB-001.stp` — Vertical stabilizer main structure
* `SA-AAA-STAB-002.stp` — Horizontal stabilizer left section
* `SA-AAA-STAB-003.md` — Assembly sequence documentation

## TFA Context

* **Primary Loop:** FE→CB→UE
* **UTCS Anchors:** `UTCS-MI:CAD:AAA:ASSY:STAB-{IDX}:revX`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)

## Related Directories

* `../` — Parent sub-assemblies directory
* `../icd/` — Interface Control Definitions
* `../boms/` — Module BOMs
* `../utcs/` — Canonical UTCS YAML records

## Status

🔄 In Progress — Stabilizer module definitions under development

---

**Maintainer:** AAA Integration Team  
**Last Updated:** 2025-01-26
