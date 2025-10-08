# custom-parts

## Overview

This directory contains custom-designed part definitions for the AMPEL360 Air Manned project's AAA (Airframes, Aerodynamics, Airworthiness) domain. Custom parts are specifically engineered components that do not exist in standard parts catalogs and require unique manufacturing specifications.

## Purpose

The custom-parts directory serves as the central repository for:

- **Custom part definitions** with STEP/CAD data for BWB (Blended Wing Body) and H2 system integration
- **Verifiable artifact records** containing metadata, content hashes, and embedded STEP data
- **Engineering specifications** for manufacturing-ready custom components
- **Traceability links** to MAL-EEM checklists, hazard logs, and UTCS (Universal Traceability Chain System) records

## Contents

### Current Artifacts

- **artifact-record.txt** — BWB H2 Tank Structural Mount Pin V3.1 (UTCS_ID: AMPEL360-AIR-T-AAA-CAD-PRT-00452-V3.1)
  - Status: Released / For Manufacturing
  - Material: Titanium Grade 5 (ASTM B348)
  - Format: ISO 10303-21 (STEP-AP242-Managed-Model)
  - Part Number: PN-00452-A

### Expected File Types

- `.txt` — Artifact records with embedded STEP data and metadata
- `.step`, `.stp` — STEP AP242 3D CAD geometry files
- `.json` — Artifact metadata in IDEALE Evidence Framework format
- `.pdf` — Engineering drawings and manufacturing specifications

## Interfaces

### Input Interfaces

- **CAD Systems**: CATIA V5/V6, Siemens NX, Drafting System X
- **PLM Systems**: Product Lifecycle Management tools exporting STEP-AP242
- **Design Tools**: Generative design outputs, topology optimization results

### Output Interfaces

- **Manufacturing**: CNC toolpaths, additive manufacturing specifications
- **Quality Assurance**: Dimensional inspection plans (see `../../../CAV/`)
- **Assembly Planning**: Integration with assembly models (see `../../ASSY/`)
- **Evidence Engine**: Verifiable artifacts for blockchain anchoring

### Data Format Standards

- **STEP Format**: ISO 10303-21, ISO 10303-242 (AP242 - Managed model-based 3D engineering)
- **Metadata Schema**: IDEALE Evidence Framework artifact schema v0.1
- **Hash Algorithm**: SHA-256 for content verification
- **Identification**: UTCS_ID pattern: `AMPEL360-AIR-T-{DOMAIN}-CAD-PRT-{ID}-{VERSION}`

## Usage

### Creating New Custom Part Records

1. **Design Phase**: Create part in CAD system with proper GD&T (Geometric Dimensioning and Tolerancing)
2. **Export**: Generate STEP-AP242 file with complete PMI (Product Manufacturing Information)
3. **Document**: Create artifact record with metadata, hash, and embedded STEP data
4. **Validate**: Run through MAL-EEM checklist and hazard log review
5. **Register**: Assign UTCS_ID and update status to appropriate lifecycle stage

### Artifact Record Structure

```
--- METADATA ---
Artifact Type: Custom Part Definition
Title: [Part Name and Version]
Domain: AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS
UTCS_ID: AMPEL360-AIR-T-AAA-CAD-PRT-{ID}-{VERSION}
Status: [Design Review / Released / For Manufacturing / In Production]
Author: [Designer Name]
Date: [YYYY-MM-DD]
MAL-EEM_Checklist: [Status and Audit Date]
Hazard_Log_Entries: [Comma-separated hazard IDs]

--- CONTENT HASH (SHA256) ---
SHA256: [64-character hex hash]

--- STEP EMBEDDED DATA (Placeholder) ---
[ISO 10303-21 STEP data or reference to external .stp file]
```

### Integration with Evidence Framework

Custom parts can be converted to verifiable artifacts using:

```bash
# Create verifiable artifact from STEP file
python evidence-engine/artifact-generator/create-verifiable-artifact.py \
  --input custom-parts/part-file.step \
  --out custom-parts/part-file.ief.json \
  --creator "Engineer Name" \
  --tool "CAD System Name"

# Sign the artifact
python evidence-engine/artifact-generator/sign-artifact.py \
  --in custom-parts/part-file.ief.json \
  --key private-key.pem \
  --signer "Organization Name"

# Verify artifact integrity
python evidence-engine/artifact-generator/verify-artifact.py \
  --in custom-parts/part-file.ief.json
```

## Evidence

### Traceability Requirements

All custom parts in this directory must maintain:

1. **Provenance Chain**: Complete design and modification history
2. **Content Integrity**: SHA-256 hash verification for all geometry data
3. **Regulatory Compliance**: MAL-EEM checklist completion and audit records
4. **Safety Documentation**: Links to hazard log entries (HZ-AAA-XXX format)
5. **UTCS Registration**: Blockchain-anchored universal traceability ID

### Quality Gates

Before a custom part moves to "Released / For Manufacturing" status:

- [ ] Design review completed and approved
- [ ] MAL-EEM checklist passed with documented audit date
- [ ] Hazard analysis completed with all risks addressed or accepted
- [ ] Material specifications verified against aerospace standards
- [ ] GD&T annotations complete and manufacturing-ready
- [ ] STEP file validates against AP242 schema
- [ ] Content hash generated and verified
- [ ] UTCS_ID assigned and registered

### Audit Trail

Each artifact record provides:

- **Creation timestamp**: ISO 8601 format date/time
- **Author attribution**: Designer/engineer identification
- **Tool provenance**: Source CAD/design system information
- **Version history**: V{major}.{minor} semantic versioning
- **Change justification**: Documented in commit messages and PLM notes

## Owners

### Primary Responsibility

- **Domain**: AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS
- **Team**: BWB Structures Engineering
- **Technical Lead**: Structural Integration Lead
- **Quality Owner**: Airworthiness Certification Engineer

### Stakeholders

- **Design Engineering**: Custom part creation and modification
- **Manufacturing Engineering**: Manufacturability review and tooling requirements
- **Quality Assurance**: Inspection planning and acceptance criteria (see `../../../CAV/QIP/`)
- **Certification Authority**: Airworthiness compliance verification
- **Supply Chain**: Material procurement and supplier qualification

### Review and Approval Authority

- **Design Changes**: Structural Integration Lead + Chief Engineer
- **Material Changes**: Materials Engineering + Certification Authority
- **Status Promotion**: Multi-disciplinary design review board
- **Release to Manufacturing**: Manufacturing Engineering + Quality Assurance

### Contact and Support

For questions or issues related to custom parts:

1. **Technical Issues**: Open issue in repository with label `domain:AAA` and `component:custom-parts`
2. **Design Collaboration**: Use PLM system collaboration features
3. **Certification Questions**: Contact Airworthiness Certification Engineer
4. **Evidence Framework**: Reference [IDEALE Evidence Framework documentation](../../../../../../evidence-engine/)

## Related Directories

- `../standard-parts/` — Catalog parts and COTS (Commercial Off-The-Shelf) components
- `../material-specifications/` — Material property definitions and certifications
- `../tolerances/` — Standard tolerance tables and GD&T specifications
- `../surface-finishes/` — Surface finish requirements and specifications
- `../../ASSY/` — Assembly models integrating custom parts
- `../../DRW/` — 2D technical drawings for custom parts
- `../../../CAV/` — Validation and inspection data for manufactured parts

## Standards and References

- **ISO 10303-21**: Industrial automation systems - Product data representation and exchange
- **ISO 10303-242** (AP242): Managed model-based 3D engineering
- **ASME Y14.5**: Dimensioning and Tolerancing standard
- **ASTM Standards**: Material specifications (e.g., ASTM B348 for Titanium)
- **IDEALE Evidence Framework**: [standards/v0.1/](../../../../../../standards/v0.1/)
- **UTCS Specification**: Universal Traceability Chain System documentation

---

**Last Updated**: 2025-10-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 AAA Domain Team
