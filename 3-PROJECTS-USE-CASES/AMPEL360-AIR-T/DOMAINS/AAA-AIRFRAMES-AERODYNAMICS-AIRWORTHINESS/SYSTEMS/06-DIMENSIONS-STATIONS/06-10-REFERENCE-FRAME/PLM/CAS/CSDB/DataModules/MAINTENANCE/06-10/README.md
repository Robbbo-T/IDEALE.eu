# MAINTENANCE Data Modules — 06-10 REFERENCE FRAME

This directory contains maintenance-related Data Modules for the aircraft reference frame system.

## Content Types

### Procedural DMs (Info Code: 000A)
Step-by-step maintenance tasks:
- Access and inspection procedures
- Measurement verification tasks
- Reference grid checks

### Descriptive DMs (Info Code: 00GA)
System descriptions:
- Datum definition and location
- Station, waterline, and buttock line system
- Reference frame structure
- Grid coordinate system

### Fault Isolation DMs (Info Code: 04DA)
Troubleshooting procedures:
- Datum misalignment detection
- Reference point verification
- Measurement discrepancy resolution

## Naming Convention

All files must follow the DMC naming pattern:
```
DMC-AMP360-AAA-06-10-00-00A-{INFO_CODE}-A_en-001-00.xml
```

Examples:
- `DMC-AMP360-AAA-06-10-00-00A-000A-A_en-001-00.xml` (Procedural) IETP Example [https://g.co/gemini/share/f3e1626dbb0d](https://g.co/gemini/share/f3e1626dbb0d)
- `DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-00.xml` (Descriptive) IETP Example [https://g.co/gemini/share/1c5b943df836](https://g.co/gemini/share/1c5b943df836)
- `DMC-AMP360-AAA-06-10-00-00A-04DA-A_en-001-00.xml` (Fault Isolation) IETP Example [https://g.co/gemini/share/b957090832ca](https://g.co/gemini/share/b957090832ca)

## S1000D Requirements

Each DM must contain:
- Valid `identAndStatusSection` with required metadata
- Proper applicability statements
- References to Common Information Repository (CIR) items
- Links to illustrations (ICN references)
- UTCS anchor for traceability

## Simplified Technical English (STE)

All procedural and descriptive text must follow ASD-STE100 guidelines:
- Use approved vocabulary
- Limit sentence length
- Follow writing rules for clarity
- Avoid ambiguous constructions

## Related

- [../../COMMON-INFO/](../../COMMON-INFO/) — Reusable warnings and notes
- [../../APPLICABILITY/ACT/](../../APPLICABILITY/ACT/) — Applicability control
- [../../../Illustrations/ICN/](../../../Illustrations/ICN/) — Illustration files
