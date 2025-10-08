# TFA Domain Repository Model — Hierarchical BEZ Pattern

## Overview

This document explains the **intentional repetition** of BEZ folders (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, etc.) at both **domain level** and **subzone level** within the TFA (Technology and Functional Architecture) Domain Repository Model.

This is **not redundancy** — it reflects a **governance hierarchy** where domain-level folders serve as **templates and schemas**, while subzone-level folders contain **instances and artifacts**.

---

## 🧩 Conceptual Justification

The TFA Domain Tree is organized by **levels of governance**, not just by file types.

| Level | Location | Role |
|-------|----------|------|
| **Domain (macro)** | `DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/` | Repository of **policies, templates, and contracts** applicable to all zones. Contains schemas, normative references, and validation standards. |
| **Subzone (micro)** | `ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/` | Repository of **operational artifacts** — actual datasets, CADs, QA records, reports derived from domain policies. |

### Key Distinction

```
Domain Level  = ONTOLOGY + CONTRACT (what & how things should be done)
Subzone Level = IMPLEMENTATION + ARTIFACTS (actual work products)
```

The repetition is **hierarchical reflection**:
- **Upper level** defines the *TFA contract and ontology*
- **Lower level** applies those contracts to *specific physical/digital artifacts*

---

## 📁 Structure Pattern

```
DOMAINS/
 └── AAA-AIRFRAMES-...
     ├── DELs/              ← Templates, policies, schemas (domain scope)
     │   ├── README.md      ← "What DELs are, policy for using them"
     │   ├── TEMPLATES/     ← Document templates
     │   └── SCHEMAS/       ← Validation schemas
     ├── PAx/               ← Packaging policies (domain scope)
     ├── PLM/               ← PLM standards and templates (domain scope)
     ├── QUANTUM_OA/        ← Optimization patterns (domain scope)
     ├── SUPPLIERS/         ← Supplier qualification criteria (domain scope)
     ├── policy/            ← Domain policies
     ├── tests/             ← Test frameworks and requirements
     └── ZONES/
         └── 53-FUSELAGE-STRUCTURES/
             └── 53-10-CENTER-BODY/
                 ├── DELs/  ← Actual certification documents (instance scope)
                 │   ├── EASA-submissions/
                 │   ├── MoC-records/
                 │   └── final-design-reports/
                 ├── PAx/   ← Actual packaging artifacts (instance scope)
                 ├── PLM/   ← Actual CAD/CAE files (instance scope)
                 │   ├── CAD/
                 │   ├── CAE/
                 │   └── CAV/
                 └── QUANTUM_OA/  ← Actual optimization runs (instance scope)
```

### Hierarchical Roles

#### Domain Level (Templates)
- **Purpose**: Define standards, templates, and policies
- **Contents**: 
  - Document templates (.docx, .xlsx stubs)
  - JSON/XML schemas for validation
  - Policy documents defining requirements
  - Test framework specifications
  - Supplier qualification criteria
- **No binary artifacts**: Only reference materials
- **Scope metadata**: `"scope": "domain"`

#### Subzone Level (Instances)
- **Purpose**: Store actual work products and artifacts
- **Contents**:
  - Completed certification documents
  - Actual CAD models and assemblies
  - Test results and reports
  - Supplier contracts and bids
  - Optimization results
- **Must contain artifacts**: At least one delivery per folder
- **Scope metadata**: `"scope": "instance"`
- **Inheritance**: References domain-level templates

---

## 🔗 Inheritance Pattern

Each subzone-level BEZ folder **inherits** from its domain-level counterpart.

### Example: inherit.json

Place in each instance-level folder:

```json
{
  "inherits_from": "../../../DELs",
  "utcs_scope": "instance",
  "applies_templates": [
    "FDR-template-v2.docx",
    "MoC-checklist-v1.xlsx"
  ],
  "overrides": {
    "submission_authority": "EASA",
    "certification_basis": "CS-25 Amendment 27"
  }
}
```

### Example: META.json for Domain Level

```json
{
  "utcs_scope": "domain",
  "type": "template_repository",
  "applies_to": [
    "ZONES/53-FUSELAGE-STRUCTURES",
    "ZONES/57-WING-STRUCTURES"
  ],
  "validation_schema": "./schemas/dels-validation.schema.json",
  "policy_version": "v1.2",
  "last_updated": "2025-01-27"
}
```

### Example: META.json for Subzone Level

```json
{
  "utcs_anchor": "utcs://ampel360/aaa/53/10/centerBody",
  "utcs_scope": "instance",
  "inherits_from": "../../../DELs",
  "ata_chapter": "53-10",
  "system_name": "Center Body",
  "certification_status": "in_progress",
  "responsible_engineer": "did:example:engineer123"
}
```

---

## 🧭 Scalability Guidelines

To maintain clarity as the structure grows to thousands of nodes:

### 1. Naming Convention for Domain-Level Templates

Use clear prefixes to distinguish template repositories:

```
AAA-AIRFRAMES-.../
├── DELs/
│   ├── README.md              ← "DELs Template Repository"
│   ├── TEMPLATES/             ← Explicit template folder
│   │   ├── FDR-template.docx
│   │   └── MoC-template.xlsx
│   └── SCHEMAS/
│       └── dels-schema.json
```

### 2. Metadata Files

Add `.meta` or `META.json` files to every BEZ folder:

- **Domain level**: `"scope": "domain"` + validation schemas
- **Instance level**: `"scope": "instance"` + UTCS anchor

### 3. CI/CD Validation

Implement automated checks in CI pipeline:

```python
def validate_bez_structure(path):
    meta = load_json(f"{path}/META.json")
    
    if meta["scope"] == "domain":
        # Domain-level rules
        assert not contains_binary_files(path), "Domain level must not contain binaries"
        assert exists(f"{path}/TEMPLATES"), "Must have TEMPLATES folder"
        assert exists(f"{path}/README.md"), "Must have README"
    
    elif meta["scope"] == "instance":
        # Instance-level rules
        assert "inherits_from" in meta, "Must declare inheritance"
        assert has_artifacts(path), "Must contain at least one artifact"
        assert "utcs_anchor" in meta, "Must have UTCS anchor"
```

### 4. Documentation Standards

Every domain-level README must include:

```markdown
## Scope and Purpose

**Scope**: Domain Template Repository  
**Purpose**: Defines standards, templates, and policies for [FOLDER_NAME]  
**Applies to**: All subzones and systems within this domain

## Using This Template

1. Navigate to your subzone (e.g., `ZONES/53-10-CENTER-BODY/`)
2. Reference templates from `TEMPLATES/` directory
3. Follow policies defined in `policy/`
4. Validate outputs against schemas in `SCHEMAS/`

## Instance Locations

See actual implementations in:
- `ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/DELs/`
- `ZONES/57-WING-STRUCTURES/57-10-BOX-SECTION/DELs/`
```

---

## 📊 Visual Hierarchy Diagram

```
┌─────────────────────────────────────────────────────────────┐
│ DOMAIN LEVEL (AAA-AIRFRAMES-...)                            │
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐            │
│ │ DELs/       │ │ PAx/        │ │ PLM/        │            │
│ │ TEMPLATES   │ │ TEMPLATES   │ │ TEMPLATES   │            │
│ │ SCHEMAS     │ │ SCHEMAS     │ │ SCHEMAS     │            │
│ │ [POLICIES]  │ │ [POLICIES]  │ │ [POLICIES]  │            │
│ └──────┬──────┘ └──────┬──────┘ └──────┬──────┘            │
│        │                │                │                    │
│        └────────────────┼────────────────┘                    │
│                         │ INHERITS                            │
│                         ▼                                     │
│        ┌────────────────────────────────────┐                │
│        │ ZONES/                             │                │
│        │  └── 53-FUSELAGE-STRUCTURES/       │                │
│        │       └── 53-10-CENTER-BODY/       │                │
│        │            ├── DELs/               │                │
│        │            │   └── [ARTIFACTS]     │ ← INSTANCES   │
│        │            ├── PAx/                │                │
│        │            │   └── [ARTIFACTS]     │ ← INSTANCES   │
│        │            └── PLM/                │                │
│        │                └── [ARTIFACTS]     │ ← INSTANCES   │
│        └────────────────────────────────────┘                │
└─────────────────────────────────────────────────────────────┘

Legend:
━━━━  = Contract/Policy definition
────  = Inheritance/Application
[...] = Actual artifacts/data
```

---

## 🎯 Pattern Reflection in TFA Components

This hierarchy reflects the core TFA pattern:

| TFA Layer | Domain Level | Subzone Level |
|-----------|--------------|---------------|
| **LLC** (Logic Layer Contract) | Defines *what* must be in each BEZ folder | Validates that instances meet LLC requirements |
| **QS** (Quantum State) | Specifies possible states (draft, reviewed, approved) | Records actual state of each artifact |
| **UTCS** (Universal Traceability) | Defines anchor format and validation rules | Contains actual UTCS anchors |

---

## ✅ Validation Checklist

For correct implementation:

### Domain Level
- [ ] Contains README explaining template purpose
- [ ] Has TEMPLATES/ or SCHEMAS/ subdirectory
- [ ] Has policy/ directory with governance rules
- [ ] META.json includes `"scope": "domain"`
- [ ] No binary artifacts (only reference files)
- [ ] Documents validation criteria

### Subzone Level
- [ ] Contains actual work products
- [ ] Has inherit.json referencing domain level
- [ ] META.json includes `"scope": "instance"` and UTCS anchor
- [ ] At least one artifact present in each BEZ folder used
- [ ] References template/schema used
- [ ] Includes responsible party metadata

---

## 🔄 Migration Path

For existing domain-level artifacts that are actually instances:

1. **Identify** which artifacts are true instances vs. templates
2. **Create** appropriate subzone directories in ZONES/
3. **Move** instance artifacts to subzone level
4. **Convert** remaining domain-level content to templates
5. **Add** META.json to both levels
6. **Update** README files to clarify scope
7. **Validate** using CI checks

---

## 📚 Related Documentation

- [ATA-STRUCTURE-EXAMPLE.md](./ATA-STRUCTURE-EXAMPLE.md) — Implementation guidelines
- [COMPLETE-DOMAIN-STRUCTURE.md](./COMPLETE-DOMAIN-STRUCTURE.md) — Full domain overview
- [ata-chapters.README.md](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md) — ATA chapter assignments
- [domains.README.md](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/domains.README.md) — Domain definitions

---

## 🔑 Key Takeaways

✅ **Repetition is intentional and correct** — not redundancy  
✅ **Domain level = Contract** (templates, schemas, policies)  
✅ **Subzone level = Implementation** (artifacts, data, deliverables)  
✅ **Hierarchy reflects TFA LLC → QS → UTCS pattern**  
✅ **Use metadata to distinguish scope explicitly**  
✅ **Validate with CI to maintain consistency**

---

**Version**: 1.0  
**Last Updated**: 2025-01-27  
**Status**: 📘 Reference Documentation
