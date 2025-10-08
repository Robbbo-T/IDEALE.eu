# Handling and Lifting Plans — AAA Domain

This directory contains handling and lifting documentation for sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview

Fixture reach, sling data, center of gravity (COG) tables, orientation limits, and safety procedures for handling and lifting sub-assemblies during manufacturing, transport, and assembly operations.

## Naming Convention

Files follow the pattern: `SA-AAA-{MODULE}-{IDX}-HANDLE` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `SA-AAA-WINGBOX-001-HANDLE.md`

## Contents

This directory should contain:
- Lifting fixture specifications and reach diagrams
- Sling configurations and load ratings
- Center of gravity (COG) calculations and tables
- Permissible orientations during handling
- Safety procedures and precautions
- Load path analyses
- Handling sequence documentation

## TFA Context

Primary flow: **FE→CB**, ensuring safe handling procedures are established before module integration.

## UTCS Anchors

All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:SUB:HANDLE:{MODULE}-{IDX}:v1`
- `UTCS-MI:CAI:SAFETY:{MODULE}-{IDX}:v1`

## Safety Requirements

All handling and lifting plans must be:
- Reviewed by CAI (Computer-Aided Integration) team
- Approved by Safety team
- Compliant with EASA CS-25 and relevant safety standards
- Validated through load testing when required

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
