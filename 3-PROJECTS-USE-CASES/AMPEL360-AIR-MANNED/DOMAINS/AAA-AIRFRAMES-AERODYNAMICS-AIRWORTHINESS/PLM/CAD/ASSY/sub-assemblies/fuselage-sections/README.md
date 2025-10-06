# Fuselage Sections Sub-Assemblies — AAA Domain

This directory contains CAD models, metadata, and documentation for **fuselage-sections** sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview

Pressure and payload sections of the BWB fuselage, including structural frames, skin panels, and internal partitions.

## Naming Convention

Files follow the pattern: `SA-AAA-FUSE-{IDX}` or zone-specific variants:
- `SA-AAA-FUSE-{IDX}-ONB` for onboard/internal elements
- `SA-AAA-FUSE-{IDX}-OUT` for outboard/external elements

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
- Pressure vessel certification artifacts

## TFA Context

Primary flow: **FE→CB→UE**, backed by **QS** provenance and **FWD** schedule assessment.

## UTCS Anchors

All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:CAD:AAA:ASSY:FUSE-{IDX}:revX`
- `UTCS-MI:ICD:AAA:FUSE-{IDX}:v1`
- `UTCS-MI:BOM:AAA:FUSE-{IDX}:v1`

## Related Directories

- [`../icd/`](../icd/) - Interface control definitions
- [`../boms/`](../boms/) - Module BOMs
- [`../handling-and-lifting/`](../handling-and-lifting/) - Handling and lifting plans
- [`../fastener-schedules/`](../fastener-schedules/) - Fastener torque and pattern schedules
- [`../tolerance-stackups/`](../tolerance-stackups/) - Tolerance stack-up analyses

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
