# AMPEL360-SPACE-T

Spacecraft systems architecture based on the IDEALE.eu framework with Spacecraft Chapter Index (SCI) organization.

## Overview

AMPEL360-SPACE-T adapts the AMPEL360-AIR-T framework for spacecraft vehicle taxonomy while preserving:
- **15 canonical domains** (AAA, PPP, MEC, LCC, EDI, EEE, EER, DDD, CCC, IIS, LIB, AAP, CQH, IIF, OOO)
- **BEZ pattern** (Bloque de Estructura Base)
- **UTCS anchoring** (Unique Traceability and Certification System)
- **TFA governance** (Template-Framework-Architecture)

## Key Features

### Spacecraft Chapter Index (SCI)
- **100 chapters** (01-100) adapted from ATA for space systems
- Spacecraft-specific semantics (GNC/AOCS, TT&C, EPS, ECLSS, etc.)
- ECSS/CCSDS/NASA compliance frameworks
- Space-only chapters: 48, 58, 59, 82, 86-92, 95-96, 99

### Structural Organization
- **All domains use SYSTEMS/** (no ZONES/ directories)
- **Clean hierarchy**: System → Subsystem → Sub-Subsystem
- **BEZ only at sub-subsystem depth** (3 levels deep)
- System and subsystem levels contain descriptors only

### UTCS Format
```
SPACE.SCI.<NN-LABEL>.<SUBSYSTEM>[.<SUB-SUBSYSTEM>]:REV
```

Examples:
- `SPACE.SCI.53-PRIMARY-STRUCTURE:rev[A]`
- `SPACE.SCI.24-EPS-POWER.PCDU.PDU-01:rev[A]`
- `SPACE.SCI.22-GNC-AOCS.STAR-TRACKER.SENSOR-HEAD:rev[C]`

## Documentation

### Quick Start
- [Quick Start Guide](./DOMAINS/QUICKSTART-SCI-IMPLEMENTATION.md) — Step-by-step SCI implementation
- [Structure Example](./DOMAINS/SPACE-STRUCTURE-EXAMPLE.md) — Detailed structural patterns
- [Cluster-Based Organization](./DOMAINS/CLUSTER-BASED-ORGANIZATION.md) — Cluster, XX, and YY deck definitions
- [Implementation Summary](./DOMAINS/IMPLEMENTATION-SUMMARY.md) — Complete overview
- [Validation Checklist](./DOMAINS/VALIDATION-CHECKLIST.md) — Compliance verification

### Reference
- [SCI Chapters CSV](../../1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.csv) — Complete chapter mapping
- [SCI Chapters README](../../1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.README.md) — Detailed documentation
- [Domains README](../../1-DIMENSIONS/CANONICAL-TAXONOMY/domains.README.md) — Canonical domains

## Domain Organization

All 15 domains follow the same cluster-based structure:

```
DOMAIN/
├─ DELs/                    ← Domain-level templates
├─ PAx/
├─ PLM/
├─ QUANTUM_OA/
├─ SUPPLIERS/
├─ policy/
├─ tests/
├─ META.json                ← scope: "domain"
├─ README.md
├─ domain-config.yaml
└─ SYSTEMS/
   └─ NN-CHAPTER-NAME/      ← System level (CLEAN)
      ├─ README.md
      ├─ system.meta.yml
      └─ interfaces.yml
      └─ NN-XX-SUBSYSTEM/   ← Subsystem level (CLEAN)
         ├─ README.md
         └─ subsystem.meta.yml
         └─ NN-XX-YY-SUB/   ← Sub-subsystem (BEZ HERE)
            ├─ DELs/
            ├─ PAx/
            ├─ PLM/
            ├─ QUANTUM_OA/
            ├─ SUPPLIERS/
            ├─ policy/
            ├─ tests/
            ├─ META.json
            ├─ inherit.json
            └─ domain-config.yaml
```

Where:
- **NN** = SCI chapter (01-100)
- **XX** = Subsystem code from cluster (10, 20, ... 90)
- **YY** = Sub-subsystem code from assigned deck (01-20)

See [CLUSTER-BASED-ORGANIZATION.md](./DOMAINS/CLUSTER-BASED-ORGANIZATION.md) for complete definitions.

## SCI Chapter Distribution

| Domain | Chapters | Focus |
|--------|----------|-------|
| **AAA** | 12 | Structures, mechanisms, spaceworthiness |
| **PPP** | 19 | Propulsion, propellants, RCS, main engines |
| **MEC** | 4 | Mechanisms, deployables, EDL |
| **LCC** | 7 | GNC/AOCS, TT&C, control, communications |
| **EDI** | 4 | Flight software, avionics, instruments |
| **EEE** | 5 | Electrical power, distribution, harness |
| **EER** | 6 | Environment, EMC, radiation, planetary protection |
| **DDD** | 2 | Thermal control, TPS |
| **CCC** | 6 | Crew systems, ECLSS, cabin |
| **IIS** | 5 | Mission ops, MBSE, simulation |
| **LIB** | 9 | Logistics, config mgmt, records |
| **AAP** | 3 | Launch pad, interfaces, safety |
| **CQH** | 3 | Cryogenics, pressurants |
| **IIF** | 2 | MGSE, GSE |
| **OOO** | 13 | Standards, cybersecurity, AI/ML |

## Compliance Frameworks

### ECSS (European Cooperation for Space Standardization)
- ECSS-E: Engineering standards
- ECSS-M: Management standards
- ECSS-Q: Quality assurance
- Artifacts in `DELs/ECSS-submissions/`

### CCSDS (Consultative Committee for Space Data Systems)
- Data formats and protocols
- TT&C standards
- Artifacts in `DELs/CCSDS-compliance/`

### NASA Standards
- NPR 7150.2 (Software engineering)
- NASA-STD series (Hardware)
- Artifacts in `DELs/NASA-standards/`

## Example Implementation

See complete example:
- System: [53-PRIMARY-STRUCTURE](./DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/SYSTEMS/53-PRIMARY-STRUCTURE/)
- Subsystem: [53-10-MAIN-BODY](./DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/SYSTEMS/53-PRIMARY-STRUCTURE/53-10-MAIN-BODY/)
- Sub-subsystem: [53-10-01-FORWARD-SECT](./DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/SYSTEMS/53-PRIMARY-STRUCTURE/53-10-MAIN-BODY/53-10-01-FORWARD-SECT/)

## Differences from AMPEL360-AIR-T

| Aspect | AIR-T | SPACE-T |
|--------|-------|---------|
| Chapters | ATA (aircraft) | SCI (spacecraft) |
| Organization | AAA uses ZONES/, others SYSTEMS/ | All domains use SYSTEMS/ |
| BEZ Depth | 2 levels (subsystem) | 3 levels (sub-subsystem) |
| Clean Levels | Domain only | Domain, system, subsystem |
| UTCS Format | `ATA.NN-LABEL` | `SPACE.SCI.NN-LABEL` |
| Compliance | EASA, FAA, CS-XX | ECSS, CCSDS, NASA |

## Validation

Run validation:
```bash
# Check structure compliance
cd 3-PROJECTS-USE-CASES/AMPEL360-SPACE-T
./validate-space-t.sh

# Validate UTCS anchors
python3 ../../scripts/validate-utcs.py DOMAINS/
```

See [Validation Checklist](./DOMAINS/VALIDATION-CHECKLIST.md) for detailed requirements.

## Status

✅ **Framework Complete**
- SCI chapter mapping defined (100 chapters)
- Documentation suite complete
- Example structure implemented
- Validation checklist provided

🚧 **In Progress**
- Populating additional domain structures
- Compliance artifact templates
- PLM workflow automation

## Contributing

When adding new SCI chapters:
1. Check [sci-chapters.csv](../../1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.csv) for assignments
2. Follow [Quick Start Guide](./DOMAINS/QUICKSTART-SCI-IMPLEMENTATION.md)
3. Use [Structure Example](./DOMAINS/SPACE-STRUCTURE-EXAMPLE.md) as reference
4. Validate using [Validation Checklist](./DOMAINS/VALIDATION-CHECKLIST.md)

## Model Configuration

- **PLUS model** configuration for mission design
- **TFA governance** for template-framework-architecture
- **QUANTUM_OA** optimization algorithms for design optimization

---

**Framework Version**: SPACE-T 1.0  
**Last Updated**: 2025-01-27  
**Maintained by**: IDEALE.eu Architecture Team
