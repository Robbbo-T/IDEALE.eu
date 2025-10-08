# TFA Domain Hierarchy — Visual Diagrams

This document provides visual representations of the domain-level vs. subzone-level BEZ hierarchy pattern.

---

## Hierarchical Structure Diagram

```
╔═══════════════════════════════════════════════════════════════════════╗
║  DOMAIN LEVEL — TEMPLATES & GOVERNANCE (Scope: "domain")              ║
║                                                                        ║
║  AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/                            ║
║                                                                        ║
║  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                  ║
║  │ DELs/       │  │ PAx/        │  │ PLM/        │  ← TEMPLATES     ║
║  │ ├TEMPLATES/ │  │ ├STANDARDS/ │  │ ├STANDARDS/ │    SCHEMAS       ║
║  │ ├SCHEMAS/   │  │ └README.md  │  │ └README.md  │    POLICIES      ║
║  │ ├POLICIES/  │  │             │  │             │                   ║
║  │ └README.md  │  │             │  │             │                   ║
║  └─────────────┘  └─────────────┘  └─────────────┘                  ║
║         │                 │                 │                         ║
║         └─────────────────┼─────────────────┘                         ║
║                           │                                           ║
║                    INHERITS (defines contract)                        ║
║                           ▼                                           ║
╚═══════════════════════════════════════════════════════════════════════╝
                            │
                            │
╔═══════════════════════════════════════════════════════════════════════╗
║  SUBZONE LEVEL — INSTANCES & ARTIFACTS (Scope: "instance")            ║
║                                                                        ║
║  ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/                      ║
║                                                                        ║
║  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                  ║
║  │ DELs/       │  │ PAx/        │  │ PLM/        │  ← ARTIFACTS     ║
║  │ ├EASA-sub/  │  │ ├ONB/       │  │ ├CAD/       │    DELIVERABLES  ║
║  │ ├MoC-rec/   │  │ ├OUT/       │  │ ├CAE/       │    REPORTS       ║
║  │ ├FDRs/      │  │ └README.md  │  │ ├CAV/       │    TEST DATA     ║
║  │ ├data-pkg/  │  │             │  │ └README.md  │                   ║
║  │ └README.md  │  │             │  │             │                   ║
║  └─────────────┘  └─────────────┘  └─────────────┘                  ║
║                                                                        ║
║  META.json (utcs_scope: "instance")                                   ║
║  inherit.json (inherits_from: "../../../DELs")                        ║
║                                                                        ║
╚═══════════════════════════════════════════════════════════════════════╝
```

---

## Inheritance Flow Diagram

```
┌──────────────────────────────────────────────────────────────────┐
│ DOMAIN LEVEL (Contract Definition)                               │
│                                                                   │
│  DELs/TEMPLATES/                                                 │
│  └── FDR-template-v2.docx  ──────┐                               │
│  └── MoC-checklist-v1.xlsx ───┐  │                               │
│                               │  │                               │
│  DELs/SCHEMAS/                │  │                               │
│  └── dels-validation.schema   │  │                               │
│                               │  │                               │
│  DELs/POLICIES/               │  │                               │
│  └── submission-process.md    │  │                               │
└───────────────────────────────┼──┼───────────────────────────────┘
                                │  │
                        INHERITS│  │ APPLIES
                                │  │
                                ▼  ▼
┌──────────────────────────────────────────────────────────────────┐
│ SUBZONE LEVEL (Contract Implementation)                          │
│                                                                   │
│  DELs/inherit.json                                               │
│  └── inherits_from: "../../../DELs"                              │
│  └── applies_templates: ["FDR-template-v2.docx", ...]            │
│                                                                   │
│  DELs/final-design-reports/                                      │
│  └── 53-10-CENTER-BODY-FDR-v1.0.pdf  (created from template)     │
│                                                                   │
│  DELs/MoC-records/                                               │
│  └── 53-10-MoC-tracking.xlsx  (created from template)            │
│                                                                   │
│  Validates against: ../../../DELs/SCHEMAS/dels-validation.schema │
│  Follows process: ../../../DELs/POLICIES/submission-process.md   │
└──────────────────────────────────────────────────────────────────┘
```

---

## TFA Component Mapping

```
┌────────────────────────────────────────────────────────────────────┐
│ TFA LAYER                  │ DOMAIN LEVEL    │ SUBZONE LEVEL       │
├────────────────────────────┼─────────────────┼─────────────────────┤
│ LLC                        │ Defines what    │ Validates that      │
│ (Logic Layer Contract)     │ must be in      │ instances meet      │
│                            │ each folder     │ LLC requirements    │
├────────────────────────────┼─────────────────┼─────────────────────┤
│ QS                         │ Specifies       │ Records actual      │
│ (Quantum State)            │ possible states │ state of each       │
│                            │ (draft, review) │ artifact            │
├────────────────────────────┼─────────────────┼─────────────────────┤
│ UTCS                       │ Defines anchor  │ Contains actual     │
│ (Universal Traceability)   │ format &        │ UTCS anchors for    │
│                            │ validation      │ each artifact       │
├────────────────────────────┼─────────────────┼─────────────────────┤
│ FWD                        │ N/A             │ Forward risk        │
│ (Forward Wave Dynamics)    │                 │ analysis for        │
│                            │                 │ specific system     │
├────────────────────────────┼─────────────────┼─────────────────────┤
│ UE                         │ N/A             │ Collapsed state     │
│ (Unitary Evolution)        │                 │ of system health    │
└────────────────────────────┴─────────────────┴─────────────────────┘
```

---

## Folder Comparison

```
┌─────────────────────────────────────────────────────────────────────────┐
│ CHARACTERISTIC            │ DOMAIN LEVEL        │ SUBZONE LEVEL         │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **Purpose**               │ Define standards    │ Store work products   │
│                           │ and policies        │ and artifacts         │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **Contains**              │ • Templates         │ • Completed docs      │
│                           │ • Schemas           │ • CAD files           │
│                           │ • Policies          │ • Test results        │
│                           │ • Standards         │ • Submissions         │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **Metadata Scope**        │ "scope": "domain"   │ "scope": "instance"   │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **File Types**            │ .docx stubs         │ .pdf, .docx filled    │
│                           │ .xlsx templates     │ .xlsx populated       │
│                           │ .schema.json        │ .step, .igs, .jt      │
│                           │ .md policies        │ Binary artifacts      │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **UTCS Anchor**           │ utcs://.../domain   │ utcs://.../instance   │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **Validation Role**       │ Provides validation │ Must pass validation  │
│                           │ criteria            │ against domain schema │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **Update Frequency**      │ Quarterly (stable)  │ Daily (active work)   │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **Approval Required**     │ Domain Lead         │ Engineer, Reviewer    │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **Binary Artifacts**      │ ❌ Not allowed      │ ✅ Required           │
├───────────────────────────┼─────────────────────┼───────────────────────┤
│ **inherits_from**         │ N/A                 │ Points to domain      │
└───────────────────────────┴─────────────────────┴───────────────────────┘
```

---

## File Flow Example

```
Step 1: Engineer needs to create Final Design Report (FDR)
   ↓
Step 2: Navigate to DOMAIN level to review template
   AAA/.../DELs/TEMPLATES/FDR-template-v2.docx
   ↓
Step 3: Copy template to SUBZONE level
   ZONES/53-10-CENTER-BODY/DELs/final-design-reports/
   ↓
Step 4: Fill in template with specific data
   - Add 53-10 center body stress analysis results
   - Include references to CAE models
   - Add UTCS anchor: utcs://ampel360/aaa/53/10/fdr001
   ↓
Step 5: Validate against domain schema
   Check: ../../../DELs/SCHEMAS/dels-validation.schema.json
   ↓
Step 6: Follow submission process
   Process: ../../../DELs/POLICIES/submission-process.md
   ↓
Step 7: Store completed FDR in subzone DELs/
   File: 53-10-CENTER-BODY-FDR-v1.0.pdf
   ↓
Step 8: Update META.json with artifact count
   "artifact_counts": { "final-design-reports": 1 }
```

---

## CI/CD Validation Flow

```
┌─────────────────────────────────────────────────────────────────┐
│ CI Pipeline Checks                                              │
└─────────────────────────────────────────────────────────────────┘
                            │
                            ├──► Check META.json exists
                            │
              ┌─────────────┴─────────────┐
              │                           │
        scope="domain"              scope="instance"
              │                           │
              ▼                           ▼
    ┌─────────────────┐         ┌──────────────────┐
    │ Domain Rules    │         │ Instance Rules   │
    │                 │         │                  │
    │ ✓ Has TEMPLATES/│         │ ✓ Has artifacts  │
    │ ✓ Has SCHEMAS/  │         │ ✓ Has inherit.json│
    │ ✓ Has README.md │         │ ✓ Has UTCS anchor│
    │ ✗ No binaries   │         │ ✓ References     │
    │                 │         │   domain level   │
    └─────────────────┘         └──────────────────┘
              │                           │
              └─────────────┬─────────────┘
                            │
                            ▼
                    ┌───────────────┐
                    │ ✅ PASS       │
                    │ ❌ FAIL       │
                    └───────────────┘
```

---

## Naming Pattern

```
Domain Level (Template Repository):
   AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/
   └── DELs/
       ├── TEMPLATES/               ← Explicit "templates" marker
       │   └── *.docx, *.xlsx
       ├── SCHEMAS/                 ← Explicit "schemas" marker
       │   └── *.schema.json
       ├── POLICIES/                ← Explicit "policies" marker
       │   └── *.md
       └── META.json                ← "scope": "domain"

Subzone Level (Instance Repository):
   ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/
   └── DELs/
       ├── EASA-submissions/        ← Actual submissions
       │   └── *.pdf
       ├── MoC-records/             ← Actual records
       │   └── *.xlsx, *.pdf
       ├── final-design-reports/    ← Actual reports
       │   └── *.pdf
       ├── META.json                ← "scope": "instance"
       └── inherit.json             ← Points to domain
```

---

## Metadata Structure Comparison

### Domain Level META.json
```json
{
  "utcs_scope": "domain",
  "type": "template_repository",
  "templates": [...],
  "validation_schema": "...",
  "policy_version": "v1.2"
}
```

### Subzone Level META.json
```json
{
  "utcs_anchor": "utcs://project/domain/ata/system",
  "utcs_scope": "instance",
  "inherits_from": "../../../DELs",
  "applies_templates": [...],
  "artifact_counts": {...}
}
```

### Subzone Level inherit.json
```json
{
  "inherits_from": "../../../DELs",
  "utcs_scope": "instance",
  "applies_templates": [...],
  "overrides": {...}
}
```

---

## Key Distinctions Summary

| Aspect | Domain Level | Subzone Level |
|--------|--------------|---------------|
| 🎯 **Role** | CONTRACT | IMPLEMENTATION |
| 📁 **Content** | Templates | Artifacts |
| 🔖 **Scope** | "domain" | "instance" |
| 🏷️ **UTCS** | Format definition | Actual anchors |
| 📝 **Files** | Stubs & schemas | Completed docs |
| 🔒 **Binaries** | Not allowed | Required |
| 🔗 **Inheritance** | Defines | Applies |
| 📊 **TFA** | LLC definition | QS state |

---

**See Also**:
- [TFA-DOMAIN-HIERARCHY.md](./TFA-DOMAIN-HIERARCHY.md) — Detailed explanation
- [ATA-STRUCTURE-EXAMPLE.md](./ATA-STRUCTURE-EXAMPLE.md) — Implementation guide
- [COMPLETE-DOMAIN-STRUCTURE.md](./COMPLETE-DOMAIN-STRUCTURE.md) — Full overview
