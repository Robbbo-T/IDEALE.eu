# ATA Chapter Structure Example for AMPEL360-AIR-T

This document demonstrates the correct application of the BEZ (Bloque de Estructura Base) at the lowest level of the ATA chapter hierarchy.

## Principle

The BEZ structure (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, policy/, tests/) appears at **two hierarchical levels** with distinct purposes:

- **Domain Level**: Templates, schemas, and policies (governance layer)
- **Subzone Level**: Actual artifacts and deliverables (implementation layer)

This hierarchical repetition is **intentional** — it reflects the TFA governance pattern where upper levels define contracts and lower levels implement them.

> **See**: [TFA-DOMAIN-HIERARCHY.md](./TFA-DOMAIN-HIERARCHY.md) for detailed explanation of the template vs. instance pattern.

## Structure Pattern

### For AAA (Structural Domains) - Use ZONES/

```
AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/
└─ ZONES/
│  ├─ 06-DIMENSIONS-STATIONS/
│  │  └─ 06-10-REFERENCE-FRAME/          ← BEZ applied here
│  │     ├─ DELs/
│  │     ├─ PAx/
│  │     ├─ PLM/
│  │     ├─ QUANTUM_OA/
│  │     ├─ SUPPLIERS/
│  │     ├─ policy/
│  │     ├─ tests/
│  │     ├─ META.json
│  │     ├─ README.md
│  │     └─ domain-config.yaml
│  │
│  ├─ 53-FUSELAGE-STRUCTURES/
│  │  ├─ 53-10-CENTER-BODY/              ← BEZ applied here
│  │  │  └─ {Full BEZ structure}
│  │  ├─ 53-20-FORWARD-SECTION/          ← BEZ applied here
│  │  │  └─ {Full BEZ structure}
│  │  └─ 53-30-AFT-SECTION/              ← BEZ applied here
│  │     └─ {Full BEZ structure}
│  │
│  ├─ 57-WING-STRUCTURES/
│  │  ├─ 57-10-BOX-SECTION/              ← BEZ applied here
│  │  │  └─ {Full BEZ structure}
│  │  ├─ 57-20-LEADING-EDGE/             ← BEZ applied here
│  │  │  └─ {Full BEZ structure}
│  │  └─ 57-30-TRAILING-EDGE/            ← BEZ applied here
│  │     └─ {Full BEZ structure}
│  │
│  └─ README.md                           ← Zone index only
│
├─ README.md                              ← Domain overview only
└─ domain-config.yaml                     ← Domain-level config only
```

### For Other Domains - Use SYSTEMS/

```
PPP-PROPULSION-FUEL-SYSTEMS/
└─ SYSTEMS/
│  ├─ 28-FUEL-SYSTEMS/                   ← BEZ applied here
│  │  ├─ DELs/
│  │  ├─ PAx/
│  │  ├─ PLM/
│  │  ├─ QUANTUM_OA/
│  │  ├─ SUPPLIERS/
│  │  ├─ policy/
│  │  ├─ tests/
│  │  ├─ META.json
│  │  ├─ README.md
│  │  └─ domain-config.yaml
│  │
│  ├─ 71-POWER-PLANT/                    ← BEZ applied here
│  │  └─ {Full BEZ structure}
│  │
│  └─ README.md
│
├─ README.md
└─ domain-config.yaml
```

## BEZ (Bloque de Estructura Base) Contents

### At Subzone/System Level (Instances)

When applied at the lowest level, the complete BEZ includes actual artifacts:

```
├─ DELs/
│  ├─ EASA-submissions/
│  ├─ MoC-records/
│  ├─ airworthiness-statements/
│  ├─ data-packages/
│  ├─ final-design-reports/
│  └─ README.md
├─ PAx/
│  ├─ ONB/
│  ├─ OUT/
│  └─ README.md
├─ PLM/
│  ├─ CAD/
│  ├─ CAE/
│  ├─ CAI/
│  ├─ CAM/
│  ├─ CAO/
│  ├─ CAP/
│  ├─ CAS/
│  ├─ CAV/
│  └─ CMP/
├─ PROCUREMENT/
│  └─ VENDORSCOMPONENTS/
├─ QUANTUM_OA/
│  ├─ GA/
│  ├─ LP/
│  ├─ MILP/
│  ├─ QAOA/
│  ├─ QOX/
│  ├─ QP/
│  ├─ QUBO/
│  └─ SA/
├─ SUPPLIERS/
│  ├─ BIDS/
│  └─ SERVICES/
├─ policy/
├─ tests/
├─ META.json                   # Includes "scope": "instance"
├─ inherit.json                # References domain-level templates
├─ README.md
└─ domain-config.yaml
```

### At Domain Level (Templates)

Domain-level BEZ folders contain templates and policies, not artifacts:

```
├─ DELs/
│  ├─ TEMPLATES/
│  │  ├─ FDR-template.docx
│  │  └─ MoC-checklist.xlsx
│  ├─ SCHEMAS/
│  │  └─ dels-validation.schema.json
│  └─ README.md               # "DELs Template Repository"
├─ PLM/
│  ├─ STANDARDS/
│  │  ├─ cad-naming-convention.md
│  │  └─ cae-mesh-requirements.md
│  └─ README.md
├─ QUANTUM_OA/
│  ├─ PATTERNS/
│  │  └─ optimization-workflows.md
│  └─ README.md
├─ META.json                   # Includes "scope": "domain"
└─ README.md
```

## ATA Chapter to Domain Assignments

See [/1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv) for the complete mapping.

### Key AAA Domain Chapters (Structural)

- 06 - Dimensions and Stations
- 14 - Hardware (Zones)
- 50 - Cargo and Accessory Compartments
- 51 - Standard Practices and Structures
- 52 - Doors
- 53 - Fuselage
- 54 - Nacelles/Pylons (shared with PPP)
- 55 - Stabilizers
- 56 - Windows
- 57 - Wings
- 62 - Main Rotor (helicopters)
- 64 - Tail Rotor (helicopters)
- 65 - Tail Rotor Drive (helicopters)
- 66 - Folding Blades/Pylon

### Naming Convention for Sub-Zones

Format: `[ATA]-[SUBSYSTEM]-[DESCRIPTIVE-NAME]/`

Examples:
- `53-10-CENTER-BODY/`
- `53-20-FORWARD-SECTION/`
- `53-30-AFT-SECTION/`
- `57-10-BOX-SECTION/`
- `57-20-LEADING-EDGE/`
- `57-30-TRAILING-EDGE/`

## Understanding Hierarchical BEZ

The presence of BEZ folders at both domain and subzone levels is intentional:

### Domain Level Purpose
- **What**: Templates, schemas, policies, standards
- **Why**: Define contracts and governance for entire domain
- **Example**: Document templates that all subzones use
- **Metadata**: `"scope": "domain"`

### Subzone Level Purpose
- **What**: Actual artifacts, deliverables, work products
- **Why**: Implement domain contracts for specific systems
- **Example**: Completed certification documents
- **Metadata**: `"scope": "instance"`, `"inherits_from": "..."`

### Inheritance Pattern

Each subzone **inherits** from domain level:

```json
// ZONES/53-10-CENTER-BODY/inherit.json
{
  "inherits_from": "../../../DELs",
  "utcs_scope": "instance",
  "applies_templates": [
    "FDR-template-v2.docx",
    "MoC-checklist-v1.xlsx"
  ]
}
```

## Migration from Current Structure

If domain-level folders contain actual artifacts (not templates):

1. **Audit** domain-level BEZ folders to identify instances vs. templates
2. **Convert** true templates to TEMPLATES/ subdirectories
3. **Move** instance artifacts to appropriate subzone directories
4. **Add** META.json with scope metadata to both levels
5. **Create** inherit.json in subzone folders
6. **Update** README files to clarify template vs. instance role
7. **Validate** using CI checks for scope compliance

## Cross-References

- [TFA Domain Hierarchy](./TFA-DOMAIN-HIERARCHY.md) — **Detailed explanation of template vs. instance pattern**
- [ATA Chapters README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md)
- [Canonical Domains README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/domains.README.md)
- [Complete Domain Structure](./COMPLETE-DOMAIN-STRUCTURE.md)
- [AMPEL360-AIR-T README](../README.md)
