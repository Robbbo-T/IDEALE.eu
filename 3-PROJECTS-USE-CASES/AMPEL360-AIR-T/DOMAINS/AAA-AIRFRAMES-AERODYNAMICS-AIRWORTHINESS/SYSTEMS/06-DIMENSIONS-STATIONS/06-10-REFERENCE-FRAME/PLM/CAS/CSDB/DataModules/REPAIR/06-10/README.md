# REPAIR Data Modules — 06-10 REFERENCE FRAME

This directory contains repair-related Data Modules for the aircraft reference frame system.

## Content Types

### Repair Schemes (Info Code: 520A)
Approved repair procedures:
- Datum marker repair
- Reference placard replacement
- Measuring point restoration

### Damage Assessment (Info Code: 510A)
Damage evaluation procedures:
- Reference point damage inspection
- Datum alignment verification
- Structural reference integrity checks

## Naming Convention

All files must follow the DMC naming pattern:
```
DMC-AMP360-AAA-06-10-00-00A-{INFO_CODE}-A_en-001-00.xml
```

Examples:
- `DMC-AMP360-AAA-06-10-00-00A-520A-A_en-001-00.xml` (Repair Scheme)
- `DMC-AMP360-AAA-06-10-00-00A-510A-A_en-001-00.xml` (Damage Assessment)

## S1000D Requirements

Each DM must contain:
- Valid `identAndStatusSection` with required metadata
- Proper applicability statements
- References to Common Information Repository (CIR) items
- Links to illustrations (ICN references)
- UTCS anchor for traceability
- Safety warnings and cautions

## Simplified Technical English (STE)

All repair procedures must follow ASD-STE100 guidelines for clarity and safety.

## Related

- [../../COMMON-INFO/](../../COMMON-INFO/) — Reusable warnings and notes
- [../../APPLICABILITY/ACT/](../../APPLICABILITY/ACT/) — Applicability control
- [../../../Illustrations/ICN/](../../../Illustrations/ICN/) — Illustration files
- [../../MAINTENANCE/06-10/](../../MAINTENANCE/06-10/) — Related maintenance DMs
