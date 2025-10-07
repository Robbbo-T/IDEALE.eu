# AMPEL360-AIR-MANNED Domains

This directory contains the complete domain organization for the AMPEL360-AIR-MANNED project, implementing the ATA chapter-based structure across all 15 canonical domains.

## Overview

All domains follow the standardized BEZ (Bloque de Estructura Base) pattern, applied at the lowest organizational level (sub-zones for AAA, systems for all others).

## Domain Organization

### Structural Domain (AAA)
- **AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/** — Uses ZONES/ organization for physical structural zones

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

## BEZ Structure

Each lowest-level sub-zone or system contains:

```
[SUB-ZONE or SYSTEM]/
├─ DELs/                   # Deliveries
├─ PAx/                    # Packaging (ONB/OUT)
├─ PLM/                    # Product Lifecycle Management
├─ PROCUREMENT/            # Vendor components
├─ QUANTUM_OA/             # Quantum optimization
├─ SUPPLIERS/              # Supplier management
├─ policy/                 # Domain policies
├─ tests/                  # Test artifacts
├─ META.json              # Metadata
├─ README.md              # Documentation
└─ domain-config.yaml     # Configuration
```

## Quick Start

To add a new ATA chapter system:
1. Identify the domain from [ata-chapters.csv](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)
2. Follow [QUICKSTART-ATA-IMPLEMENTATION.md](./QUICKSTART-ATA-IMPLEMENTATION.md)
3. Apply BEZ structure at the lowest level only

## Documentation

| File | Purpose |
|------|---------|
| [ATA-STRUCTURE-EXAMPLE.md](./ATA-STRUCTURE-EXAMPLE.md) | Pattern explanation |
| [COMPLETE-DOMAIN-STRUCTURE.md](./COMPLETE-DOMAIN-STRUCTURE.md) | Full reference for all 15 domains |
| [QUICKSTART-ATA-IMPLEMENTATION.md](./QUICKSTART-ATA-IMPLEMENTATION.md) | Implementation guide |
| [IMPLEMENTATION-SUMMARY.md](./IMPLEMENTATION-SUMMARY.md) | Project summary |

## Status

🏗️ **Framework Complete** — 2 full BEZ implementations, 6 placeholder structures, 93 ATA chapters ready for implementation

---

**Last Updated**: 2025-01-27  
**Maintained by**: IDEALE.eu Architecture Team
