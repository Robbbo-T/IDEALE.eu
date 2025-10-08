# Fastener Schedules

## Overview

This directory contains torque specifications, installation order sequences, and pattern definitions for critical structural joints in the **AMPEL360‑AIR‑T** BWB aircraft. Fastener schedules are essential for ensuring joint integrity, preventing over-torque damage, and maintaining structural load paths.

## Purpose

The fastener-schedules directory serves as the central repository for:

- **Torque specifications** for all critical fasteners in airframe assembly
- **Installation order sequences** ensuring proper load distribution and preventing distortion
- **Fastener pattern definitions** specifying type, size, spacing, and edge margins
- **Witness mark requirements** for torque verification and quality assurance
- **UTCS traceability** linking fastener schedules to structural analysis and quality records

## Contents Overview

### Schedule Types

1. **Major Structural Joint Fasteners**
   - Wing-to-body attachment bolts
   - Fuselage frame-to-skin fasteners
   - Spar splice joint bolts
   - Landing gear attachment fittings

2. **Secondary Structure Fasteners**
   - Floor beam attachments
   - Seat track installations
   - Panel close-out fasteners
   - Access door hinges and latches

3. **System Installation Fasteners**
   - System bracket attachments
   - Cable/harness routing clips
   - Duct support fasteners
   - Component mounting hardware

4. **Special Fastening Requirements**
   - Interference-fit fasteners (e.g., Hi-Lok, Huck bolts)
   - Torque-limited fasteners
   - Self-locking nuts (prevailing torque)
   - Blind fasteners for limited access areas

## File Naming Convention

Following the canonical naming pattern:

```
ASM-AAA-{ZONE}-FASTENER-{IDX}.{ext}
```

Where:
- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)
- `{IDX}` = 4-digit serial number (e.g., 0001, 0050, 0200)
- `{ext}` = File extension (`.md`, `.csv`, `.xlsx`, `.pdf`)

Examples:
- `ASM-AAA-ONB-FASTENER-0001.csv` — Wing-to-body fastener torque schedule
- `ASM-AAA-ONB-FASTENER-0012.md` — Center body frame fastener installation order
- `ASM-AAA-OUT-FASTENER-0042.pdf` — Outer wing skin fastener pattern drawing

## Expected File Types

- `.csv` — Fastener schedules with torque values, installation order
- `.md` — Fastener installation procedures and special instructions
- `.xlsx` — Complex fastener matrices with calculations
- `.pdf` — Fastener pattern drawings and torque application diagrams
- `.json` — Fastener metadata and traceability records
- `.jpg`, `.png` — Photos of witness mark locations and examples

## Fastener Schedule Template

Standard CSV format for fastener schedules:

```csv
Fastener_ID,Location,Type,Size,Material,Torque_Min_in-lb,Torque_Max_in-lb,Install_Order,Witness_Mark,QIP_Check,Notes
FB-001,WTB-Port-Fwd,Bolt,0.5-20,Ti-6Al-4V,250,275,1,Yes,Critical,Initial torque
FB-002,WTB-Port-Fwd,Bolt,0.5-20,Ti-6Al-4V,250,275,2,Yes,Critical,Cross-torque pattern
FB-003,WTB-Port-Fwd,Bolt,0.5-20,Ti-6Al-4V,250,275,3,Yes,Critical,Cross-torque pattern
...
```

### Column Definitions

- **Fastener_ID**: Unique identifier for each fastener (cross-reference to drawings)
- **Location**: Assembly location (e.g., WTB = Wing-To-Body, CB = Center Body)
- **Type**: Bolt, Screw, Rivet, Hi-Lok, Huck, etc.
- **Size**: Thread size and pitch (unified or metric)
- **Material**: Fastener material (titanium, steel, aluminum, etc.)
- **Torque_Min/Max**: Torque range in specified units (in-lb, ft-lb, N·m)
- **Install_Order**: Sequence number for installation
- **Witness_Mark**: Yes/No - whether witness mark required
- **QIP_Check**: Critical/Standard - inspection level required
- **Notes**: Special instructions, lubrication, sealant requirements

## TFA Context

Fastener schedules align with the TFA flow: **FE→CB→QB**

- **FE (Functional Execution)**: Orchestration of fastener installation across multiple joints
- **CB (Constraint-Based)**: Enforcement of torque limits, installation order, tool calibration
- **QB (Quantum-Based)**: Optimization of installation sequences to minimize cycle time

## Required Artifacts

Each fastener schedule must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Fastener Schedule | `.csv` or `.xlsx` | `UTCS-MI:ASM:FASTENER:{LOC}:{IDX}:v{X}` | 🔄 |
| Torque Procedure | `.md` or `.pdf` | `UTCS-MI:CAM:OPR:TORQUE:{IDX}:v{X}` | 🔄 |
| Pattern Drawing | `.pdf` or CAD | `UTCS-MI:CAD:AAA:FASTENER:{IDX}:rev{X}` | 🔄 |
| Tool Calibration Record | `.pdf` or `.json` | `UTCS-MI:CAV:CAL:TORQUE-TOOL:{ID}:v{X}` | 🔄 |
| QIP Torque Audit | `.csv` or report | `UTCS-MI:CAV:QIP:AAA:TORQUE-{IDX}:v{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Torque Application Methods

### Hand Torque Wrench

- **Use**: Most common for accessible fasteners
- **Calibration**: Required every 90 days or 5000 cycles
- **Technique**: Smooth, continuous pull without jerking
- **Verification**: Final value read while applying torque (not residual)

### Power Torque Tools

- **Use**: High-volume production, repetitive installations
- **Calibration**: Daily verification, full calibration every 30 days
- **Control**: Programmable torque settings with auto-shutoff
- **Data Recording**: Electronic capture of torque values for each fastener

### Torque-Tension Indicating

- **Use**: Critical joints where preload accuracy is essential
- **Method**: Direct bolt tension measurement (e.g., ultrasonic)
- **Advantage**: Compensates for friction variations
- **Application**: Landing gear, engine mount, wing carry-through

### Angle Tightening

- **Use**: Plastic region tightening for high preload joints
- **Method**: Initial torque to snug, then specified angle rotation
- **Advantage**: More consistent preload than torque-only
- **Application**: High-strength structural bolts

## Installation Order Strategies

### Cross-Pattern Tightening

For circular or rectangular patterns:

```
    7   3   8
    
    2   1   4
    
    6   5   9
```

- Start at center (1)
- Move to opposite sides in cross pattern
- Gradually tighten to final torque in multiple passes

### Progressive Tightening

For linear patterns (e.g., spar splice):

```
Pass 1:  [2] [4] [6] [8] [10] [12]
Pass 2:  [1] [3] [5] [7] [9] [11] [13]
Pass 3:  All fasteners to final torque
```

- Distribute load evenly across joint
- Minimize distortion of mating parts

### Parallel Tightening

For symmetric structures:

```
Port Side:     [1] [2] [3] [4]
Starboard:     [1] [2] [3] [4]
```

- Tighten corresponding port/starboard fasteners in parallel
- Maintains symmetry and prevents twist

## Quality and Inspection Requirements

### Pre-Installation Checks

- [ ] Fasteners inspected for damage, corrosion, proper batch/lot
- [ ] Holes inspected for damage, burrs, proper diameter and countersink
- [ ] Mating surfaces clean and free of foreign objects
- [ ] Sealant applied per specification (if required)
- [ ] Torque tools calibrated within validity period

### During Installation

- [ ] Fasteners installed in specified order per schedule
- [ ] Torque values recorded for critical fasteners
- [ ] Witness marks applied to critical fasteners after torque
- [ ] Out-of-tolerance fasteners identified and reported
- [ ] Real-time torque data captured for power tools

### Post-Installation Validation

- [ ] Random torque audit on specified % of fasteners per QIP
- [ ] Visual inspection of witness marks for alignment
- [ ] Documentation of any nonconformances
- [ ] Photographic evidence of completed joint
- [ ] UTCS traceability records generated

## Witness Mark Requirements

Witness marks provide visual verification that fasteners have not loosened:

### Application Method

1. Apply torque to specified value
2. Mark bolt head and adjacent surface with paint pen or marker
3. Mark should create a continuous line across bolt head and structure
4. Use contrasting color (e.g., white on dark surface, dark on light)

### Inspection Criteria

- **Acceptable**: Marks remain aligned (no rotation of fastener)
- **Unacceptable**: Marks misaligned, indicating fastener loosening
- **Action**: Re-torque and re-mark if misalignment detected

### Critical Fasteners

Witness marks required on:

- All primary structure fasteners (wing-to-body, landing gear)
- Fasteners with torque values >200 in-lb
- Self-locking nuts in vibration environments
- Fasteners specified as "critical" in stress analysis

## Torque Specifications by Fastener Type

### Aerospace Bolts (AN/NAS/MS Series)

| Type | Size | Material | Dry Torque (in-lb) | Lubricated Torque (in-lb) |
| :--- | :--- | :--- | :--- | :--- |
| AN3 | 10-32 | Steel | 20-25 | 15-20 |
| AN4 | 1/4-28 | Steel | 50-70 | 40-60 |
| AN5 | 5/16-24 | Steel | 100-140 | 80-110 |
| AN6 | 3/8-24 | Steel | 160-190 | 130-160 |
| AN7 | 7/16-20 | Steel | 450-500 | 360-400 |

*Note: Values are typical. Always refer to manufacturer specifications and structural analysis.*

### Hi-Lok and Hi-Tite Fasteners

- **Installation**: Torque until collar breaks off at preload groove
- **Verification**: Visual check for proper collar break
- **No torque value**: Preload controlled by collar design
- **Advantage**: No overtorque risk, consistent preload

### Huck Fasteners

- **Installation**: Hydraulic or pneumatic installation tool
- **Method**: Collar swaged onto pin until break groove separates
- **Verification**: Pin break-off and collar swage inspection
- **Application**: High-shear joints, production efficiency

## Nonconformance and Corrective Action

### Common Nonconformances

1. **Under-torque**: Fastener below minimum torque value
   - **Action**: Re-torque to specification, document
   
2. **Over-torque**: Fastener exceeds maximum torque value
   - **Action**: Engineering evaluation, possible replacement
   
3. **Stripped threads**: Threads damaged during installation
   - **Action**: Remove fastener, inspect hole, repair or oversize
   
4. **Cross-threaded**: Fastener installed at angle, damaging threads
   - **Action**: Remove, inspect, repair hole and replace fastener

5. **Wrong fastener installed**: Incorrect type, size, or material
   - **Action**: Remove, install correct fastener, verify with QIP

### Documentation

All nonconformances must be:

- Documented in Nonconformance Report (NCR)
- Evaluated by engineering for structural impact
- Corrective action approved by quality
- Re-inspected after correction
- Linked to UTCS for traceability

## Interfaces

### Input Interfaces

- **From CAE**: Joint stress analysis specifying fastener loads and preload requirements
- **From CAD**: Fastener patterns, hole locations, and edge margins
- **From Materials Engineering**: Fastener material specifications and torque-tension relationships
- **From Design Engineering**: Joint design and fastener selection

### Output Interfaces

- **To CAM/OPR**: Work instructions incorporating fastener schedules
- **To CAV/QIP**: Inspection criteria and torque audit requirements
- **To Training**: Fastener installation procedures for technician training
- **To Maintenance**: Torque specifications for in-service inspection

## Traceability and Evidence

All fastener schedules must reference:

1. **Design Authority**: UTCS anchors to structural analysis specifying fastener requirements
2. **Tool Calibration**: UTCS anchors to torque tool calibration records
3. **Installation Records**: UTCS anchors to torque values recorded during installation
4. **Quality Verification**: UTCS anchors to torque audit results

Example UTCS anchor chain:
```
UTCS-MI:CAE:AAA:STRESS:WTB-JOINT:v3  (structural analysis)
  → UTCS-MI:ASM:FASTENER:WTB:0001:v2  (fastener schedule)
  → UTCS-MI:CAV:CAL:TORQUE-TOOL:TW-042:v1  (tool calibration)
  → UTCS-MI:CAV:QIP:AAA:TORQUE-0001:v1  (torque audit)
```

## Safety Considerations

### Hazard Log References

- **HZ-AAA-OVERTORQUE-xxx**: Risk of fastener failure due to excessive torque
- **HZ-AAA-UNDERTORQUE-xxx**: Risk of joint loosening due to insufficient preload
- **HZ-AAA-TOOL-xxx**: Risk of injury from power tool operation
- **HZ-AAA-FOREIGN-OBJECT-xxx**: Risk of debris in critical joints

### Personal Protective Equipment

- **Safety glasses**: Required for all fastener installation
- **Hearing protection**: Required for power tool operation
- **Anti-fatigue mats**: Recommended for repetitive torque operations
- **Gloves**: Use with caution (can affect torque accuracy)

## KPIs for Fastener Installation

Tracked via CI/CD pipeline:

- **Torque compliance rate**: Target >99.5% of fasteners within specification
- **First-time-right rate**: Target >98% (no rework required)
- **Nonconformance rate**: Target <100 ppm (parts per million)
- **Tool calibration compliance**: Target 100% of tools within calibration date
- **Torque audit pass rate**: Target >99% on random audit inspections

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Major structural joints requiring fastener schedules
- [`../system-installation-steps/`](../system-installation-steps/) — System fasteners and mounting hardware
- [`../qip-hold-points/`](../qip-hold-points/) — Quality inspection gates for torque verification
- [`../tolerance-stackups/`](../tolerance-stackups/) — Impact of fastener installation on assembly tolerances
- `../../CAE/` — Structural analysis specifying fastener requirements
- `../../../CAM/OPR/` — Work instructions incorporating torque procedures
- `../../../CAV/QIP/` — Quality plans and torque audit procedures

## Standards and References

- **NASM 1312-xx**: Fastener torque specifications (various fastener types)
- **MIL-STD-1312**: Fastener Test Methods (torque-tension relationships)
- **ASME B1.1**: Unified Screw Threads
- **ISO 898**: Mechanical properties of fasteners
- **ISO 5393**: Rotary tools for threaded fasteners
- **EASA CS-25.613**: Material strength properties and design values
- **AC 43.13-1B**: Acceptable Methods, Techniques, and Practices (torque values)

## Governance and Reviews

### Approval Authority

- **Schedule Owner**: Structures Stress Engineer
- **Technical Approval**: Structures Chief Engineer
- **Quality Approval**: Airworthiness Certification Engineer
- **Manufacturing Approval**: Manufacturing Engineering Lead

### Review Gates

- **M4 (Critical Design Review)**: Fastener schedules finalized and approved
- **M5 (Installation Readiness)**: First article installation verified
- **In-Service**: Periodic audits and lessons learned updates

### Change Control

All updates to fastener schedules must:

1. Undergo engineering analysis of structural impact
2. Update affected work instructions and training materials
3. Notify quality for inspection procedure updates
4. Obtain multi-disciplinary approval
5. Validate via first article or test specimen

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 Structures Engineering Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
