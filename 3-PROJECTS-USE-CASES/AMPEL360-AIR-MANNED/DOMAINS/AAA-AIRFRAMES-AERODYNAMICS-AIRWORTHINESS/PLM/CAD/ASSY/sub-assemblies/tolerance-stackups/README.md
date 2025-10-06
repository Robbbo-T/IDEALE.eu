# Tolerance Stack-up Analyses — AAA Domain

This directory contains tolerance stack-up reports and metrology correlation data for sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview

Sequential tolerance analyses, dimensional variation studies, statistical correlation, and metrology validation for key dimensions and interfaces in sub-assembly modules.

## Naming Convention

Files follow the pattern: `SA-AAA-{MODULE}-{IDX}-TSTACK` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `SA-AAA-WINGBOX-001-TSTACK.md`

## Contents

This directory should contain:
- Dimensional chain analyses
- Worst-case and statistical tolerance studies
- Root sum square (RSS) calculations
- Monte Carlo simulation results (when applicable)
- Measurement correlation data
- Variation sources and contributors
- Critical dimension monitoring plans
- Interface gap and clearance analyses

## TFA Context

Primary flow: **CB→UE**, ensuring dimensional compliance before module release.

## UTCS Anchors

All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:SUB:TSTACK:{MODULE}-{IDX}:v1`
- `UTCS-MI:CAE:METROLOGY:{MODULE}-{IDX}:v1`

## Quality Requirements

All tolerance stack-up reports must be:
- Reviewed by CAE (Computer-Aided Engineering) team
- Approved by Metrology team
- Compliant with EASA CS-25 dimensional requirements
- Validated through physical measurements when required
- Updated with as-built data

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules
- [`../icd/`](../icd/) - Interface control definitions

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
