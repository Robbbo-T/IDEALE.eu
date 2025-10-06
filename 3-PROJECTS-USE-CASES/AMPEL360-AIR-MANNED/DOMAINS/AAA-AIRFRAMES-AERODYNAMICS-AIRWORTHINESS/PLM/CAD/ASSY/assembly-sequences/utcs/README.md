# UTCS Records

## Overview

This directory contains canonical **UTCS (Universal Traceability Chain System)** YAML records for all assembly sequence artifacts in the `assembly-sequences` directory. UTCS provides verifiable evidence chains linking assembly procedures, simulations, and validation data to design requirements and quality records.

## Purpose

The utcs directory serves as the central repository for:

- **UTCS YAML records** documenting metadata and traceability for all assembly artifacts
- **Evidence chain anchors** connecting assembly procedures to upstream requirements and downstream validation
- **Versioning and change tracking** for all assembly-related artifacts
- **Blockchain anchoring references** for immutable traceability records
- **CI/CD validation inputs** ensuring all procedures have proper UTCS documentation

## Contents Overview

UTCS records are organized by artifact type:

1. **Assembly Procedures**: Join sequences, system installations, master WBS
2. **DMU Simulations**: Digital mockup validations and interference reports
3. **Tool Access Plans**: Fixture reach studies, crane paths, reposition budgets
4. **Tolerance Stack-ups**: Dimensional analyses and metrology correlations
5. **Fastener Schedules**: Torque specifications and installation sequences
6. **QIP Hold Points**: Inspection gates and acceptance criteria
7. **Resolution Logs**: Issue tracking, ECRs, and deviation approvals

## UTCS YAML Record Format

Standard UTCS record structure:

```yaml
---
utcs_id: "UTCS-MI:ASM:{CATEGORY}:{IDENTIFIER}:v{VERSION}"
artifact_type: "Assembly Procedure"
title: "Wing-to-Body Join Sequence - Port Side"
description: "Detailed assembly procedure for attaching port outer wing to center body"

# Artifact Details
domain: "AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS"
project: "AMPEL360-AIR-T"
zone: "ONB"  # ONB or OUT
kind: "JOIN"  # JOIN, SYS, DMU, TSTACK, FASTENER, TOOL, QIP
index: "0001"
version: "1"
status: "Approved"  # Draft, Review, Approved, Superseded, Obsolete

# Provenance
created_date: "2025-01-15T10:30:00Z"
modified_date: "2025-01-27T14:22:00Z"
created_by: "J. Smith (AAA Integration Lead)"
approved_by: "T. Johnson (Chief Engineer)"
approval_date: "2025-01-27T16:00:00Z"

# Content
file_path: "../major-section-joins/ASM-AAA-ONB-JOIN-0001.md"
content_hash: "sha256:a3f5b8c9d2e1f0a7b6c5d4e3f2a1b0c9d8e7f6a5b4c3d2e1f0"
file_size_bytes: 45320

# Traceability - Upstream (Requirements/Design)
upstream_refs:
  - utcs_id: "UTCS-MI:CAD:AAA:ASSY:57-10:revC"
    relation: "implements"
    description: "Assembly model geometry"
  - utcs_id: "UTCS-MI:CAE:AAA:STRESS:WTB-JOINT:v2"
    relation: "validated_by"
    description: "Structural analysis of wing-to-body joint"
  - utcs_id: "UTCS-MI:SPEC:AAA:ASSEMBLY:REQ-042:v1"
    relation: "satisfies"
    description: "Assembly requirement for wing attachment"

# Traceability - Downstream (Implementation/Validation)
downstream_refs:
  - utcs_id: "UTCS-MI:ASM:DMU:WING-JOIN:0012:v2"
    relation: "validated_by"
    description: "DMU simulation confirming feasibility"
  - utcs_id: "UTCS-MI:CAV:QIP:AAA:JOIN-0001:v1"
    relation: "inspected_by"
    description: "QIP hold points for wing join"
  - utcs_id: "UTCS-MI:CAV:MEAS:WTB-GAP:S/N-001:v1"
    relation: "measured_in"
    description: "First article measurement data"

# Related Artifacts (Siblings)
related_refs:
  - utcs_id: "UTCS-MI:ASM:JOIN:ONB:0002:v1"
    relation: "variant_of"
    description: "Starboard wing join (mirror procedure)"
  - utcs_id: "UTCS-MI:ASM:FASTENER:WTB:0001:v2"
    relation: "uses"
    description: "Fastener schedule for wing-to-body joint"
  - utcs_id: "UTCS-MI:ASM:TOOL:ACCESS-0012:v2"
    relation: "uses"
    description: "Tool access plan for wing join"

# Evidence and Compliance
mal_eem_status: "Completed"
mal_eem_audit_date: "2025-01-26"
hazard_log_refs:
  - "HZ-AAA-LIFT-023"
  - "HZ-AAA-TORQUE-015"
classification: "INTERNAL-EVIDENCE-REQUIRED"
tfa_stage: "FE→CB→QB"

# Blockchain Anchoring (when implemented)
blockchain_anchor:
  chain: "Ethereum"
  transaction_hash: "TBD"
  block_number: null
  anchor_date: null

# Change History
change_log:
  - version: "1"
    date: "2025-01-27"
    author: "J. Smith"
    change_type: "Initial Release"
    description: "First approved version of wing-to-body join procedure"
    approval_ref: "ECR-AAA-2025-0042"

# Keywords for searchability
keywords:
  - wing-to-body
  - major join
  - structural assembly
  - BWB
  - port wing
  - fastener installation

# Compliance and Standards
standards_compliance:
  - standard: "EASA CS-25.613"
    clause: "Material strength properties and design values"
    status: "Compliant"
  - standard: "ATA iSpec 2200"
    chapter: "Assembly procedures"
    status: "Compliant"
  - standard: "AS9100D"
    clause: "7.5.1.1 Control of production process"
    status: "Compliant"

# Metadata
utcs_schema_version: "v5.0"
record_type: "artifact"
last_validated: "2025-01-27T18:00:00Z"
validation_method: "CI/CD automated checks"
---
```

## File Naming Convention

UTCS YAML records follow a standardized naming pattern:

```
{CATEGORY}-{ZONE}-{KIND}-{IDX}_v{VERSION}.yaml
```

Where:
- `{CATEGORY}` = ASM (Assembly), DMU, TOOL, TSTACK, FASTENER, QIP, RESLOG
- `{ZONE}` = ONB (onboard) or OUT (outboard)
- `{KIND}` = Specific artifact type within category
- `{IDX}` = 4-digit serial number
- `{VERSION}` = Version number

Examples:
- `ASM-ONB-JOIN-0001_v1.yaml` — Wing-to-body join procedure v1
- `DMU-ONB-WING-JOIN-0012_v2.yaml` — DMU simulation v2
- `FASTENER-WTB-0001_v2.yaml` — Fastener schedule v2

## UTCS ID Format

Canonical UTCS ID structure:

```
UTCS-MI:{CATEGORY}:{SUBCATEGORY}:{IDENTIFIER}:v{VERSION}
```

Components:
- `UTCS-MI` = Universal Traceability Chain System - Manufacturing & Integration
- `{CATEGORY}` = Top-level category (ASM, CAD, CAE, CAV, CAM, etc.)
- `{SUBCATEGORY}` = Specific type within category
- `{IDENTIFIER}` = Unique identifier (often matches file code)
- `v{VERSION}` = Version number

Examples:
- `UTCS-MI:ASM:JOIN:ONB:0001:v1` — Assembly join procedure
- `UTCS-MI:ASM:DMU:WING-JOIN:0012:v2` — DMU simulation
- `UTCS-MI:CAV:QIP:AAA:JOIN-0001:v1` — Quality inspection plan

## Record Lifecycle

### 1. Creation
- UTCS record created when new artifact is authored
- Metadata populated with author, date, content hash
- Status set to "Draft"
- Upstream references identified and linked

### 2. Review
- Technical review conducted
- Peer reviews documented in change_log
- Status updated to "Review"
- Reviewers noted in metadata

### 3. Approval
- Multi-disciplinary approval obtained
- Approval signatures and dates recorded
- Status updated to "Approved"
- Downstream references begin to link to this record

### 4. Active Use
- Record is authoritative source for artifact traceability
- Downstream artifacts reference this UTCS ID
- Measurements and validations link back to this record
- Changes tracked via version increments

### 5. Supersession
- When artifact is revised, new version created
- Previous version status changed to "Superseded"
- New version includes reference to superseded version
- Old version retained for historical traceability

### 6. Obsolescence
- When artifact is no longer applicable (design change, product discontinuation)
- Status changed to "Obsolete"
- Record preserved for regulatory retention requirements
- Reason for obsolescence documented

## Traceability Relationships

### Upstream Relationships (Requirements → Design)

- **satisfies**: Artifact fulfills a requirement
- **implements**: Artifact realizes a design element
- **validated_by**: Artifact is verified by analysis or simulation
- **derived_from**: Artifact is based on another artifact

### Downstream Relationships (Implementation → Validation)

- **inspected_by**: Artifact has quality inspection plan
- **measured_in**: Artifact has measurement/test data
- **verified_by**: Artifact effectiveness confirmed
- **used_in**: Artifact incorporated in higher-level assembly

### Sibling Relationships (Peer Artifacts)

- **variant_of**: Similar artifact for different configuration
- **uses**: Artifact depends on or references another
- **replaces**: Artifact supersedes previous artifact
- **related_to**: General association between artifacts

## UTCS Validation

### Automated Checks (CI/CD)

- **Schema validation**: YAML conforms to UTCS schema v5.0
- **ID uniqueness**: No duplicate UTCS IDs within repository
- **Hash verification**: Content hash matches actual file
- **Reference integrity**: All upstream/downstream refs exist
- **Version consistency**: Version numbers follow semantic versioning
- **Date logic**: Modified date ≥ created date, approval date ≥ modified date

### Manual Review

- **Traceability completeness**: All required links present
- **Classification accuracy**: Security classification correct
- **Hazard log coverage**: All relevant hazards referenced
- **Standards compliance**: Applicable standards identified
- **MAL-EEM status**: Ethics/evidence/methods checklist complete

## Blockchain Anchoring

Future implementation will include:

- **Content hash anchoring**: SHA-256 hash anchored on blockchain
- **Timestamp proof**: Immutable proof of artifact existence at specific time
- **Integrity verification**: Detect any tampering with artifact content
- **Audit trail**: Permanent record of all UTCS record changes
- **Smart contracts**: Automated validation and approval workflows

## Search and Discovery

UTCS records enable powerful search capabilities:

- **By UTCS ID**: Direct lookup of specific artifact
- **By content hash**: Find artifact even if renamed/moved
- **By keyword**: Full-text search of titles, descriptions, keywords
- **By relationship**: Find all artifacts upstream/downstream of given artifact
- **By date range**: Find artifacts created/modified in timeframe
- **By author**: Find all artifacts created by specific person
- **By status**: Find all Draft/Review/Approved artifacts
- **By standard**: Find artifacts complying with specific standard

## Integration with Evidence Framework

UTCS records integrate with IDEALE Evidence Framework:

```bash
# Validate UTCS record
python evidence-engine/utcs-validator/validate-utcs.py \
  --record utcs/ASM-ONB-JOIN-0001_v1.yaml

# Generate UTCS record from artifact
python evidence-engine/utcs-generator/create-utcs-record.py \
  --artifact ../major-section-joins/ASM-AAA-ONB-JOIN-0001.md \
  --template assembly-procedure \
  --output utcs/ASM-ONB-JOIN-0001_v1.yaml

# Query UTCS database
python evidence-engine/utcs-query/query-utcs.py \
  --downstream-of "UTCS-MI:CAD:AAA:ASSY:57-10:revC" \
  --format json

# Verify traceability chain
python evidence-engine/utcs-validator/verify-chain.py \
  --start "UTCS-MI:SPEC:AAA:ASSEMBLY:REQ-042:v1" \
  --end "UTCS-MI:CAV:MEAS:WTB-GAP:S/N-001:v1"
```

## KPIs for UTCS Management

Tracked via CI/CD pipeline:

- **UTCS coverage**: % of artifacts with UTCS records (target 100%)
- **Traceability completeness**: % of UTCS records with all required links (target >95%)
- **Validation pass rate**: % of UTCS records passing CI checks (target 100%)
- **Broken link rate**: % of UTCS references to non-existent artifacts (target 0%)
- **Approval lag**: Average days from creation to approval (target <7 days)
- **Record accuracy**: % of records with correct content hash (target 100%)

## Interfaces

### Input Interfaces

- **From Assembly Procedures**: Metadata for join sequences, system installations
- **From DMU Simulations**: Validation evidence and interference reports
- **From Quality**: Inspection results and acceptance records
- **From Design Engineering**: Requirements and specifications

### Output Interfaces

- **To CI/CD Pipeline**: Validation checks for artifact completeness
- **To Evidence Engine**: Traceability queries and blockchain anchoring
- **To Certification Authority**: Evidence packages for airworthiness approval
- **To Project Management**: Status dashboards and traceability reports

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Assembly procedures documented by UTCS
- [`../system-installation-steps/`](../system-installation-steps/) — System procedures with UTCS records
- [`../digital-mockup-sims/`](../digital-mockup-sims/) — DMU validations tracked by UTCS
- [`../fastener-schedules/`](../fastener-schedules/) — Fastener specs with UTCS traceability
- [`../tolerance-stackups/`](../tolerance-stackups/) — Analyses referenced in UTCS
- [`../qip-hold-points/`](../qip-hold-points/) — Inspection plans linked via UTCS
- [`../resolution-logs/`](../resolution-logs/) — Issue tracking with UTCS references

## Standards and References

- **ISO/IEC 27001**: Information security management (for UTCS data protection)
- **ISO 9001:2015**: Quality management (traceability requirements)
- **AS9100D**: Aerospace quality (configuration management and traceability)
- **EASA Part 21**: Design and production organization (traceability for certification)
- **Blockchain Standards**: Emerging standards for immutable record-keeping
- **YAML 1.2**: Data serialization format for UTCS records

## Governance and Reviews

### Approval Authority

- **UTCS Record Owner**: Artifact author (engineer, analyst, inspector)
- **UTCS Validation**: Automated CI/CD checks
- **Traceability Approval**: System Engineering Lead
- **Blockchain Anchoring**: IT Security + Quality Assurance

### Review Gates

- **Artifact Creation**: UTCS record created simultaneously
- **Technical Review**: UTCS metadata validated
- **Approval**: UTCS record approved with artifact
- **Production**: UTCS provides live traceability
- **Archive**: UTCS records retained per regulations

### Change Control

UTCS records follow strict versioning:

1. New version created for any artifact change
2. Previous version marked "Superseded" (never deleted)
3. Change log documents reason for revision
4. Approval required before version activation
5. Blockchain anchor updates for new versions

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 Systems Engineering Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
