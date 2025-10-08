# 52-20-SERVICE-DOORS — Service Doors

**ATA Chapter**: 52 (Doors)  
**Sub-Zone**: 52-20  
**Domain**: AAA (Airframes, Aerodynamics, Airworthiness)  
**Project**: AMPEL360-AIR-T

## Overview

The service doors system encompasses the structural design and integration of:
- Crew service doors (forward and aft)
- Catering service access
- Door frame and threshold structures
- Door operating mechanisms (structural interface)
- Door seal interfaces
- Service access provisions

## Scope

This zone is organized into specific door instances, each containing the complete BEZ (Bloque de Estructura Base) structure with all design, analysis, manufacturing, and certification artifacts.

### Sub-Zones

- **52-21-SERVICE-DOOR-FWD** — Forward service door
- **52-22-SERVICE-DOOR-AFT** — Aft service door

## Directory Structure

```
52-20-SERVICE-DOORS/
├─ 52-21-SERVICE-DOOR-FWD/        # Forward service door (full BEZ)
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
├─ 52-22-SERVICE-DOOR-AFT/        # Aft service door (full BEZ)
│  └─ {Full BEZ structure}
│
└─ README.md                      # This file
```

## Key Interfaces

### Structural Interfaces
- **53-XX-FUSELAGE** — Door frame integration with fuselage structure
- **51-XX-STANDARDS** — Structural design standards and practices

### Systems Interfaces
- **52-XX-DOOR-OPERATION** (MEC domain) — Door actuation and operating mechanisms
- **38-XX-WATER-WASTE** (HHH domain) — Water and waste system interfaces
- **21-XX-AIR-CONDITIONING** (DDD domain) — Door seals and pressurization interface

## Compliance Requirements

### Certification Standards
- EASA CS-25 (Large Aeroplanes)
  - CS 25.783 — Doors
  - CS 25.813 — Emergency exit access

### Analysis Requirements
- Structural strength analysis (pressure loads, flight loads)
- Door failure modes and effects analysis (FMEA)
- Pressure differential testing
- Fatigue and damage tolerance analysis

## TFA Flow

This zone follows the canonical TFA flow:
**QS → FWD → UE → FE → CB → QB**

## UTCS Anchors

All artifacts must include UTCS anchors for traceability. Door-specific anchors should be under the respective sub-zone (52-21, 52-22):
```
UTCS-MI:CAD:AAA:52-21:DOOR:rev[X]  # Forward service door
UTCS-MI:CAD:AAA:52-22:DOOR:rev[X]  # Aft service door
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
