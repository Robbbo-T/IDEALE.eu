# UTCS Structure Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                        UTCS YAML Structure                           │
│                    (IDEALE-STD-0001 v0.1.0)                         │
└─────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────┐
│ METADATA (Required)                                                  │
├─────────────────────────────────────────────────────────────────────┤
│ schema_version: "1.0.0"              # SemVer format                │
│ utcs_id: "UTCS-MI:CAD:AAA:ONB:0001:v1"  # Canonical identifier     │
│ product: "AMPEL360-AIR-T"            # Product name                 │
│ domain: "AAA"                        # One of 15 domains            │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ TFA BRIDGE (Required)                                                │
├─────────────────────────────────────────────────────────────────────┤
│ bridge: "QS→FWD→UE→FE→CB→QB"        # TFA sequence                 │
│ primary_path: "FE→CB→UE"             # Primary operational path     │
│                                                                       │
│ TFA Stages:                                                          │
│   QS  = Quality State (context foundation)                          │
│   FWD = Forward (specification)                                      │
│   UE  = Unified Engineering (design)                                 │
│   FE  = Finite Element (analysis)                                    │
│   CB  = Certification Basis (compliance)                             │
│   QB  = Quantum Baseline (blockchain anchor)                         │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ PROVENANCE (Required)                                                │
├─────────────────────────────────────────────────────────────────────┤
│ provenance:                                                          │
│   owner: "Engineering Team"          # Responsible party            │
│   maintainer: "john.doe"             # Current maintainer           │
│   reviewers: ["qa.lead", "safety"]   # Optional reviewers           │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ THREADING (Optional)                                                 │
├─────────────────────────────────────────────────────────────────────┤
│ threading:                                                           │
│   context:                           # Situational awareness        │
│     mission: "Wing assembly"                                         │
│     env: "onboard"                                                   │
│     refs: ["UTCS-MI:...", "..."]    # Related UTCS IDs             │
│   content:                           # Data payload                  │
│     summary: "Description..."                                        │
│   cache: {}                          # Performance optimization      │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ STRUCTURE (Optional)                                                 │
├─────────────────────────────────────────────────────────────────────┤
│ structure:                                                           │
│   schema: "asm.join.v1"              # Schema identifier            │
│   fields:                            # Custom structured data        │
│     zone: "ONB"                                                      │
│     kind: "JOIN"                                                     │
│     index: 12                                                        │
│     min_clearance_mm: 8.0                                            │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ SHEET (Required)                                                     │
├─────────────────────────────────────────────────────────────────────┤
│ sheet:                                                               │
│   files:                             # Array of related files       │
│     - path: "../models/design.stp"   # Relative path               │
│       role: "cad"                    # File role                    │
│     - path: "../docs/spec.md"                                       │
│       role: "specification"                                          │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ EVIDENCE (Required)                                                  │
├─────────────────────────────────────────────────────────────────────┤
│ evidence:                                                            │
│   requirements: ["CS25.601", "..."] # Requirement IDs              │
│   links:                             # Traceability links           │
│     - "../verification/test.yaml"    # Relative paths              │
│     - "UTCS-MI:TEST:AAA:..."        # UTCS ID references           │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ SECURITY (Optional but recommended)                                  │
├─────────────────────────────────────────────────────────────────────┤
│ security:                                                            │
│   classification: "INTERNAL"         # Access control level        │
│                                                                       │
│ Valid classifications:                                               │
│   - INTERNAL                         # Internal use                 │
│   - INTERNAL–EVIDENCE-REQUIRED       # With evidence req            │
│   - RESTRICTED                       # Restricted access            │
└─────────────────────────────────────────────────────────────────────┘
                                ↓
┌─────────────────────────────────────────────────────────────────────┐
│ INTEGRITY (Required)                                                 │
├─────────────────────────────────────────────────────────────────────┤
│ integrity:                                                           │
│   hash_algorithm: "SHA256"           # Hash algorithm               │
│   content_hash: "abc123...def"       # 64-char hex hash            │
│                                                                       │
│ Hash of primary artifact (typically sheet.files[0])                 │
└─────────────────────────────────────────────────────────────────────┘


═══════════════════════════════════════════════════════════════════════
                           VALIDATION FLOW
═══════════════════════════════════════════════════════════════════════

    ┌──────────────┐
    │ UTCS File    │
    │ (*.yaml)     │
    └──────┬───────┘
           │
           ↓
    ┌──────────────────┐
    │ Schema           │  ← utcs-core.schema.json
    │ Validation       │
    └──────┬───────────┘
           │
           ↓
    ┌──────────────────┐
    │ Field            │  ← UTCS ID format
    │ Validation       │  ← Domain enum
    └──────┬───────────┘  ← Bridge pattern
           │
           ↓
    ┌──────────────────┐
    │ Reference        │  ← sheet.files[] exist?
    │ Checking         │  ← evidence.links[] valid?
    └──────┬───────────┘
           │
           ↓
    ┌──────────────────┐
    │ Integrity        │  ← content_hash matches?
    │ Verification     │
    └──────┬───────────┘
           │
           ↓
    ┌──────────────────┐
    │ ✅ Valid          │
    │ ⚠️  Warnings      │
    │ ❌ Errors         │
    └──────────────────┘


═══════════════════════════════════════════════════════════════════════
                          UTCS ID ANATOMY
═══════════════════════════════════════════════════════════════════════

    UTCS-MI:CAD:AAA:ONB:0001:v1
    │       │   │   │   │    │
    │       │   │   │   │    └── Version (integer)
    │       │   │   │   └─────── Index (4 digits)
    │       │   │   └──────────── Zone/System (e.g., ONB, 57-10)
    │       │   └──────────────── Class/Domain (e.g., AAA, PPP)
    │       └──────────────────── Scope (CAD, CAE, ASM, etc.)
    └──────────────────────────── Prefix (always UTCS-MI)

    Examples:
    - UTCS-MI:ASM:AAA:ONB:0012:v1      (Assembly)
    - UTCS-MI:CAD:MEC:57-10:0003:v2    (CAD Model)
    - UTCS-MI:TEST:CQH:WTB:0045:v1     (Test)
    - UTCS-MI:BOM:PPP:ENG:0001:v1      (Bill of Materials)


═══════════════════════════════════════════════════════════════════════
                        REPOSITORY LAYOUT
═══════════════════════════════════════════════════════════════════════

    DOMAINS/{DOMAIN}/
    └── ZONES/{ATA-CHAPTER}/
        └── {SUBZONE}/
            ├── PLM/
            │   ├── CAD/
            │   │   └── ASSY/
            │   │       ├── models/
            │   │       │   └── design-001.stp
            │   │       └── utcs/
            │   │           └── CAD-AAA-ONB-0001.yaml  ← UTCS here
            │   ├── CAE/
            │   └── MBD/
            └── DELs/
                └── utcs/


═══════════════════════════════════════════════════════════════════════
                    TOOLS AND AUTOMATION
═══════════════════════════════════════════════════════════════════════

    scripts/validate-utcs.py
    ├── Load utcs-core.schema.json
    ├── Find all utcs/*.yaml files
    ├── Validate each file
    │   ├── Schema compliance
    │   ├── UTCS ID format
    │   ├── File references
    │   ├── Evidence links
    │   └── Content hashes
    └── Generate report

    scripts/update-utcs-hash.py
    ├── Read artifact file
    ├── Calculate SHA256 hash
    ├── Update UTCS YAML
    └── Save changes

    .github/workflows/utcs-validation.yml
    ├── Trigger on push/PR
    ├── Install dependencies
    ├── Run validate-utcs.py
    └── Upload report


═══════════════════════════════════════════════════════════════════════
               For more details, see IDEALE-STD-0001-UTCS.md
═══════════════════════════════════════════════════════════════════════
```
