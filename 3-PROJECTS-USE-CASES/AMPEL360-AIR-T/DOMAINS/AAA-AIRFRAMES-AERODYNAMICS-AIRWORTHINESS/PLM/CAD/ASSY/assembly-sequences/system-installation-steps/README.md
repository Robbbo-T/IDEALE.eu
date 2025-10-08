# System Installation Steps

## Overview

This directory contains sequences and procedures for integrating large mechanical, electrical, and systems components into the **AMPEL360‑AIR‑T** BWB airframe after major structural joins are complete. System installation is a critical phase that requires careful coordination between multiple disciplines and precise sequencing to avoid access conflicts.

## Purpose

The system-installation-steps directory serves as the central repository for:

- **System integration sequences** defining chronological installation order for major subsystems
- **Multi-discipline coordination** plans ensuring electrical, mechanical, hydraulic, and environmental systems are integrated efficiently
- **Access conflict resolution** addressing tool reach and component routing through limited openings
- **Installation validation checkpoints** with functional tests and interface verification
- **UTCS traceability** linking installation procedures to design, analysis, and quality records

## Contents Overview

### Major Systems Categories

1. **Landing Gear Systems**
   - Main landing gear installation and rigging
   - Nose landing gear integration
   - Gear actuation system routing and testing
   - Wheel well close-out sequences

2. **Propulsion System Integration**
   - Engine installation (if applicable for BWB configuration)
   - Nacelle attachment procedures
   - Fuel system installation and testing
   - Engine accessory systems integration

3. **Environmental Control Systems (ECS)**
   - Main duct installation through center body
   - Air distribution system components
   - Pack installation and connection
   - Bleed air system integration

4. **Hydraulic Systems**
   - Hydraulic pump installation
   - Hydraulic line routing and connection
   - Reservoir and accumulator installation
   - System pressure testing

5. **Electrical Power Systems**
   - Generator installation and connection
   - Main electrical harness routing
   - Distribution panels and circuit breakers
   - Auxiliary power unit (APU) integration

6. **Flight Control Systems**
   - Actuator installation for control surfaces
   - Mechanical linkage and cable routing
   - Fly-by-wire computer installation
   - Control surface rigging and testing

7. **Fuel Systems**
   - Fuel tank sealing and testing
   - Fuel pump installation
   - Fuel line routing and connection
   - Fuel quantity indication system

8. **Interior Systems**
   - Floor panel installation
   - Seat tracks and monuments
   - Cabin systems (IFE, lighting, oxygen)
   - Cargo handling systems

## File Naming Convention

Following the canonical naming pattern:

```
ASM-AAA-{ZONE}-SYS-{IDX}.md
```

Where:
- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)
- `{IDX}` = 4-digit serial number (e.g., 0001, 0050, 0125)

Examples:
- `ASM-AAA-ONB-SYS-0001.md` — Main landing gear installation sequence
- `ASM-AAA-ONB-SYS-0015.md` — ECS main duct installation
- `ASM-AAA-OUT-SYS-0042.md` — Wing leading edge systems installation

## Expected File Types

- `.md` — Installation procedure documentation in Markdown format
- `.pdf` — System installation drawings and schematics
- `.json` — Metadata, traceability records, and interface matrices
- `.csv` — Connector pin-out tables, torque specifications
- `.step`, `.stp` — 3D geometry of systems and installation tooling
- `.mp4`, `.avi` — Installation simulation videos and training materials
- `.xlsx` — Installation sequence matrices and dependency charts

## TFA Context

System installation aligns with the TFA flow: **UE→FE→CB→QB**

- **UE (Uncertainty Envelope)**: Deterministic snapshots of installation states at quality gates
- **FE (Functional Execution)**: Cross-subsystem orchestration (e.g., electrical routing vs. hydraulic line placement)
- **CB (Constraint-Based)**: Enforcement of clearances, access limitations, cure windows for sealants
- **QB (Quantum-Based)**: Optimization of parallel installations, resource scheduling, and line balancing

## Required Artifacts

Each system installation must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Installation Procedure | `.md` or `.pdf` | `UTCS-MI:ASM:SYS:{ZONE}:{IDX}:v{X}` | 🔄 |
| System Interface Document | `.pdf` or `.json` | `UTCS-MI:SYS:ICD:{SYSTEM}:{IDX}:v{X}` | 🔄 |
| Wiring/Routing Diagram | `.pdf` or CAD | `UTCS-MI:ELEC:ROUTING:{IDX}:rev{X}` | 🔄 |
| Functional Test Procedure | `.md` or `.pdf` | `UTCS-MI:CAV:TEST:{SYSTEM}:{IDX}:v{X}` | 🔄 |
| Installation QIP Checklist | `.md` or `.json` | `UTCS-MI:CAV:QIP:AAA:SYS-{IDX}:v{X}` | 🔄 |
| Tool Access Validation | Report or DMU | `UTCS-MI:ASM:TOOL:SYS-{IDX}:v{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Installation Sequencing Considerations

### Critical Path Analysis

Systems must be installed in a sequence that minimizes:

1. **Access conflicts**: Heavy/bulky items installed before close-out panels
2. **Rework risk**: Systems with high adjustment needs installed with flexibility for late changes
3. **Testing dependencies**: Systems required for other system tests installed early
4. **Parallel operations**: Independent systems installed simultaneously to reduce cycle time

### Typical Installation Order

For BWB center body (example sequence):

1. **Phase 1 - Major mechanical systems** (landing gear, main ducts)
2. **Phase 2 - Primary electrical harnesses** (main power distribution)
3. **Phase 3 - Hydraulic systems** (pumps, lines, actuators)
4. **Phase 4 - Secondary systems** (ECS components, fuel system details)
5. **Phase 5 - Flight control systems** (actuators, linkages)
6. **Phase 6 - Interior systems** (floors, seats, monuments)
7. **Phase 7 - Close-out and final connections** (panels, access doors)

### Access Gates and Hold Points

Installation sequences define "access gates" - points where panels must remain open for specific system work:

- **Forward access gate**: Open until avionics and flight deck systems complete
- **Center wheel well gate**: Open until landing gear final rigging complete
- **Aft fuselage gate**: Open until APU and tail systems installed
- **Wing root gate**: Open until wing-to-body system connections complete

## Quality and Inspection Requirements

### Pre-Installation Checks

- [ ] System components inspected and conform to specifications
- [ ] Installation area prepared (cleanliness, protective coatings applied)
- [ ] Required tooling and fixtures available and calibrated
- [ ] Interface dimensions verified (mating points, mounting holes)
- [ ] Personnel trained on installation procedure and safety requirements

### During Installation

- [ ] Torque values recorded for all critical fasteners
- [ ] Electrical continuity and insulation resistance tested
- [ ] Hydraulic line pressure tested per specification
- [ ] Clearances verified between systems and structure
- [ ] Support bracket alignment verified
- [ ] Chafe protection applied at all contact points

### Post-Installation Validation

- [ ] Functional tests performed per system specification
- [ ] Interface tests completed (power, signal, hydraulic connections)
- [ ] Installation completeness verified against parts list
- [ ] Photographic evidence of completed installation
- [ ] QIP hold points signed off by authorized inspector
- [ ] UTCS traceability records generated and anchored

## Interfaces

### Input Interfaces

- **From CAD/ASSY**: System installation envelopes, clearance analysis
- **From System Design**: Interface control documents (ICDs), connector specifications
- **From Manufacturing Engineering**: Tooling designs, work instructions, ergonomic analysis
- **From Major Section Joins**: Completed structural assembly ready for systems integration

### Output Interfaces

- **To CAV/QIP**: Functional test results, installation acceptance records
- **To CAI/INS**: Installation completeness for final integration testing
- **To CAS/AMM**: Installation configuration for maintenance procedures
- **To Flight Test**: System integration status for aircraft acceptance

## Traceability and Evidence

All installation procedures must reference:

1. **Design Authority**: UTCS anchors to approved system designs and specifications
2. **Installation Planning**: UTCS anchors to DMU validation of installation sequence
3. **Process Validation**: UTCS anchors to first article installation reports
4. **Quality Records**: UTCS anchors to inspection and test results

Example UTCS anchor chain:
```
UTCS-MI:SYS:DESIGN:ECS:MAIN-DUCT:v3  (design authority)
  → UTCS-MI:ASM:DMU:SYS-0015:v2  (installation simulation)
  → UTCS-MI:ASM:SYS:ONB:0015:v1  (installation procedure)
  → UTCS-MI:CAV:QIP:AAA:SYS-0015:v1  (inspection results)
  → UTCS-MI:CAV:TEST:ECS:DUCT-PRESS:v1  (functional test)
```

## Safety Considerations

### Hazard Log References

System installation involves multiple safety risks:

- **HZ-AAA-ELEC-xxx**: Electrical shock hazards during power system installation
- **HZ-AAA-HYDRAULIC-xxx**: High-pressure hydraulic system hazards
- **HZ-AAA-CONFINED-xxx**: Confined space entry for internal installations
- **HZ-AAA-HEAVY-xxx**: Heavy component lifting and positioning
- **HZ-AAA-FUEL-xxx**: Fuel system hazards (flammability, toxicity)

### Lock-Out/Tag-Out (LOTO)

All system installations must follow LOTO procedures:

- Electrical systems: Power sources locked out during installation
- Hydraulic systems: Pressure relieved and locked out
- Fuel systems: Isolated and purged before work
- Pneumatic systems: Depressurized and tagged

### Personal Protective Equipment (PPE)

Required PPE varies by system:

- **Electrical work**: Insulated gloves, arc flash protection
- **Hydraulic work**: Chemical-resistant gloves, face shield
- **Fuel systems**: Fire-resistant clothing, respirator
- **Confined spaces**: Harness, air monitoring, communication equipment

## KPIs for System Installation

Tracked via CI/CD pipeline:

- **Installation cycle time**: Target time from major join completion to system functional test
- **First-time-right rate**: Target >90% for system installations without rework
- **Access conflict incidents**: Count of interference issues requiring sequence changes
- **Functional test pass rate**: Target >95% on first functional test
- **Safety incidents**: Target 0 incidents per system installation
- **Completeness at gate**: % of planned systems installed by each quality gate

## Coordination and Communication

### Multi-Discipline Integration Meetings

Weekly installation coordination meetings address:

- **Sequence conflicts**: Resolve access and timing conflicts between disciplines
- **Resource constraints**: Tooling, personnel, and material availability
- **Quality issues**: Address inspection findings and corrective actions
- **Schedule updates**: Track progress against installation plan
- **Lessons learned**: Capture improvements for future installations

### Interface Responsibility Matrix

Defines ownership for system-to-system interfaces:

| Interface | Primary Responsibility | Secondary Responsibility | Review Authority |
| :--- | :--- | :--- | :--- |
| Electrical-to-Hydraulic | Electrical Systems | Hydraulic Systems | Systems Integration Lead |
| Structure-to-System | Structures | Responsible System | AAA Integration Lead |
| System-to-System (mechanical) | Primary System | Secondary System | Systems Integration Lead |

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Structural joins completed before system installation
- [`../digital-mockup-sims/`](../digital-mockup-sims/) — DMU validation of installation sequences
- [`../fastener-schedules/`](../fastener-schedules/) — System attachment fastener specifications
- [`../tool-access-plans/`](../tool-access-plans/) — Tooling and access analysis for installations
- [`../tolerance-stackups/`](../tolerance-stackups/) — System interface tolerance analysis
- [`../qip-hold-points/`](../qip-hold-points/) — Quality gates during installation
- `../../../CAI/INS/` — Final integration and testing procedures
- `../../../CAV/QIP/` — System acceptance test procedures

## Standards and References

- **ATA Chapters**: System-specific maintenance manual standards (ATA 29 Hydraulic, ATA 24 Electrical, etc.)
- **SAE AS50881**: Wiring Aerospace Vehicle standard
- **MIL-STD-1472**: Human Engineering design criteria
- **EASA CS-25**: Certification specifications for systems integration
- **ATA iSpec 2200**: Illustrated parts data standards
- **S1000D**: International technical publication specification

## Governance and Reviews

### Approval Authority

- **Procedure Owner**: Systems Integration Lead
- **Technical Approval**: Chief Systems Engineer
- **Quality Approval**: Systems Airworthiness Engineer
- **Safety Approval**: Safety & Hazard Analysis Lead

### Review Gates

- **M3 (System Design Review)**: System specifications and interface definitions
- **M4 (Critical Design Review)**: Installation procedures and tooling validated
- **M5 (Installation Readiness)**: First article installation complete and verified
- **Pre-Flight Test**: All systems installed and functionally tested

### Change Control

All updates to installation procedures must:

1. Undergo engineering change process with impact assessment
2. Coordinate with all affected disciplines
3. Update interface control documents
4. Revise work instructions and training materials
5. Validate changes via DMU or mockup
6. Obtain multi-disciplinary approval before release

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 Systems Integration Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
