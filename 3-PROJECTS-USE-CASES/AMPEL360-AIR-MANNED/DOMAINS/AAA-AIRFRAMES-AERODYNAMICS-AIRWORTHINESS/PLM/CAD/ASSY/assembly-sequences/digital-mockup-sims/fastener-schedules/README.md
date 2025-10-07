# Fastener Schedules — Sub-Assemblies

This directory contains **torque, order, and pattern documentation for critical joints** within sub-assemblies belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Fastener schedules ensure consistent and correct installation of mechanical fasteners in structural joints. Proper torque values and installation sequences are critical for:

* Maintaining structural integrity
* Preventing joint failure or loosening
* Ensuring fatigue life requirements
* Meeting certification standards

## Contents

* **Torque Specifications** — Required torque values for each fastener type
* **Installation Sequences** — Order of fastener installation to prevent distortion
* **Pattern Layouts** — Fastener spacing and locations
* **Tooling Requirements** — Specific tools and equipment needed
* **Inspection Criteria** — Visual and measurement requirements

## Naming Convention

Files follow the template: `FAST-AAA-{MODULE}-{IDX}.{ext}`

* `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{md|pdf|xlsx}`

**Examples:**
* `FAST-AAA-WINGBOX-001.pdf` — Wing box main spar fastener schedule
* `FAST-AAA-FUSE-002.xlsx` — Fuselage frame-to-skin fastener pattern
* `FAST-AAA-STAB-001.md` — Stabilizer attachment bolt torque specifications

## TFA Context

* **Primary Loop:** FE→CB
* **UTCS Anchors:** `UTCS-MI:SUB:FASTENER:{MODULE}-{IDX}:v1`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Quality Critical:** All schedules require QIP verification

## Required Information

Each fastener schedule must include:

1. **Fastener Specifications**
   - Part number and type (bolt, rivet, Hi-Lok, etc.)
   - Material and finish
   - Diameter and grip length
   - Quantity required

2. **Torque Values**
   - Minimum and maximum torque (lb-in or N-m)
   - Torque wrench calibration requirements
   - Environmental considerations (dry/wet installation)

3. **Installation Sequence**
   - Numbered installation order
   - Tightening pattern (cross-pattern, spiral, linear)
   - Multi-pass requirements
   - Re-torque intervals

4. **Hole Preparation**
   - Hole size and tolerance
   - Surface treatment requirements
   - Sealant application (if applicable)

5. **Inspection Requirements**
   - Visual inspection criteria
   - Torque verification sampling
   - Non-conformance reporting
   - Hold points for QA inspection

## Joint Types

Fastener schedules are categorized by joint type:

* **Primary Structure Joints** — Wing spars, fuselage frames (highest criticality)
* **Secondary Structure Joints** — Interior panels, non-load bearing components
* **Skin-to-Frame Joints** — Fuselage and wing skin attachment
* **Assembly Joints** — Sub-assembly-to-sub-assembly connections
* **Access Panel Fasteners** — Removable panels and doors

## Related Directories

* `../` — Parent sub-assemblies directory
* `../utcs/` — Canonical UTCS YAML records
* `../../sub-assemblies/` — Source CAD models showing fastener locations
* `../../../PLM/CAV/QIP/` — Quality Inspection Protocols

## Standards and References

* **CS-25.613** — Material strength properties and design values
* **CS-25.625** — Fitting factors
* **NASM (National Aerospace Standard)** — Fastener specifications
* **Company Assembly Manual** — Standard practices and procedures

## Status

🔄 In Progress — Fastener schedules under development

---

**Maintainer:** AAA Integration Team & Manufacturing Engineering  
**Approval Required:** Stress Analysis, Quality Assurance  
**Last Updated:** 2025-01-26
