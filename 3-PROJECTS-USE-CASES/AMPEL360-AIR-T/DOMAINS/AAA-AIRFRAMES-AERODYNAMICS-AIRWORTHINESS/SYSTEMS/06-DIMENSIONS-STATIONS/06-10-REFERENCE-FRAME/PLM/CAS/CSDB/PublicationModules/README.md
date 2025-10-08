# Publication Modules

This directory contains Publication Modules (PMs) that define the structure and content of technical publications.

## Purpose

Publication Modules organize Data Modules into deliverable publications:
- Define publication structure (chapters, sections)
- Reference Data Modules to include
- Specify publication metadata
- Configure applicability and filtering
- Control front matter and back matter

## Publication Types

### Aircraft Maintenance Manual (AMM)
Structure and instance PMs for maintenance procedures.

**Structure PM**: `PM-AMP360-AMM-06-10-STRUCT.xml`
- Defines AMM chapter structure for ATA 06-10
- References all maintenance-related DMs
- Organizes by topic (Description, Procedures, Fault Isolation)

**Instance PMs**: `PM-AMP360-AMM-06-06-10-001.xml`, etc.
- Publication for specific aircraft serial numbers
- Applies configuration filtering via ACT
- Includes aircraft-specific effectivity

### Structural Repair Manual (SRM)
Structure and instance PMs for repair procedures.

**Structure PM**: `PM-AMP360-SRM-06-STRUCT.xml`
- Defines SRM chapter structure
- References repair-related DMs
- Organizes repair schemes by damage type

### Illustrated Parts Data (IPD)
Publication of parts catalogs with illustrations.

**Instance PM**: `PM-AMP360-IPD-06-06-10-001.xml`
- Parts catalog for 06-10 system
- References IPD Data Modules
- Includes part number cross-references

## Publication Module Structure

### Structure PM
Defines hierarchical organization:
```xml
<pm>
  <identAndStatusSection>
    <pmIdent>
      <pmCode modelIdentCode="AMP360" pmIssuer="AAA" 
              pmNumber="AMM0610" pmVolume="00"/>
      ...
    </pmIdent>
  </identAndStatusSection>
  <content>
    <pmEntry>
      <pmEntryTitle>ATA 06-10 - Reference Frame</pmEntryTitle>
      <pmEntry>
        <pmEntryTitle>Description</pmEntryTitle>
        <dmRef>...</dmRef>
      </pmEntry>
      <pmEntry>
        <pmEntryTitle>Maintenance Procedures</pmEntryTitle>
        <dmRef>...</dmRef>
      </pmEntry>
    </pmEntry>
  </content>
</pm>
```

### Instance PM
Publication for specific configuration:
- Includes structure PM reference or inline structure
- Adds applicability filtering
- Specifies serial number effectivity
- Includes publication date and revision

## Naming Convention

### Structure PM
```
PM-{PROD}-{TYPE}-{ATA}-STRUCT.xml
```
Examples:
- `PM-AMP360-AMM-06-STRUCT.xml`
- `PM-AMP360-SRM-06-STRUCT.xml`

### Instance PM
```
PM-{PROD}-{TYPE}-{ATA}-{SNS}-{SEQ}.xml
```
Examples:
- `PM-AMP360-AMM-06-10-001.xml`
- `PM-AMP360-IPD-06-10-001.xml`

**Note**: No "PMC" suffix in filenames (PMC is internal identifier only).

## PM to DM Relationship

Publication Modules reference Data Modules:
1. PM defines structure
2. PM includes `<dmRef>` elements
3. Each `<dmRef>` points to a specific DMC
4. DMRL validates all references

**Critical**: PMs reference **DMCs**, not file paths.

## Applicability

PMs can filter content by:
- Manufacturing Serial Number (MSN)
- Configuration level
- Modification state
- Effectivity dates

Applicability controlled via ACT references.

## Front Matter and Back Matter

PMs can include:
- **Front Matter**: Title page, revision history, table of contents, list of effective pages
- **Back Matter**: Index, glossary, list of abbreviations, vendor list

## Publication Generation

From PM to deliverable:
1. **Parse PM** — Read structure and DM references
2. **Resolve References** — Locate all referenced DMs
3. **Apply Applicability** — Filter content per ACT
4. **Assemble Content** — Combine DMs per structure
5. **Generate Output** — Produce PDF/Web/IETP
6. **Create Baseline** — Archive snapshot with checksums

## Current Publications

### ATA 06-10 AMM Structure
**File**: `PM-AMP360-AMM-06-10-STRUCT.xml`

Organizes maintenance content:
- **Description** section with system overview
- **Maintenance Procedures** section with inspection tasks
- **Fault Isolation** section with troubleshooting
- References to Common Information Repository

## Validation

PM validation checks:
- ✅ Valid PM XML structure per schema
- ✅ All `<dmRef>` elements resolve to existing DMs
- ✅ All referenced DMs appear in DMRL
- ✅ Applicability statements reference valid ACT entries
- ✅ PM metadata complete (title, issue info, responsible company)

## CI/CD Integration

PM validation in pipeline:
1. XSD validation against pm.xsd
2. Schematron validation for business rules
3. Reference validation (all DMCs exist)
4. DMRL coverage check
5. Applicability validation (ACT entries exist)

## Related

- [../DataModules/](../DataModules/) — DMs referenced by PMs
- [../DMRL/](../DMRL/) — Master list of DMs for publication
- [../DataModules/APPLICABILITY/ACT/](../DataModules/APPLICABILITY/ACT/) — Applicability control
- [../../Outputs/PUBLISH/](../../Outputs/PUBLISH/) — Generated publications
- S1000D Issue 6.0, Chapter 3.9.4 — Publication Module specification

## Best Practices

- **Use Structure PMs** — Define reusable structure separately from instances
- **Keep Current** — Update PMs when DMs are added or removed
- **Test Early** — Validate PM references before publication
- **Version Control** — Track PM changes with issue numbers
- **Document Structure** — Use clear, hierarchical `<pmEntryTitle>` elements
