# ATA Chapter Assignments to Canonical Domains

This file defines the **primary assignment** of all 100 ATA (Air Transport Association) chapters to the 15 canonical domains of the IDEALE.eu framework.

## Purpose

The ATA chapter system provides a standardized numbering scheme for aircraft systems and documentation. This mapping ensures:
- **Clear authority** — Each ATA chapter has one primary canonical domain
- **Design responsibility** — The primary domain owns design and documentation
- **Cross-domain integration** — Secondary domains listed for multi-system interfaces
- **Consistency** — Uniform organization across all aviation projects

## File Structure

**Format**: CSV (Comma-Separated Values)  
**Encoding**: UTF-8  
**Columns**:
1. `Category` - Classification type (always "ATA Chapter")
2. `ATA_Chapter` - Chapter number (01-100)
3. `ATA_Title` - Functional title of the chapter
4. `Primary_Domain` - Three-letter code of the primary canonical domain
5. `Secondary_Domains` - Optional comma-separated list of related domains
6. `Notes` - Additional context or clarifications

## Assignment Principles

### Primary Domain Authority

Each ATA chapter is assigned to **exactly one** primary domain that holds:
- Design authority and ownership
- Documentation responsibility
- Configuration control
- Certification data packages (DELs)

### Secondary Domain Interfaces

Secondary domains are listed when:
- Systems have significant cross-domain dependencies
- Integration requires coordination between domains
- Shared components or interfaces exist

## Domain-to-ATA Chapter Summary

### AAA - Airframes, Aerodynamics, Airworthiness
**Primary chapters**: 06, 14, 50, 51, 52, 53, 55, 56, 57, 62, 64, 65, 66

Key focus: Structural zones, fuselage, wings, stabilizers, doors, windows, rotor systems

### MEC - Mechanical Systems, Modules
**Primary chapters**: 27, 29, 32, 36, 37, 63, 67, 79, 83

Key focus: Flight controls, hydraulics, landing gear, pneumatics, mechanical drives

### PPP - Propulsion, Fuel Systems
**Primary chapters**: 28, 49, 54, 60, 61, 70, 71, 72, 73, 75, 78, 81, 82

Key focus: Engines, fuel systems, APU, propellers, nacelles, turbines

### LCC - Linkages, Control, Communications
**Primary chapters**: 08, 22, 23, 44, 45, 76, 93

Key focus: Autopilot, communications, cabin control systems, engine controls

### EDI - Electronics, Digital, Instruments
**Primary chapters**: 31, 34, 42, 77, 84, 94

Key focus: Avionics, navigation, IMA, engine indication, digital systems

### EEE - Electrical, Endotransponders, Circulation
**Primary chapters**: 24, 33, 39, 74, 80, 97

Key focus: Power generation/distribution, lighting, ignition, starting, wiring

### EER - Environmental, Emissions, Remediation
**Primary chapters**: 15, 26, 38, 85

Key focus: Fire protection, water/waste, emissions, environmental effects

### DDD - Drainage, Dehumidification, Drying
**Primary chapters**: 09, 21, 30, 41

Key focus: Air conditioning, anti-icing, water ballast, surface protection

### CCC - Cockpit, Cabin, Cargo
**Primary chapters**: 11, 25, 35, 43

Key focus: Equipment/furnishings, oxygen, cabin systems, placards

### IIS - Information, Intelligence, Systems
**Primary chapters**: 16, 46, 91

Key focus: Ground support equipment, information systems, charts

### LIB - Logistics, Inventory, Blockchain
**Primary chapters**: 01, 04, 05, 12

Key focus: Maintenance scheduling, servicing, time limits

### AAP - Airport Adaptable Platforms
**Primary chapters**: 10

Key focus: Parking, mooring, ground operations

### CQH - Cryogenics, Quantum, H2
**Primary chapters**: 47

Key focus: Nitrogen generation, inert gas systems, hydrogen storage

### IIF - Industrial Infrastructure, Facilities
**Primary chapters**: 07

Key focus: Lifting, shoring, jacking facilities

### OOO - OS, Ontologies, Office Interfaces
**Primary chapters**: 02, 03, 13, 17, 18, 19, 20, 40, 48, 58, 59, 68, 69, 86-90, 92-96, 98-100

Key focus: Reserved chapters, standard practices, general hardware, process interfaces

## Usage in Project Structure

### Directory Naming Convention

When organizing ATA chapters within domains, use the format:
```
[ATA-NUMBER]-[SYSTEM-NAME]/
```

Examples:
- `53-FUSELAGE-STRUCTURES/`
- `24-ELECTRICAL-POWER/`
- `71-POWER-PLANT/`

### ZONES vs SYSTEMS Organization

- **ZONES/** — Used for structural domains (AAA) with physical zones
  - Example: `AAA/ZONES/53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/`
  
- **SYSTEMS/** — Used for functional system domains (all others)
  - Example: `PPP/SYSTEMS/71-POWER-PLANT/`

### BEZ (Bloque de Estructura Base) Application

The complete BEZ structure (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, etc.) should **only** be applied at the **lowest level** of the hierarchy:

```
DOMAINS/
├─ AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/
│  ├─ ZONES/
│  │  ├─ 53-FUSELAGE-STRUCTURES/
│  │  │  └─ 53-10-CENTER-BODY/  ← BEZ applied here
│  │  │     ├─ DELs/
│  │  │     ├─ PAx/
│  │  │     ├─ PLM/
│  │  │     ├─ QUANTUM_OA/
│  │  │     ├─ SUPPLIERS/
│  │  │     ├─ policy/
│  │  │     ├─ tests/
│  │  │     ├─ META.json
│  │  │     ├─ README.md
│  │  │     └─ domain-config.yaml
```

## Cross-Domain Workflows

### Multi-Domain Systems

Some ATA chapters involve multiple domains:
- **ATA 54** (Nacelles/Pylons): Primary PPP, interfaces with AAA structures
- **ATA 22** (Auto Flight): Primary LCC, interfaces with EDI avionics
- **ATA 39** (Electrical Panels): Primary EEE, interfaces with EDI electronics

These cross-domain interfaces are managed through:
- UTCS anchors for traceability
- MAP-SERVICES for coordination
- PAx (Packaging) artifacts for integration

## Compliance and Certification

### DELs (Design Evidence Lists)

Each domain's primary ATA chapters require:
- EASA/FAA submissions in `DELs/EASA-submissions/`
- Means of Compliance records in `DELs/MoC-records/`
- Airworthiness statements in `DELs/airworthiness-statements/`

### Traceability

All artifacts must include:
- **UTCS anchors** — Canonical identifiers
- **ATA chapter reference** — Clear chapter assignment
- **Domain ownership** — Primary domain responsibility

## Maintenance of This Mapping

### Stability

The ATA chapter system is industry-standard and **stable**. Changes require:
1. Industry standards committee review
2. Regulatory authority alignment (EASA, FAA)
3. Impact assessment across all projects
4. Documentation update plan

### Adding Custom Chapters

Some modern aircraft may define custom chapters (e.g., ATA 100+):
- Document rationale in `Notes` column
- Assign to appropriate canonical domain
- Reference in project-specific README files

## Change History

| Date | Change | Rationale |
|------|--------|-----------|
| 2025-01-27 | Initial ATA chapter mapping created | Standardize ATA-to-domain assignments |

---

**See Also**:
- [domains.csv](./domains.csv) - Canonical domain definitions
- [projects.csv](./projects.csv) - Canonical project definitions
- [Main README](./README.md) - Canonical taxonomy overview
