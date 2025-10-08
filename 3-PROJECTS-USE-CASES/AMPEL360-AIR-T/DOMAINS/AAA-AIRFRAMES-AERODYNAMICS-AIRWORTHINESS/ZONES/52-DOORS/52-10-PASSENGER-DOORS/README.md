# 52-10-PASSENGER-DOORS — Passenger Entry and Emergency Exit Doors

**ATA Chapter**: 52 (Doors)  
**Sub-Zone**: 52-10  
**Domain**: AAA (Airframes, Aerodynamics, Airworthiness)  
**Project**: AMPEL360-AIR-T

## Overview

The passenger doors system encompasses the structural design and integration of:
- Main passenger entry doors (forward and aft)
- Door frame and threshold structures
- Door operating mechanisms (structural interface)
- Door seal interfaces
- Evacuation slide attachment provisions
- Pressure relief and safety systems interface

## Scope

This zone is organized into specific door instances, each containing the complete BEZ (Bloque de Estructura Base) structure with all design, analysis, manufacturing, and certification artifacts.

### Sub-Zones

- **52-11-PASSENGER-DOOR-FWD** — Forward passenger entry door
- **52-12-PASSENGER-DOOR-AFT** — Aft passenger entry door

## Directory Structure

```
52-10-PASSENGER-DOORS/
├─ 52-11-PASSENGER-DOOR-FWD/      # Forward passenger door (full BEZ)
│  ├─ DELs/                       # Deliveries and certification
│  ├─ PAx/                        # Packaging and Integration
│  ├─ PLM/                        # Product Lifecycle Management
│  ├─ PROCUREMENT/                # Procurement Management
│  ├─ QUANTUM_OA/                 # Quantum Optimization
│  ├─ SUPPLIERS/                  # Supplier Management
│  ├─ policy/                     # Policies and procedures
│  ├─ tests/                      # Test plans and results
│  ├─ META.json                   # Metadata
│  ├─ README.md                   # Component documentation
│  └─ domain-config.yaml          # Configuration
│
├─ 52-12-PASSENGER-DOOR-AFT/      # Aft passenger door (full BEZ)
│  └─ {Full BEZ structure}
│
├─ DELs/                          # Legacy - Zone-level deliveries
├─ META.json                      # Zone metadata
├─ README.md                      # This file
└─ domain-config.yaml             # Zone configuration
```

**Note**: The legacy DELs directory at this level is deprecated. New work should be organized under the specific door sub-zones (52-11, 52-12).

## Key Interfaces

### Structural Interfaces
- **53-XX-FUSELAGE** — Door frame integration with fuselage
- **51-XX-STANDARDS** — Structural design standards
- **56-XX-WINDOWS** — Adjacent window structures

### Systems Interfaces
- **52-XX-DOOR-OPERATION** (MEC domain) — Door actuation mechanisms
- **25-XX-EQUIPMENT** (CCC domain) — Evacuation slides
- **21-XX-AIR-CONDITIONING** (DDD domain) — Door seals and pressurization
- **33-XX-LIGHTING** (EEE domain) — Exit lighting
- **52-XX-DOOR-WARNING** (CCC domain) — Door position sensors

## Compliance Requirements

### Certification Standards
- EASA CS-25 (Large Aeroplanes)
  - CS 25.783 — Doors
  - CS 25.785 — Seats, berths, safety belts, and harnesses
  - CS 25.807 — Emergency exits
  - CS 25.809 — Emergency exit arrangement
  - CS 25.810 — Emergency egress assist means
  - CS 25.811 — Emergency exit marking
  - CS 25.812 — Emergency lighting

### Analysis Requirements
- Structural strength analysis (pressure loads)
- Door failure modes and effects analysis
- Crash loads and energy absorption
- Evacuation performance analysis
- Pressure differential testing

## TFA Flow

This sub-zone follows the canonical TFA flow:
**QS → FWD → UE → FE → CB → QB**

- **QS** (Quantum Superposition State) — Door design space exploration
- **FWD** (Forward Wave Dynamics) — Loading scenarios (pressure, crash)
- **UE** (Unit/Unique Element) — Specific door component definitions
- **FE** (Federation Entanglement) — Interface coordination
- **CB** (Classical Bit/Solver) — Structural analysis (FEA)
- **QB** (Qubit Inspired Solver) — Door structure optimization

## UTCS Anchors

All artifacts must include UTCS anchors for traceability. Door-specific anchors should be under the respective sub-zone (52-11, 52-12):
```
UTCS-MI:CAD:AAA:52-11:DOOR:rev[X]  # Forward door
UTCS-MI:CAD:AAA:52-12:DOOR:rev[X]  # Aft door
UTCS-MI:CAE:AAA:52-11:STRESS:rev[X]
UTCS-MI:DEL:AAA:52-11:CERT:rev[X]
```

## Status

✅ **Structure Complete** — Sub-zones defined with full BEZ structure, ready for artifacts

## Related Documentation

- [ZONES README](../README.md)
- [AAA Domain README](../../README.md)
- [ATA Chapter 52 Assignments](../../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)

---

**Maintained by**: AAA Integration Team  
**Last Updated**: 2025-01-27
