# Final MoC Records

This directory contains **authoritative** Means of Compliance (MoC) records for the 53-10 Center Body certification.

## Purpose

MoC records are formal documents that:
- Demonstrate **how** each CS-25 requirement is satisfied
- Document the **evidence** supporting compliance
- Provide **traceability** to supporting artifacts (analysis, tests, inspections)
- Receive **formal approval** from design authority and QA
- Are **submitted to EASA** as part of certification packages

## Important Notes

✅ **AUTHORITATIVE** — Files in this directory are the official compliance records
- Use these records for certification submissions
- Reference these records in compliance matrices
- Create UTCS anchors to these documents
- Maintain version control and change history

## Naming Convention

```
MOC-CS25-<PARA>-<SUBJECT>-<METHOD>-<YYYYMMDD>-R<NN>.pdf
```

Where:
- `<PARA>` — CS-25 paragraph number (e.g., 561, 571, 603)
- `<SUBJECT>` — Brief topic (e.g., STATIC, FATIGUE, MATERIALS)
- `<METHOD>` — Compliance method (ANALYSIS, TEST, INSPECTION, SIMILARITY, SERVICE-EXP)
- `<YYYYMMDD>` — Date of issue
- `<R<NN>>` — Revision number (R00, R01, R02, etc.)

Examples:
- `MOC-CS25-561-STATIC-ANALYSIS-20250310-R01.pdf`
- `MOC-CS25-571-FATIGUE-DT-ANALYSIS-20250312-R01.pdf`
- `MOC-CS25-603-MATERIALS-INSPECTION-20250305-R00.pdf`

## Required Content

Each MoC record **must** include:

1. **Requirement** — CS-25 paragraph and exact regulatory text
2. **Method** — Analysis / Test / Inspection / Similarity / Service Experience
3. **Configuration** — CAD/ASSY revs, materials, fasteners, load cases (UTCS anchors)
4. **Assumptions** — Loads, boundary conditions, safety factors, scatter factors
5. **Results/Margins** — Per feature/location; pass/fail criteria and assessment
6. **Traceability** — Links to supporting artifacts (FEM, test reports, inspections) with UTCS hashes
7. **Sign-off** — Analyst, checker, design authority, QA (names, dates, signatures)

## Release Process

1. **Draft preparation** — Analyst creates draft in `../drafts/`
2. **Technical review** — Checker reviews technical content
3. **Design authority approval** — DA approves compliance demonstration
4. **QA verification** — QA verifies completeness and traceability
5. **Release** — Move to this directory with formal naming and revision
6. **UTCS anchoring** — Create UTCS YAML record in `../utcs/`
7. **Matrix update** — Update compliance matrix in `../matrices/`

## Revision Control

When updating an existing MoC record:
- Increment revision number (R01 → R02)
- Update date in filename
- Document change history in the record
- Update UTCS YAML with new hash
- Mark superseded versions in compliance matrix

## UTCS Integration

For each MoC record in this directory:
- Create corresponding UTCS YAML in `../utcs/`
- Include SHA-256 hash of PDF file
- Reference all supporting evidence with UTCS anchors
- Document approval chain and provenance

## Related

- [../utcs/](../utcs/) — UTCS YAML records for these MoC PDFs
- [../matrices/](../matrices/) — Compliance matrices referencing these records
- [../methods/](../methods/) — Supporting evidence (analysis, tests, inspections)
- [../../EASA-submissions/](../../EASA-submissions/) — Formal certification packages
