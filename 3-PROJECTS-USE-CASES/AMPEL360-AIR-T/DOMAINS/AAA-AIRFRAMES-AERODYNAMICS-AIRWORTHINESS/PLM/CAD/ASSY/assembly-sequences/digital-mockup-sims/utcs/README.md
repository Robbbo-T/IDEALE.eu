# UTCS Records — Sub-Assemblies

This directory contains **canonical UTCS YAML records for all module, ICD, and BOM artifacts** for sub-assemblies belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

UTCS (Universal Traceability Canon Schema) records provide machine-readable metadata and provenance tracking for all sub-assembly artifacts. These records enable:

* Automated validation and verification
* Cryptographic integrity verification
* Traceability across tool chains
* Version control and configuration management
* Cross-domain artifact linking
* Compliance evidence generation

## Contents

* **UTCS YAML files** — Complete UTCS Canon format records for all artifacts
* **Threading metadata** — Context, Content, and Cache information
* **Structure definitions** — Schema and field definitions
* **Style guidelines** — Naming conventions, units, and notation
* **Sheet manifests** — File lists with roles and relationships
* **Evidence links** — Requirements traceability and verification records
* **Security metadata** — Classification and access control
* **Integrity hashes** — Cryptographic hashes for provenance

## Naming Convention

UTCS files follow the template: `UTCS-{ARTIFACT_TYPE}-AAA-{MODULE}-{IDX}.yaml`

* `{ARTIFACT_TYPE}` ∈ `{CAD|ICD|BOM|TSTACK|FASTENER|HANDLE|RESLOG|QIP}`
* `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)

**Examples:**
* `UTCS-CAD-AAA-WINGBOX-001.yaml` — Wing box CAD model UTCS record
* `UTCS-ICD-AAA-WINGBOX-to-BODY-001.yaml` — Interface definition UTCS record
* `UTCS-BOM-AAA-FUSE-002.yaml` — Fuselage section BOM UTCS record
* `UTCS-TSTACK-AAA-STAB-001.yaml` — Stabilizer tolerance stack-up UTCS record

## UTCS Anchor Format

UTCS anchors provide unique identifiers for artifacts:

```
UTCS-MI:{DOMAIN}:{CAx}:{ARTIFACT}:{MODULE}-{IDX}:{VERSION}
```

**Examples:**
* `UTCS-MI:CAD:AAA:ASSY:WINGBOX-001:rev3`
* `UTCS-MI:ICD:AAA:WINGBOX-to-BODY-001:v1`
* `UTCS-MI:BOM:AAA:FUSE-002:v2`
* `UTCS-MI:SUB:TSTACK:STAB-001:v1`
* `UTCS-MI:SUB:FASTENER:LGBAY-001:v1`
* `UTCS-MI:SUB:HANDLE:PYLON-001:v1`
* `UTCS-MI:SUB:RESLOG:WINGBOX-001:v1`

## UTCS Canon Format

### Threading
* **Context** — Mission environment, configuration, external references
  - Project/program identification
  - Configuration applicability
  - Operational context
  - External dependencies

* **Content** — Summary, description, and content references
  - Artifact description and purpose
  - Technical summary
  - File references and locations
  - Associated documentation

* **Cache** — Exports, thumbnails, and derived artifacts
  - Rendered images and previews
  - Exported formats (STEP, IGES, PDF)
  - Analysis results
  - Verification artifacts

### Structure
* **Schema** — Domain-specific field definitions
  - Data model and relationships
  - Required and optional fields
  - Field types and constraints
  - Validation rules

* **Fields** — Data structure with types and constraints
  - Part numbers and identifiers
  - Dimensions and parameters
  - Material properties
  - Performance characteristics

* **Relationships** — Links to related artifacts
  - Parent-child relationships
  - Interface connections
  - Dependency mapping
  - Version lineage

### Style
* **Naming** — File naming conventions and codes
  - Nomenclature standards
  - Abbreviation definitions
  - Coding schemes
  - Version notation

* **Units** — Measurement units and coordinate systems
  - Length, mass, time units
  - Coordinate system definitions
  - Datum references
  - Unit conversions

* **Notation** — Mathematical notation and symbology
  - Equation formats
  - Symbol definitions
  - Notation standards
  - Presentation rules

### Sheet
* **Manifest** — List of files with roles (spec/geometry/evidence)
  - Source files (CAD, drawings, documents)
  - Derived files (exports, reports)
  - Evidence files (test results, analyses)
  - Supporting files (procedures, standards)

* **Dependencies** — Required input files and versions
  - Referenced artifacts
  - Prerequisite data
  - Tool versions
  - Library dependencies

* **Outputs** — Generated output files and formats
  - Manufacturing files
  - Analysis results
  - Documentation packages
  - Verification reports

## UTCS Record Example Structure

```yaml
---
utcs_version: "5.0"
artifact_id: "UTCS-MI:CAD:AAA:ASSY:WINGBOX-001:rev3"
classification: "INTERNAL-EVIDENCE-REQUIRED"

threading:
  context:
    project: "PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT"
    configuration: "BWB-Q100"
    domain: "AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS"
    
  content:
    title: "Wing Box Sub-Assembly - Primary Structure"
    description: "Complete wing box assembly including spars, ribs, and skin panels"
    primary_file: "../wing-structure/SA-AAA-WINGBOX-001.stp"
    
  cache:
    thumbnail: "../thumbnails/SA-AAA-WINGBOX-001_preview.png"
    pdf_export: "../wing-structure/SA-AAA-WINGBOX-001.pdf"

structure:
  schema: "CAD_ASSEMBLY_v5"
  fields:
    part_number: "SA-AAA-WINGBOX-001"
    revision: "rev3"
    mass_kg: 2450.5
    cog_mm: [12500, 0, -450]
    
  relationships:
    parent: "UTCS-MI:CAD:AAA:ASSY:WING:001:rev5"
    interfaces:
      - "UTCS-MI:ICD:AAA:WINGBOX-to-BODY-001:v1"
      - "UTCS-MI:ICD:AAA:WINGBOX-to-LGBAY-001:v1"
    bom: "UTCS-MI:BOM:AAA:WINGBOX-001:v2"

style:
  naming_convention: "SA-AAA-{MODULE}-{IDX}"
  units:
    length: "mm"
    mass: "kg"
    force: "N"
  coordinate_system: "Aircraft Body Axes"

sheet:
  manifest:
    - role: "geometry"
      file: "SA-AAA-WINGBOX-001.stp"
      format: "STEP AP242"
    - role: "drawing"
      file: "SA-AAA-WINGBOX-001.pdf"
      format: "PDF"
      
  dependencies:
    - "UTCS-MI:CAD:AAA:PART:SPAR-FRONT-001:rev2"
    - "UTCS-MI:CAD:AAA:PART:SPAR-REAR-001:rev2"
    
  outputs:
    - "UTCS-MI:SUB:TSTACK:WINGBOX-001:v1"
    - "UTCS-MI:SUB:FASTENER:WINGBOX-001:v1"

provenance:
  created_by: "J.Smith@ideale.eu"
  created_date: "2025-01-15T10:30:00Z"
  modified_by: "M.Jones@ideale.eu"
  modified_date: "2025-01-24T14:22:00Z"
  approved_by: "A.Engineer@ideale.eu"
  approved_date: "2025-01-25T09:15:00Z"
  
integrity:
  canonical_hash: "sha256:abc123def456..."
  file_hash: "sha256:789xyz012..."
  
tfa_stage: "UE"
status: "APPROVED"
---
```

## Validation

All UTCS YAML files must:
* **Pass schema validation** — Conform to UTCS Canon schema v5.0
* **Include required fields** — All mandatory fields populated
* **Resolve all links** — All UTCS anchors resolve to valid artifacts
* **Hash verification** — Integrity hashes match artifact content
* **CI/CD checks** — Automated validation in continuous integration

## Cross-References

* **All sub-assembly subdirectories** — Source artifacts for UTCS records
* **PLM/CAE/MBD** — Related analysis and simulation models
* **PLM/CAV/QIP** — Quality issue protocol artifacts
* **UTCS-MI Documentation** — UTCS Canon schema and guidelines

## Related Directories

* `../` — Parent sub-assemblies directory
* `../wing-structure/` — Wing box artifacts
* `../stabilizer-units/` — Stabilizer artifacts
* `../fuselage-sections/` — Fuselage artifacts
* `../landing-gear-bays/` — Landing gear bay artifacts
* `../pylon-interfaces/` — Pylon artifacts
* `../icd/` — Interface definitions
* `../boms/` — Bills of materials
* `../tolerance-stackups/` — Tolerance analyses
* `../fastener-schedules/` — Fastener specifications
* `../handling-and-lifting/` — Handling plans
* `../resolution-logs/` — Change records

## Tools and Automation

* **UTCS Validator** — Schema validation tool
* **UTCS Generator** — Automated UTCS record creation from artifacts
* **CI Pipeline** — Continuous validation and verification
* **Hash Calculator** — Integrity hash generation and verification
* **Link Checker** — UTCS anchor resolution verification

## Status

🔄 In Progress — UTCS YAML records under development

---

**Maintainer:** AAA Integration Team & Data Management  
**Schema Version:** UTCS v5.0  
**Last Updated:** 2025-01-26
