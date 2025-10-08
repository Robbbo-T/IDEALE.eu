# Bills of Materials (BOM) — AAA Domain

This directory contains module-level Bills of Materials for sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview

Module-level component lists, part specifications, and assembly hierarchy derived from the top-level BOM. Each sub-assembly BOM defines all parts, materials, and quantities required for that specific module.

## Naming Convention

Files follow the pattern: `SA-AAA-{MODULE}-{IDX}-BOM` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `SA-AAA-WINGBOX-001-BOM.csv`

## File Formats

BOMs may be provided in multiple formats:
- `.csv` - Comma-separated values (preferred for data exchange)
- `.json` - JSON format (for structured data and automation)
- `.md` - Markdown format (for human-readable documentation)

## Contents

Each BOM should include:
- Part numbers and descriptions
- Quantity per assembly
- Material specifications
- Manufacturing process codes
- Supplier information
- Mass and center of gravity contributions
- Configuration control information
- Revision history
- Links to detailed part drawings or models

## TFA Context

Primary flow: **QS→UE**, maintaining provenance of module components.

## UTCS Anchors

All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:BOM:AAA:{MODULE}-{IDX}:v1`
- `UTCS-MI:CAD:ASSY:{MODULE}-{IDX}:revX`

## BOM Management Requirements

All BOMs must be:
- Derived from top-level assembly BOMs
- Reviewed by AAA Integration Team
- Approved by Configuration Management
- Synchronized with CAD assembly structures
- Updated with Engineering Change Requests (ECR)
- Traceable to as-built configurations

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules
- [`../resolution-logs/`](../resolution-logs/) - ECR and deviation tracking

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
