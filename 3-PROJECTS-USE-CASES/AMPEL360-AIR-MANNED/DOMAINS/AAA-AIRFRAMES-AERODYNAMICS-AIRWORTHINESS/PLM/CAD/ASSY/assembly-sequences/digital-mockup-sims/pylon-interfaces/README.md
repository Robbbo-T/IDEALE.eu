# Pylon Interfaces — Sub-Assemblies

This directory contains CAD models, metadata, and documentation for **interfaces between airframe and propulsion systems (PPP cross‑link)** belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Pylons provide the structural connection between the airframe and the propulsion system. This folder manages sub-assembly artifacts for:

* Pylon structural attachment points to wing/fuselage
* Engine mount interfaces
* Thrust transfer structures
* Systems integration provisions (fuel, hydraulics, electrical)
* Aerodynamic fairings

## Contents

* **CAD/DMU sources** — STEP files and native CAD models for pylon interfaces
* **Interface Control Definitions (ICD)** — Interfaces with PPP (Propulsion-Powerplant-Power) domain
* **Sub‑Assembly BOMs** — Component lists for pylon structures
* **Load analysis results** — Thrust loads, inertial loads, and structural paths
* **Vibration isolation studies** — Engine vibration mitigation documentation

## Naming Convention

Files follow the template: `SA-AAA-PYLON-{IDX}.{ext}`

* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{stp|md|csv|pdf}`

**Examples:**
* `SA-AAA-PYLON-001.stp` — Pylon structure (engine position 1)
* `SA-AAA-PYLON-002.stp` — Pylon structure (engine position 2)
* `SA-AAA-PYLON-003.md` — Thrust mount interface documentation

## TFA Context

* **Primary Loop:** FE→CB→UE
* **UTCS Anchors:** `UTCS-MI:CAD:AAA:ASSY:PYLON-{IDX}:revX`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Cross-Domain:** PPP (Propulsion-Powerplant-Power) for engine integration

## Key Considerations

* **Structural Integrity:** Pylon must transfer engine thrust loads to airframe safely
* **Engine Separation:** Emergency engine separation provisions per CS-25.903
* **Vibration Isolation:** Minimize transmission of engine vibrations to airframe
* **Maintenance Access:** Quick-disconnect provisions for engine removal/installation
* **Systems Routing:** Protected routing for fuel lines, hydraulics, electrical harnesses
* **Aerodynamic Performance:** Minimize drag and maintain laminar flow where possible

## Related Directories

* `../` — Parent sub-assemblies directory
* `../icd/` — Interface Control Definitions
* `../boms/` — Module BOMs
* `../utcs/` — Canonical UTCS YAML records
* `../../../PPP/` — Cross-domain link to Propulsion systems

## Status

🔄 In Progress — Pylon interface definitions under development

---

**Maintainer:** AAA Integration Team  
**Cross-Domain Coordination:** PPP Domain Lead  
**Last Updated:** 2025-01-26
