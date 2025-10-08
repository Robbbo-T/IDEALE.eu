#!/usr/bin/env bash
set -euo pipefail

# SYSTEMS Scaffold Script with S1000D-compliant CAS/CSDB
# Creates a complete SYSTEMS tree structure with CAP (Computer-Aided Processes)
# and embedded S1000D-friendly CAS/CSDB subtree for every subsystem
#
# Usage: ./scaffold-systems-cas.sh [DOMAIN] [SYS] [NAME] [ATA] [SNS_LIST]
#   DOMAIN: Domain code (e.g., AAA, AAP, PPP)
#   SYS: System number and name (e.g., 10-PARKING-MOORING)
#   NAME: System name (e.g., PARKING-MOORING)
#   ATA: ATA chapter for CAS DMs (e.g., 10)
#   SNS_LIST: Space-separated list of subsystems (e.g., "00-GENERAL 10-PARKING 20-MOORING")

# Default values - can be overridden by command line arguments
DOMAIN="${1:-XXX}"
SYS="${2:-10-PARKING-MOORING}"
NAME="${3:-PARKING-MOORING}"
ATA="${4:-10}"

# Handle subsystem list
if [ $# -gt 4 ]; then
  shift 4
  SNS_LIST=("$@")
else
  SNS_LIST=("00-GENERAL" "10-PARKING" "20-MOORING" "30-STORAGE" "40-RETURN-TO-SERVICE")
fi

# Constants
ROOT="3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/${DOMAIN}-DOMAIN-DESCRIPTION/SYSTEMS"
PROD="AMP360"
LANG="en-US"

echo "=========================================="
echo "SYSTEMS Scaffold with S1000D CAS/CSDB"
echo "=========================================="
echo "Domain: ${DOMAIN}"
echo "System: ${SYS} (${NAME})"
echo "ATA Chapter: ${ATA}"
echo "Subsystems: ${SNS_LIST[*]}"
echo "Target: ${ROOT}/${SYS}-${NAME}"
echo "=========================================="

# Create system root
mkdir -p "$ROOT/$SYS-$NAME"

for SNS in "${SNS_LIST[@]}"; do
  echo "Creating subsystem: ${SNS}..."
  BASE="$ROOT/$SYS-$NAME/$SNS"
  
  # Create base directories
  mkdir -p "$BASE"/{DELs,policy,tests}
  mkdir -p "$BASE/PLM"/{CAD,CAE,CAO,CAM,CAI,CAV,CAS,CMP,CAP}
  mkdir -p "$BASE/QUANTUM_OA"/{GA,LP,MILP,QP,QUBO,QAOA,QOX,SA}
  mkdir -p "$BASE/PROCUREMENT/VENDORSCOMPONENTS"
  mkdir -p "$BASE/SUPPLIERS"/{BIDS,SERVICES}
  
  # Create subsystem README
  cat > "$BASE/README.md" <<EOF
# ${SYS} — ${SNS}

**UTCS anchor**: \`UTCS-MI:${DOMAIN}:SYS:${SYS}:${SNS}:rev[A]\`

## Purpose

This subsystem is part of the ${NAME} system within the ${DOMAIN} domain.

## Structure

- **DELs/** — Design Evidence Lists and certification deliverables
- **PLM/** — Product Lifecycle Management artifacts (CAD, CAE, CAO, CAM, CAI, CAV, CAS, CMP, CAP)
- **QUANTUM_OA/** — Quantum optimization algorithms and formulations
- **PROCUREMENT/** — Vendor and component sourcing
- **SUPPLIERS/** — Supplier bids and services
- **policy/** — Subsystem-specific policies
- **tests/** — Test data and validation

## PLM Integration

All PLM directories follow TFA-V2/UTCS alignment:
- **CAD** — Computer-Aided Design
- **CAE** — Computer-Aided Engineering
- **CAO** — Computer-Aided Optimization
- **CAM** — Computer-Aided Manufacturing
- **CAI** — Computer-Aided Integration
- **CAV** — Computer-Aided Verification
- **CAS** — Computer-Aided Service (S1000D CSDB)
- **CMP** — Computer-Aided Management/Program
- **CAP** — Computer-Aided Processes

## Status

🚧 **Scaffolded** — Ready for artifact population

---

**Maintained by**: ${DOMAIN} Integration Team  
**Last Updated**: $(date +%Y-%m-%d)
EOF

  # Create META.json
  cat > "$BASE/META.json" <<EOF
{
  "system": "${SYS}",
  "subSystem": "${SNS}",
  "domain": "${DOMAIN}",
  "ataChapter": "${ATA}",
  "version": "0.1.0",
  "status": "scaffolded"
}
EOF

  # Create empty utcs.json
  echo '{}' > "$BASE/utcs.json"

  # ============================================
  # CAS CSDB SUBTREE (S1000D-compliant)
  # ============================================
  echo "  Creating CAS/CSDB structure for ${SNS}..."
  CAS="$BASE/PLM/CAS"
  
  # Create CAS directory structure
  mkdir -p "$CAS/processes"
  mkdir -p "$CAS/inputs"
  
  # CSDB structure
  mkdir -p "$CAS/CSDB/DataModules/COMMON-INFO"/{warnings,standard-notes,common-materials}
  mkdir -p "$CAS/CSDB/DataModules/APPLICABILITY/ACT"
  mkdir -p "$CAS/CSDB/DataModules/MAINTENANCE/${ATA}-${SNS}"/{scheduled-tasks,fault-isolation}
  mkdir -p "$CAS/CSDB/DataModules/REPAIR/${ATA}-${SNS}"/{repair-schemes,damage-assessment}
  mkdir -p "$CAS/CSDB/DataModules/IPD/${ATA}-${SNS}/illustrated-parts-data"
  mkdir -p "$CAS/CSDB/Illustrations/ICN"/{master,renditions,hotspots}
  mkdir -p "$CAS/CSDB/PublicationModules"
  mkdir -p "$CAS/CSDB/DMRL"
  mkdir -p "$CAS/CSDB/BREX"
  
  # WorkPackages
  mkdir -p "$CAS/WorkPackages"/{task-cards,checklists,schedules}
  
  # Data/FLEET_IN_SERVICE
  mkdir -p "$CAS/Data/FLEET_IN_SERVICE"/{service-bulletins-status,reliability-series}
  
  # ExchangePackages
  mkdir -p "$CAS/ExchangePackages/incoming"
  mkdir -p "$CAS/ExchangePackages/outgoing"/{transmittals,manifests,checksums}
  
  # Outputs
  mkdir -p "$CAS/Outputs/PUBLISH"/{AMM-Published,SRM-Published,IPD-Published}
  mkdir -p "$CAS/Outputs/Baselines"
  
  # Schemas
  mkdir -p "$CAS/schemas/s1000d"/{xsd,schematron,brex-tests,codelists}
  mkdir -p "$CAS/schemas/utcs"
  
  # Governance
  mkdir -p "$CAS/Governance/policies"
  
  # UTCS
  mkdir -p "$CAS/utcs"
  
  # Create CAS README
  cat > "$CAS/README.md" <<EOF
# CAS/CSDB — S1000D authoring for ${SYS}/${SNS}

## Purpose

The CAS (Computer-Aided Service) directory manages all S1000D-compliant technical publications and maintenance data for this subsystem, following Issue 6.0 standards.

## Structure

### Core S1000D Components

- **CSDB/** — Common Source Database
  - **DataModules/** — Technical content modules (DMCs)
    - COMMON-INFO — Warnings, notes, common materials
    - APPLICABILITY — Applicability Cross-reference Table (ACT)
    - MAINTENANCE — Scheduled tasks, fault isolation
    - REPAIR — Repair schemes, damage assessment
    - IPD — Illustrated Parts Data
  - **Illustrations/ICN/** — Information Control Numbers (master, renditions, hotspots)
  - **PublicationModules/** — Publication structures (PMs)
  - **DMRL/** — Data Module Requirements List
  - **BREX/** — Business Rules Exchange

### Supporting Directories

- **processes/** — BPMN/CMMN workflows, SOPs
- **inputs/** — UE hooks, failures, AOG, fleet data
- **WorkPackages/** — Task cards, checklists, schedules with mapping.json
- **Data/FLEET_IN_SERVICE/** — Service bulletins status, reliability series
- **ExchangePackages/** — Import/export packages with transmittals and manifests
- **Outputs/** — Published deliverables and baselines
  - PUBLISH/ — AMM, SRM, IPD published outputs
  - Baselines/ — Date-stamped releases with checksums
- **schemas/** — Validation schemas
  - s1000d/ — XSD, Schematron, BREX tests, codelists
  - utcs/ — UTCS schema integration
- **Governance/policies/** — Quality, publishing, security policies

## Validation Pipeline

1. **XSD** — Schema validation
2. **Schematron** — Business rule validation
3. **BREX** — Project-specific business rules
4. **DMRL** — Publication gating

## UTCS Integration

CAS artifacts use UTCS pattern:
\`\`\`
UTCS-MI:${DOMAIN}:CAS:${ATA}-${SNS}:{artifact}:rev[X]
\`\`\`

## ATA Mapping

- **System**: ${SYS}
- **Subsystem**: ${SNS}
- **ATA Chapter**: ${ATA}
- **ATA Section**: ${SNS%%-*}

## Status

🚧 **Scaffolded** — S1000D structure ready for data module authoring

---

**Related**:
- [PLM README](../README.md) — PLM directory overview
- [Subsystem README](../../README.md) — Subsystem documentation
- [S1000D Issue 6.0 Specification](http://www.s1000d.org/)

**Maintained by**: ${DOMAIN} Technical Publications Team  
**Last Updated**: $(date +%Y-%m-%d)
EOF

  # Create META.mapping.json
  cat > "$CAS/META.mapping.json" <<EOF
{
  "system": "${SYS}",
  "subSystem": "${SNS}",
  "ataChapter": "${ATA}",
  "ataSection": "${SNS%%-*}",
  "mapping": {
    "description": "SYSTEMS ↔ ATA mapping for S1000D data modules",
    "systemCode": "${SYS}",
    "ataCode": "${ATA}-${SNS%%-*}"
  }
}
EOF

  # Create placeholder DMRL
  cat > "$CAS/CSDB/DMRL/dmrl.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- Data Module Requirements List (DMRL) placeholder -->
<!-- This file defines which data modules are required for publication -->
<!-- To be populated with actual DMC references during authoring -->
<dmrl>
  <!-- Example structure:
  <dmlEntry>
    <dmCode modelIdentCode="${PROD}" systemDiffCode="${DOMAIN}" systemCode="00" subSystemCode="00" subSubSystemCode="00" assyCode="00A" disassyCode="000" disassyCodeVariant="A" infoCode="000" infoCodeVariant="A" itemLocationCode="A"/>
    <issueInfo issueNumber="001" inWork="00"/>
    <language languageIsoCode="${LANG%%-*}" countryIsoCode="${LANG##*-}"/>
  </dmlEntry>
  -->
</dmrl>
EOF

  # Create placeholder Publication Modules
  cat > "$CAS/CSDB/PublicationModules/PM-${PROD}-AMM-${ATA}-STRUCT.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- Aircraft Maintenance Manual (AMM) Structure Publication Module -->
<!-- pmCode must match filename -->
<!-- This PM defines the structure and content list for the AMM -->
<!-- To be populated with actual data module references -->
<pm xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- Example structure:
  <identAndStatusSection>
    <pmAddress>
      <pmIdent>
        <pmCode modelIdentCode="${PROD}" pmIssuer="AMM" pmNumber="${ATA}" pmVolume="00"/>
        <language languageIsoCode="${LANG%%-*}" countryIsoCode="${LANG##*-}"/>
        <issueInfo issueNumber="001" inWork="00"/>
      </pmIdent>
      <pmAddressItems>
        <issueDate year="2025" month="01" day="01"/>
        <pmTitle>Aircraft Maintenance Manual - ATA ${ATA}</pmTitle>
      </pmAddressItems>
    </pmAddress>
    <pmStatus>
      <security securityClassification="01"/>
      <responsiblePartnerCompany enterpriseName="${DOMAIN} Integration Team"/>
    </pmStatus>
  </identAndStatusSection>
  <content>
    <!-- Data module references go here -->
  </content>
  -->
</pm>
EOF

  cat > "$CAS/CSDB/PublicationModules/PM-${PROD}-AMM-${ATA}-${SNS%%-*}-001.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- AMM Publication Module for ATA ${ATA} - ${SNS} -->
<!-- To be populated with specific data module references for this subsystem -->
<pm xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- Publication module content -->
</pm>
EOF

  cat > "$CAS/CSDB/PublicationModules/PM-${PROD}-SRM-${ATA}-STRUCT.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- Structural Repair Manual (SRM) Structure Publication Module -->
<!-- pmCode must match filename -->
<pm xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- Publication module content -->
</pm>
EOF

  cat > "$CAS/CSDB/PublicationModules/PM-${PROD}-IPD-${ATA}-${SNS%%-*}-001.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- Illustrated Parts Data (IPD) Publication Module for ATA ${ATA} - ${SNS} -->
<pm xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- Publication module content -->
</pm>
EOF

  # Create placeholder BREX
  cat > "$CAS/CSDB/BREX/DMC-${PROD}-${DOMAIN}-00-00-00-00A-000A-A_${LANG}_001-00.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- Business Rules Exchange (BREX) Data Module -->
<!-- dmType=businessRulesExchange -->
<!-- Filename must match DMC structure -->
<!-- This defines project-specific validation rules beyond standard S1000D schemas -->
<dmodule xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- Example structure:
  <identAndStatusSection>
    <dmAddress>
      <dmIdent>
        <dmCode modelIdentCode="${PROD}" systemDiffCode="${DOMAIN}" systemCode="00" subSystemCode="00" subSubSystemCode="00" assyCode="00A" disassyCode="000" disassyCodeVariant="A" infoCode="000" infoCodeVariant="A" itemLocationCode="A"/>
        <language languageIsoCode="${LANG%%-*}" countryIsoCode="${LANG##*-}"/>
        <issueInfo issueNumber="001" inWork="00"/>
      </dmIdent>
      <dmAddressItems>
        <issueDate year="2025" month="01" day="01"/>
        <dmTitle>
          <techName>Business Rules</techName>
          <infoName>BREX Data Module</infoName>
        </dmTitle>
      </dmAddressItems>
    </dmAddress>
    <dmStatus>
      <security securityClassification="01"/>
      <responsiblePartnerCompany enterpriseName="${DOMAIN} Integration Team"/>
    </dmStatus>
  </identAndStatusSection>
  <content>
    <businessRules>
      <!-- BREX rules go here -->
    </businessRules>
  </content>
  -->
</dmodule>
EOF

  # Create WorkPackages mapping.json
  cat > "$CAS/WorkPackages/mapping.json" <<EOF
{
  "description": "Maps work packages to data modules and task cards",
  "workPackages": []
}
EOF

  # Create Governance policies
  cat > "$CAS/Governance/policies/metadata.yaml" <<EOF
# S1000D Metadata Policy
# Defines required metadata fields for all data modules

required_ids_fields:
  - responsiblePartnerCompany
  - security
  - issueInfo
  - language
  - qualityAssurance

fail_on_missing: true

metadata_validation:
  enforce_dmCode_format: true
  require_techName: true
  require_infoName: true
  validate_security_classification: true

publication_rules:
  require_dmrl_approval: true
  enforce_brex_compliance: true
  validate_illustration_references: true
EOF

  cat > "$CAS/Governance/policies/acceptance.yaml" <<EOF
# Data Module Acceptance Policy

acceptance_criteria:
  - schema_valid: true
  - schematron_valid: true
  - brex_compliant: true
  - peer_reviewed: true
  - quality_approved: true

reviewers_required: 2

approval_workflow:
  - author
  - technical_reviewer
  - quality_assurance
  - publication_manager
EOF

  cat > "$CAS/Governance/policies/publishing.yaml" <<EOF
# S1000D Publishing Policy

publishing_gates:
  - dmrl_complete: true
  - all_dms_validated: true
  - illustrations_complete: true
  - change_log_updated: true

baseline_requirements:
  - checksum_verification: true
  - archive_to_baselines: true
  - utcs_snapshot: true

output_formats:
  - PDF
  - HTML5
  - XML
EOF

  cat > "$CAS/Governance/policies/security.yaml" <<EOF
# Security Classification Policy

security_levels:
  "01": "Unclassified"
  "02": "Restricted"
  "03": "Confidential"
  "04": "Secret"

default_classification: "01"

access_control:
  enforce_classification_marking: true
  audit_access: true
  encrypt_above_level: "02"
EOF

  cat > "$CAS/Governance/policies/controlled-language.yaml" <<EOF
# Simplified Technical English (STE) Policy

controlled_language: "ASD-STE100"

rules:
  enforce_ste: true
  allow_technical_names: true
  require_approved_words: true

exceptions:
  - proper_nouns
  - product_codes
  - part_numbers
EOF

  # Create utcs index
  cat > "$CAS/utcs/index.json" <<EOF
{
  "description": "UTCS threading for CAS artifacts",
  "utcsPattern": "UTCS-MI:${DOMAIN}:CAS:${ATA}-${SNS}:{artifact}:rev[X]",
  "examples": [
    "UTCS-MI:${DOMAIN}:CAS:${ATA}-${SNS%%-*}:DMC-MAINTENANCE:rev[A]",
    "UTCS-MI:${DOMAIN}:CAS:${ATA}-${SNS%%-*}:PM-AMM:rev[A]",
    "UTCS-MI:${DOMAIN}:CAS:${ATA}-${SNS%%-*}:DMRL:rev[A]"
  ]
}
EOF

  # Create schemas stub
  cat > "$CAS/schemas/utcs/utcs.schema.json" <<EOF
{
  "\$schema": "http://json-schema.org/draft-07/schema#",
  "title": "UTCS Schema for CAS Artifacts",
  "description": "Schema for validating UTCS metadata in S1000D artifacts",
  "type": "object",
  "properties": {
    "utcs_id": {
      "type": "string",
      "pattern": "^UTCS-MI:${DOMAIN}:CAS:${ATA}-[0-9]{2}:[A-Z0-9\\-]+:rev\\[[A-Z0-9]+\\]$"
    }
  },
  "required": ["utcs_id"]
}
EOF

  echo "  ✓ CAS/CSDB structure complete for ${SNS}"
done

# Create system-level README
cat > "$ROOT/$SYS-$NAME/README.md" <<EOF
# ${SYS} — System Overview

**System**: ${NAME}  
**Domain**: ${DOMAIN}  
**ATA Chapter**: ${ATA}

## Sub-systems

${SNS_LIST[*]}

## UTCS Anchors

- System: \`UTCS-MI:${DOMAIN}:SYS:${SYS}:{artifact}:rev[X]\`
- Subsystem: \`UTCS-MI:${DOMAIN}:SYS:${SYS}:{SNS}:{artifact}:rev[X]\`
- CAS artifacts: \`UTCS-MI:${DOMAIN}:CAS:${ATA}-{SNS}:{artifact}:rev[X]\`

## Structure

Each subsystem follows the canonical TFA-V2/UTCS pattern:

\`\`\`
{SNS}/
├─ DELs/                    # Design Evidence Lists
├─ PLM/                     # Product Lifecycle Management
│  ├─ CAD/ CAE/ CAO/ CAM/   # Design, Engineering, Optimization, Manufacturing
│  ├─ CAI/ CAV/             # Integration, Verification
│  ├─ CAS/                  # Service (S1000D CSDB - see below)
│  ├─ CMP/                  # Program Management
│  └─ CAP/                  # Computer-Aided Processes
├─ QUANTUM_OA/              # Quantum Optimization Algorithms
├─ PROCUREMENT/             # Vendor and component sourcing
├─ SUPPLIERS/               # Supplier bids and services
├─ policy/                  # Subsystem policies
├─ tests/                   # Test data and validation
├─ utcs.json                # UTCS threading configuration
└─ META.json                # Subsystem metadata
\`\`\`

## S1000D CAS/CSDB

Each subsystem's \`PLM/CAS/\` directory contains a complete S1000D Issue 6.0 compliant CSDB:

\`\`\`
PLM/CAS/
├─ README.md
├─ processes/                      # BPMN/CMMN, SOPs
├─ inputs/                         # UE hooks, failures, AOG, fleet data
├─ CSDB/
│  ├─ DataModules/                 # Technical content (DMCs)
│  ├─ Illustrations/ICN/           # Graphics and hotspots
│  ├─ PublicationModules/          # Publication structures (PMs)
│  ├─ DMRL/                        # Data Module Requirements List
│  └─ BREX/                        # Business Rules Exchange
├─ WorkPackages/                   # Task cards, checklists, schedules
├─ Data/FLEET_IN_SERVICE/          # Service bulletins, reliability data
├─ ExchangePackages/               # Import/export with transmittals
├─ Outputs/
│  ├─ PUBLISH/                     # AMM, SRM, IPD published outputs
│  └─ Baselines/                   # Date-stamped releases
├─ schemas/                        # XSD, Schematron, BREX tests, UTCS
├─ Governance/policies/            # Quality, publishing, security policies
└─ utcs/                           # UTCS integration
\`\`\`

## Status

🚧 **Scaffolded** — Ready for artifact population

## Standards Compliance

- **TFA-V2** — Threading Flow Architecture V2
- **UTCS** — UiX Threading Context/Content/Cache and Structure/Style/Sheet
- **S1000D Issue 6.0** — International specification for technical publications
- **ATA iSpec 2200** — Air Transport Association chapters (optional mapping)

---

**Maintained by**: ${DOMAIN} Integration Team  
**Last Updated**: $(date +%Y-%m-%d)
EOF

# Create system-level META.json
cat > "$ROOT/$SYS-$NAME/META.json" <<EOF
{
  "system": "${SYS}",
  "name": "${NAME}",
  "domain": "${DOMAIN}",
  "ataChapter": "${ATA}",
  "subsystems": [
$(printf '    "%s"' "${SNS_LIST[0]}"; printf ',\n    "%s"' "${SNS_LIST[@]:1}")
  ],
  "version": "0.1.0",
  "status": "scaffolded",
  "standards": [
    "TFA-V2",
    "UTCS",
    "S1000D-6.0"
  ],
  "scaffoldDate": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
EOF

echo ""
echo "=========================================="
echo "✓ Scaffolding complete!"
echo "=========================================="
echo "Created: ${ROOT}/${SYS}-${NAME}/"
echo "Subsystems: ${#SNS_LIST[@]}"
echo "S1000D CSDB: ✓ (per subsystem)"
echo ""
echo "Next steps:"
echo "1. Review generated structure"
echo "2. Populate S1000D data modules in CSDB/DataModules/"
echo "3. Add illustrations to CSDB/Illustrations/ICN/"
echo "4. Configure DMRL and publication modules"
echo "5. Update governance policies as needed"
echo "=========================================="
