# ATA Chapter Structure Example for AMPEL360-AIR-MANNED

This document demonstrates the correct application of the BEZ (Bloque de Estructura Base) at the lowest level of the ATA chapter hierarchy.

## Principle

The BEZ structure (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, policy/, tests/) should **only exist at the final sub-zone or system level**, not at the domain level.

## Structure Pattern

### For AAA (Structural Domains) - Use ZONES/

```
AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/
├─ ZONES/
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
├─ SYSTEMS/
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

When applied at the lowest level, the complete BEZ includes:

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
├─ META.json
├─ README.md
└─ domain-config.yaml
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

## Migration from Current Structure

If a domain currently has BEZ at the domain level (as AAA does), migration involves:

1. Create `ZONES/` or `SYSTEMS/` directory
2. Create ATA chapter directories within ZONES/SYSTEMS
3. Create sub-zone directories with descriptive names
4. Move BEZ structure to the sub-zone level
5. Update README files to reflect new hierarchy
6. Update UTCS anchors and references

## Cross-References

- [ATA Chapters README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md)
- [Canonical Domains README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/domains.README.md)
- [AMPEL360-AIR-MANNED README](../README.md)
