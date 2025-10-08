#!/usr/bin/env bash
set -Eeuo pipefail

# ===================================================================
# CAS Scaffold Script for S1000D-compliant structure (Issue-6.0)
# Creates complete CAS directory structure for ATA XX-YY zones
# ===================================================================

# Function to create directory structure for a single zone
scaffold_cas_zone() {
  local zone_base="$1"
  local ata="$2"
  local sns="$3"
  local zone_name="$4"
  
  local cas_dir="${zone_base}/CAS"
  
  echo "Scaffolding CAS for ${ata}-${sns}-${zone_name}..."
  
  # Create main directory structure
  mkdir -p "${cas_dir}"/{processes,inputs}
  
  # CSDB structure
  mkdir -p "${cas_dir}/CSDB/DataModules/COMMON-INFO"/{warnings,standard-notes,common-materials}
  mkdir -p "${cas_dir}/CSDB/DataModules/APPLICABILITY/ACT"
  mkdir -p "${cas_dir}/CSDB/DataModules/MAINTENANCE/${ata}-${sns}"/{scheduled-tasks,fault-isolation}
  mkdir -p "${cas_dir}/CSDB/DataModules/REPAIR/${ata}-${sns}"/{repair-schemes,damage-assessment}
  mkdir -p "${cas_dir}/CSDB/DataModules/IPD/${ata}-${sns}/illustrated-parts-data"
  
  # Illustrations
  mkdir -p "${cas_dir}/CSDB/Illustrations/ICN"/{master,renditions,hotspots}
  
  # Publication Modules
  mkdir -p "${cas_dir}/CSDB/PublicationModules"
  
  # DMRL & BREX
  mkdir -p "${cas_dir}/CSDB"/{DMRL,BREX}
  
  # WorkPackages
  mkdir -p "${cas_dir}/WorkPackages"/{task-cards,checklists,schedules}
  
  # Data
  mkdir -p "${cas_dir}/Data/FLEET_IN_SERVICE"/{service-bulletins-status,reliability-series}
  
  # Exchange Packages
  mkdir -p "${cas_dir}/ExchangePackages/incoming"
  mkdir -p "${cas_dir}/ExchangePackages/outgoing"/{transmittals,manifests,checksums}
  
  # Outputs
  mkdir -p "${cas_dir}/Outputs/PUBLISH"/{AMM-Published,SRM-Published,IPD-Published}
  mkdir -p "${cas_dir}/Outputs/Baselines"
  
  # Schemas
  mkdir -p "${cas_dir}/schemas/s1000d"/{xsd,schematron,brex-tests,codelists}
  mkdir -p "${cas_dir}/schemas/utcs"
  
  # Governance
  mkdir -p "${cas_dir}/Governance"/{policies,}
  
  # UTCS
  mkdir -p "${cas_dir}/utcs"
  
  # Create main README.md
  cat > "${cas_dir}/README.md" <<'README_END'
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
README_END

  # Create CSDB README
  cat > "${cas_dir}/CSDB/README.md" <<'CSDB_README_END'
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
CSDB_README_END

  # Create WorkPackages mapping.json stub
  cat > "${cas_dir}/WorkPackages/mapping.json" <<MAPPING_END
{
  "wpId": "WP-AMM-${ata}-${sns}-001",
  "dmcRefs": [
    "DMC-AMP360-${ata}-${sns}-00-00A-040A-A_en-US_010-00"
  ],
  "actRef": "DMC-AMP360-AAA-00-00-00-00A-00AA-A_en-US_001-00",
  "effectivity": "MSN[0001..0048]; Engine=CFM56-7B",
  "description": "Example work package mapping to Data Module Codes"
}
MAPPING_END

  # Create Governance metadata policy stub
  cat > "${cas_dir}/Governance/policies/metadata.yaml" <<'METADATA_END'
# Metadata Policy for S1000D Data Modules
# Defines required IDS (Identification and Status) fields

require_ids_fields:
  - responsiblePartnerCompany
    # code: Responsible organization code
    # enterpriseName: Full organization name
  - security
    # securityClassification: UNCLASSIFIED, CONFIDENTIAL, SECRET, etc.
  - issueInfo
    # issueNumber: Format NNN (e.g., 010)
    # inWork: Format NN (e.g., 00)
  - qualityAssurance
    # applicability: Verification status
    # firstVerification: Initial QA check
    # secondVerification: Secondary QA check (if required)

enforce_language: "ASD-STE100"
# Simplified Technical English compliance required

export_control:
  required: true
  allowed_values:
    - "EAR99"           # Export Administration Regulations - no license required
    - "EU-AL"           # European Union - Authorized List
    - "ITAR-Exempt"     # International Traffic in Arms Regulations - Exempt
    - "PROPRIETARY"     # Company proprietary

data_module_types:
  procedural: "040A"       # Maintenance procedures
  descriptive: "000A"      # Descriptive information
  fault_isolation: "541A"  # Fault isolation procedures
  repair: "520A"           # Repair procedures
  ipd: "941A"              # Illustrated parts data

validation_rules:
  filename_matches_dmc: true
  dmc_in_content_matches_filename: true
  all_graphics_exist: true
  all_references_valid: true
METADATA_END

  # Create KPIs stub
  cat > "${cas_dir}/Governance/KPIs.md" <<'KPI_END'
# CAS KPIs — Key Performance Indicators

## Content Quality

- **DM Validation Pass Rate**: Target 100% (XSD + Schematron + BREX)
- **Broken Reference Count**: Target 0 (all ICN and DM references valid)
- **BREX Compliance**: 100% of DMs pass business rules
- **DMRL Coverage**: 100% of published DMs listed in DMRL

## Process Efficiency

- **Time to Publish**: < 24 hours from DM approval to baseline
- **Baseline Frequency**: Monthly minimum
- **Exchange Package Turnaround**: < 48 hours

## Maintenance

- **Data Module Update Frequency**: Track updates per ATA chapter
- **Service Bulletin Integration**: < 7 days from SB release to DM update
- **Fleet Feedback Loop**: < 14 days from field report to procedure update

## Governance

- **Metadata Compliance**: 100% of DMs have required IDS fields
- **Security Classification**: 100% properly marked
- **Export Control**: 100% marked with correct export control
- **Controlled Language**: Target 95% ASD-STE100 compliance

## Traceability

- **UTCS Coverage**: 100% of DMs have UTCS anchors
- **WP-DMC Mapping**: 100% of work packages mapped to DMCs
- **Baseline Integrity**: 100% checksums valid on all baselines

---

**Review Frequency**: Monthly  
**Owner**: CAS Lead Engineer
KPI_END

  # Create other policy stubs
  cat > "${cas_dir}/Governance/policies/acceptance.yaml" <<'ACCEPT_END'
# Acceptance Criteria for Data Modules

validation:
  xsd: MUST_PASS
  schematron: MUST_PASS
  brex: MUST_PASS

review:
  technical_review: REQUIRED
  quality_assurance: REQUIRED
  design_authority_approval: REQUIRED

content:
  simplified_technical_english: REQUIRED
  illustrations_complete: REQUIRED
  all_references_valid: REQUIRED

traceability:
  utcs_anchor: REQUIRED
  requirement_links: REQUIRED
  test_evidence: REQUIRED_FOR_PROCEDURES
ACCEPT_END

  cat > "${cas_dir}/Governance/policies/publishing.yaml" <<'PUBLISH_END'
# Publishing Policy

baseline:
  frequency: MONTHLY
  approval_required: DESIGN_AUTHORITY
  immutable: true
  checksum_algorithm: SHA256

publication_types:
  AMM:
    approval: DESIGN_AUTHORITY
    distribution: INTERNAL_AND_OPERATORS
  SRM:
    approval: DESIGN_AUTHORITY + QA
    distribution: INTERNAL_AND_MRO
  IPD:
    approval: DESIGN_AUTHORITY
    distribution: INTERNAL_AND_SUPPLY_CHAIN

dmrl_snapshot:
  required: true
  included_in_baseline: true

utcs_snapshot:
  required: true
  included_in_baseline: true
PUBLISH_END

  cat > "${cas_dir}/Governance/policies/security.yaml" <<'SECURITY_END'
# Security and Export Control Policy

classification_levels:
  - UNCLASSIFIED
  - INTERNAL
  - CONFIDENTIAL
  - PROPRIETARY

export_control:
  marking_required: true
  review_required: true
  allowed_markings:
    - EAR99
    - EU-AL
    - ITAR-Exempt
    - PROPRIETARY

handling:
  UNCLASSIFIED:
    distribution: PUBLIC
  INTERNAL:
    distribution: EMPLOYEES_ONLY
  CONFIDENTIAL:
    distribution: NEED_TO_KNOW
    encryption: REQUIRED
  PROPRIETARY:
    distribution: AUTHORIZED_ONLY
    watermarking: REQUIRED
SECURITY_END

  cat > "${cas_dir}/Governance/policies/controlled-language.yaml" <<'LANG_END'
# Controlled Language Policy

standard: ASD-STE100
version: "Issue 8"

compliance:
  target: 95%
  measurement: AUTOMATED_CHECKER

exceptions:
  allowed:
    - Technical_terms_from_specifications
    - Part_numbers
    - Product_names
    - Proper_nouns
  
approval_required: TECHNICAL_WRITER_LEAD

tools:
  - name: STE_Checker
    version: "2.0"
    frequency: BEFORE_REVIEW

training:
  required: true
  frequency: ANNUAL
  audience: ALL_TECHNICAL_WRITERS
LANG_END

  # Create example exchange manifest
  mkdir -p "${cas_dir}/ExchangePackages/outgoing/manifests"
  cat > "${cas_dir}/ExchangePackages/outgoing/manifests/example.json" <<MANIFEST_END
{
  "packageId": "XCHG-AMM-${ata}-${sns}-2025-10-08",
  "createdBy": "CAS-System",
  "createdDate": "2025-01-27T12:00:00Z",
  "packageType": "INCREMENTAL",
  "dms": [
    {
      "dmc": "DMC-AMP360-${ata}-${sns}-00-00A-040A-A_en-US_010-00",
      "issue": "010",
      "inWork": "00",
      "title": "Example Maintenance Procedure"
    }
  ],
  "pms": [
    {
      "pmCode": "PM-AMP360-AMM-${ata}-${sns}-001",
      "issue": "01",
      "title": "AMM Publication Module"
    }
  ],
  "icns": [
    {
      "icn": "ICN-AMP360-${ata}-${sns}-0001",
      "format": "SVG"
    }
  ],
  "hashes": [
    {
      "path": "pm/PM-AMP360-AMM-${ata}-${sns}-001.xml",
      "sha256": "0000000000000000000000000000000000000000000000000000000000000000"
    },
    {
      "path": "dms/DMC-AMP360-${ata}-${sns}-00-00A-040A-A_en-US_010-00.xml",
      "sha256": "0000000000000000000000000000000000000000000000000000000000000000"
    }
  ],
  "dmrl": {
    "included": true,
    "path": "dmrl.xml",
    "sha256": "0000000000000000000000000000000000000000000000000000000000000000"
  }
}
MANIFEST_END

  # Create UTCS index stub
  cat > "${cas_dir}/utcs/index.json" <<UTCS_END
{
  "description": "DMC/PM Code to UTCS mirror for ${ata}-${sns}",
  "mappings": [
    {
      "dmc": "DMC-AMP360-${ata}-${sns}-00-00A-040A-A_en-US_010-00",
      "utcs": "UTCS-MI:AAA:CAS:${ata}-${sns}:maintenance-proc:rev[1]",
      "type": "procedural"
    },
    {
      "pmCode": "PM-AMP360-AMM-${ata}-${sns}-001",
      "utcs": "UTCS-MI:AAA:CAS:${ata}-${sns}:publication:rev[1]",
      "type": "publication"
    }
  ]
}
UTCS_END

  # Create schemas/utcs/utcs.schema.json stub
  cat > "${cas_dir}/schemas/utcs/utcs.schema.json" <<'UTCS_SCHEMA_END'
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "https://ideale.eu/schemas/utcs/1.0.0",
  "title": "UTCS Schema for CAS",
  "type": "object",
  "required": ["schema_version", "utcs_id", "product", "domain"],
  "properties": {
    "schema_version": {
      "type": "string",
      "pattern": "^[0-9]+\\.[0-9]+\\.[0-9]+$"
    },
    "utcs_id": {
      "type": "string",
      "pattern": "^UTCS-MI:[A-Z]{3}:CAS:[0-9]{2}-[0-9]{2}:.+:rev\\[[0-9]+\\]$"
    },
    "product": {
      "type": "string"
    },
    "domain": {
      "type": "string"
    },
    "dmc": {
      "type": "string",
      "pattern": "^DMC-.+\\.xml$"
    }
  }
}
UTCS_SCHEMA_END

  # Create META.json
  cat > "${cas_dir}/META.json" <<META_END
{
  "scope": "cas",
  "ata_chapter": "${ata}",
  "ata_section": "${sns}",
  "zone_name": "${zone_name}",
  "standard": "S1000D Issue 5.0+",
  "utcs_anchor": "UTCS-MI:AAA:CAS:${ata}-${sns}:system:rev[1]",
  "last_updated": "2025-01-27",
  "maintained_by": "AAA Integration Team"
}
META_END

  echo "  ✓ Created CAS structure for ${ata}-${sns}"
}

# Main execution
ZONES_BASE="/home/runner/work/IDEALE.eu/IDEALE.eu/3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES"

# Find all PLM directories and extract zone information
find "$ZONES_BASE" -maxdepth 3 -type d -name "PLM" | while read plm_dir; do
  # Extract zone path (parent of PLM)
  zone_dir=$(dirname "$plm_dir")
  zone_path=$(basename "$zone_dir")
  
  # Extract ATA-SNS pattern (e.g., "55-10-HORIZONTAL-STABILIZER")
  if [[ "$zone_path" =~ ^([0-9]{2})-([0-9]{2})-(.+)$ ]]; then
    ata="${BASH_REMATCH[1]}"
    sns="${BASH_REMATCH[2]}"
    zone_name="${BASH_REMATCH[3]}"
    
    scaffold_cas_zone "$zone_dir" "$ata" "$sns" "$zone_name"
  fi
done

echo ""
echo "======================================================================"
echo "CAS S1000D structure scaffolding complete!"
echo "======================================================================"
echo ""
echo "Summary:"
echo "  • Created complete S1000D CSDB structure"
echo "  • Added README.md with full documentation"
echo "  • Created stub files for mapping, policies, and manifests"
echo "  • Set up schemas, governance, and UTCS directories"
echo ""
echo "Next steps:"
echo "  1. Review README.md in each CAS directory"
echo "  2. Populate Data Modules in CSDB/DataModules/"
echo "  3. Create Publication Modules in CSDB/PublicationModules/"
echo "  4. Set up CI/CD validation (see validation script)"
echo ""
