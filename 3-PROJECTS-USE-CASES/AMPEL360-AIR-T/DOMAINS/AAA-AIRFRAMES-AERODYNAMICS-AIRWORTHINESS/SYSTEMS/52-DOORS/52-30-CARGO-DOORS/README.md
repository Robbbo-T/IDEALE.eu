# 52-30-CARGO-DOORS — Cargo Doors

**ATA Chapter**: 52 (Doors)  
**Sub-Zone**: 52-30  
**Domain**: AAA (Airframes, Aerodynamics, Airworthiness)  
**Project**: AMPEL360-AIR-T

## Overview

The cargo doors system encompasses the structural design and integration of:
- Cargo compartment doors (forward and aft)
- Large freight door structures
- Door frame and threshold structures
- Heavy-duty operating mechanisms (structural interface)
- Door seal interfaces and pressure containment
- Cargo loading system interfaces

## Scope

This zone is organized into specific door instances, each containing the complete BEZ (Bloque de Estructura Base) structure with all design, analysis, manufacturing, and certification artifacts.

### Sub-Zones

- **52-31-CARGO-DOOR-FWD** — Forward cargo compartment door
- **52-32-CARGO-DOOR-AFT** — Aft cargo compartment door

## Directory Structure

```
52-30-CARGO-DOORS/
├─ 52-31-CARGO-DOOR-FWD/          # Forward cargo door (full BEZ)
│  ├─ DELs/                       # Deliveries and certification
│  ├─ PAx/                        # Packaging and Integration
│  ├─ PLM/                        # Product Lifecycle Management
│  ├─ PROCUREMENT-VENDORSCOMPONENTS/                # Procurement Management
│  ├─ QUANTUM_OA/                 # Quantum Optimization
│  ├─ SUPPLIERS/                  # Supplier Management
│  ├─ policy/                     # Policies and procedures
│  ├─ tests/                      # Test plans and results
│  ├─ META.json                   # Metadata
│  ├─ README.md                   # Component documentation
│  └─ domain-config.yaml          # Configuration
│
├─ 52-32-CARGO-DOOR-AFT/          # Aft cargo door (full BEZ)
│  └─ {Full BEZ structure}
│
└─ README.md                      # This file
```

## Key Interfaces

### Structural Interfaces
- **53-XX-FUSELAGE** — Door frame integration with fuselage structure
- **51-XX-STANDARDS** — Structural design standards and practices
- **50-XX-CARGO-COMPARTMENTS** — Cargo compartment structures

### Systems Interfaces
- **52-XX-DOOR-OPERATION** (MEC domain) — Heavy-duty door actuation mechanisms
- **25-XX-CARGO-EQUIPMENT** (CCC domain) — Cargo loading systems
- **21-XX-AIR-CONDITIONING** (DDD domain) — Door seals and pressurization interface
- **26-XX-FIRE-PROTECTION** (SSS domain) — Fire containment interfaces

## Compliance Requirements

### Certification Standards
- EASA CS-25 (Large Aeroplanes)
  - CS 25.783 — Doors
  - CS 25.787 — Stowage compartments
  - CS 25.855 — Cargo and baggage compartments

### Analysis Requirements
- Structural strength analysis (cargo loads, pressure loads)
- Door failure modes and effects analysis (FMEA)
- Cargo loading scenario analysis
- Pressure differential testing
- Fatigue and damage tolerance analysis
- Fire containment analysis

## TFA Flow

This zone follows the canonical TFA flow:
**QS → FWD → UE → FE → CB → QB**

## UTCS Anchors

All artifacts must include UTCS anchors for traceability. Door-specific anchors should be under the respective sub-zone (52-31, 52-32):
```
UTCS-MI:CAD:AAA:52-31:DOOR:rev[X]  # Forward cargo door
UTCS-MI:CAD:AAA:52-32:DOOR:rev[X]  # Aft cargo door
```

## Status

✅ **Structure Complete** — Sub-zones defined with full BEZ structure, ready for artifacts

## Related Documentation

- [52-DOORS Zone README](../README.md)
- [AAA Domain README](../../../README.md)
- [ATA Chapter 52 Assignments](../../../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)

---

**Maintained by**: AAA Integration Team  
**Last Updated**: 2025-01-27
