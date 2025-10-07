# Tolerance Stack-ups — Sub-Assemblies

This directory contains **stack-up analyses and metrology correlation** for sub-assemblies belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Tolerance stack-up analysis ensures that cumulative dimensional variations from individual parts and assembly processes remain within acceptable limits for proper fit, function, and performance. This folder manages:

* Dimensional tolerance chains
* Statistical analysis of tolerance effects
* Critical dimension verification plans
* Metrology correlation studies
* Assembly shimming and adjustment strategies

## Contents

* **Stack-up Analysis Reports** — Calculations showing tolerance accumulation
* **Critical Dimension Lists** — Key measurements requiring verification
* **Metrology Plans** — Measurement methods and acceptance criteria
* **Shimming Strategies** — Adjustable fit provisions
* **As-Built Correlation** — Comparison of predicted vs. measured dimensions

## Naming Convention

Files follow the template: `TSTACK-AAA-{MODULE}-{IDX}.{ext}`

* `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{md|pdf|xlsx}`

**Examples:**
* `TSTACK-AAA-WINGBOX-001.pdf` — Wing box chord-wise alignment tolerance stack-up
* `TSTACK-AAA-FUSE-002.xlsx` — Fuselage section mating interface analysis
* `TSTACK-AAA-STAB-001.md` — Stabilizer incidence angle tolerance study

## TFA Context

* **Primary Loop:** CB→UE
* **UTCS Anchors:** `UTCS-MI:SUB:TSTACK:{MODULE}-{IDX}:v1`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Cross-Domain:** CAV (Validation) for metrology verification

## Analysis Types

### 1. Worst-Case Analysis
* Conservative approach assuming all tolerances stack at maximum deviation
* Used for safety-critical dimensions
* Ensures no interference under any condition

### 2. Statistical Analysis (RSS)
* Root Sum Square method for more realistic predictions
* Assumes random variation distribution
* Appropriate for non-safety-critical dimensions

### 3. Monte Carlo Simulation
* Probabilistic analysis with manufacturing process capability data
* Predicts assembly yield and shimming requirements
* Used for complex multi-part assemblies

## Required Information

Each tolerance stack-up analysis must include:

1. **Dimensional Chain**
   - Sequence of dimensions affecting critical feature
   - Part-to-part and assembly process contributions
   - Datum reference scheme

2. **Tolerance Budget**
   - Individual part tolerances
   - Assembly process tolerances
   - Interface gap/clearance requirements
   - Total allowable variation

3. **Critical Dimensions**
   - Features requiring tight control
   - Aerodynamic surfaces (contour, incidence angles)
   - Structural interfaces (bolt hole patterns, mating surfaces)
   - Systems clearances (wire bundles, ducts, actuators)

4. **Adjustment Provisions**
   - Shimming locations and ranges
   - Adjustable hardware specifications
   - Measurement points for adjustment decisions

5. **Verification Plan**
   - Measurement methods (CMM, laser tracker, tooling holes)
   - Acceptance criteria
   - Nonconformance disposition process

## Key Considerations

* **Aerodynamic Contours** — Wing/stabilizer profiles must maintain design shape within tolerance
* **Structural Alignment** — Load paths require proper alignment to avoid stress concentrations
* **Systems Clearances** — Moving parts (control surfaces, landing gear) must have adequate clearance
* **Assembly Sequence** — Tolerance accumulation depends on build-up order
* **Manufacturing Capability** — Tolerances must be achievable with available processes

## Related Directories

* `../` — Parent sub-assemblies directory
* `../utcs/` — Canonical UTCS YAML records
* `../icd/` — Interface Control Definitions with mating tolerances
* `../../sub-assemblies/` — Source CAD models with dimension chains
* `../../../PLM/CAV/MEAS/` — Measurement results for correlation

## Standards and References

* **CS-25.303** — Factor of safety (tolerances affecting strength)
* **ISO 1101** — Geometrical tolerancing standards
* **ASME Y14.5** — Dimensioning and tolerancing
* **Company Tolerance Standards** — Manufacturing capability guidelines

## Status

🔄 In Progress — Tolerance stack-up analyses under development

---

**Maintainer:** AAA Integration Team & Metrology Engineering  
**Approval Required:** Chief Engineer, Quality Assurance  
**Last Updated:** 2025-01-26
