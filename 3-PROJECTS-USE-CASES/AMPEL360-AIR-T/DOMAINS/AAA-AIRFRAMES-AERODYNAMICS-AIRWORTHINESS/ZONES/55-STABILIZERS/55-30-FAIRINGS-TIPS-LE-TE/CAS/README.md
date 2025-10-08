# CAS — S1000D Compliant Continuous Airworthiness System

> **Standard Version:** Issue-6.0  
> **Scope:** Complete S1000D CSDB for maintenance, repair, and illustrated parts data

## Overview

This directory implements the full S1000D Content Source Database (CSDB) for Continuing Airworthiness Support, including:

- **Data Modules (DM)**: Structured technical content (maintenance, repair, IPD)
- **Publication Modules (PM)**: Publication structure and configuration
- **Illustrations (ICN)**: Master graphics with renditions and hotspots
- **DMRL**: Data Module Requirements List (managed and baselined)
- **BREX**: Business Rules Exchange (validation rules as real DMC)

## Directory Structure

```
CAS/
├─ README.md                         # This file
├─ processes/                        # BPMN/CMMN, SOPs for CAS execution
├─ inputs/                           # UE hooks, fleet data, AOG, failures
├─ CSDB/                             # S1000D Content Source Database
│  ├─ DataModules/                   # Technical content modules
│  │  ├─ COMMON-INFO/                # CIR: reusable warnings/notes/materials
│  │  ├─ APPLICABILITY/ACT/          # Applicability Cross-reference Table
│  │  ├─ MAINTENANCE/                # Scheduled tasks, fault isolation
│  │  ├─ REPAIR/                     # Repair schemes, damage assessment
│  │  └─ IPD/                        # Illustrated Parts Data
│  ├─ Illustrations/ICN/             # Information Control Numbers
│  │  ├─ master/                     # Source SVG/CGM
│  │  ├─ renditions/                 # PDF/PNG/SVG variants
│  │  └─ hotspots/                   # Overlays (SVG/XML)
│  ├─ PublicationModules/            # PM structure and instance PMs
│  ├─ DMRL/                          # Data Module Requirements List
│  ├─ BREX/                          # Business Rules (as real DMC)
│  └─ README.md                      # CSDB-specific documentation
├─ WorkPackages/                     # Executable packages (non-S1000D)
│  ├─ task-cards/
│  ├─ checklists/
│  ├─ schedules/
│  └─ mapping.json                   # WP → DMC refs + effectivity
├─ Data/                             # Fleet in-service data
│  └─ FLEET_IN_SERVICE/
│     ├─ service-bulletins-status/
│     └─ reliability-series/
├─ ExchangePackages/                 # Data exchange (incoming/outgoing)
│  ├─ incoming/
│  └─ outgoing/
│     ├─ transmittals/
│     ├─ manifests/
│     └─ checksums/
├─ Outputs/                          # Published outputs and baselines
│  ├─ PUBLISH/
│  │  ├─ AMM-Published/
│  │  ├─ SRM-Published/
│  │  └─ IPD-Published/
│  └─ Baselines/                     # Immutable releases with checksums
│     └─ {YYYY-MM-DD}_AMM{ATA}-{SNS}/
│        ├─ pm/
│        ├─ dms/
│        ├─ dmrl.xml
│        ├─ checksum/
│        └─ utcs-snapshot.json
├─ schemas/                          # Validation schemas
│  ├─ s1000d/
│  │  ├─ xsd/                        # XML Schema definitions
│  │  ├─ schematron/                 # Schematron validation rules
│  │  ├─ brex-tests/                 # BREX business rule tests
│  │  └─ codelists/                  # S1000D code lists
│  └─ utcs/
│     └─ utcs.schema.json
├─ Governance/                       # Quality and compliance policies
│  ├─ KPIs.md
│  └─ policies/
│     ├─ acceptance.yaml
│     ├─ publishing.yaml
│     ├─ security.yaml
│     ├─ controlled-language.yaml
│     └─ metadata.yaml               # Required IDS fields policy
├─ utcs/                             # UTCS traceability
│  └─ index.json                     # DMC/pmCode ↔ UTCS mirror
└─ META.json                         # Zone metadata
```

## Naming Conventions

### Data Modules (DM)
Filename = DMC (Data Module Code), no free text:
```
DMC-{PROD}-{ATA}-{SNS}-00-00A-040A-A_{LANG}_010-00.xml
```

Example: `DMC-AMP360-55-10-00-00A-040A-A_en-US_010-00.xml`

### Publication Modules (PM)
Structure PM:
```
PM-{PROD}-AMM-{ATA}-STRUCT.xml
```

Instance PM (with serial number):
```
PM-{PROD}-AMM-{ATA}-{SNS}-001.xml
```

Examples:
- `PM-AMP360-AMM-55-STRUCT.xml`
- `PM-AMP360-AMM-55-10-001.xml`
- `PM-AMP360-SRM-55-STRUCT.xml`
- `PM-AMP360-IPD-55-10-001.xml`

### Illustrations (ICN)
```
ICN-{PROD}-{ATA}-{SNS}-0001-SVG.svg
hotspots/ICN-{PROD}-{ATA}-{SNS}-0001-hotspots.svg
```

### BREX as Real DMC
```
DMC-{PROD}-AAA-00-00-00-00A-000A-A_{LANG}_001-00.xml
```

Example: `DMC-AMP360-AAA-00-00-00-00A-000A-A_en-US_001-00.xml`

### UTCS
```
UTCS-MI:AAA:CAS:{ATA}-{SNS}:{artifact}:rev[X]
```

## CI/CD Validation Gates

All CAS content must pass the following automated checks:

1. **DM Filename Validation**: Match `^DMC-.*\.xml$`
2. **XSD Validation**: All DMs validate against S1000D XSD
3. **Schematron Validation**: Business rules check
4. **BREX Validation**: Custom business rules pass
5. **IDS Required Fields**: All mandatory identification fields present
6. **PM Reference Check**: PMs reference DMCs (not file paths)
7. **ACT Applicability**: Respect Applicability Cross-reference Table
8. **ICN Existence**: All `graphicRef` have corresponding ICN files
9. **DMRL Coverage**: All PM-referenced DMCs are in DMRL
10. **Baseline Immutability**: Checksums verify baseline integrity
11. **Governance Policy**: Metadata policy requirements satisfied

## Stub Files

Example stub files are provided in subdirectories:

- `WorkPackages/mapping.json` - WP to DMC mapping
- `Governance/policies/metadata.yaml` - Metadata policy
- `ExchangePackages/outgoing/manifests/example.json` - Exchange manifest

## Related Documentation

- [S1000D Standard](http://www.s1000d.org/)
- [ATA iSpec 2200](https://www.ataevolution.org/)
- [UTCS Standard](../../../../../../../standards/IDEALE-STD-0001-UTCS.md)

## Status

🚧 **Structure Ready** — Awaiting population with S1000D content

---

**Maintained by**: AAA Integration Team  
**Last Updated**: 2025-01-27
