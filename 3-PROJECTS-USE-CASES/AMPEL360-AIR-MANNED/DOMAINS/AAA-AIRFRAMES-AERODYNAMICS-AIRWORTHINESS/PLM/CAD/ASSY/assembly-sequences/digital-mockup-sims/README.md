# Digital Mockup Simulations

## Overview

This directory contains CAD animation sequences, rendered videos, and simulation reports validating assembly processes for the **AMPEL360‑AIR‑T** BWB aircraft. Digital Mock-Up (DMU) simulations are essential for verifying assembly feasibility, detecting interferences, and optimizing sequences before physical implementation.

## Purpose

The digital-mockup-sims directory serves as the central repository for:

- **DMU animation sequences** showing step-by-step assembly motions and component paths
- **Interference detection reports** identifying collisions and clearance violations
- **Tool access simulations** validating fixture reach and ergonomic considerations
- **Assembly validation videos** for training and procedure review
- **UTCS-anchored evidence** of validated assembly processes

## Contents Overview

### Simulation Types

1. **Major Join Sequences**
   - Center body to wing mating simulations
   - Fuselage section assembly animations
   - Visualization of large component positioning and alignment

2. **System Installation Paths**
   - Main duct insertion through center body
   - Landing gear installation motion
   - Engine/propulsion system integration paths
   - Electrical harness routing visualization

3. **Tool Access Studies**
   - Crane and AGV (Automated Guided Vehicle) path planning
   - Fixture positioning and reach validation
   - Worker access and ergonomic analysis
   - Tooling interference checks

4. **Kinematic Simulations**
   - Control surface deployment and rigging
   - Landing gear extension/retraction validation
   - Door and panel operation clearances
   - Mechanism travel validation

5. **Interference Analysis**
   - Static interference detection between components
   - Dynamic clearance analysis during motion
   - Tolerance variation impact studies
   - Service access validation

## File Naming Convention

Following the canonical naming pattern:

```
ASM-AAA-{ZONE}-DMU-{IDX}.{ext}
```

Where:
- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)
- `{IDX}` = 4-digit serial number (e.g., 0001, 0025, 0150)
- `{ext}` = File extension based on content type

Examples:
- `ASM-AAA-ONB-DMU-0001.mp4` — Center body to wing join animation video
- `ASM-AAA-ONB-DMU-0001.md` — Simulation report and validation summary
- `ASM-AAA-ONB-DMU-0015.pdf` — ECS duct installation interference report
- `ASM-AAA-OUT-DMU-0042.avi` — Outer wing panel assembly sequence

## Expected File Types

- `.mp4`, `.avi`, `.mov` — Rendered animation videos
- `.md` — Simulation reports and validation summaries
- `.pdf` — Interference reports, clearance analysis documents
- `.json` — Simulation metadata, interference lists, kinematic data
- `.csv` — Clearance measurements, interference coordinates
- `.step`, `.stp` — DMU assembly snapshots at key states
- `.jpg`, `.png` — Screenshots of key assembly states or interferences
- `.pptx`, `.pdf` — Presentation materials for design reviews

## Software and Tools

### CAD/DMU Platforms

- **CATIA V5/V6**: DMU Kinematics, DMU Fitting Simulator
- **Siemens NX**: Assembly Sequencing, Clearance Analysis
- **Dassault 3DEXPERIENCE**: Live Rendering, Immersive Virtual Experience
- **Autodesk Inventor**: Assembly Constraints, Motion Simulation
- **PTC Creo**: Mechanism Design, Interference Detection

### Rendering and Visualization

- **CATIA Live Rendering**: High-quality video rendering from DMU
- **KeyShot**: Professional rendering for marketing and training videos
- **Blender**: Open-source rendering and animation
- **Unity/Unreal**: Real-time interactive assembly visualization

### Analysis Tools

- **CATIA DMU Space Analysis**: Clearance measurement and reporting
- **3DCS Variation Analyst**: Tolerance stack-up in DMU environment
- **Process Simulate (Siemens)**: Manufacturing process simulation
- **Tecnomatix**: Assembly line simulation and optimization

## TFA Context

DMU simulations align with the TFA flow: **UE→FE→CB**

- **UE (Uncertainty Envelope)**: Deterministic snapshots of assembly states for validation gates
- **FE (Functional Execution)**: Orchestration of multi-component assembly sequences
- **CB (Constraint-Based)**: Enforcement and validation of clearances, tool access, and physical constraints

## Required Artifacts

Each DMU simulation must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Animation Video | `.mp4` or `.avi` | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:v{X}` | 🔄 |
| Simulation Report | `.md` or `.pdf` | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:REPORT:v{X}` | 🔄 |
| Interference List | `.json` or `.csv` | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:INTERF:v{X}` | 🔄 |
| Clearance Report | `.pdf` or table | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:CLEAR:v{X}` | 🔄 |
| DMU Assembly Model | `.step` or native | `UTCS-MI:CAD:AAA:DMU:{IDX}:rev{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Simulation Workflow

### 1. Planning Phase

- [ ] Identify assembly sequence to be simulated
- [ ] Gather CAD models of all components and tooling
- [ ] Define simulation objectives (interference check, timing, access validation)
- [ ] Establish success criteria and clearance requirements

### 2. Model Preparation

- [ ] Import component CAD models into DMU environment
- [ ] Simplify geometry if needed for performance
- [ ] Define assembly constraints and motion paths
- [ ] Set up reference coordinate systems and datums

### 3. Simulation Execution

- [ ] Define component motion paths and sequences
- [ ] Run interference detection algorithms
- [ ] Validate clearances against specifications
- [ ] Adjust paths to resolve conflicts
- [ ] Capture key frames and assembly states

### 4. Validation and Review

- [ ] Generate interference reports and clearance measurements
- [ ] Create annotated videos with callouts
- [ ] Review with assembly engineers and manufacturing team
- [ ] Document findings and required design changes
- [ ] Obtain approval from stakeholders

### 5. Documentation and Delivery

- [ ] Render final animation videos
- [ ] Compile simulation reports with evidence
- [ ] Generate UTCS anchors for traceability
- [ ] Upload to evidence repository
- [ ] Link to assembly procedures and work instructions

## Quality and Validation Criteria

### Interference Detection

- **Zero hard interferences**: No component-to-component overlap in final assembled state
- **Minimum clearances maintained**: All clearances ≥ specified values (typically 5-10mm)
- **Dynamic clearances verified**: Adequate clearance during motion and installation
- **Tolerance sensitivity assessed**: Worst-case tolerance combinations analyzed

### Tool Access Validation

- **Fixture reach confirmed**: All tooling can reach required attachment points
- **Installation angles achievable**: Component insertion angles within limits
- **Worker access adequate**: Personnel can reach with appropriate tools (ergonomics)
- **Service access preserved**: Maintenance operations remain feasible

### Sequence Timing

- **Cycle time estimated**: Installation time predicted from simulation
- **Critical path identified**: Longest dependent sequence chain defined
- **Parallel operations validated**: Independent assemblies confirmed as non-interfering

### Model Quality

- **CAD model accuracy**: All models at correct revision and configuration
- **Assembly constraints valid**: Constraints properly represent physical reality
- **Motion paths realistic**: Paths respect crane/AGV capabilities and restrictions
- **Collision detection resolution**: Mesh density adequate for accurate interference detection

## Simulation Report Template

Each simulation should include a standardized report:

```markdown
# DMU Simulation Report: {SIMULATION_NAME}

## Metadata
- **Simulation ID**: ASM-AAA-{ZONE}-DMU-{IDX}
- **Date**: YYYY-MM-DD
- **Analyst**: [Name]
- **Software**: [CAD Platform and Version]
- **UTCS Anchor**: UTCS-MI:ASM:DMU:{DESC}:{IDX}:v{X}

## Objective
[Brief description of what was being validated]

## Scope
- Components involved: [List]
- Assembly sequence steps: [List]
- Tooling included: [List]

## Results

### Interference Analysis
- **Total Interferences Detected**: [Count]
- **Critical Interferences**: [Count requiring design change]
- **Minor Clearance Issues**: [Count requiring attention]

### Clearance Measurements
| Location | Minimum Clearance | Specification | Status |
| :--- | :--- | :--- | :--- |
| ... | ... | ... | ✅/❌ |

### Sequence Validation
- **Feasibility**: ✅ Feasible / ❌ Infeasible / ⏳ Requires Changes
- **Cycle Time Estimate**: [XX] minutes
- **Critical Path**: [Description]

## Issues and Recommendations
1. [Issue description] → [Recommendation]
2. ...

## Approvals
- **DMU Analyst**: [Name, Date]
- **Assembly Engineering**: [Name, Date]
- **Design Authority**: [Name, Date]

## Attachments
- Video: ASM-AAA-{ZONE}-DMU-{IDX}.mp4
- Interference List: ASM-AAA-{ZONE}-DMU-{IDX}_interferences.csv
- Clearance Report: ASM-AAA-{ZONE}-DMU-{IDX}_clearances.pdf
```

## Interfaces

### Input Interfaces

- **From CAD/ASSY**: Master assembly models and component definitions
- **From CAD/PRT**: Individual part geometry for interference checking
- **From CAM/FIX**: Tooling and fixture CAD models
- **From Assembly Procedures**: Proposed sequence plans to be validated

### Output Interfaces

- **To Assembly Planning**: Validated sequences ready for implementation
- **To Design Engineering**: Required design changes to resolve interferences
- **To Manufacturing**: Animation videos for training and work instruction
- **To Quality**: Evidence of assembly feasibility for certification

## Traceability and Evidence

All DMU simulations must reference:

1. **CAD Models Used**: UTCS anchors to specific geometry revisions
2. **Simulation Parameters**: Documentation of clearance specs and constraints
3. **Validation Criteria**: Requirements the simulation is validating against
4. **Results and Decisions**: Approval records and design change linkages

Example UTCS anchor chain:
```
UTCS-MI:CAD:AAA:ASSY:57-10:revC  (assembly model)
  + UTCS-MI:CAM:FIX:WING-JIG-02:v3  (tooling fixture)
  → UTCS-MI:ASM:DMU:WING-JOIN:0012:v2  (DMU simulation)
  → UTCS-MI:ASM:JOIN:ONB:0012:v1  (validated procedure)
```

## KPIs for DMU Simulations

Tracked via CI/CD pipeline:

- **Simulation coverage**: % of assembly sequences with DMU validation
- **Interference catch rate**: Count of issues found in DMU vs. physical assembly
- **First-time-right improvement**: % reduction in rework after DMU implementation
- **Time to resolution**: Days from interference detection to design fix approval
- **Simulation accuracy**: % agreement between predicted and actual cycle times

## Best Practices

### Model Management

- Use lightweight representations for large assemblies to improve performance
- Maintain separate simplified models for clearance checking
- Document all geometry simplifications and their impact on results
- Version control DMU assemblies synchronized with CAD baselines

### Collision Detection Settings

- Set appropriate collision detection resolution (balance accuracy vs. performance)
- Define clearance zones around components for near-miss detection
- Use bounding boxes for initial coarse collision checks
- Refine with precise mesh-based checks in critical areas

### Animation Quality

- Use smooth camera movements for viewer comprehension
- Add annotations and callouts for key assembly features
- Include assembly step numbers and component labels
- Show multiple viewing angles for complex operations
- Maintain consistent timing (not too fast or too slow)

### Performance Optimization

- Suppress non-essential components from collision detection
- Use envelopes or simplified geometry where appropriate
- Run simulations overnight for complex assemblies
- Parallelize independent simulation runs

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Major join sequences validated by DMU
- [`../system-installation-steps/`](../system-installation-steps/) — System installations requiring DMU validation
- [`../tool-access-plans/`](../tool-access-plans/) — Tooling and fixture designs validated by DMU
- [`../tolerance-stackups/`](../tolerance-stackups/) — Tolerance impacts on DMU clearances
- `../../PRT/` — Component part models used in DMU
- `../../../CAM/FIX/` — Fixture designs modeled in DMU

## Standards and References

- **ISO 16792**: Technical product documentation - Digital product definition data practices
- **ASME Y14.41**: Digital Product Definition Data Practices
- **VDA 4955**: Engineering Change Management (ECM) in DMU context
- **LOTAR**: Long Term Archiving and Retrieval for DMU data preservation
- **JT ISO 14306**: 3D visualization format for lightweight DMU viewing

## Governance and Reviews

### Approval Authority

- **Simulation Owner**: DMU/CAD Analyst
- **Technical Approval**: Assembly Engineering Lead
- **Design Approval**: Structures Chief Engineer (for major joins)
- **Manufacturing Approval**: Manufacturing Engineering Lead

### Review Gates

- **Preliminary DMU**: Concept validation at M2 (PDR)
- **Detailed DMU**: Full sequence validation at M4 (CDR)
- **As-Built DMU**: Verification with actual tolerances at M5
- **Lessons Learned**: Post-production DMU vs. actual comparison

### Change Control

DMU simulation updates triggered by:

1. Design changes affecting assembly interfaces
2. Tooling or fixture modifications
3. Assembly sequence revisions
4. Tolerance specification changes
5. Interference findings requiring resolution

All updates follow standard PR workflow with UTCS evidence links.

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 CAD/DMU Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
