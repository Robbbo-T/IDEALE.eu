# Major Section Joins

## Overview

This directory contains joining procedures and documentation for main BWB (Blended Wing Body) sections for the **AMPEL360‑AIR‑T** aircraft. These are critical structural joints that connect major airframe components, such as center body to outer wing sections, and form the primary load paths of the aircraft structure.

## Purpose

The major-section-joins directory serves as the central repository for:

- **Join sequence procedures** defining step-by-step assembly of major structural sections
- **Interface control documents** specifying mating surface requirements and tolerances
- **Structural joining methods** including fastener patterns, bonding, and splice joints
- **Quality inspection gates** for critical structural interfaces
- **UTCS traceability links** for all join procedures and validation evidence

## Contents Overview

### Key Join Areas

1. **Center Body to Outer Wing (CB↔OW)**
   - Port and starboard wing attachment sequences
   - Main spar splice joints
   - Wing box closure procedures
   
2. **Forward Fuselage to Center Body (FF↔CB)**
   - Nose section integration
   - Flight deck structural interface
   - Forward pressure bulkhead connection

3. **Aft Body Integration (AB↔CB)**
   - Tail cone attachment procedures
   - Aft pressure bulkhead interface
   - Engine pylon structural joints (if applicable)

4. **Major Frame Splice Joints**
   - Circumferential frame joins
   - Longitudinal stringer splices
   - Skin panel edge joins

## File Naming Convention

Following the canonical naming pattern from parent README:

```
ASM-AAA-{ZONE}-JOIN-{IDX}.md
```

Where:
- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)
- `{IDX}` = 4-digit serial number (e.g., 0001, 0012, 0025)

Examples:
- `ASM-AAA-ONB-JOIN-0001.md` — Center body to outer wing port side join
- `ASM-AAA-ONB-JOIN-0002.md` — Center body to outer wing starboard side join
- `ASM-AAA-OUT-JOIN-0015.md` — Outer wing skin panel joins

## Expected File Types

- `.md` — Join procedure documentation in Markdown format
- `.pdf` — Engineering drawings and join detail specifications
- `.json` — Metadata and traceability records
- `.csv` — Fastener schedules and torque tables for specific joins
- `.step`, `.stp` — 3D geometry of joint interfaces and tooling
- `.mp4`, `.avi` — DMU simulation videos of join sequences

## TFA Context

Major section joins align with the TFA flow: **FE→CB→QB**

- **FE (Functional Execution)**: Orchestration of multiple subsystems (structure, sealing, electrical harness routing through joints)
- **CB (Constraint-Based)**: Enforcement of clearances, cure windows (for adhesive bonding), tool access limitations
- **QB (Quantum-Based)**: Optimization of resource scheduling, parallel join operations, and line balancing

## Required Artifacts

Each major section join must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Join Procedure Document | `.md` or `.pdf` | `UTCS-MI:ASM:JOIN:{ZONE}:{IDX}:v{X}` | 🔄 |
| Interface Control Drawing | `.pdf` or `.step` | `UTCS-MI:CAD:AAA:ICD:{IDX}:rev{X}` | 🔄 |
| Fastener Schedule | `.csv` or table in `.md` | `UTCS-MI:ASM:FASTENER:{IDX}:v{X}` | 🔄 |
| QIP Hold Points | `.md` or `.json` | `UTCS-MI:CAV:QIP:AAA:JOIN-{IDX}:v{X}` | 🔄 |
| DMU Validation | Video or report | `UTCS-MI:ASM:DMU:JOIN-{IDX}:v{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Quality and Inspection Requirements

### Pre-Assembly Checks

- [ ] Mating surface cleanliness verified (visual and particle count)
- [ ] Interface geometry measured and within tolerance (see `../tolerance-stackups/`)
- [ ] Fastener holes inspected for damage, burrs, and dimensional conformance
- [ ] Sealant and bonding materials within shelf life and properly stored
- [ ] Tooling calibrated and fixture alignment verified

### During Assembly

- [ ] Hole alignment verified before fastener installation
- [ ] Gap measurements recorded at specified stations
- [ ] Fastener torque applied per schedule with calibrated tools
- [ ] Witness marks applied for critical torque applications
- [ ] Real-time monitoring of cure process for bonded joints (if applicable)

### Post-Assembly Validation

- [ ] Final torque audit on sample fasteners
- [ ] Non-destructive testing (NDT) per specification (ultrasonics, X-ray, etc.)
- [ ] Dimensional verification of final assembly
- [ ] Leak testing for pressurized sections
- [ ] Photographic evidence of completed join with serial number visible

## Interfaces

### Input Interfaces

- **From CAD/ASSY**: Master assembly models, interface definitions, clearance analysis
- **From CAE**: Structural analysis results, load paths, fastener sizing
- **From CAM/OPR**: Tooling availability, fixture designs, work instructions
- **From PAx**: Accessibility studies, ergonomic analysis, service access requirements

### Output Interfaces

- **To CAM/OPR**: Validated assembly procedures ready for shop floor execution
- **To CAV/QIP**: Inspection plans, hold points, acceptance criteria
- **To CAS/AMM**: Maintenance procedures for join disassembly/reassembly
- **To Evidence Engine**: UTCS-anchored traceability records

## Traceability and Evidence

All join procedures must reference:

1. **Geometry Evidence**: UTCS anchors to CAD models defining the joint interface
2. **Analysis Evidence**: UTCS anchors to structural analysis validating the joint design
3. **Process Evidence**: UTCS anchors to manufacturing process specifications
4. **Quality Evidence**: UTCS anchors to inspection results and acceptance records

Example UTCS anchor chain:
```
UTCS-MI:CAD:AAA:ASSY:57-10:revC  (geometry)
  → UTCS-MI:CAE:AAA:STRESS:57-10-JOINT:v2  (analysis)
  → UTCS-MI:ASM:JOIN:ONB:0012:v1  (procedure)
  → UTCS-MI:CAV:QIP:AAA:JOIN-0012:v1  (inspection)
```

## Safety Considerations

### Hazard Log References

Major section joins involve large structures and heavy lifting operations. All procedures must reference relevant hazard log entries:

- **HZ-AAA-LIFT-xxx**: Crane and lifting operations for large assemblies
- **HZ-AAA-PRESS-xxx**: Pressurized joint integrity and leak hazards
- **HZ-AAA-TORQUE-xxx**: Fastener over-torque or under-torque risks
- **HZ-AAA-ACCESS-xxx**: Personnel safety in confined spaces during join operations

### MAL-EEM Checklist

All join procedures must complete MAL-EEM (Minimal Assurance Level - Ethics, Evidence, Methods) checklist items:

- **Ethics**: Worker safety protocols documented and trained
- **Evidence**: All critical parameters recorded with UTCS anchors
- **Methods**: Validated procedures with DMU simulation and first article inspection

## KPIs for Major Joins

Tracked via CI/CD pipeline:

- **First-time-right rate**: Target >95% for major joins
- **Rework incidents**: Target <5% requiring fastener removal/reinstallation
- **Cycle time**: Measured from first mate to final torque completion
- **Gap compliance**: % of measured gaps within tolerance band
- **Torque compliance**: % of fasteners achieving specified torque range
- **Safety incidents**: Target 0 incidents per major join operation

## Related Directories

- [`../system-installation-steps/`](../system-installation-steps/) — Subsystem integration after major joins
- [`../digital-mockup-sims/`](../digital-mockup-sims/) — DMU animations validating join sequences
- [`../fastener-schedules/`](../fastener-schedules/) — Detailed fastener torque and order schedules
- [`../tool-access-plans/`](../tool-access-plans/) — Fixture and tooling reach studies
- [`../tolerance-stackups/`](../tolerance-stackups/) — Interface tolerance analysis
- [`../qip-hold-points/`](../qip-hold-points/) — Quality inspection gates
- `../../CAE/` — Structural analysis supporting joint design
- `../../../CAV/QIP/` — Quality inspection procedures and results

## Standards and References

- **EASA CS-25**: Certification Specifications for Large Aeroplanes (structural requirements)
- **ATA iSpec 2200**: Information Standards for Aviation Maintenance
- **NASM (National Aerospace Standards - Mechanical)**: Fastener specifications
- **Boeing BAC 5XXX**: Process specifications for structural assembly (reference)
- **Airbus AIMS**: Assembly and Installation Manual Standards (reference)
- **ISO 10303-242**: STEP AP242 for CAD data exchange

## Governance and Reviews

### Approval Authority

- **Procedure Owner**: AAA Integration Lead
- **Technical Approval**: Structures Chief Engineer
- **Quality Approval**: Airworthiness Certification Engineer
- **Safety Approval**: Safety & Hazard Analysis Lead

### Review Gates

- **M2 (Preliminary Design Review)**: Join concepts and interface definitions
- **M4 (Critical Design Review)**: Detailed join procedures and tooling plans
- **M5 (Installation Readiness Review)**: First article completion and validation
- **Pre-EIS (Entry Into Service)**: PPAP/FAI sign-off for production

### Change Control

All updates to join procedures must:

1. Follow PR workflow with UTCS evidence links
2. Undergo engineering impact assessment
3. Obtain multi-disciplinary approval
4. Update affected downstream documents (QIP, work instructions, training)
5. Validate via CI/CD checks (link validation, format compliance)

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 AAA Integration Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
