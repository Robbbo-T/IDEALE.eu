# Spacecraft Chapter Index (SCI) Assignments to Canonical Domains

This file defines the **primary assignment** of 100 Spacecraft Chapter Index (SCI) chapters to the 15 canonical domains of the IDEALE.eu framework for the **AMPEL360-SPACE-T** project.

## Purpose

The SCI system provides a standardized numbering scheme for spacecraft systems and documentation, adapted from ATA chapters for space vehicle applications. This mapping ensures:
- **Clear authority** — Each SCI chapter has one primary canonical domain
- **Design responsibility** — The primary domain owns design and documentation
- **Cross-domain integration** — Secondary domains listed for multi-system interfaces
- **Consistency** — Uniform organization across all spacecraft projects
- **ECSS/CCSDS/NASA compliance** — Alignment with space industry standards

## File Structure

**Format**: CSV (Comma-Separated Values)  
**Encoding**: UTF-8  
**Columns**:
1. `Category` - Classification type (always "SCI Chapter")
2. `SCI_Chapter` - Chapter number (01-100)
3. `SCI_Title` - Functional title of the chapter for spacecraft
4. `Primary_Domain` - Three-letter code of the primary canonical domain
5. `Secondary_Domains` - Optional comma-separated list of related domains
6. `Notes` - Additional context or clarifications

## Assignment Principles

### Primary Domain Authority

Each SCI chapter is assigned to **exactly one** primary domain that holds:
- Design authority and ownership
- Documentation responsibility
- Configuration control
- Certification data packages (DELs)
- ECSS/CCSDS compliance artifacts

### Secondary Domain Interfaces

Secondary domains are listed when:
- Systems have significant cross-domain dependencies
- Integration requires coordination between domains
- Shared components or interfaces exist

## Domain-to-SCI Chapter Summary

### AAA - Structures, Mechanisms & Spaceworthiness
**Primary chapters**: 06, 14, 50, 51, 52, 53, 54, 55, 56, 57, 58, 94

Key focus: Primary structure, payload bay, solar array structures, hatches, windows, avionics bays

### PPP - Propulsion & Propellants
**Primary chapters**: 28, 47, 54 (shared), 60, 61, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 83, 84

Key focus: Main propulsion, RCS, propellant systems, electric propulsion, turbomachinery

### MEC - Mechanisms & Mobility
**Primary chapters**: 27, 32, 59, 66

Key focus: Deployment mechanisms, EDL systems, sampling mechanisms, deployable practices

### LCC - Links, Control & Communications
**Primary chapters**: 22, 23, 41, 44, 45, 48, 93

Key focus: GNC/AOCS, TT&C, fault tolerance, FDIR, health monitoring, optical comms, central control

### EDI - Avionics, C&DH & Instruments
**Primary chapters**: 31, 34, 40, 42

Key focus: Flight software, navigation sensors, telemetry, databus/IMA

### EEE - Electrical, Power & Harness
**Primary chapters**: 24, 33, 39, 49, 97

Key focus: EPS, power distribution, lighting, alternate power sources, harnesses

### EER - Environment, EMC & Remediation
**Primary chapters**: 15, 26, 37, 85, 86, 87

Key focus: Acoustics, vibration, ordnance safety, venting, EMC, planetary protection, radiation

### DDD - Thermal Control & Heat Rejection
**Primary chapters**: 21, 30

Key focus: Active thermal control, TPS, thermal protection systems

### CCC - Crew, Cabin & Cargo / Payload Accommodation
**Primary chapters**: 11, 25, 35, 36, 38, 43

Key focus: Crew systems, ECLSS oxygen and water, pressurization, human interfaces

### IIS - Information, Intelligence & Mission Systems
**Primary chapters**: 46, 90, 91, 95, 96

Key focus: Mission ops, space traffic awareness, mission analysis, MBSE, simulation

### LIB - Logistics, Inventory & Build
**Primary chapters**: 01, 02, 03, 04, 05, 12, 19, 98, 99

Key focus: Program intro, configuration management, V&V, limits, servicing, records, compliance

### AAP - Access, Launch & Pad Interfaces
**Primary chapters**: 10, 17, 18

Key focus: Launch pad handling, interface control documents, hazard analysis

### CQH - Cryogenics, Quantum & H2
**Primary chapters**: 29, 47 (shared), 82

Key focus: Pressure systems, pressurants, cryogenic injection

### IIF - Industrial Infrastructure & Facilities
**Primary chapters**: 07, 16

Key focus: MGSE, EGSE/GSE integration

### OOO - OS, Ontologies & Office Interfaces (Platform)
**Primary chapters**: 13, 20, 62, 63, 64, 65, 67, 68, 69, 88, 89, 92, 100

Key focus: General hardware, standard practices, cybersecurity, AI/ML, calibration, reserved chapters

## Usage in Project Structure

### Directory Naming Convention

All SCI chapter directories follow the pattern:
```
NN-SPACE-LABEL/
```

Examples:
- `24-EPS-POWER/` (SCI Chapter 24)
- `22-GNC-AOCS/` (SCI Chapter 22)
- `21-THERMAL-CONTROL-SYSTEM/` (SCI Chapter 21)

### SYSTEMS Organization (All Domains)

**All domains use SYSTEMS/** - there are no ZONES in AMPEL360-SPACE-T:

```
DOMAINS/
├─ AAA-STRUCTURES-MECHANISMS-SPACEWORTHINESS/
│  └─ SYSTEMS/
│     ├─ 53-PRIMARY-STRUCTURE/          ← System level (clean)
│     │  ├─ README.md
│     │  ├─ system.meta.yml
│     │  └─ interfaces.yml
│     │  └─ 53-10-MAIN-BODY/            ← Subsystem level (clean)
│     │     ├─ README.md
│     │     └─ subsystem.meta.yml
│     │     └─ 53-10-01-FORWARD-SECT/   ← Sub-subsystem (BEZ here)
│     │        ├─ DELs/
│     │        ├─ PAx/
│     │        ├─ PLM/
│     │        ├─ QUANTUM_OA/
│     │        ├─ SUPPLIERS/
│     │        ├─ policy/
│     │        ├─ tests/
│     │        ├─ META.json
│     │        ├─ inherit.json
│     │        └─ domain-config.yaml
```

### BEZ (Bloque de Estructura Base) Application

The BEZ structure appears at **two hierarchical levels**:

#### Domain Level (Templates & Governance)
- **Location**: `DOMAINS/AAA-.../`
- **Purpose**: Templates, schemas, policies, and standards
- **Contents**: Document templates, validation schemas, governance rules
- **Metadata**: `"scope": "domain"`

#### Sub-Subsystem Level (Instances & Artifacts)
- **Location**: `DOMAINS/AAA/.../SYSTEMS/53-.../53-10-.../53-10-01-.../`
- **Purpose**: Actual work products and deliverables
- **Contents**: Completed documents, CAD files, test results, contracts
- **Metadata**: `"scope": "instance"`, references domain templates

**System and subsystem levels are clean** - they contain only descriptors (README.md, meta.yml, interfaces.yml).

This hierarchical repetition is **intentional** — domain level defines the contract, sub-subsystem level implements it.

**Complete BEZ structure should be fully populated at the sub-subsystem level**:

```
SUB-SUBSYSTEM/
├─ DELs/
│  ├─ ECSS-submissions/
│  ├─ CCSDS-compliance/
│  ├─ NASA-standards/
│  ├─ data-packages/
│  └─ final-design-reports/
├─ PAx/
│  ├─ ONB/
│  └─ OUT/
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
├─ inherit.json
└─ domain-config.yaml
```

## UTCS Anchor Format for SPACE-T

All UTCS anchors follow the format:
```
SPACE.SCI.<NN-LABEL>.<SUBSYSTEM>[.<COMPONENT>]:REV
```

Examples:
```
SPACE.SCI.24-EPS-POWER.PCDU.PDU-01:rev[A]
SPACE.SCI.22-GNC-AOCS.STAR-TRACKER:rev[B]
SPACE.SCI.53-PRIMARY-STRUCTURE.53-10-MAIN-BODY.53-10-01-FORWARD-SECT:rev[C]
```

## Crosswalk: ATA → SCI (for Migration)

When migrating from AMPEL360-AIR-T to AMPEL360-SPACE-T, use this mapping:

```
01 → 01-PROGRAM-INTRO
04 → 04-SPACEWORTHINESS-LIMITS
05 → 05-DESIGN-LIFE-TIME-LIMITS
06 → 06-COORDINATES-MASS-PROPERTIES
07 → 07-MGSE-SHORING-LIFTING
08 → 08-MASS-PROPERTIES-LEVELING
09 → 09-SURFACE-FINISHES-OUTGASSING
10 → 10-LAUNCH-PAD-HANDLING-RESTRAINTS
11 → 11-MARKINGS-PLACARDS
12 → 12-GROUND-SERVICING
13 → 13-GENERAL-HARDWARE
14 → 14-FASTENERS-STRUCTURAL-HARDWARE
15 → 15-ACOUSTICS-VIBRATION-ENVIRONMENT
16 → 16-EGSE-GSE-INTEGRATION
20 → 20-STANDARD-PRACTICES
21 → 21-THERMAL-CONTROL-SYSTEM
22 → 22-GNC-AOCS
23 → 23-TT-C
24 → 24-EPS-POWER
25 → 25-CREW-SYSTEMS-PAYLOAD-ACCOMMOD.
26 → 26-ORDNANCE-FIRE-EXPLOSION-SAFETY
27 → 27-MECHANISMS-DEPLOYABLES
28 → 28-PROPELLANT-SYSTEMS
29 → 29-PRESSURE-SYSTEMS-PNEUMATICS
30 → 30-TPS-THERMAL-PROTECTION
31 → 31-TELEMETRY-DATA-RECORDING
32 → 32-EDL-LANDING-SYSTEMS
33 → 33-ILLUMINATION-BEACONS
34 → 34-NAVIGATION-SENSORS
35 → 35-ECLSS-OXYGEN
36 → 36-PRESSURIZATION-ATMOSPHERE
37 → 37-VENTING-VACUUM-COMPATIBILITY
38 → 38-ECLSS-WATER-WASTE
39 → 39-PCDU-PANELS-POWER-DISTRIBUTION
40 → 40-FLIGHT-SOFTWARE
41 → 41-TIME-SYNC-FAULT-TOLERANCE
42 → 42-DATABUS-IMA
43 → 43-HUMAN-SYSTEMS-INTERFACE
44 → 44-MODE-CONTROL-FDIR
45 → 45-HEALTH-MONITORING-MAINT-CBRS
46 → 46-MISSION-OPS-GROUND-SEGMENT
47 → 47-PRESSURANTS-PURGE-N2
49 → 49-ALTERNATE-POWER-SOURCES
50 → 50-PAYLOAD-BAY-STRUCTURES
51 → 51-STANDARD-PRACTICES-STRUCTURES
52 → 52-ACCESS-DOORS-HATCHES
53 → 53-PRIMARY-STRUCTURE
54 → 54-PROPULSION-MODULE-STRUCTURE
55 → 55-MASTS-BOOMS-RAD-STRUCTURES
56 → 56-VIEWPORTS-WINDOWS
57 → 57-SOLAR-ARRAY-STRUCTURES
60 → 60-RCS-PRACTICES
61 → 61-RCS-THRUSTERS
66 → 66-DEPLOYABLE-PRACTICES
70 → 70-MAIN-PROPULSION-PRACTICES
71 → 71-MAIN-PROPULSION
72 → 72-ENGINE-MODULES
73 → 73-PROPELLANT-CONTROL
74 → 74-IGNITION-ACTUATION
75 → 75-THERMAL-MANAGEMENT-PROPULSION
76 → 76-THRUST-VECTOR-CONTROL
77 → 77-PROPULSION-INDICATING
78 → 78-PLUME-CONTAMINATION
79 → 79-LUBRICATION
80 → 80-STARTING-SEQUENCING
81 → 81-TURBOMACHINERY
83 → 83-PUMPS-GEARBOXES
84 → 84-ELECTRIC-PROPULSION
85 → 85-EMISSIONS-RF-EMC-CONTAMINATION
91 → 91-MISSION-ANALYSIS-PERFORMANCE
93 → 93-CENTRAL-CONTROL-SYSTEMS
94 → 94-AVIONICS-BAYS-EE-COMPARTMENTS
97 → 97-HARNESS-WIRING
98 → 98-RECORDS-DATA-PACKAGES
```

New SPACE-only chapters (not in ATA):
- 48-OPTICAL-COMMUNICATIONS
- 58-DOCKING-SYSTEMS
- 59-SAMPLING-MECHANISMS
- 82-CRYOGENIC-REACTANT-INJECTION
- 86-PLANETARY-PROTECTION
- 87-RADIATION-SHIELDING
- 88-CYBERSECURITY
- 89-AI-ML-ASSURANCE
- 90-SPACE-TRAFFIC-CONJUNCTION
- 92-CALIBRATION-GEOMETRY
- 95-MODEL-BASED-SYSTEMS-ENGINEERING
- 96-SIMULATION-HIL-SIL
- 99-COMPLIANCE-LICENSING

## Compliance Frameworks

### ECSS (European Cooperation for Space Standardization)
- ECSS-E: Engineering standards
- ECSS-M: Management standards
- ECSS-Q: Quality assurance standards
- Artifacts stored in `DELs/ECSS-submissions/`

### CCSDS (Consultative Committee for Space Data Systems)
- Data format and protocol standards
- Telemetry, tracking, and command
- Artifacts stored in `DELs/CCSDS-compliance/`

### NASA Standards
- NPR 7150.2 (NASA Software Engineering Requirements)
- NASA-STD-8739 series (Hardware)
- Artifacts stored in `DELs/NASA-standards/`

## Cross-References

- [Complete Domain Structure](../../../3-PROJECTS-USE-CASES/AMPEL360-SPACE-T/DOMAINS/COMPLETE-DOMAIN-STRUCTURE.md)
- [SPACE Structure Example](../../../3-PROJECTS-USE-CASES/AMPEL360-SPACE-T/DOMAINS/SPACE-STRUCTURE-EXAMPLE.md)
- [Canonical Domains README](./domains.README.md)
- [AMPEL360-SPACE-T README](../../../3-PROJECTS-USE-CASES/AMPEL360-SPACE-T/README.md)
