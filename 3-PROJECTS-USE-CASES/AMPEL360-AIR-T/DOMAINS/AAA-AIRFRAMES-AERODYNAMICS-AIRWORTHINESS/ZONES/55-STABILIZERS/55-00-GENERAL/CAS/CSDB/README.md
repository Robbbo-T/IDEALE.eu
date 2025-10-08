# CSDB — Content Source Database

This directory contains the complete S1000D Content Source Database for this zone.

## Data Module Organization

Data Modules are organized by type and ATA chapter:

- **COMMON-INFO/**: Common Information Repository (CIR)
  - Reusable warnings, cautions, notes
  - Standard materials and tools
  - Cross-referenced by multiple DMs

- **APPLICABILITY/ACT/**: Applicability Cross-reference Table
  - Product variant applicability
  - Configuration management
  - Effectivity rules

- **MAINTENANCE/**: Maintenance procedures
  - Scheduled maintenance tasks
  - Fault isolation procedures
  - Troubleshooting guides

- **REPAIR/**: Repair procedures
  - Structural repair schemes
  - Damage assessment procedures
  - Repair techniques

- **IPD/**: Illustrated Parts Data
  - Parts catalogs with illustrations
  - Part number cross-references
  - Assembly breakdowns

## File Naming

All Data Modules use DMC-based naming:
```
DMC-{ModelIdentCode}-{SystemDiffCode}-{SystemCode}-{SubSystemCode}-
{SubSubSystemCode}-{AssyCode}-{DisassyCode}-{DisassyCodeVariant}-
{InfoCode}-{InfoCodeVariant}-{ItemLocationCode}_{LanguageCode}_{IssueNumber}-{InWork}.xml
```

Example:
```
DMC-AMP360-A-55-10-00-00A-040A-A_en-US_010-00.xml
```

Where:
- AMP360 = Model Ident Code
- A = System Diff Code
- 55 = ATA Chapter
- 10 = ATA Section
- 040A-A = Procedural information code
- en-US = Language
- 010-00 = Issue 010, In-Work 00

## Publication Modules

Publication Modules define how Data Modules are assembled into publications:

- **Structure PMs**: Define publication hierarchy
- **Instance PMs**: Specific publication configurations with serial numbers

## DMRL Management

The Data Module Requirements List (DMRL) is the master index:
- Lists all DMs in the CSDB
- Defines publication applicability
- Snapshotted at each baseline release

## BREX Rules

Business Rules Exchange (BREX) defines validation rules specific to this project:
- Stored as a real DMC (not just metadata)
- Applied during CI/CD validation
- Must pass for all DMs before publication

---

**Reference**: S1000D Issue 5.0 or later
