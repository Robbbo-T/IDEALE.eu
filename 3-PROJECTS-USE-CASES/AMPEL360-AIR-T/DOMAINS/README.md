# AMPEL360-AIR-T Domains

This directory contains the complete domain organization for the AMPEL360-AIR-T project, implementing the ATA chapter-based structure across all 15 canonical domains.

## Overview

All domains follow a **hierarchical structure** with two distinct levels:

1. **Domain Level**: Templates, schemas, policies, and standards (governance)
2. **Subzone/System Level**: Actual artifacts, deliverables, and work products (implementation)

The BEZ (Bloque de Estructura Base) pattern appears at both levels with different purposes:
- **Domain-level BEZ folders** define templates and standards
- **Subzone-level BEZ folders** contain actual implementation artifacts

> **Important**: See [TFA-DOMAIN-HIERARCHY.md](./TFA-DOMAIN-HIERARCHY.md) for detailed explanation of the template vs. instance pattern.

## Domain Organization

### Structural Domain (AAA)
- **AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/** — Uses SYSTEMS/ organization for physical structural systems

### Functional Domains (All Others)
- **AAP-AIRPORT-ADAPTABLE-PLATFORMS/** — Airport ground operations
- **CCC-COCKPIT-CABIN-CARGO/** — Interior systems and equipment
- **CQH-CRYOGENICS-QUANTUM-H2/** — Cryogenic and hydrogen systems
- **DDD-DRAINAGE-DEHUMIDIFICATION-DRYING/** — Environmental control
- **EDI-ELECTRONICS-DIGITAL-INSTRUMENTS/** — Avionics and digital systems
- **EEE-ELECTRICAL-ENDOTRANSPONDERS-CIRCULATION/** — Electrical power
- **EER-ENVIRONMENTAL-EMISSIONS-REMEDIATION/** — Environmental compliance
- **IIF-INDUSTRIAL-INFRASTRUCTURE-FACILITIES/** — Ground facilities
- **IIS-INFORMATION-INTELLIGENCE-SYSTEMS/** — Information systems
- **LCC-LINKAGES-CONTROL-COMMUNICATIONS/** — Control and communications
- **LIB-LOGISTICS-INVENTORY-BLOCKCHAIN/** — Supply chain
- **MEC-MECHANICAL-SYSTEMS-MODULES/** — Mechanical systems
- **OOO-OS-ONTOLOGIES-OFFICE-INTERFACES/** — Standards and processes
- **PPP-PROPULSION-FUEL-SYSTEMS/** — Propulsion and fuel

## ATA Chapter Assignment

All 101 ATA chapters (00-100) are mapped to these domains. See:
- [ata-chapters.csv](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv) — Complete mapping
- [ATA-STRUCTURE-EXAMPLE.md](./ATA-STRUCTURE-EXAMPLE.md) — Implementation guide
- [COMPLETE-DOMAIN-STRUCTURE.md](./COMPLETE-DOMAIN-STRUCTURE.md) — Full reference

## BEZ Structure Hierarchy

### Domain Level (Templates & Governance)

Each domain contains BEZ folders at the domain level providing **templates and standards**:

```
[DOMAIN]/
├─ DELs/                    # Document templates, schemas
├─ PAx/                     # Packaging standards
├─ PLM/                     # PLM policies
├─ QUANTUM_OA/              # Optimization patterns
├─ SUPPLIERS/               # Qualification criteria
├─ policy/                  # Governance rules
├─ tests/                   # Test frameworks
└─ META.json               # Scope: "domain"
```

### Subzone/System Level (Instances & Artifacts)

Each lowest-level sub-zone or system contains BEZ folders with **actual work products**:

```
[SUB-SYSTEM or SYSTEM]/
├─ DELs/                          # Actual certification documents
├─ PAx/                           # Actual packaging artifacts (ONB/OUT)
├─ PLM/                           # Actual CAD/CAE files
├─ PROCUREMENT-VENDORSCOMPONENTS/ # Actual vendor components
├─ QUANTUM_OA/                    # Actual optimization runs
├─ SUPPLIERS/                     # Actual supplier contracts
├─ policy/                        # System-specific policies
├─ tests/                         # Actual test results
├─ META.json                      # Scope: "instance", UTCS anchor
├─ inherit.json                   # References domain templates
├─ README.md                      # System documentation
└─ domain-config.yaml     # System configuration
```

This hierarchical repetition is **intentional** — the domain level defines the contract, the subzone level implements it.

## Quick Start

To add a new ATA chapter system:
1. Identify the domain from [ata-chapters.csv](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)
2. Follow [QUICKSTART-ATA-IMPLEMENTATION.md](./QUICKSTART-ATA-IMPLEMENTATION.md)
3. Apply BEZ structure at the lowest level only

## Documentation

| File | Purpose |
|------|---------|
| [TFA-DOMAIN-HIERARCHY.md](./TFA-DOMAIN-HIERARCHY.md) | **Template vs. instance pattern explained** |
| [TFA-HIERARCHY-DIAGRAMS.md](./TFA-HIERARCHY-DIAGRAMS.md) | **Visual hierarchy diagrams** |
| [ATA-STRUCTURE-EXAMPLE.md](./ATA-STRUCTURE-EXAMPLE.md) | Implementation pattern explanation |
| [COMPLETE-DOMAIN-STRUCTURE.md](./COMPLETE-DOMAIN-STRUCTURE.md) | Full reference for all 15 domains |
| [QUICKSTART-ATA-IMPLEMENTATION.md](./QUICKSTART-ATA-IMPLEMENTATION.md) | Implementation guide |
| [IMPLEMENTATION-SUMMARY.md](./IMPLEMENTATION-SUMMARY.md) | Project summary |

## Status

🏗️ **Framework Complete** — 2 full BEZ implementations, 6 placeholder structures, 93 ATA chapters remaining to be implemented (of 101 total ATA chapters)

---

**Last Updated**: 2025-01-27  
**Maintained by**: IDEALE.eu Architecture Team
