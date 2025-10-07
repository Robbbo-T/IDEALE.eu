# Complete Domain Structure Reference — AMPEL360-AIR-MANNED

This document provides a complete overview of how the 15 canonical domains are organized with ATA chapter assignments.

## Structure Overview

All domains follow the pattern:
- **Domain-level README** — Overview, TFA integration, compliance requirements
- **ZONES/** (for AAA) or **SYSTEMS/** (all others) — ATA chapter organization
- **Sub-Zone/System level** — Complete BEZ structure (DELs, PAx, PLM, QUANTUM_OA, etc.)

## Domain Organization by Type

### Structural Domain (Use ZONES/)

#### AAA - Airframes, Aerodynamics, Airworthiness
```
AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/
├─ ZONES/
│  ├─ 06-DIMENSIONS-STATIONS/
│  ├─ 14-HARDWARE/
│  ├─ 50-CARGO-COMPARTMENTS/
│  ├─ 51-STANDARD-PRACTICES/
│  ├─ 52-DOORS/
│  ├─ 53-FUSELAGE-STRUCTURES/ ✓ (example implemented)
│  │  └─ 53-10-CENTER-BODY/ (complete BEZ)
│  ├─ 54-NACELLES-PYLONS/ (shared with PPP)
│  ├─ 55-STABILIZERS/
│  ├─ 56-WINDOWS/
│  ├─ 57-WING-STRUCTURES/ ✓ (structure created)
│  │  └─ 57-10-BOX-SECTION/
│  ├─ 62-MAIN-ROTOR/
│  ├─ 64-TAIL-ROTOR/
│  ├─ 65-TAIL-ROTOR-DRIVE/
│  └─ 66-FOLDING-BLADES/
```

### Functional Domains (Use SYSTEMS/)

#### PPP - Propulsion, Fuel Systems
**ATA Chapters**: 28, 49, 54, 60-61, 70-73, 75, 78, 81-82
```
PPP-PROPULSION-FUEL-SYSTEMS/
├─ SYSTEMS/
│  ├─ 28-FUEL-SYSTEMS/
│  ├─ 49-APU/
│  ├─ 54-NACELLES-PYLONS/ (shared with AAA)
│  ├─ 60-PROPELLER-PRACTICES/
│  ├─ 61-PROPELLERS/
│  ├─ 70-ENGINE-PRACTICES/
│  ├─ 71-POWER-PLANT/ ✓ (example implemented)
│  ├─ 72-ENGINE/
│  ├─ 73-ENGINE-FUEL-CONTROL/
│  ├─ 75-ENGINE-BLEED-AIR/
│  ├─ 78-EXHAUST/
│  ├─ 81-TURBINES/
│  └─ 82-WATER-INJECTION/
```

#### MEC - Mechanical Systems, Modules
**ATA Chapters**: 27, 29, 32, 36-37, 63, 67, 79, 83
```
MEC-MECHANICAL-SYSTEMS-MODULES/
├─ SYSTEMS/
│  ├─ 27-FLIGHT-CONTROLS/
│  ├─ 29-HYDRAULIC-POWER/
│  ├─ 32-LANDING-GEAR-SYSTEMS/ ✓ (structure created)
│  ├─ 36-PNEUMATIC/
│  ├─ 37-VACUUM/
│  ├─ 63-MAIN-ROTOR-DRIVE/
│  ├─ 67-ROTOR-FLIGHT-CONTROL/
│  ├─ 79-OIL-LUBRICATION/
│  └─ 83-ACCESSORY-GEARBOXES/
```

#### LCC - Linkages, Control, Communications
**ATA Chapters**: 08, 22-23, 44-45, 76, 93
```
LCC-LINKAGES-CONTROL-COMMUNICATIONS/
├─ SYSTEMS/
│  ├─ 08-LEVELING-WEIGHING/
│  ├─ 22-AUTO-FLIGHT-SYSTEM/ ✓ (structure created)
│  ├─ 23-COMMUNICATIONS/
│  ├─ 44-CABIN-SYSTEMS-CONTROL/
│  ├─ 45-CENTRAL-MAINTENANCE-SYSTEM/
│  ├─ 76-ENGINE-CONTROLS/
│  └─ 93-CENTRAL-CONTROL-SYSTEMS/
```

#### EDI - Electronics, Digital, Instruments
**ATA Chapters**: 31, 34, 42, 77, 84, 94
```
EDI-ELECTRONICS-DIGITAL-INSTRUMENTS/
├─ SYSTEMS/
│  ├─ 31-INDICATING-RECORDING/
│  ├─ 34-NAVIGATION-AVIONICS/ ✓ (structure created)
│  ├─ 42-INTEGRATED-MODULAR-AVIONICS/
│  ├─ 77-ENGINE-INDICATING/
│  ├─ 84-PROPULSION-AUGMENTATION/
│  └─ 94-EE-COMPARTMENTS/
```

#### EEE - Electrical, Endotransponders, Circulation
**ATA Chapters**: 24, 33, 39, 74, 80, 97
```
EEE-ELECTRICAL-ENDOTRANSPONDERS-CIRCULATION/
├─ SYSTEMS/
│  ├─ 24-ELECTRICAL-POWER/ ✓ (structure created)
│  ├─ 33-LIGHTS/
│  ├─ 39-ELECTRICAL-PANELS/
│  ├─ 74-IGNITION/
│  ├─ 80-STARTING/
│  └─ 97-WIRING/
```

#### EER - Environmental, Emissions, Remediation
**ATA Chapters**: 15, 26, 38, 85
```
EER-ENVIRONMENTAL-EMISSIONS-REMEDIATION/
├─ SYSTEMS/
│  ├─ 15-NOISE-VIBRATION/
│  ├─ 26-FIRE-PROTECTION/
│  ├─ 38-WATER-WASTE/
│  └─ 85-EMISSIONS/
```

#### DDD - Drainage, Dehumidification, Drying
**ATA Chapters**: 09, 21, 30, 41
```
DDD-DRAINAGE-DEHUMIDIFICATION-DRYING/
├─ SYSTEMS/
│  ├─ 09-SURFACE-PROTECTION/
│  ├─ 21-AIR-CONDITIONING/
│  ├─ 30-ANTI-ICING-DRAINAGE/ ✓ (structure created)
│  └─ 41-WATER-BALLAST/
```

#### CCC - Cockpit, Cabin, Cargo
**ATA Chapters**: 11, 25, 35, 43
```
CCC-COCKPIT-CABIN-CARGO/
├─ SYSTEMS/
│  ├─ 11-PLACARDS-MARKINGS/
│  ├─ 25-EQUIPMENT-FURNISHINGS/ ✓ (structure created)
│  ├─ 35-OXYGEN/
│  └─ 43-CABIN-SYSTEMS/
```

#### IIS - Information, Intelligence, Systems
**ATA Chapters**: 16, 46, 91
```
IIS-INFORMATION-INTELLIGENCE-SYSTEMS/
├─ SYSTEMS/
│  ├─ 16-GROUND-SUPPORT-EQUIPMENT/
│  ├─ 46-INFORMATION-SYSTEMS/
│  └─ 91-CHARTS-PERFORMANCE/
```

#### LIB - Logistics, Inventory, Blockchain
**ATA Chapters**: 01, 04-05, 12
```
LIB-LOGISTICS-INVENTORY-BLOCKCHAIN/
├─ SYSTEMS/
│  ├─ 01-INTRODUCTION/
│  ├─ 04-AIRWORTHINESS-LIMITATIONS/
│  ├─ 05-TIME-LIMITS/
│  └─ 12-SERVICING/
```

#### AAP - Airport Adaptable Platforms
**ATA Chapters**: 10
```
AAP-AIRPORT-ADAPTABLE-PLATFORMS/
├─ SYSTEMS/
│  └─ 10-PARKING-MOORING/
```

#### CQH - Cryogenics, Quantum, H2
**ATA Chapters**: 47
```
CQH-CRYOGENICS-QUANTUM-H2/
├─ SYSTEMS/
│  └─ 47-NITROGEN-GENERATION/
```

#### IIF - Industrial Infrastructure, Facilities
**ATA Chapters**: 07
```
IIF-INDUSTRIAL-INFRASTRUCTURE-FACILITIES/
├─ SYSTEMS/
│  └─ 07-LIFTING-SHORING/
```

#### OOO - OS, Ontologies, Office Interfaces
**ATA Chapters**: 02-03, 13, 17-20, 40, 48, 58-59, 68-69, 86-90, 92-96, 98-100
```
OOO-OS-ONTOLOGIES-OFFICE-INTERFACES/
├─ PLATFORM/
│  ├─ 13-GENERAL-HARDWARE/
│  ├─ 20-STANDARD-PRACTICES/
│  └─ [RESERVED-CHAPTERS]/ (placeholder structure)
```

## BEZ (Bloque de Estructura Base) Template

Each lowest-level sub-zone or system contains:

```
[ATA-CHAPTER-SYSTEM]/
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

## Implementation Status

### ✓ Implemented (with complete BEZ)
- AAA/ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/
- PPP/SYSTEMS/71-POWER-PLANT/

### 🏗️ Structure Created (BEZ ready to implement)
- AAA/ZONES/57-WING-STRUCTURES/57-10-BOX-SECTION/
- LCC/SYSTEMS/22-AUTO-FLIGHT-SYSTEM/
- EDI/SYSTEMS/34-NAVIGATION-AVIONICS/
- EEE/SYSTEMS/24-ELECTRICAL-POWER/
- MEC/SYSTEMS/32-LANDING-GEAR-SYSTEMS/
- CCC/SYSTEMS/25-EQUIPMENT-FURNISHINGS/
- DDD/SYSTEMS/30-ANTI-ICING-DRAINAGE/

### 📋 To Be Implemented
- All remaining ATA chapter systems across 15 domains

## Cross-References

- [ATA Chapters CSV](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv) — Complete assignment table
- [ATA Chapters README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md) — Detailed documentation
- [Domains README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/domains.README.md) — Domain definitions
- [ATA Structure Example](./ATA-STRUCTURE-EXAMPLE.md) — Implementation guidelines

## Validation Checklist

For each domain implementation:

- [ ] Domain README created with TFA integration description
- [ ] ZONES/ or SYSTEMS/ directory created at domain level
- [ ] ATA chapter directories created following naming convention
- [ ] Sub-zone/system READMEs created with interface definitions
- [ ] Complete BEZ structure applied at lowest level only
- [ ] Cross-references to other domains documented
- [ ] UTCS anchor format specified
- [ ] Compliance requirements listed

---

**Last Updated**: 2025-01-27  
**Status**: 🚧 Framework implemented, additional systems in development
