# MoC Compliance Matrices

This directory contains compliance matrices that cross-reference CS-25 requirements with their corresponding Means of Compliance (MoC) methods and evidence.

## Purpose

Compliance matrices provide a comprehensive view of certification status by mapping:
- **Requirements** — Specific CS-25 paragraphs applicable to 53-10 Center Body
- **MoC Methods** — Analysis (A), Test (T), Inspection (I), Similarity (S), Service Experience (SE)
- **Evidence** — UTCS anchors to supporting artifacts (FEM models, test reports, inspections)
- **Status** — Compliance status (In review, Approved, Rejected, Superseded)

## File Format

Matrices should be provided in CSV or Excel format for easy tracking and filtering:

```
Requirement,Title,Applicability,MoC_Method,Status,Evidence_UTCS,EASA_Status,Notes
CS-25.561,Emergency landing loads,Applicable,A,Complete,UTCS-MI:CAE:AAA:FEM:53-10:STATIC:R01,Accepted,
CS-25.571,Fatigue / DT,Applicable,A/T,In Review,UTCS-MI:CAE:AAA:FEM:53-10:FATIGUE:R02,Pending,
```

## Contents

- **Master compliance matrix** — Complete requirement-to-evidence mapping for 53-10
- **Subset matrices** — Filtered views by discipline (structures, materials, systems)
- **Gap analysis** — Tracking of open items and missing evidence
- **Review matrices** — Status tracking for EASA reviews and CRI responses

## Related

- [../records/](../records/) — Final MoC record PDFs
- [../utcs/](../utcs/) — UTCS YAML records with evidence anchors
- [../cri-ip/](../cri-ip/) — EASA Certification Review Items
