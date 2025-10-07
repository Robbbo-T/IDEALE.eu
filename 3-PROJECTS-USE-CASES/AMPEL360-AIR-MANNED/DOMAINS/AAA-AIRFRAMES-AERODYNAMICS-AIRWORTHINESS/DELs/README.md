# Deliverables (DELs) Template Repository — AAA Domain

> **Scope**: Domain-level template repository  
> **Type**: Templates, schemas, and policies  
> **Purpose**: Defines standards for certification documentation across all AAA subzones

This directory contains the **template repository** for Design Evidence Lists (DELs) within the Airframes, Aerodynamics, and Airworthiness (**AAA**) domain.

## Domain vs. Subzone Distinction

This is a **domain-level template repository**. It provides:
- Document templates (`.docx`, `.xlsx` stubs)
- Validation schemas (`.json`, `.xsd`)
- Policies and procedures (`.md`)
- Standards and guidelines

**For actual artifacts** (completed documents, submissions, reports), see subzone-level DELs folders:
- `ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/DELs/`
- `ZONES/57-WING-STRUCTURES/57-10-BOX-SECTION/DELs/`
- etc.

> **See**: [TFA-DOMAIN-HIERARCHY.md](../TFA-DOMAIN-HIERARCHY.md) for detailed explanation of template vs. instance pattern.

---

## Purpose

This template repository establishes the standards for formal deliverables, mandated reports, and critical compliance documentation required by regulatory bodies (e.g., EASA) and internal program management.

## Template Repository Contents

### What Domain-Level DELs Contains

1. **Document Templates**: Standard formats for all certification documents
   - Final Design Report (FDR) templates
   - Means of Compliance (MoC) checklists
   - Compliance Matrix templates
   - Airworthiness Statement templates

2. **Validation Schemas**: JSON/XML schemas for document validation
   - Metadata structure validation
   - Required fields checking
   - Format compliance

3. **Policies and Procedures**: Governance documentation
   - Document control procedures
   - Review and approval workflows
   - Regulatory submission processes
   - Archive and retention policies

4. **Standards and Guidelines**: Best practices
   - UTCS anchor formatting
   - Traceability requirements
   - Naming conventions
   - Version control guidelines

### What Domain-Level DELs Does NOT Contain

❌ Completed certification documents (see subzone DELs/)  
❌ Actual EASA submissions (see subzone DELs/EASA-submissions/)  
❌ Final design reports (see subzone DELs/final-design-reports/)  
❌ Test results or data packages (see subzone DELs/data-packages/)

---

## Directory Structure

```
DELs/ (Domain Level - Templates)
├── TEMPLATES/
│   ├── FDR-template-v2.docx
│   ├── MoC-checklist-v1.xlsx
│   ├── compliance-matrix-template.xlsx
│   └── airworthiness-statement-template.docx
├── SCHEMAS/
│   ├── dels-validation.schema.json
│   ├── metadata-structure.schema.json
│   └── utcs-anchor-format.schema.json
├── POLICIES/
│   ├── document-control.md
│   ├── review-approval-workflow.md
│   ├── regulatory-submission-process.md
│   └── archive-retention.md
├── STANDARDS/
│   ├── naming-conventions.md
│   ├── traceability-requirements.md
│   └── version-control-guidelines.md
├── META.json.example          # Example domain-scope metadata
├── README.md                  # This file
└── [Legacy subdirectories]    # To be migrated to TEMPLATES/
```

---

## Using This Template Repository

### For Engineers Creating Certification Documents

1. **Navigate** to your subzone directory (e.g., `ZONES/53-10-CENTER-BODY/DELs/`)
2. **Copy** the appropriate template from `TEMPLATES/`
3. **Follow** policies defined in `POLICIES/`
4. **Validate** your document against schemas in `SCHEMAS/`
5. **Store** completed documents in your subzone DELs folder
6. **Create** `inherit.json` referencing this template repository

### For Domain Managers

1. **Maintain** templates and keep them up to date
2. **Update** policies based on regulatory changes
3. **Review** schema validity periodically
4. **Ensure** all subzones reference correct template versions
5. **Approve** changes to templates through governance process

---

## Template Version Control

All templates follow semantic versioning:

| Template | Current Version | Last Updated | Status |
|----------|----------------|--------------|---------|
| FDR-template | v2.0 | 2025-01-15 | Current |
| MoC-checklist | v1.0 | 2024-12-10 | Current |
| Compliance-matrix | v1.5 | 2025-01-20 | Current |
| Airworthiness-statement | v1.2 | 2024-11-30 | Current |

---

## Contents Overview (Legacy - To Be Reorganized)

The following subdirectories are legacy structure pending migration to TEMPLATES/:

Deliverables stored here typically include:

1.  **Certification Documentation:** Final submissions of the Compliance Matrix, Means of Compliance (MoC) evidence, and official correspondence with regulatory authorities.
2.  **Summary Reports:** Final, approved reports derived from raw data in the `tests/` and `PLM/CAE/` folders (e.g., Final Stress Analysis Report, Flutter Clearance Report, Acoustic Test Summary).
3.  **Master Technical Specifications:** The finalized versions of component specifications and assembly master plans (often linked to `PLM/CAD/DRW`).
4.  **Airworthiness Compliance Records:** Auditable records proving that all parts and processes adhere to the required standards (indexed via **UTCS**).

## Traceability Mandate

Every file within this directory must be indexed by the **UTCS** system, mapping it directly back to the foundational safety and performance requirements established in `PLM/CAO/REQ/`.

*   **Required Metadata:** Each deliverable must reference its generating **TFA Flow** stage and carry a complete **UTCS record**.
*   **Compliance:** Critical structural and safety deliverables must confirm adherence to the **MAL-EEM** checklist (Ethics/Empathy/Explainability/Mitigation), particularly for any adaptive aerodynamic control systems.

## Subzone Implementation Examples

For actual artifact implementations, see:

| Subzone | Path | Status |
|---------|------|--------|
| Center Body | `ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/DELs/` | ✅ Implemented |
| Wing Box | `ZONES/57-WING-STRUCTURES/57-10-BOX-SECTION/DELs/` | 🏗️ In Progress |
| Forward Fuselage | `ZONES/53-FUSELAGE-STRUCTURES/53-20-FORWARD-SECTION/DELs/` | 📋 Planned |

Each subzone DELs folder should contain:
- Completed certification documents
- EASA submissions
- Final design reports
- Actual MoC records
- Data packages
- `META.json` with `"scope": "instance"`
- `inherit.json` referencing this template repository

---

## Related Documentation

- [TFA-DOMAIN-HIERARCHY.md](../TFA-DOMAIN-HIERARCHY.md) — Template vs. instance pattern
- [AAA Domain README](../README.md) — Domain overview
- [ATA-STRUCTURE-EXAMPLE.md](../../ATA-STRUCTURE-EXAMPLE.md) — Implementation guide

---

## Directory Index (Hyperlinkable)

| Folder | Content Description |
| :--- | :--- |
| [Current Folder (`./`)](#) | Contains top-level certification final reports, the Master Compliance Matrix, and the final Type Certificate application package. |
| [`EASA-submissions/`](./EASA-submissions/) | Specific documents, data packages, and official correspondence submitted to the EASA (or relevant regulatory body). |
| [`MoC-records/`](./MoC-records/) | Detailed records of the Means of Compliance (Analysis, Test, Inspection, Similarity) for every requirement. |
| [`final-design-reports/`](./final-design-reports/) | Approved final stress, flutter, and mass properties reports resulting from the design cycle. |
| [`airworthiness-statements/`](./airworthiness-statements/) | Official statements affirming the airworthiness status of major airframe assemblies and systems. |
| [`data-packages/`](./data-packages/) | Consolidated, traceable packages of underlying CAD/CAE/Test data supporting the main reports. |
