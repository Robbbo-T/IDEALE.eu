# SCI Chapter Structure Example for AMPEL360-SPACE-T

This document demonstrates the correct application of the BEZ (Bloque de Estructura Base) at the **sub-subsystem level only** for spacecraft systems using the Spacecraft Chapter Index (SCI).

## Principle

The BEZ structure (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, policy/, tests/) appears at **two hierarchical levels** with distinct purposes:

- **Domain Level**: Templates, schemas, and policies (governance layer)
- **Sub-Subsystem Level**: Actual artifacts and deliverables (implementation layer)

**System and Subsystem levels are CLEAN** - they contain only descriptors.

This hierarchical repetition is **intentional** — it reflects the TFA governance pattern where upper levels define contracts and lower levels implement them.

## Structure Pattern

### All Domains Use SYSTEMS/ (No ZONES)

Unlike AMPEL360-AIR-T where AAA used ZONES/, **all AMPEL360-SPACE-T domains use SYSTEMS/** exclusively.

### Cluster-Based Organization

AMPEL360-SPACE-T uses a **cluster-based organization** with standardized XX subsystem codes (10-90) and fixed YY sub-subsystem codes (01-20) from assigned decks.

**Path pattern:** `NN-LABEL/NN-XX-SUBSYSTEM/NN-XX-YY-SUBSUBSYSTEM/`

See [CLUSTER-BASED-ORGANIZATION.md](./CLUSTER-BASED-ORGANIZATION.md) for complete cluster and deck definitions.

```
AAA-STRUCTURES-MECHANISMS-SPACEWORTHINESS/
├─ DELs/                                    ← Domain-level templates
├─ PAx/
├─ PLM/
├─ QUANTUM_OA/
├─ SUPPLIERS/
├─ policy/
├─ tests/
├─ META.json                                ← scope: "domain"
├─ README.md
├─ domain-config.yaml
│
└─ SYSTEMS/
   │
   ├─ 53-PRIMARY-STRUCTURE/                 ← System level (CLEAN)
   │  ├─ README.md                          ← System overview only
   │  ├─ system.meta.yml                    ← System metadata
   │  └─ interfaces.yml                     ← Interface definitions
   │
   │  ├─ 53-10-PRIMARY-STRUCTURE/           ← Subsystem level (CLEAN)
   │  │  ├─ README.md                       ← Subsystem overview only
   │  │  └─ subsystem.meta.yml              ← Subsystem metadata
   │  │
   │  │  ├─ 53-10-01-PRIMARY-ELEMENTS/      ← Sub-subsystem (BEZ HERE, YY deck A)
   │  │  │  ├─ DELs/
   │  │  │  │  ├─ ECSS-submissions/
   │  │  │  │  ├─ CCSDS-compliance/
   │  │  │  │  ├─ NASA-standards/
   │  │  │  │  ├─ data-packages/
   │  │  │  │  └─ final-design-reports/
   │  │  │  ├─ PAx/
   │  │  │  │  ├─ ONB/
   │  │  │  │  └─ OUT/
   │  │  │  ├─ PLM/
   │  │  │  │  ├─ CAD/
   │  │  │  │  ├─ CAE/
   │  │  │  │  ├─ CAI/
   │  │  │  │  ├─ CAM/
   │  │  │  │  ├─ CAO/
   │  │  │  │  ├─ CAP/
   │  │  │  │  ├─ CAS/
   │  │  │  │  ├─ CAV/
   │  │  │  │  └─ CMP/
   │  │  │  ├─ QUANTUM_OA/
   │  │  │  │  ├─ GA/
   │  │  │  │  ├─ LP/
   │  │  │  │  ├─ MILP/
   │  │  │  │  ├─ QAOA/
   │  │  │  │  ├─ QOX/
   │  │  │  │  ├─ QP/
   │  │  │  │  ├─ QUBO/
   │  │  │  │  └─ SA/
   │  │  │  ├─ SUPPLIERS/
   │  │  │  │  ├─ BIDS/
   │  │  │  │  └─ SERVICES/
   │  │  │  ├─ policy/
   │  │  │  ├─ tests/
   │  │  │  ├─ META.json          ← scope: "instance"
   │  │  │  ├─ inherit.json       ← References domain templates
   │  │  │  ├─ README.md
   │  │  │  └─ domain-config.yaml
   │  │  │
   │  │  ├─ 53-10-02-SECONDARY-ELEMENTS/    ← Sub-subsystem (BEZ HERE, YY=02)
   │  │  │  └─ {Full BEZ structure}
   │  │  │
   │  │  └─ 53-10-03-JOINTS-FASTENERS/      ← Sub-subsystem (BEZ HERE, YY=03)
   │  │     └─ {Full BEZ structure}
   │  │
   │  ├─ 53-20-SECONDARY-STRUCTURE/         ← Subsystem level (CLEAN, XX=20)
   │  │  ├─ README.md
   │  │  └─ subsystem.meta.yml
   │  │  └─ 53-20-01-PRIMARY-ELEMENTS/      ← Sub-subsystem (BEZ HERE)
   │  │     └─ {Full BEZ structure}
   │  │
   │  └─ 53-30-DOORS-HATCHES-ACCESS/        ← Subsystem level (CLEAN, XX=30)
   │     ├─ README.md
   │     └─ subsystem.meta.yml
   │     └─ 53-30-01-PRIMARY-ELEMENTS/      ← Sub-subsystem (BEZ HERE)
   │        └─ {Full BEZ structure}
   │
   ├─ 54-PROPULSION-MODULE-STRUCTURE/       ← System level (CLEAN)
   │  ├─ README.md
   │  ├─ system.meta.yml
   │  └─ interfaces.yml
   │
   ├─ 57-SOLAR-ARRAY-STRUCTURES/            ← System level (CLEAN)
   │  └─ {Similar pattern with XX from Cluster S, YY from deck A}
   │
   └─ README.md                              ← SYSTEMS index
```

### Example: PPP Domain (Propulsion)

```
PPP-PROPULSION-PROPELLANTS/
├─ DELs/                                      ← Domain-level templates
├─ PAx/
├─ PLM/
├─ QUANTUM_OA/
├─ SUPPLIERS/
├─ policy/
├─ tests/
├─ META.json
├─ README.md
├─ domain-config.yaml
│
└─ SYSTEMS/
   │
   ├─ 71-MAIN-PROPULSION/                     ← System level (CLEAN)
   │  ├─ README.md
   │  ├─ system.meta.yml
   │  └─ interfaces.yml
   │
   │  └─ 71-10-MAIN-ENGINE/                   ← Subsystem level (CLEAN)
   │     ├─ README.md
   │     └─ subsystem.meta.yml
   │
   │     ├─ 71-10-01-THRUST-CHAMBER/          ← Sub-subsystem (BEZ HERE)
   │     │  └─ {Full BEZ structure}
   │     │
   │     ├─ 71-10-02-TURBOPUMP/               ← Sub-subsystem (BEZ HERE)
   │     │  └─ {Full BEZ structure}
   │     │
   │     └─ 71-10-03-VALVES/                  ← Sub-subsystem (BEZ HERE)
   │        └─ {Full BEZ structure}
   │
   ├─ 28-PROPELLANT-SYSTEMS/                  ← System level (CLEAN)
   │  └─ {Similar pattern}
   │
   └─ 60-RCS-PRACTICES/                       ← System level (CLEAN)
      └─ {Similar pattern}
```

### Example: LCC Domain (Links, Control & Communications)

```
LCC-LINKS-CONTROL-COMMUNICATIONS/
└─ SYSTEMS/
   │
   ├─ 22-GNC-AOCS/                            ← System level (CLEAN)
   │  ├─ README.md
   │  ├─ system.meta.yml
   │  └─ interfaces.yml
   │
   │  └─ 22-10-STAR-TRACKER/                  ← Subsystem level (CLEAN)
   │     ├─ README.md
   │     └─ subsystem.meta.yml
   │
   │     ├─ 22-10-01-SENSOR-HEAD/             ← Sub-subsystem (BEZ HERE)
   │     │  └─ {Full BEZ structure}
   │     │
   │     └─ 22-10-02-PROCESSING-UNIT/         ← Sub-subsystem (BEZ HERE)
   │        └─ {Full BEZ structure}
   │
   ├─ 23-TT-C/                                ← System level (CLEAN)
   │  └─ 23-10-TRANSPONDER/
   │     └─ 23-10-01-RF-UNIT/                 ← Sub-subsystem (BEZ HERE)
   │
   └─ 44-MODE-CONTROL-FDIR/                   ← System level (CLEAN)
      └─ {Similar pattern}
```

## BEZ (Bloque de Estructura Base) Contents

### At Sub-Subsystem Level (Instances)

When applied at the sub-subsystem level, the complete BEZ includes actual artifacts:

```
SUB-SUBSYSTEM/
├─ DELs/
│  ├─ ECSS-submissions/          ← ECSS compliance artifacts
│  │  ├─ ECSS-E-ST-10C.pdf
│  │  └─ compliance-matrix.xlsx
│  ├─ CCSDS-compliance/          ← CCSDS standards compliance
│  │  └─ CCSDS-123.0-B-1.pdf
│  ├─ NASA-standards/            ← NASA requirements compliance
│  │  └─ NPR-7150.2-checklist.xlsx
│  ├─ data-packages/
│  └─ final-design-reports/
├─ PAx/
│  ├─ ONB/                       ← Onboard artifacts
│  └─ OUT/                       ← Output artifacts
├─ PLM/
│  ├─ CAD/                       ← 3D models (STEP, IGES)
│  ├─ CAE/                       ← Analysis (FEA, CFD)
│  ├─ CAI/                       ← Inspection data
│  ├─ CAM/                       ← Manufacturing data
│  ├─ CAO/                       ← Operations data
│  ├─ CAP/                       ← Procurement data
│  ├─ CAS/                       ← S1000D technical publications
│  ├─ CAV/                       ← Verification artifacts
│  └─ CMP/                       ← Compliance artifacts
├─ QUANTUM_OA/                   ← Optimization algorithms
│  ├─ GA/                        ← Genetic algorithms
│  ├─ LP/                        ← Linear programming
│  ├─ MILP/                      ← Mixed integer linear programming
│  ├─ QAOA/                      ← Quantum approximate optimization
│  ├─ QOX/                       ← Quantum optimization
│  ├─ QP/                        ← Quadratic programming
│  ├─ QUBO/                      ← Quadratic unconstrained binary optimization
│  └─ SA/                        ← Simulated annealing
├─ SUPPLIERS/
│  ├─ BIDS/                      ← Supplier bids
│  └─ SERVICES/                  ← Service contracts
├─ policy/                       ← Component-specific policies
├─ tests/                        ← Test results and reports
├─ META.json                     ← Metadata: scope: "instance"
├─ inherit.json                  ← Template inheritance
├─ README.md                     ← Component documentation
└─ domain-config.yaml            ← Configuration
```

### At Domain Level (Templates)

Domain-level BEZ folders contain templates and policies, not artifacts:

```
DOMAIN/
├─ DELs/
│  ├─ TEMPLATES/
│  │  ├─ ECSS-FDR-template.docx
│  │  ├─ CCSDS-compliance-checklist.xlsx
│  │  └─ NASA-review-package-template.pptx
│  ├─ SCHEMAS/
│  │  └─ dels-validation.schema.json
│  └─ README.md                  ← "DELs Template Repository"
├─ PLM/
│  ├─ STANDARDS/
│  │  ├─ cad-naming-convention.md
│  │  ├─ cae-mesh-requirements.md
│  │  └─ step-ap242-guidelines.md
│  └─ README.md
├─ QUANTUM_OA/
│  ├─ PATTERNS/
│  │  └─ optimization-workflows.md
│  └─ README.md
├─ META.json                     ← Metadata: scope: "domain"
└─ README.md
```

## System/Subsystem Level Descriptors (CLEAN)

### System Level Files (No BEZ)

At the system level (e.g., `53-PRIMARY-STRUCTURE/`), only descriptor files:

```
53-PRIMARY-STRUCTURE/
├─ README.md                     ← System overview and purpose
├─ system.meta.yml               ← System-level metadata
└─ interfaces.yml                ← External interfaces
```

**system.meta.yml** example:
```yaml
utcs_anchor: "SPACE.SCI.53-PRIMARY-STRUCTURE:rev[A]"
system_name: "Primary Structure"
domain: "AAA"
sci_chapter: 53
description: "Main structural elements providing spacecraft integrity"
subsystems:
  - "53-10-MAIN-BODY"
  - "53-20-ADAPTERS"
  - "53-30-LONGERONS"
interfaces:
  - domain: "PPP"
    system: "54-PROPULSION-MODULE-STRUCTURE"
    type: "structural-attachment"
  - domain: "EEE"
    system: "57-SOLAR-ARRAY-STRUCTURES"
    type: "structural-mounting"
```

### Subsystem Level Files (No BEZ)

At the subsystem level (e.g., `53-10-MAIN-BODY/`), only descriptor files:

```
53-10-MAIN-BODY/
├─ README.md                     ← Subsystem overview
└─ subsystem.meta.yml            ← Subsystem metadata
```

**subsystem.meta.yml** example:
```yaml
utcs_anchor: "SPACE.SCI.53-PRIMARY-STRUCTURE.53-10-MAIN-BODY:rev[A]"
subsystem_name: "Main Body"
parent_system: "53-PRIMARY-STRUCTURE"
description: "Central body structure housing primary payload"
sub_subsystems:
  - "53-10-01-FORWARD-SECT"
  - "53-10-02-CENTER-SECT"
  - "53-10-03-AFT-SECT"
mass_budget_kg: 1250.5
material: "Aluminum 2219-T87"
```

## UTCS Anchor Format

All UTCS anchors follow the spacecraft format with cluster-based hierarchy:
```
SPACE.SCI.<NN-LABEL>.<NN-XX-SUBSYSTEM>.<NN-XX-YY-SUBSUBSYSTEM>:REV
```

Examples:
```
SPACE.SCI.53-PRIMARY-STRUCTURE:rev[A]
SPACE.SCI.53-PRIMARY-STRUCTURE.53-10-PRIMARY-STRUCTURE:rev[A]
SPACE.SCI.53-PRIMARY-STRUCTURE.53-10-PRIMARY-STRUCTURE.53-10-01-PRIMARY-ELEMENTS:rev[B]
SPACE.SCI.24-EPS-POWER.24-30-CONVERSION-REGULATION:rev[A]
SPACE.SCI.24-EPS-POWER.24-30-CONVERSION-REGULATION.24-30-03-CONVERSION-REGULATION:rev[A]
SPACE.SCI.71-MAIN-PROPULSION.71-40-THRUST-DEVICES:rev[A]
SPACE.SCI.71-MAIN-PROPULSION.71-40-THRUST-DEVICES.71-40-04-THRUSTERS-NOZZLES:rev[C]
```

### Hierarchy Levels

- **System**: `SPACE.SCI.NN-LABEL:rev[X]`
- **Subsystem**: `SPACE.SCI.NN-LABEL.NN-XX-SUBSYSTEM:rev[X]`
- **Sub-subsystem**: `SPACE.SCI.NN-LABEL.NN-XX-SUBSYSTEM.NN-XX-YY-SUBSUBSYSTEM:rev[X]`

The XX and YY codes provide stable, numeric identifiers for automation and traceability.

## SCI Chapter to Domain Assignments

See [/1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.csv](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.csv) for the complete mapping.

### Key AAA Domain Chapters (Structures)

- 06 - Coordinates and Mass Properties
- 14 - Fasteners and Structural Hardware
- 50 - Payload Bay Structures
- 51 - Standard Practices (Structures)
- 52 - Access Doors and Hatches
- 53 - Primary Structure
- 54 - Propulsion Module Structure (shared with PPP)
- 55 - Masts, Booms, and Rad Structures
- 56 - Viewports and Windows
- 57 - Solar Array Structures
- 58 - Docking Systems
- 94 - Avionics Bays and EE Compartments

### Naming Convention for Sub-Subsystems

### Cluster-Based Approach

Format: `[SCI]-[XX]-[YY]-[DESCRIPTIVE-NAME]/`

Where:
- **SCI** = Chapter number (01-100)
- **XX** = Subsystem code from cluster (10, 20, 30, ... 90)
- **YY** = Sub-subsystem code from assigned deck (01-20)
- **DESCRIPTIVE-NAME** = Human-readable name matching YY deck content

Examples using **Cluster S** (Structures) with **YY Deck A**:
- `53-10-01-PRIMARY-ELEMENTS/` (XX=10: Primary Structure, YY=01: Primary elements)
- `53-10-02-SECONDARY-ELEMENTS/` (XX=10: Primary Structure, YY=02: Secondary elements)
- `53-10-03-JOINTS-FASTENERS/` (XX=10: Primary Structure, YY=03: Joints & fasteners)
- `53-20-01-PRIMARY-ELEMENTS/` (XX=20: Secondary Structure, YY=01: Primary elements)
- `53-30-01-PRIMARY-ELEMENTS/` (XX=30: Doors/Hatches, YY=01: Primary elements)

Examples using **Cluster H** (Power) with **YY Deck H**:
- `24-10-01-GENERATION/` (XX=10: Generation, YY=01: Generation arrays/RTG/fuel cell)
- `24-20-02-STORAGE/` (XX=20: Storage, YY=02: Storage battery modules)
- `24-30-03-CONVERSION-REGULATION/` (XX=30: Conversion, YY=03: Conversion/regulation PCDU)

Examples using **Cluster B** (Propulsion) with **YY Deck B**:
- `71-10-01-TANKS-PMD/` (XX=10: Propellant Storage, YY=01: Tanks & PMD)
- `71-40-04-THRUSTERS-NOZZLES/` (XX=40: Thrust Devices, YY=04: Thrusters/nozzles)
- `71-60-08-THERMAL-MGMT-INSULATION/` (XX=60: Thermal Management, YY=08: Thermal management & insulation)

### XX Codes are Cluster-Specific

Each cluster defines its own set of 9 XX codes (10-90) representing common subsystems for that functional area. See [CLUSTER-BASED-ORGANIZATION.md](./CLUSTER-BASED-ORGANIZATION.md) for the complete list of XX codes per cluster.

### YY Codes are Deck-Specific (01-20 Fixed)

Each YY deck provides 20 fixed sub-subsystem codes (01-20) appropriate for that cluster's domain. The same YY deck is used across all chapters in a cluster, ensuring consistency.

**Key principle:** YY codes are **not placeholders** - they represent specific, reusable content defined in the deck.

## Understanding Hierarchical BEZ

The presence of BEZ folders at both domain and sub-subsystem levels is intentional:

### Domain Level Purpose
- **What**: Templates, schemas, policies, standards
- **Why**: Define contracts and governance for entire domain
- **Example**: Document templates that all sub-subsystems use
- **Metadata**: `"scope": "domain"`

### Sub-Subsystem Level Purpose
- **What**: Actual artifacts, deliverables, work products
- **Why**: Implement domain contracts for specific components
- **Example**: Completed certification documents, CAD models
- **Metadata**: `"scope": "instance"`, `"inherits_from": "..."`

### System/Subsystem Levels (CLEAN)
- **What**: Descriptors only (README.md, meta.yml, interfaces.yml)
- **Why**: Organize hierarchy without artifacts
- **NO BEZ**: Clean levels for navigation

### Inheritance Pattern

Each sub-subsystem **inherits** from domain level:

```json
// 53-10-01-FORWARD-SECT/inherit.json
{
  "inherits_from": "../../../../../../DELs",
  "utcs_scope": "instance",
  "applies_templates": [
    "ECSS-FDR-template.docx",
    "CCSDS-compliance-checklist.xlsx"
  ],
  "compliance_frameworks": [
    "ECSS-E-ST-10C",
    "ECSS-E-ST-32C",
    "NASA-STD-5001B"
  ]
}
```

## Migration from AMPEL360-AIR-T

When migrating from aircraft (ATA) to spacecraft (SCI) structure:

1. **Rename chapters** using SCI nomenclature (see crosswalk in sci-chapters.README.md)
2. **Eliminate ZONES/** — Convert all to SYSTEMS/
3. **Move BEZ up one level** — From subsystem to sub-subsystem depth
4. **Add clean levels** — Insert system.meta.yml and subsystem.meta.yml
5. **Update UTCS** — Change from ATA format to SPACE.SCI format
6. **Add ECSS/CCSDS** — Replace EASA with ECSS/CCSDS/NASA compliance
7. **Update inherit.json** — Adjust paths for new hierarchy depth

## Validation Checklist

- [ ] Every domain uses **SYSTEMS/** only (no ZONES/)
- [ ] System level contains **only** README.md, system.meta.yml, interfaces.yml
- [ ] Subsystem level contains **only** README.md, subsystem.meta.yml
- [ ] BEZ present **exclusively** at sub-subsystem depth
- [ ] SCI codes and labels consistent across domains
- [ ] UTCS anchors follow SPACE.SCI.NN-LABEL format
- [ ] ECSS/CCSDS/NASA compliance artifacts in DELs/
- [ ] Cross-domain dependencies in inherit.json
- [ ] Domain-level BEZ contains templates only
- [ ] Sub-subsystem-level BEZ contains instances only

## Cross-References

- [SCI Chapters README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.README.md)
- [Canonical Domains README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/domains.README.md)
- [Complete Domain Structure](./COMPLETE-DOMAIN-STRUCTURE.md)
- [AMPEL360-SPACE-T README](../README.md)
