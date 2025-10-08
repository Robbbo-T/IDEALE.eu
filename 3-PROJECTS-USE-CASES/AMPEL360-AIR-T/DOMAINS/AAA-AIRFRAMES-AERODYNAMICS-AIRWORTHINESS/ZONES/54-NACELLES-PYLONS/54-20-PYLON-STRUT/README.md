# 54-20-PYLON-STRUT — Pylon and Strut Structural Design

**ATA Chapter**: 54 (Nacelles/Pylons)  
**Sub-Zone**: 54-20  
**Domain**: AAA (Airframes, Aerodynamics, Airworthiness)  
**Project**: AMPEL360-AIR-T

## Overview

The 54-20-PYLON-STRUT sub-zone encompasses the design, analysis, and certification of pylon/strut structures that attach the engine/nacelle assembly to the wing. This includes:
- Primary load path structure (forward and aft engine mounts)
- Secondary load path and failsafe features
- Wing attachment fittings and interfaces
- Firewall structure within pylon
- Electrical bonding provisions
- Systems routing and support structure

## Scope

This sub-zone contains all design artifacts, structural analysis, and certification data for pylon structures:
- Primary and secondary load path design (CAD/CAE)
- Engine mount attachment fittings
- Wing interface and carry-through structure
- Static and dynamic load testing (CAV)
- Electrical bonding and lightning protection coordination (EEE)
- Manufacturing travelers and assembly procedures (CAP)

## Key Components

### Primary Load Path
- Forward engine mount beam
- Aft engine mount beam
- Pylon box structure (upper and lower skins, spars, ribs)
- Wing attachment fittings (forward and aft)
- Load introduction and distribution

### Secondary Load Path
- Failsafe load paths
- Secondary attachment points
- Redundant structure per damage tolerance

### Firewall Structure
- Firewall panels within pylon
- Fire seal interfaces
- Drain and ventilation provisions

### Systems Support
- Fuel line routing and support
- Hydraulic line support
- Electrical harness routing
- Bleed air ducting support

### Electrical Bonding
- Bonding jumpers and straps
- Lightning attachment points
- Static discharge paths
- Grounding provisions

## Key Standards

### Load Requirements
- **CS/FAR-25.361** — Engine torque
- **CS/FAR-25.363** — Side load on engine and auxiliary power unit mounting
- **CS/FAR-25.367** — Unsymmetrical loads due to engine failure
- **CS/FAR-25.471** — Ground load conditions
- **CS/FAR-25.473** — Ground load dynamic conditions

### Structural Requirements
- **CS/FAR-25.571** — Damage tolerance and fatigue evaluation
- **CS/FAR-25.613** — Material strength properties
- **CS/FAR-25.619** — Special factors
- **CS/FAR-25.625** — Fitting factors
- **CS/FAR-25.631** — Bird strike damage

### Fire Protection
- **CS/FAR-25.1191** — Firewalls
- **CS/FAR-25.1193** — Cowling and nacelle skin

### Electrical
- **CS/FAR-25.899** — Electrical bonding and protection against lightning
- **DO-160** — Environmental conditions (lightning, HIRF)

## Directory Structure

```
54-20-PYLON-STRUT/
├─ DELs/                          # Certification deliveries
│  ├─ EASA-submissions/           # Regulatory submissions
│  ├─ MoC-records/                # Compliance records
│  ├─ airworthiness-statements/   # Airworthiness compliance
│  ├─ data-packages/              # Complete data packages
│  └─ final-design-releases/      # Design reports
│
├─ PAx/                           # Integration
│  ├─ ONB/                        # Onboard integration
│  └─ OUT/                        # External interfaces
│
├─ PLM/                           # Product Lifecycle Management
│  ├─ CAD/                        # 3D models and assemblies
│  ├─ CAE/                        # Structural analysis (FEA)
│  ├─ CAI/                        # Clearance analysis
│  ├─ CAM/                        # Manufacturing planning
│  ├─ CAO/                        # Optimization and requirements
│  ├─ CAP/                        # Process automation
│  │  ├─ BPMN/                    # Assembly process models
│  │  ├─ SOPs/                    # Installation procedures
│  │  ├─ Travelers/               # Manufacturing routing
│  │  ├─ Checklists/              # QA inspection checklists
│  │  ├─ eSign/                   # Approval workflows
│  │  ├─ Process-Mining/          # Process analytics
│  │  └─ Integrations/            # PLM/ERP integration
│  ├─ CAS/                        # Service planning
│  ├─ CAV/                        # Validation and testing
│  └─ CMP/                        # Compliance management
│
├─ PROCUREMENT/                   # Supplier management
├─ QUANTUM_OA/                    # Optimization algorithms
├─ SUPPLIERS/                     # Vendor coordination
├─ policy/                        # Design standards
├─ tests/                         # Test data and reports
└─ README.md                      # This file
```

## Key Analyses

### Structural Analysis (CAE)
- Static stress analysis (limit and ultimate loads)
  - Vertical loads (1g, 2.5g, -1g cases)
  - Side loads (engine failure, crosswind)
  - Torsional loads (engine torque)
  - Combined load cases
- Fatigue analysis (safe-life and damage tolerance)
- Damage tolerance evaluation (DTE)
  - Crack growth analysis
  - Residual strength assessment
  - Failsafe evaluation
- Buckling stability analysis
- Non-linear analysis (large deformation, contact)
- Thermal stress analysis (fire scenarios)

### Load Cases
- Symmetric flight loads (maneuvers, gusts)
- Asymmetric loads (engine-out scenarios)
- Ground loads (taxi, braking, turning)
- Emergency landing conditions
- Crash loads (survivability)

### Clearance Analysis (CAI)
- Engine-to-wing clearances
- Cowl-to-pylon clearances
- Systems routing validation
- Maintenance access verification

## UTCS Integration

Pylon structure UTCS anchors:
```
UTCS-MI:AAA:Z54:CAD:PYLON-PRIMARY-STRUCTURE:rev[A]
UTCS-MI:AAA:Z54:CAD:ENGINE-MOUNT-FITTINGS:rev[A]
UTCS-MI:AAA:Z54:CAE:PYLON-PRIMARY-LOADPATH:rev[A]
UTCS-MI:AAA:Z54:CAE:ENGINE-MOUNT-LOADS-ANALYSIS:rev[A]
UTCS-MI:AAA:Z54:CAE:PYLON-DAMAGE-TOLERANCE:rev[A]
UTCS-MI:AAA:Z54:CAV:PYLON-STATIC-TEST:rev[A]
```

## CAP (Computer-Aided Processes)

Process automation for pylon structures:
- **BPMN:** Pylon assembly and wing integration workflows
- **SOPs:** Engine installation and removal procedures
- **Travelers:** Manufacturing routing with inspection hold points
- **Checklists:** Bonding verification, torque checks, NDI inspection
- **eSign:** Structural approval and release workflows
- **Process-Mining:** Assembly efficiency analysis
- **Integrations:** ERP production scheduling, MES quality tracking

## Key Interfaces

### Within AAA Domain
- **54-10-NACELLE-STRUCTURE** — Pylon-to-nacelle attachment
- **54-40-FIRE-THERMAL-ACOUSTICS** — Firewall integration
- **57-WING-STRUCTURES** — Wing carry-through and attachment points

### Cross-Domain Interfaces
- **PPP/71-POWER-PLANT** — Engine mount interfaces (forward/aft mounts)
- **PPP/73-ENGINE-FUEL** — Fuel line routing and support
- **EEE/24-ELECTRICAL** — Bonding and grounding (critical interface)
- **EER/26-FIRE-PROTECTION** — Fire detection and extinguishing systems
- **MEC/29-HYDRAULIC** — Hydraulic line routing through pylon

### OEM Interfaces
- Engine manufacturers — Interface control drawings (ICDs)
- Wing OEM — Wing attachment interface definitions

## Testing Requirements

### Static Testing
- Ultimate load capability (150% design limit load)
- Proof load testing
- Residual strength after damage
- Fail-safe demonstration

### Fatigue Testing
- Full-scale fatigue article (pylon + wing section)
- Spectrum loading per flight profile
- Damage detection intervals
- Crack growth monitoring

### Dynamic Testing
- Modal testing (frequency response)
- Whirl testing (rotor imbalance)
- Engine shutdown transients

### Environmental Testing
- Temperature extremes (operating envelope)
- Fire endurance (firewall burn-through)
- Lightning strike testing
- Electrical bonding verification

## Compliance Requirements

### Load Substantiation
- Load analysis per 25.361/363/367
- Load distribution and reaction loads
- Bearing stress and fastener analysis
- Special factors justification (25.619, 25.625)

### Damage Tolerance
- Damage tolerance evaluation (DTE) per 25.571
- Inspection intervals and methods
- Crack growth analysis and residual strength
- Failsafe load paths

### Material and Process
- Material qualification and property data
- Manufacturing process specifications
- Non-destructive inspection (NDI) procedures
- Surface treatment and corrosion protection

### Electrical Bonding
- Bonding resistance measurements (< 0.002 ohms)
- Lightning protection analysis
- HIRF (High Intensity Radiated Fields) protection

## Status

🚧 **In Development** — Structure ready for design artifacts

## Related Documentation

- [Zone README](../README.md) — ATA 54 zone overview
- [54-00-GENERAL](../54-00-GENERAL/README.md) — Zone governance
- [54-10-NACELLE-STRUCTURE](../54-10-NACELLE-STRUCTURE/README.md) — Nacelle interfaces
- [57-WING-STRUCTURES](../../57-WING-STRUCTURES/README.md) — Wing attachment interface

---

**Maintained by**: AAA Pylon Design Team  
**Last Updated**: 2025-01-27
  
