# Fastener Schedules — AAA Domain

This directory contains fastener torque and pattern schedules for sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview

Torque specifications, fastener sequences, tightening patterns, and quality inspection plans for critical joints within sub-assembly modules.

## Naming Convention

Files follow the pattern: `SA-AAA-{MODULE}-{IDX}-FASTENER` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `SA-AAA-WINGBOX-001-FASTENER.md`

## Contents

This directory should contain:
- Fastener type specifications (material, size, grade)
- Torque values and tolerances
- Tightening sequence and patterns
- Preload requirements
- Thread lubrication specifications
- Quality inspection procedures (QIP)
- Non-conformance handling procedures
- Fastener installation tools and equipment

## TFA Context

Primary flow: **FE→CB**, ensuring fastener specifications are validated before assembly operations.

## UTCS Anchors

All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:SUB:FASTENER:{MODULE}-{IDX}:v1`
- `UTCS-MI:CAM:QIP:{MODULE}-{IDX}:v1`

## Quality Requirements

All fastener schedules must be:
- Reviewed by CAM (Computer-Aided Manufacturing) team
- Approved by QIP (Quality Inspection Plan) team
- Compliant with EASA CS-25 and relevant manufacturing standards
- Validated through assembly trials when required

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules
- [`../icd/`](../icd/) - Interface control definitions

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
