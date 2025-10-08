# AMPEL360-SPACE-T Cluster-Based Organization

## Overview

This document defines the **cluster-based organization** for AMPEL360-SPACE-T, providing standardized subsystem (XX) and sub-subsystem (YY) coding for consistent implementation across all SCI chapters.

## Key Principles

1. **System level stays clean**: Only README.md, system.meta.yml, interfaces.yml
2. **Subsystem level stays clean**: Only README.md, subsystem.meta.yml  
3. **BEZ lives only at YY level**: Full BEZ structure at `NN-LABEL/NN-XX-SUBSYSTEM/NN-XX-YY-SUBSUBSYSTEM/`
4. **Fixed YY decks (01-20)**: No placeholders, reusable across chapters in same cluster
5. **Numeric stability**: XX and YY codes are fixed for automation and UTCS

## Path Pattern

```
DOMAIN/SYSTEMS/NN-LABEL/NN-XX-SUBSYSTEM/NN-XX-YY-SUBSUBSYSTEM/
```

Where:
- **NN**: SCI chapter number (01-100)
- **LABEL**: Chapter name (e.g., PRIMARY-STRUCTURE, EPS-POWER)
- **XX**: Subsystem code (10, 20, 30, ... 90) - standardized per cluster
- **YY**: Sub-subsystem code (01-20) - from deck assigned to cluster

## Clusters and Chapter Mapping

### Cluster E — Program / Compliance / GSE
**YY Deck: E**  
**Chapters**: 01, 04, 05, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 98, 99

**XX Subsystems:**
- **NN-10** Governance & Policies
- **NN-20** Plans & Management (SEMP/V&V/RMP/IMP/IMS)
- **NN-30** Requirements & Compliance (matrices, tailoring)
- **NN-40** Risk & Opportunity
- **NN-50** Reviews & Gates (SRR/PDR/CDR/etc.)
- **NN-60** Standards & Tailoring
- **NN-70** Data & Records
- **NN-80** Training & Qualifications
- **NN-90** Audits, Licensing & Export Control

---

### Cluster S — Structures / Mechanisms
**YY Deck: A**  
**Chapters**: 50, 51, 52, 53, 55, 56, 57, 94  
**Shared**: 54 (use XX from S, YY deck A if AAA owns; YY deck B if PPP owns)

**XX Subsystems:**
- **NN-10** Primary Structure
- **NN-20** Secondary Structure & Panels
- **NN-30** Doors/Hatches/Access (52)
- **NN-40** Joints & Fasteners (14 ties in via platform)
- **NN-50** Mechanisms & Hinges (booms, masts) (55)
- **NN-60** Mounts, Alignment & Tolerances
- **NN-70** Materials & Processes
- **NN-80** Inspection & NDI
- **NN-90** Qualification & Acceptance

---

### Cluster G — Thermal Control & TPS
**YY Deck: G**  
**Chapters**: 21, 30

**XX Subsystems:**
- **NN-10** Radiators & Heat Exchangers
- **NN-20** Insulation & MLI
- **NN-30** Heaters & Thermostats
- **NN-40** Heat Pipes/Straps & Interfaces
- **NN-50** TPS Materials, Tiles & Attachments (30)
- **NN-60** Thermal Sensors & Harness
- **NN-70** Thermal Control Algorithms & Modes
- **NN-80** TVAC Tests & Correlation
- **NN-90** Contamination Control & Bakeout

---

### Cluster H — Power / EPS / Harness
**YY Deck: H**  
**Chapters**: 24, 39, 49, 97

**XX Subsystems:**
- **NN-10** Generation (Arrays/RTG/Fuel Cells)
- **NN-20** Storage (Batteries)
- **NN-30** Conversion & Regulation (PCDU)
- **NN-40** Distribution (LCLs/Relays/Loads)
- **NN-50** Protection, Grounding & Bonding
- **NN-60** Telemetry & Metering
- **NN-70** Control & Modes
- **NN-80** Harness & Connectors (Power)
- **NN-90** Thermal, Budgets & EGSE

---

### Cluster F — Communications (RF/Optical) & TT&C
**YY Deck: F**  
**Chapters**: 23, 33, 48

**XX Subsystems:**
- **NN-10** RF Front-End (L/S/X/Ka)
- **NN-20** Transceivers & Modems
- **NN-30** Antennas & Pointing
- **NN-40** Modulation/Coding & CCSDS TM/TC
- **NN-50** Ranging & Doppler
- **NN-60** RF Distribution & Switching
- **NN-70** Optical Terminals & Benches (48)
- **NN-80** Calibration & Test
- **NN-90** Ground Interfaces & Ops

---

### Cluster N — Navigation, Time, Sensing & Data
**YY Deck: C**  
**Chapters**: 31, 34, 41

**XX Subsystems:**
- **NN-10** Navigation Sensors (Star/Sun/GNSS/IMU)
- **NN-20** Timing & Synchronization
- **NN-30** Data Handling & Recording (C&DH)
- **NN-40** Sensor/Actuator I/O Modules
- **NN-50** Processing & Storage
- **NN-60** Telemetry Points & Parameters
- **NN-70** Fault Management Hooks
- **NN-80** HIL/SIL Instrumentation
- **NN-90** Security & Hardening (time/data)

---

### Cluster C — Avionics, Software & Databus
**YY Deck: C**  
**Chapters**: 40, 42, 93

**XX Subsystems:**
- **NN-10** Flight Computers & Processing
- **NN-20** Flight Software & Services
- **NN-30** Databus & Networks (SpaceWire/1553/CAN/IMA)
- **NN-40** Boot, Update & Configuration
- **NN-50** Timebase & Synchronization Links
- **NN-60** I/O Abstraction & Drivers
- **NN-70** Mode Tables & Resources
- **NN-80** HIL/SIL Frameworks
- **NN-90** Cyber Hardening & Integrity

---

### Cluster L — Control, Autonomy, FDIR & Health
**YY Deck: I**  
**Chapters**: 22, 44, 45  
**Note**: 41 timebase is in Cluster N but interfaces here

**XX Subsystems:**
- **NN-10** Control Architecture & Modes
- **NN-20** GNC Estimation & Guidance
- **NN-30** Actuator Command & Allocation
- **NN-40** FDIR Rules & Monitors
- **NN-50** Health Monitoring & CBM/CBRS (45)
- **NN-60** Redundancy & Cross-Strapping (ties to 93)
- **NN-70** Performance Trending & Analytics
- **NN-80** Verification (Closed-loop/HIL)
- **NN-90** Ops Procedures & Limits

---

### Cluster D — ECLSS / Crew & Payload Accommodation
**YY Deck: D**  
**Chapters**: 25, 35, 36, 37, 38

**XX Subsystems:**
- **NN-10** Atmosphere Supply (O₂/N₂)
- **NN-20** Pressure Control & Valving
- **NN-30** CO₂ & Trace Contaminant Removal
- **NN-40** Humidity & Condensate
- **NN-50** Water Processing & Waste
- **NN-60** Fire Detection & Suppression (26 ties safety)
- **NN-70** Sensors & Health Monitoring
- **NN-80** Control Electronics & Software
- **NN-90** Ops, Maintenance & Servicing

---

### Cluster B — Propulsion & Fluids
**YY Deck: B**  
**Chapters**: 28, 29, 47, 60, 61, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85  
**Shared**: 54 structure (use XX from Cluster S, YY deck B when PPP owns)

**XX Subsystems:**
- **NN-10** Propellant Storage & PMD (28)
- **NN-20** Pressurization & Purge (29, 47)
- **NN-30** Feed & Distribution (73)
- **NN-40** Thrust Devices (61 RCS / 71 Main / 84 Electric)
- **NN-50** Ignition & Actuation (74)
- **NN-60** Thermal Management (75)
- **NN-70** Thrust Vector & Allocation (76)
- **NN-80** Control Electronics & Software (77 indicating, 80 starting)
- **NN-90** Safety, Contamination & EMC (78 plume, 85 emissions)

---

### Cluster J — Docking, Sampling & Robotics
**YY Deck: J**  
**Chapters**: 58, 59

**XX Subsystems:**
- **NN-10** Approach Sensing & VBN/LIDAR
- **NN-20** Latching & Soft-Capture
- **NN-30** Seals & Pressure Equalization
- **NN-40** Umbilicals & Transfer (power/fluid/data)
- **NN-50** Actuators & Drives
- **NN-60** Control & Autonomy
- **NN-70** Safety & Abort
- **NN-80** Calibration & Testbeds
- **NN-90** Ops & Procedures

---

### Cluster R — Environment, Safety & Space Traffic
**YY Deck: E** (with R-specific content in YY-14/17/19)  
**Chapters**: 15, 26, 86, 87, 90

**XX Subsystems:**
- **NN-10** Acoustic & Vibration Environment (15)
- **NN-20** Ordnance, Pyro & Hazard Controls (26)
- **NN-30** Planetary Protection (86)
- **NN-40** Radiation Shielding & Effects (87)
- **NN-50** Conjunction Assessment & Debris (90)
- **NN-60** EMC/EMI & Emissions (85 ties here when not propulsion)
- **NN-70** Safety Analysis (FMEA/FTA)
- **NN-80** Verification & Test (Hazard/EMI/Rad)
- **NN-90** Compliance & Licensing

---

### Cluster I — Ground, Integration & Mission Ops
**YY Deck: I**  
**Chapters**: 07, 10, 16, 32, 46, 92  
**Note**: 91, 95, 96 are in Cluster M

**XX Subsystems:**
- **NN-10** MGSE & Handling (07, 10)
- **NN-20** EGSE & Benches (16)
- **NN-30** Integration & Checkouts
- **NN-40** EDL & Landing Ops (32)
- **NN-50** Ground Segment & MOC Interfaces (46)
- **NN-60** Calibration & Geometry (92)
- **NN-70** Procedures & Training
- **NN-80** Ops Data Products & Trending
- **NN-90** Archival & Handover

---

### Cluster M — Models, Simulation & MBSE
**YY Deck: C** (software) + **E** (governance)  
**Chapters**: 91, 95, 96

**XX Subsystems:**
- **NN-10** MBSE Architecture & Views (95)
- **NN-20** Requirements & Trace Models
- **NN-30** Simulation Frameworks (SIL/HIL) (96)
- **NN-40** Plant/Environment/Dynamics Models
- **NN-50** Calibration & Geometry Models (links to 92)
- **NN-60** Stimulation & Test Scenario Libraries
- **NN-70** V&V Plans & Evidence (91 ties to performance)
- **NN-80** Performance & Mission Analysis (91)
- **NN-90** Configuration & Versioning

---

## YY Decks (01-20, Fixed)

Use the deck assigned to the cluster. These are the **only** YY codes at sub-subsystem level.

### Deck A — Structural/Mechanical
**For**: Cluster S, and 54 when AAA owns

- **01** Primary elements
- **02** Secondary elements
- **03** Joints & fasteners
- **04** Mechanisms & hinges
- **05** Kinematics & alignment
- **06** Loads & environments
- **07** Materials & processes
- **08** Thermal interfaces & isolation
- **09** Contamination & cleanliness
- **10** Safety & hazard controls
- **11** Sensors & instrumentation
- **12** Control & actuation interfaces
- **13** Harness routing & connectors
- **14** Manufacturing process plans
- **15** Inspection & NDI
- **16** Verification & qualification tests
- **17** Reliability, FMEA, FTA
- **18** Compliance evidence
- **19** Logistics, handling & packaging
- **20** MGSE/tooling & fixtures

---

### Deck B — Propulsion & Fluids
**For**: Cluster B, and 54 when PPP owns

- **01** Tanks & PMD
- **02** Lines & plumbing
- **03** Valves & regulators
- **04** Thrusters/nozzles
- **05** Pressurization systems
- **06** Ignition & actuation
- **07** Sensors & transducers
- **08** Thermal management & insulation
- **09** Purge & vent
- **10** Compatibility & cleanliness
- **11** Control electronics (EPCU/PCU)
- **12** Software & sequences
- **13** Health monitoring & telemetry
- **14** Models & performance analysis
- **15** GSE (fill/drain)
- **16** Safety & ordnance interlocks
- **17** Test & calibration (hotfire/acceptance)
- **18** Reliability & margins
- **19** Compliance & licensing
- **20** PPE/ESD & safe processing

---

### Deck C — Avionics / Software / Data
**For**: Clusters C, N, M (software parts)

- **01** Processing elements (OBC/FPGAs)
- **02** Software components & services
- **03** Boot & update
- **04** Timebase & sync
- **05** Data handling & storage
- **06** Databus interfaces
- **07** Sensor/actuator I/O modules
- **08** Memory management
- **09** FDIR hooks
- **10** Cybersecurity & hardening
- **11** Telemetry points & parameters
- **12** Commanding interfaces
- **13** Mode/state tables
- **14** Models, simulation & HIL/SIL
- **15** Verification (unit/int/system)
- **16** Performance & resource budgets
- **17** Safety & certification evidence
- **18** Protocols & ICDs (CCSDS/PUS)
- **19** Configuration & release mgmt
- **20** EGSE & test benches

---

### Deck D — ECLSS / Crew / Payload Accommodation
**For**: Cluster D

- **01** Atmosphere supply
- **02** Pressure control & valves
- **03** CO₂ removal
- **04** Trace contaminant control
- **05** Humidity & condensate
- **06** Zonal temperature control
- **07** Potable water processing
- **08** Waste management
- **09** Fire detection & suppression
- **10** Sensors & health monitoring
- **11** Control electronics & SW
- **12** Plumbing & fittings
- **13** Filters & cartridges
- **14** Safety & hazard controls
- **15** Models & budgets
- **16** Verification & acceptance tests
- **17** Spares & maintainability
- **18** Crew interfaces & displays
- **19** ICDs to cabin/power
- **20** EGSE/servicing

---

### Deck E — Program / Compliance / GSE
**For**: Clusters E, R (with R-specific content in 14/17/19)

- **01** Governance & policy artifacts
- **02** Plans (SEMP/V&V/RMP/IMP/IMS)
- **03** Requirements & compliance matrix
- **04** Risk & opportunity registers
- **05** Configuration management
- **06** Data & records management
- **07** Standards & tailoring
- **08** Reviews & gate packages
- **09** Contracts & supplier artifacts
- **10** Deliverables & data packs
- **11** Training & qualification records
- **12** Licensing & export control
- **13** CONOPS & ops concepts
- **14** Interface control documents
- **15** Audit & surveillance evidence
- **16** Metrics & reporting
- **17** Cost & schedule baselines
- **18** Security & access control
- **19** Archival & retention
- **20** Automation & tooling

---

### Deck F — Communications (RF/Optical/TT&C)
**For**: Cluster F

- **01** RF front-end chains
- **02** Transceivers/modems
- **03** Frequency & timing refs
- **04** Antennas & pointing
- **05** RF distribution/switches
- **06** Modulation/coding (CCSDS)
- **07** Ranging & Doppler
- **08** Link budgets & performance
- **09** Thermal controls (RF/optical)
- **10** EMC/EMI controls
- **11** RF harness & connectors
- **12** Commanding interfaces
- **13** Telemetry point sets
- **14** Safety/inhibit lines
- **15** Ground interfaces (EGSE/SDP)
- **16** Calibration & alignment
- **17** Redundancy & cross-strapping
- **18** Protocols & packetization
- **19** Calibration sources & benches
- **20** RF/optical EGSE sets

---

### Deck G — Thermal & TPS
**For**: Cluster G

- **01** Radiators/HEX
- **02** Insulation/MLI
- **03** Heaters/thermostats
- **04** Heat pipes/straps
- **05** TPS materials & tiles
- **06** Thermal sensors
- **07** Control algorithms
- **08** TVAC & correlation
- **09** Contamination/bakeout
- **10** Thermal interfaces
- **11** Thermal harness
- **12** Thermal models/budgets
- **13** Redundancy/safeties
- **14** EMC/EMI for thermal units
- **15** Verification plans
- **16** Acceptance results
- **17** Reliability/derating
- **18** Compliance evidence
- **19** GSE/TVAC fixtures
- **20** Cleanliness/prep records

---

### Deck H — Power / EPS / Harness
**For**: Cluster H

- **01** Generation (arrays/RTG/fuel cell)
- **02** Storage (battery modules)
- **03** Conversion/regulation (PCDU)
- **04** Distribution (LCLs/relays)
- **05** Protection (fuses/OVP/UVP)
- **06** Metering & sensors
- **07** Control & modes
- **08** Power harness & connectors
- **09** Thermal management
- **10** Grounding & bonding
- **11** EMI/EMC controls
- **12** Fault isolation
- **13** Power/energy budgets
- **14** SW & tables (PCDU/EPS)
- **15** Verification & acceptance
- **16** Inhibit lines & safety
- **17** Reliability/derating rules
- **18** Pinouts & ICDs
- **19** EGSE (array simulators)
- **20** Ops & maintenance

---

### Deck I — Ops / FDIR / Mission Ops
**For**: Clusters I, L

- **01** Mission planning
- **02** Modes & timelines
- **03** Procedures & scripts
- **04** Anomaly response
- **05** FDIR rules
- **06** Ground systems & MOC
- **07** Telemetry trending
- **08** Command products
- **09** Contingency profiles
- **10** Training & sims
- **11** Operations certification
- **12** Communications plan
- **13** Security operations
- **14** Config & releases
- **15** LEOP & handover
- **16** Maintenance & updates
- **17** Conjunction assessment
- **18** Data product distribution
- **19** Performance assessment
- **20** Archival

---

### Deck J — Docking / Sampling / Robotics
**For**: Cluster J

- **01** Sensing (VBN/LIDAR)
- **02** Soft capture/latching
- **03** Seals & pressure equalization
- **04** Umbilicals & transfers
- **05** Actuators & drives
- **06** Control & autonomy
- **07** Safety & abort logic
- **08** Calibration & fixtures
- **09** Thermal & contamination
- **10** Structural interfaces
- **11** Health monitoring
- **12** Interfaces & ICDs
- **13** Redundancy & power
- **14** EMC/EMI controls
- **15** GSE & alignment tools
- **16** Procedures & crew aids
- **17** HIL rigs & testbeds
- **18** Materials compatibility
- **19** Compliance (IDSS/etc.)
- **20** Spares & logistics

---

## Implementation Notes

### Structure Rules

1. **System level (`NN-LABEL/`)**: Only descriptors
   - README.md
   - system.meta.yml
   - interfaces.yml

2. **Subsystem level (`NN-XX-SUBSYSTEM/`)**: Only descriptors
   - README.md
   - subsystem.meta.yml

3. **Sub-subsystem level (`NN-XX-YY-SUBSUBSYSTEM/`)**: Full BEZ
   - DELs/ (ECSS, CCSDS, NASA)
   - PAx/ (ONB, OUT)
   - PLM/ (CAD, CAE, CAI, CAM, CAO, CAP, CAS, CAV, CMP)
   - QUANTUM_OA/ (GA, LP, MILP, QAOA, QOX, QP, QUBO, SA)
   - SUPPLIERS/ (BIDS, SERVICES)
   - policy/
   - tests/
   - META.json
   - inherit.json
   - domain-config.yaml
   - README.md

### UTCS Format

```
SPACE.SCI.<NN-LABEL>.<NN-XX-SUBSYSTEM>.<NN-XX-YY-SUBSUBSYSTEM>:REV
```

Examples:
```
SPACE.SCI.53-PRIMARY-STRUCTURE.53-10-PRIMARY-STRUCTURE.53-10-01-PRIMARY-ELEMENTS:rev[A]
SPACE.SCI.24-EPS-POWER.24-30-CONVERSION-REGULATION.24-30-03-CONVERSION-REGULATION:rev[A]
SPACE.SCI.71-MAIN-PROPULSION.71-40-THRUST-DEVICES.71-40-04-THRUSTERS-NOZZLES:rev[B]
```

### Shared Chapter 54

Chapter 54 (Propulsion Module Structure) is shared between AAA and PPP:

- **Use XX list from Cluster S** for structural packaging
- **Use YY deck A** if owned by AAA (structural focus)
- **Use YY deck B** if instantiated under PPP (propulsion focus)

### Complete Chapter → Cluster Mapping

- **Cluster E**: 01, 04, 05, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 98, 99
- **Cluster S**: 50, 51, 52, 53, 54*, 55, 56, 57, 94 (*shared with B)
- **Cluster G**: 21, 30
- **Cluster H**: 24, 39, 49, 97
- **Cluster F**: 23, 33, 48
- **Cluster N**: 31, 34, 41
- **Cluster C**: 40, 42, 93
- **Cluster L**: 22, 44, 45
- **Cluster D**: 25, 35, 36, 37, 38
- **Cluster B**: 28, 29, 47, 54*, 60, 61, 70-85 (*shared with S)
- **Cluster J**: 58, 59
- **Cluster R**: 15*, 26, 86, 87, 90 (*15 also in E for programmatic; use R for environment ownership)
- **Cluster I**: 07, 10, 16, 32, 46, 92
- **Cluster M**: 91, 95, 96

---

**Version**: SPACE-T 1.1 (Cluster-Based)  
**Date**: 2025-01-27  
**Maintained by**: IDEALE.eu Architecture Team
