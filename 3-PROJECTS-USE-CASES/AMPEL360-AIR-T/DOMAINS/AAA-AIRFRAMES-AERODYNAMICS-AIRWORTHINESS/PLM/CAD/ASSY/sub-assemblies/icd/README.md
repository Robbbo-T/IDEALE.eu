# Interface Control Definitions (ICD) — AAA Domain

This directory contains Interface Control Definitions for sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview

Mating conditions, fastener patterns, tolerances, datum schemes, allowable gaps, and interface specifications that govern how sub-assemblies connect to each other and to the main airframe.

## Naming Convention

Files follow the pattern: `SA-AAA-{MODULE}-{IDX}-ICD` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `SA-AAA-WINGBOX-001-ICD.md`

## Contents

This directory should contain:
- Interface geometry definitions
- Mating surface specifications
- Datum reference frames
- Fastener hole patterns and locations
- Interface tolerance requirements
- Allowable gaps and clearances
- Seal and gasket specifications
- Electrical bonding requirements
- Interface test and verification procedures

## TFA Context

Primary flow: **FE→CB**, coordinating multiple module interfaces into the master structure.

## UTCS Anchors

All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:ICD:AAA:{MODULE}-{IDX}:v1`
- `UTCS-MI:CAD:CAI:{MODULE}-{IDX}:v1`

## Interface Control Requirements

All ICDs must be:
- Reviewed by AAA Integration Lead
- Approved by CAI (Computer-Aided Integration) Lead
- Cross-referenced with mating component ICDs
- Validated through assembly trials or digital mock-ups
- Updated with as-built deviations

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules
- [`../fastener-schedules/`](../fastener-schedules/) - Fastener specifications
- [`../tolerance-stackups/`](../tolerance-stackups/) - Tolerance analyses

## Cross-Domain References

- PAx domain for clearance and clash checks
- Interference domain for assembly verification

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
