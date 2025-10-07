# Wing Structure Sub-Assemblies — AAA Domain

This directory contains CAD models, metadata, and documentation for **wing-structure** sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview
Wing-box internals, spars, ribs, and composite panels that form the primary structural elements of the wing system.

## Naming Convention
Files follow the pattern: `SA-AAA-WINGBOX-{IDX}` or zone-specific variants:
- `SA-AAA-WINGBOX-{IDX}-ONB` for onboard/internal elements
- `SA-AAA-WINGBOX-{IDX}-OUT` for outboard/external elements

Where `{IDX}` is a 3-digit serial number (e.g., 001, 002, 003).

## Contents
This directory should contain:
- CAD/DMU assembly files (STEP format)
- Module-specific BOMs
- Interface Control Definitions (ICD)
- Handling and lifting plans
- Fastener schedules
- Tolerance stack-up reports
- PAx clearance and clash check results

## New Template Files

This PR adds the following template files to help bootstrap new wing structure documentation:

- **`.gitignore`** - Git ignore rules for CAD workflow artifacts (temp files, autosaves, analysis caches, renders)
- **`.gitattributes`** - Binary format declarations for 20+ CAD file types (STEP, CATIA, SolidWorks, NX, etc.)
- **`INDEX.md`** - Quick reference index to all template files and key artifacts
- **`boms/BOM-wing-structure.csv`** - Generic BOM template with aerospace-standard columns
- **`icd/wing-structure-ICD-template.md`** - Interface Control Document template
- **`fastener-schedules/fastener-schedule-wing-structure.csv`** - Fastener specification template
- **`tolerance-stackups/tolerance-stackup-template.csv`** - Tolerance analysis template
- **`handling-and-lifting/handling-and-lifting-guidance.md`** - Safety procedures template
- **`resolution-logs/issues-log.csv`** - Issue tracking template
- **`utcs/utc-template.yaml`** - Universal Test Case template

These templates provide starting points for creating new wing structure artifacts. See individual subdirectory READMEs for details on each template's structure and usage.

## TFA Context
Primary flow: **FE→CB→UE**, backed by **QS** provenance and **FWD** schedule assessment.

## UTCS Anchors
All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:CAD:AAA:ASSY:WINGBOX-{IDX}:revX`
- `UTCS-MI:ICD:AAA:WINGBOX-{IDX}:v1`
- `UTCS-MI:BOM:AAA:WINGBOX-{IDX}:v1`

## Related Directories
- [`./icd/`](./icd/) - Interface control definitions
- [`./boms/`](./boms/) - Module BOMs
- [`./handling-and-lifting/`](./handling-and-lifting/) - Handling and lifting plans
- [`./fastener-schedules/`](./fastener-schedules/) - Fastener torque and pattern schedules
- [`./tolerance-stackups/`](./tolerance-stackups/) - Tolerance stack-up analyses

## References
See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
