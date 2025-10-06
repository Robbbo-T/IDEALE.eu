# Tool Access Plans

## Overview

This directory contains fixture reach studies, crane/AGV path planning, and reposition budget documentation for the **AMPEL360‑AIR‑T** BWB aircraft assembly. Tool access planning is critical for ensuring that all assembly operations can be physically performed with available equipment and within ergonomic constraints.

## Purpose

The tool-access-plans directory serves as the central repository for:

- **Fixture reach studies** validating that tooling can access all required fastener locations
- **Crane and AGV path planning** defining safe and efficient material handling routes
- **Reposition budgets** documenting allowable component movements during assembly
- **Ergonomic analysis** ensuring worker safety and efficiency
- **UTCS traceability** linking tool access validation to assembly procedures and equipment specifications

## Contents Overview

### Study Types

1. **Fixture and Jig Reach Analysis**
   - Drill/rivet gun access to fastener holes
   - Torque wrench reach for critical fasteners
   - Inspection tool access for quality verification
   - Cleco/temporary fastener installation access

2. **Crane and Lifting Path Planning**
   - Overhead crane travel paths for major components
   - Clearance analysis for crane hook and sling assemblies
   - Load swing and pendulum motion envelopes
   - Crane interference with structure and other equipment

3. **AGV (Automated Guided Vehicle) Routes**
   - Transport paths for moving assemblies between stations
   - Floor clearances and obstacle avoidance
   - Turning radius and positioning accuracy requirements
   - Integration with factory layout and workflow

4. **Component Reposition Studies**
   - Allowable rotations and translations during assembly
   - Fixture adjustment ranges and degrees of freedom
   - Sequence of repositions to minimize handling
   - Impact of repositions on dimensional control

5. **Ergonomic and Worker Access**
   - Reach envelopes for assembly personnel
   - Posture analysis for repetitive operations
   - Platform and scaffold requirements
   - Fatigue analysis for extended operations

## File Naming Convention

Following the canonical naming pattern:

```
ASM-AAA-{ZONE}-TOOL-{IDX}.{ext}
```

Where:
- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)
- `{IDX}` = 4-digit serial number (e.g., 0001, 0025, 0100)
- `{ext}` = File extension based on content type

Examples:
- `ASM-AAA-ONB-TOOL-0001.pdf` — Wing-to-body join fixture reach study
- `ASM-AAA-ONB-TOOL-0015.mp4` — Crane path animation for center body positioning
- `ASM-AAA-OUT-TOOL-0042.md` — AGV transport plan for outer wing panels

## Expected File Types

- `.pdf` — Reach study reports, clearance drawings, ergonomic analysis
- `.md` — Tool access procedures, reposition plans, study summaries
- `.json` — Metadata, equipment specifications, clearance measurements
- `.csv` — Reposition budgets, access point coordinates
- `.step`, `.stp` — 3D models of tooling, fixtures, and access envelopes
- `.mp4`, `.avi` — Animation of crane paths, AGV routes, fixture motions
- `.jpg`, `.png` — Diagrams, photos of access constraints, ergonomic poses
- `.xlsx` — Reposition tracking spreadsheets, equipment capacity matrices

## TFA Context

Tool access plans align with the TFA flow: **CB (Constraint-Based)**

- **CB**: Enforcement and validation of physical constraints including:
  - Tool reach limitations
  - Equipment capacities (crane load ratings, AGV weight limits)
  - Clearance requirements
  - Ergonomic boundaries
  - Reposition budgets affecting dimensional stack-up

## Required Artifacts

Each tool access plan must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Reach Study Report | `.pdf` or `.md` | `UTCS-MI:ASM:TOOL:ACCESS-{IDX}:v{X}` | 🔄 |
| Crane Path Plan | `.pdf` or video | `UTCS-MI:CAM:CRANE:PATH-{IDX}:v{X}` | 🔄 |
| AGV Route Definition | `.json` or drawing | `UTCS-MI:CAM:AGV:ROUTE-{IDX}:v{X}` | 🔄 |
| Reposition Budget | `.csv` or table | `UTCS-MI:ASM:REPOSITION:{IDX}:v{X}` | 🔄 |
| Ergonomic Analysis | `.pdf` or report | `UTCS-MI:CAM:ERGO:{IDX}:v{X}` | 🔄 |
| Tooling Specification | `.pdf` or CAD | `UTCS-MI:CAM:FIX:{TOOL-ID}:rev{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Fixture and Jig Reach Analysis

### Objectives

- Verify that all fastener holes can be accessed by required tools
- Identify areas requiring special tooling or alternative methods
- Validate fixture positioning and orientation
- Ensure clearances for tool head, operator hand, and power source

### Analysis Process

1. **Model Preparation**
   - Import assembly CAD model with all components in position
   - Add fixture and jig models at planned locations
   - Define tool envelopes (drill, rivet gun, torque wrench, etc.)

2. **Reach Simulation**
   - Position tool at each fastener location
   - Check for interferences between tool and structure
   - Verify adequate clearance for tool operation
   - Validate access angle meets tool specifications

3. **Results Documentation**
   - Identify all access conflicts
   - Propose solutions (fixture adjustments, special tooling, sequence changes)
   - Document acceptable access points
   - Generate visual reports with color-coded access map

### Access Classification

- **Green (Full Access)**: Standard tooling can reach with no restrictions
- **Yellow (Limited Access)**: Requires special tooling or non-optimal angle
- **Red (No Access)**: Cannot be accessed with current plan, design change required

## Crane and Lifting Path Planning

### Objectives

- Define safe crane travel paths for all major component movements
- Validate clearances throughout crane motion
- Ensure load capacities and rigging are adequate
- Minimize cycle time while maintaining safety

### Planning Considerations

1. **Load Characteristics**
   - Component weight and center of gravity
   - Sling and spreader bar configuration
   - Load stability during transport

2. **Clearance Requirements**
   - Minimum clearance between load and obstacles (typically 300mm / 12")
   - Crane hook height availability
   - Overhead structure and utilities

3. **Path Optimization**
   - Minimize total travel distance
   - Avoid congested areas and other operations
   - Plan for load swing damping time before precision positioning

4. **Safety Considerations**
   - No personnel under suspended loads
   - Exclusion zones during crane operations
   - Emergency procedures and load release plans

### Crane Path Documentation

- **Start position**: Load pickup point (coordinates, orientation)
- **Waypoints**: Intermediate positions avoiding obstacles
- **End position**: Load set-down point with final orientation
- **Travel envelope**: 3D volume occupied by load during motion
- **Clearances**: Minimum distances to structure at all points
- **Duration**: Estimated time for lift operation

## AGV Transport Planning

### Objectives

- Define efficient AGV routes for moving assemblies between workstations
- Validate floor clearances and turning radii
- Integrate with factory traffic management
- Ensure positioning accuracy at destination

### Route Definition

1. **Waypoint Planning**
   - Define path as series of waypoints with coordinates
   - Specify travel speed and acceleration limits
   - Identify slow zones near personnel or obstacles

2. **Clearance Validation**
   - Verify minimum clearances to walls, equipment, structures
   - Check for floor obstructions (drains, expansion joints)
   - Validate overhead clearances for tall loads

3. **Turning Analysis**
   - Calculate turning radius for AGV and load
   - Verify adequate aisle width for turns
   - Plan multi-point turns for tight spaces

4. **Docking Precision**
   - Define positioning accuracy requirements at destination
   - Specify alignment aids (targets, sensors, guides)
   - Plan for fine adjustment after AGV positioning

### AGV Integration

- **Traffic Management**: Coordinate with other AGV routes and schedules
- **Priority Rules**: Define right-of-way at intersections
- **Safety Sensors**: Obstacle detection and emergency stop zones
- **Communication**: Integration with factory MES (Manufacturing Execution System)

## Reposition Budgets

### Purpose

Reposition budgets track allowable component movements during assembly to maintain dimensional control. Each reposition can introduce positional error that accumulates through the assembly sequence.

### Budget Allocation

| Operation | Translation (mm) | Rotation (degrees) | Cumulative Error (mm) |
| :--- | :--- | :--- | :--- |
| Initial fixture placement | ±2.0 | ±0.5 | 2.0 |
| Crane lift and transport | ±3.0 | ±1.0 | 5.0 |
| Set on assembly jig | ±1.5 | ±0.3 | 6.5 |
| Adjust for mate | ±1.0 | ±0.2 | 7.5 |
| Final position (tolerance budget) | --- | --- | ±10.0 (spec) |

**Reposition Margin**: 2.5 mm (10.0 - 7.5)

### Reposition Tracking

Each reposition must be documented:

- **What**: Component being moved
- **From/To**: Start and end positions
- **Method**: Crane, AGV, manual, fixture adjustment
- **Accuracy**: Expected positional accuracy of method
- **Cumulative**: Running total of positional uncertainty
- **Mitigation**: Metrology checks, shimming, alignment aids

### Best Practices

- **Minimize repositions**: Plan sequences to reduce component handling
- **Metrology at gates**: Measure actual position after critical repositions
- **Adjust budget**: Update budget based on actual measurements
- **Reserve margin**: Don't consume entire reposition budget, leave margin for adjustments

## Ergonomic and Worker Access Analysis

### Objectives

- Ensure assembly operations can be performed safely and efficiently
- Minimize worker fatigue and repetitive strain injuries
- Validate platform and scaffold requirements
- Optimize work height and reach distances

### Analysis Methods

1. **Reach Envelope Analysis**
   - Define worker reach zones (optimal, acceptable, marginal)
   - Optimal: Within 50cm of shoulder, no bending or stretching
   - Acceptable: Requires reaching or slight bending
   - Marginal: Extreme reaches, requires ladders or platforms

2. **Posture Assessment**
   - RULA (Rapid Upper Limb Assessment) for repetitive tasks
   - OWAS (Ovako Working Posture Analysis System) for whole body
   - Identify operations requiring awkward postures
   - Propose workstation modifications or tooling changes

3. **Force Analysis**
   - Measure forces required for tool operation
   - Validate against ergonomic limits (typically <25 lbf / 110 N for extended operations)
   - Consider powered assist for high-force operations

4. **Duration and Frequency**
   - Estimate time spent in each posture
   - Calculate repetition rates for repeated motions
   - Identify operations exceeding fatigue limits

### Ergonomic Solutions

- **Adjustable platforms**: Bring work to optimal height
- **Balanced tool arms**: Reduce weight of heavy tools
- **Rotating fixtures**: Reorient work to optimal position
- **Team lifting**: Multiple workers for heavy/awkward parts
- **Powered assist**: Manipulators and hoists for heavy components

## Quality and Validation

### Pre-Execution Validation

- [ ] All tool access conflicts resolved or mitigated
- [ ] Crane paths simulated and clearances verified
- [ ] AGV routes programmed and tested
- [ ] Reposition budget allocated and tracked
- [ ] Ergonomic assessment completed and approved

### During Execution

- [ ] Tool access issues documented and resolved in real-time
- [ ] Crane operations monitored by qualified signalperson
- [ ] AGV routes modified for temporary obstacles
- [ ] Actual repositions recorded against budget
- [ ] Worker feedback on ergonomic issues collected

### Post-Execution Review

- [ ] Tool access plan effectiveness evaluated
- [ ] Crane cycle times compared to estimates
- [ ] AGV route optimization opportunities identified
- [ ] Reposition budget margin reviewed
- [ ] Ergonomic incidents analyzed and corrective actions taken

## Interfaces

### Input Interfaces

- **From CAD/ASSY**: Assembly models for access analysis
- **From CAM/FIX**: Fixture and tooling designs
- **From Facility Planning**: Factory layout, crane specifications, AGV capabilities
- **From Safety Engineering**: Ergonomic standards, lifting regulations

### Output Interfaces

- **To Assembly Planning**: Validated tool access for sequence planning
- **To Manufacturing Engineering**: Work instructions incorporating access plans
- **To Tooling Design**: Requirements for special tooling or fixture modifications
- **To Training**: Access procedures and ergonomic best practices

## Traceability and Evidence

All tool access plans must reference:

1. **Assembly Models**: UTCS anchors to CAD geometry used for analysis
2. **Equipment Specifications**: UTCS anchors to crane, AGV, and tooling capacities
3. **Analysis Results**: UTCS anchors to reach studies, path simulations, ergonomic assessments
4. **Validation Records**: UTCS anchors to first article execution confirming access feasibility

Example UTCS anchor chain:
```
UTCS-MI:CAD:AAA:ASSY:57-10:revC  (assembly model)
  + UTCS-MI:CAM:FIX:WING-JIG-02:v3  (fixture specification)
  → UTCS-MI:ASM:TOOL:ACCESS-0012:v2  (reach study)
  → UTCS-MI:ASM:JOIN:ONB:0012:v1  (validated procedure)
```

## Safety Considerations

### Hazard Log References

- **HZ-AAA-CRANE-xxx**: Crane operation hazards (load drop, swing, collision)
- **HZ-AAA-AGV-xxx**: AGV collision and pinch point hazards
- **HZ-AAA-ERGO-xxx**: Ergonomic hazards (repetitive strain, awkward postures)
- **HZ-AAA-CONFINED-xxx**: Confined space access for internal assembly
- **HZ-AAA-FALL-xxx**: Fall hazards on platforms and scaffolds

### Safety Protocols

- **Crane Operations**: Qualified rigger and signalperson required
- **AGV Operations**: Exclusion zones and warning lights
- **Platform Work**: Fall protection for work above 1.8m (6 feet)
- **Confined Space**: Entry permit, air monitoring, standby rescue
- **Ergonomic**: Mandatory breaks for high-repetition or high-force tasks

## KPIs for Tool Access

Tracked via CI/CD pipeline:

- **Access conflict resolution rate**: % of conflicts resolved before execution
- **Crane cycle time accuracy**: Actual vs. planned time (target ±10%)
- **AGV positioning accuracy**: Actual vs. required (target ±5mm)
- **Reposition budget utilization**: % of budget consumed (target <80%)
- **Ergonomic incidents**: Count per 100,000 work hours (target <2)

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Join operations requiring tool access validation
- [`../system-installation-steps/`](../system-installation-steps/) — System installations with access constraints
- [`../digital-mockup-sims/`](../digital-mockup-sims/) — DMU simulations validating tool access
- [`../tolerance-stackups/`](../tolerance-stackups/) — Reposition budget impact on tolerances
- `../../../CAM/FIX/` — Fixture designs requiring reach validation
- `../../../CAM/OPR/` — Work instructions incorporating access plans

## Standards and References

- **ASME B30.2**: Overhead and Gantry Cranes (safety standards)
- **ISO 11228**: Ergonomics - Manual Handling
- **ANSI/ASSE Z244.1**: Control of Hazardous Energy (Lockout/Tagout)
- **MIL-STD-1472**: Human Engineering design criteria
- **ISO 10218**: Robots and robotic devices - Industrial robots (AGV safety)
- **OSHA 1926.251**: Rigging equipment for material handling
- **ISO 11226**: Ergonomics - Evaluation of static working postures

## Governance and Reviews

### Approval Authority

- **Plan Owner**: Manufacturing Engineering Lead
- **Technical Approval**: Assembly Engineering Lead
- **Safety Approval**: Safety & Ergonomics Engineer
- **Tooling Approval**: Tooling & Fixture Design Lead

### Review Gates

- **M3 (Tooling Design Review)**: Initial tool access concepts
- **M4 (Critical Design Review)**: Detailed access plans and simulations
- **M5 (Installation Readiness)**: First article validation of access
- **Continuous Improvement**: Ongoing optimization based on production experience

### Change Control

All updates to tool access plans must:

1. Assess impact on assembly sequence and cycle time
2. Verify safety implications of changes
3. Update work instructions and training materials
4. Re-validate via DMU or physical mockup
5. Obtain approval from manufacturing and safety

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 Manufacturing Engineering Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
