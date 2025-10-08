# 51-90-NDT-NDI-METHODS — Non-Destructive Testing and Inspection Methods

**ATA Chapter**: 51 (Standard Practices and Structures)  
**Sub-Zone**: 51-90  
**Domain**: AAA (Airframes, Aerodynamics, Airworthiness)  
**Project**: AMPEL360-AIR-T

## Overview

The NDT/NDI methods system establishes standards and procedures for:
- Ultrasonic testing (UT) methods and procedures
- Eddy current inspection (ECI)
- Radiographic testing (RT)
- Magnetic particle inspection (MPI)
- Liquid penetrant inspection (LPI)
- Visual inspection criteria
- Thermography and advanced methods
- Inspector qualification requirements

## Scope

This sub-zone contains all standards, procedures, and certification artifacts for non-destructive testing and inspection methods used in structural applications.

## Directory Structure

```
51-90-NDT-NDI-METHODS/
├─ DELs/                          # Deliveries
│  ├─ EASA-submissions/           # EASA certification submissions
│  ├─ MoC-records/                # Means of Compliance records
│  ├─ airworthiness-statements/   # Airworthiness compliance statements
│  ├─ data-packages/              # Complete data packages
│  ├─ final-design-reports/       # Final design reports
│  └─ README.md
│
├─ PAx/                           # Packaging and Integration
│  ├─ ONB/                        # Onboard systems integration
│  ├─ OUT/                        # External systems integration
│  └─ README.md
│
├─ PLM/                           # Product Lifecycle Management
│  ├─ CAD/                        # Component design and models
│  ├─ CAE/                        # Engineering analysis
│  ├─ CAI/                        # Integration planning
│  ├─ CAM/                        # Manufacturing processes
│  ├─ CAO/                        # Optimization and requirements
│  ├─ CAP/                        # Process automation
│  ├─ CAS/                        # Service and maintenance
│  ├─ CAV/                        # Verification and validation
│  └─ CMP/                        # Compliance management
│
├─ PROCUREMENT/                   # Procurement Management
│  └─ VENDORSCOMPONENTS/          # Vendor-supplied components
│
├─ QUANTUM_OA/                    # Quantum Optimization Algorithms
│  ├─ GA/                         # Genetic algorithms
│  ├─ LP/                         # Linear programming
│  ├─ MILP/                       # Mixed-integer linear programming
│  ├─ QAOA/                       # Quantum approximate optimization
│  ├─ QOX/                        # Quantum optimization exchange
│  ├─ QP/                         # Quadratic programming
│  ├─ QUBO/                       # Quadratic unconstrained binary opt
│  └─ SA/                         # Simulated annealing
│
├─ SUPPLIERS/                     # Supplier Management
│  ├─ BIDS/                       # Supplier bids and proposals
│  └─ SERVICES/                   # Supplier services and support
│
├─ policy/                        # Policies and procedures
├─ tests/                         # Test plans and results
├─ META.json                      # Metadata
├─ README.md                      # This file
└─ domain-config.yaml             # Configuration
```

## Key Interfaces

### Structural Interfaces
- **All Structural Zones** — Applies practices to structural components
- **53-XX-FUSELAGE** — Fuselage structure applications
- **57-XX-WINGS** — Wing structure applications
- **55-XX-STABILIZERS** — Empennage applications

### Systems Interfaces
- **Manufacturing** — Production processes
- **Maintenance** — Service and repair
- **Quality Assurance** — Quality control

## Compliance Requirements

### Certification Standards
- EASA CS-25 (Large Aeroplanes)
  - CS 25.601 — General structural requirements
  - CS 25.603 — Materials
  - CS 25.605 — Fabrication methods
  - CS 25.607 — Fasteners
  - CS 25.609 — Protection of structure

### Analysis Requirements
- Material and process qualification
- Method validation and verification
- Compliance documentation

## TFA Flow

This sub-zone follows the canonical TFA flow:
**QS → FWD → UE → FE → CB → QB**

- **QS** (Quantum Superposition State) — Design space exploration
- **FWD** (Forward Wave Dynamics) — Application scenarios
- **UE** (Unit/Unique Element) — Specific method definitions
- **FE** (Federation Entanglement) — Multi-discipline coordination
- **CB** (Classical Bit/Solver) — Deterministic analysis
- **QB** (Qubit Inspired Solver) — Optimization

## UTCS Anchors

All artifacts must include UTCS anchors for traceability:
```
UTCS-MI:DOC:AAA:51-90:METHODS:rev[X]
UTCS-MI:CAE:AAA:51-90:ANALYSIS:rev[X]
UTCS-MI:DEL:AAA:51-90:CERT:rev[X]
```

## Status

🚧 **In Development** — Structure defined, artifacts to be populated

## Related Documentation

- [ZONES README](../README.md)
- [AAA Domain README](../../README.md)
- [ATA Chapter 51 Assignments](../../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)

---

**Maintained by**: AAA Integration Team  
**Last Updated**: 2025-01-27
