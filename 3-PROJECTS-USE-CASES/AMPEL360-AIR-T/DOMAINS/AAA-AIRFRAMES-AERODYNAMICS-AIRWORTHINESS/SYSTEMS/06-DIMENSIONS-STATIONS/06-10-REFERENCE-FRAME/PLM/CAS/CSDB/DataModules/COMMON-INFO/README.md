# Common Information Repository (CIR)

This directory contains reusable content referenced by multiple Data Modules.

## Purpose

The CIR provides standardized, reusable content elements that ensure consistency across all technical publications:

- **Warnings** — Safety warnings for hazardous conditions
- **Cautions** — Equipment damage prevention notices
- **Notes** — Supplementary information
- **Standard materials** — Approved materials list
- **Standard tools** — Common tools and equipment
- **Standard consumables** — Fluids, sealants, etc.

## Benefits

- **Consistency** — Same warnings appear identically across all DMs
- **Maintainability** — Update once, apply everywhere
- **Translation efficiency** — Translate common text once
- **Quality** — Reviewed and approved standard text

## Usage in Data Modules

Reference CIR items using internalRef or externalPubRef:

```xml
<warningRef internalRefId="CIR-WARN-ELECTRICAL-001"/>
<cautionRef internalRefId="CIR-CAUT-TORQUE-001"/>
```

## Naming Convention

Files follow DMC pattern with info code 00UA (Common Information):
```
DMC-AMP360-AAA-00-00-00-00A-00UA-A_en-001-00.xml
```
IETP example: [https://g.co/gemini/share/dc828d58b25e](https://g.co/gemini/share/dc828d58b25e)

## Content Organization

- Warnings (safety hazards)
- Cautions (equipment protection)
- Notes (supplementary information)
- Materials specifications
- Tool requirements
- Standard procedures

## Simplified Technical English

All CIR content follows ASD-STE100 for maximum clarity and translatability.

## Related

- Parent CSDB: [../../README.md](../../README.md)
- Referenced by MAINTENANCE DMs: [../MAINTENANCE/](../MAINTENANCE/)
- Referenced by REPAIR DMs: [../REPAIR/](../REPAIR/)
