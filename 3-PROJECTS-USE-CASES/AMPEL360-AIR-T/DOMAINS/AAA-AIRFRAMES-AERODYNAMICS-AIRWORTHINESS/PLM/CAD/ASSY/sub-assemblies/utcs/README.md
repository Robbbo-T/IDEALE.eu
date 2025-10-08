# UTCS Records — AAA Domain Sub-Assemblies

This directory contains **canonical UTCS YAML records** for all module, ICD, and BOM artifacts in the sub-assemblies domain.

## Overview

The UTCS (Universal Threading Context/Content/Cache & Structure) system provides a standardized way to reference, track, and validate all artifacts across the AMPEL360-AIR-T project. All YAML records stored here serve as the authoritative metadata for sub-assembly artifacts.

## Purpose

- **Provenance tracking** - Complete lineage of all artifacts from creation to release
- **Traceability anchors** - UTCS-MI references used throughout documentation
- **Version control** - Immutable records of artifact versions and changes
- **CI/CD integration** - Automated validation of links and references
- **Audit trail** - Complete history for certification and compliance

## Naming Convention

UTCS YAML files follow the pattern: `SA-AAA-{MODULE}-{IDX}-{TYPE}.yaml` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)
- `{TYPE}` = artifact type (e.g., `CAD`, `ICD`, `BOM`, `HANDLE`, `FASTENER`)

Example: `SA-AAA-WINGBOX-001-CAD.yaml`, `SA-AAA-LGBAY-002-ICD.yaml`

## YAML Schema

Each UTCS record includes:
- **Threading** - Context (mission/env/refs), Content (summary/refs), Cache (exports/thumbnails)
- **Structure** - Schema definition with domain-specific fields
- **Style** - Naming conventions, units, notation standards
- **Sheet** - File manifest with roles (spec/geometry/evidence)
- **Evidence** - Requirements, checks, and UTCS anchor links
- **Security** - Classification and access controls
- **Integrity** - Hash and signature for provenance

## TFA Context

Primary flow: **QS**, maintaining the provenance ledger for all sub-assembly artifacts.

## UTCS Anchor Format

All anchors follow the format:
- `UTCS-MI:CAD:AAA:ASSY:{MODULE}-{IDX}:revX`
- `UTCS-MI:ICD:AAA:{MODULE}-{IDX}:v1`
- `UTCS-MI:BOM:AAA:{MODULE}-{IDX}:v1`
- `UTCS-MI:SUB:TSTACK:{MODULE}-{IDX}:v1`
- `UTCS-MI:SUB:FASTENER:{MODULE}-{IDX}:v1`
- `UTCS-MI:SUB:HANDLE:{MODULE}-{IDX}:v1`
- `UTCS-MI:SUB:RESLOG:{MODULE}-{IDX}:v1`

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules
- [`../icd/`](../icd/) - Interface control definitions
- [`../boms/`](../boms/) - Module BOMs

## CI/CD Integration

UTCS records are validated by CI/CD pipelines to ensure:
- All referenced artifacts exist
- Anchor formats are correct
- Version consistency across references
- Hash integrity is maintained
- No orphaned or dangling references

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions and governance procedures.
