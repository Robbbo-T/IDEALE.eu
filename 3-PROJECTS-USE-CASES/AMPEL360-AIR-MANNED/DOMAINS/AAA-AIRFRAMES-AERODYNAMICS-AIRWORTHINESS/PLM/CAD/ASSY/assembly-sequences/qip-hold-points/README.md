# QIP Hold Points

## Overview

This directory contains Quality Inspection Plan (QIP) hold points, checklists, and acceptance criteria for the **AMPEL360‑AIR‑T** BWB aircraft assembly. QIP hold points are critical quality gates where assembly must pause for inspection before proceeding to the next operation, ensuring that defects are caught early and preventing costly rework.

## Purpose

The qip-hold-points directory serves as the central repository for:

- **Inspection hold point definitions** specifying where assembly stops for quality verification
- **Inspection checklists** detailing measurements and checks required at each hold point
- **Acceptance criteria** defining pass/fail limits for inspected features
- **Nonconformance procedures** for handling out-of-specification conditions
- **UTCS traceability** linking inspection results to design requirements and assembly procedures

## Contents Overview

### Hold Point Categories

1. **Pre-Assembly Hold Points**
   - Incoming part inspection and acceptance
   - Fixture calibration verification
   - Tooling and equipment readiness checks
   - Material shelf-life and storage conditions

2. **In-Process Hold Points**
   - Critical dimension verification during assembly
   - Fastener torque audits and witness mark checks
   - Gap measurements at major interfaces
   - Alignment verification before permanent attachment

3. **Post-Assembly Hold Points**
   - Final dimensional inspection
   - Leak testing for sealed compartments
   - Functional testing of installed systems
   - Completeness verification and buy-off

4. **Special Process Hold Points**
   - Sealant application and cure monitoring
   - Bonding process control and validation
   - Non-destructive testing (NDT) inspections
   - Surface treatment and coating verification

## File Naming Convention

Following the canonical naming pattern:

```
QIP-AAA-{ZONE}-{KIND}-{IDX}.{ext}
```

Where:
- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)
- `{KIND}` = Hold point type (e.g., PREASSY, INPROC, POSTASSY, NDT)
- `{IDX}` = 4-digit serial number (e.g., 0001, 0025, 0150)
- `{ext}` = File extension based on content type

Examples:
- `QIP-AAA-ONB-INPROC-0001.md` — In-process hold point for wing-to-body join
- `QIP-AAA-ONB-NDT-0012.pdf` — NDT inspection requirements for center body welds
- `QIP-AAA-OUT-POSTASSY-0042.csv` — Post-assembly inspection checklist for wing panels

## Expected File Types

- `.md` — Hold point procedures and inspection instructions
- `.pdf` — Formal inspection plans and reports
- `.csv` — Inspection checklists and measurement data
- `.json` — Metadata, traceability records, acceptance criteria
- `.jpg`, `.png` — Reference photos, example defects, measurement locations
- `.xlsx` — Inspection data collection forms

## TFA Context

QIP hold points align with the TFA flow: **FE (Functional Execution)**

- **FE**: Quality gates embedded in assembly execution flow ensuring each step meets requirements before proceeding

## Required Artifacts

Each QIP hold point must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Hold Point Procedure | `.md` or `.pdf` | `UTCS-MI:CAV:QIP:AAA:{KIND}-{IDX}:v{X}` | 🔄 |
| Inspection Checklist | `.csv` or `.xlsx` | `UTCS-MI:CAV:QIP:AAA:CHECKLIST-{IDX}:v{X}` | 🔄 |
| Acceptance Criteria | Table or document | `UTCS-MI:CAV:QIP:AAA:CRITERIA-{IDX}:v{X}` | 🔄 |
| Inspection Data | `.csv` or `.json` | `UTCS-MI:CAV:QIP:AAA:DATA-{S/N}-{IDX}:v{X}` | 🔄 |
| Nonconformance Report | `.pdf` or form | `UTCS-MI:CAV:NCR:{NCR-ID}:v{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Hold Point Workflow

### 1. Planning Phase

- [ ] Identify critical features and operations requiring hold points
- [ ] Define acceptance criteria based on design requirements
- [ ] Determine inspection methods and equipment needed
- [ ] Assign inspection authority and approval levels
- [ ] Document hold point in assembly procedure

### 2. Pre-Execution Preparation

- [ ] Calibrate measurement equipment
- [ ] Prepare inspection checklists and data collection forms
- [ ] Brief assembly and inspection personnel
- [ ] Verify access to features to be inspected
- [ ] Stage any special inspection tooling

### 3. Hold Point Execution

- [ ] Assembly operation reaches hold point
- [ ] Inspector notified and arrives at station
- [ ] Inspection performed per checklist
- [ ] Measurements recorded with traceability (serial number, date, inspector)
- [ ] Results compared to acceptance criteria

### 4. Disposition

**If Conforming:**
- [ ] Inspector signs off on checklist
- [ ] Hold point released, assembly proceeds
- [ ] Data recorded in quality system
- [ ] UTCS traceability record generated

**If Nonconforming:**
- [ ] Nonconformance Report (NCR) initiated
- [ ] Root cause investigation started
- [ ] Disposition decision: Use-As-Is / Repair / Rework / Scrap
- [ ] Engineering and quality approval obtained
- [ ] Corrective action implemented
- [ ] Re-inspection performed

### 5. Documentation and Closeout

- [ ] All inspection data entered into quality database
- [ ] Traceability links established (part S/N, assembly S/N, inspector ID)
- [ ] Trend analysis performed (control charts, Cpk)
- [ ] Lessons learned captured for continuous improvement

## Inspection Checklist Template

Standard format for inspection checklists:

```csv
Item,Feature,Specification,Measurement_Method,Tool_ID,Acceptance_Criteria,Actual,Status,Inspector,Date,Notes
1,Wing-to-body gap (Sta 150),5.0 ± 1.5 mm,Caliper measurement,CAL-042,"3.5 - 6.5 mm",4.8 mm,Pass,J. Smith,2025-01-27,
2,Fastener torque (FB-001),250-275 in-lb,Torque wrench audit,TW-018,"250 - 275 in-lb",265 in-lb,Pass,J. Smith,2025-01-27,
3,Witness mark alignment,No rotation,Visual inspection,N/A,Aligned,Aligned,Pass,J. Smith,2025-01-27,
4,Sealant bead width,6 ± 2 mm,Visual + measurement,CAL-033,"4 - 8 mm",5.5 mm,Pass,J. Smith,2025-01-27,
5,Surface cleanliness,Per spec XYZ,Visual + tape test,N/A,No contamination,Clean,Pass,J. Smith,2025-01-27,
```

### Checklist Fields

- **Item**: Sequential number for checklist items
- **Feature**: Description of what is being inspected
- **Specification**: Reference to design requirement or standard
- **Measurement_Method**: How the inspection is performed
- **Tool_ID**: Identification of calibrated measurement equipment used
- **Acceptance_Criteria**: Numerical or qualitative pass/fail limits
- **Actual**: Measured or observed value
- **Status**: Pass / Fail / N/A
- **Inspector**: Name or ID of person performing inspection
- **Date**: Date and time of inspection (ISO 8601 format)
- **Notes**: Any relevant observations or anomalies

## Acceptance Criteria Types

### Dimensional Criteria

- **Nominal ± Tolerance**: e.g., 100.0 ± 0.5 mm (range: 99.5 - 100.5 mm)
- **Bilateral Tolerance**: e.g., 100 +0.8/-0.3 mm (range: 99.7 - 100.8 mm)
- **Unilateral Tolerance**: e.g., 100 +0.0/-0.5 mm (range: 99.5 - 100.0 mm)
- **Geometric Tolerance**: e.g., Position Ø 0.5 mm at MMC relative to Datum A-B-C

### Visual Criteria

- **Surface Finish**: Ra value or comparison to standard roughness samples
- **Defect Limits**: Maximum allowed size/count of scratches, dents, pores, etc.
- **Color/Appearance**: Match to approved standard or color chip
- **Completeness**: All required features present (holes, marks, labels)

### Functional Criteria

- **Leak Rate**: Maximum allowable leak (e.g., <10⁻⁶ std cc/sec helium)
- **Torque**: Fastener prevailing torque within specification
- **Fit**: Clearance or interference within limits
- **Movement**: Control surface travel within angular limits

### Process Criteria

- **Temperature**: Cure temperature within control limits
- **Time**: Process duration within specification
- **Environment**: Temperature, humidity, cleanliness during operation
- **Material Certification**: Batch/lot traceability and conformance

## Inspection Methods and Equipment

### Manual Measurement Tools

- **Calipers**: ±0.02 mm accuracy for general dimensions
- **Micrometers**: ±0.001 mm accuracy for precision measurements
- **Height Gages**: ±0.01 mm accuracy for vertical dimensions
- **Protractors/Angle Gages**: ±0.5° accuracy for angular measurements
- **Pin Gages**: Go/No-Go checking of hole diameters

### Coordinate Measuring Machines (CMM)

- **Bridge CMM**: ±0.002 mm accuracy for 3D measurements
- **Portable CMM (Arm)**: ±0.025 mm accuracy for on-assembly measurements
- **Laser Tracker**: ±0.020 mm + 5 ppm for large-scale metrology
- **Photogrammetry**: ±0.050 mm accuracy for complex shapes

### Non-Destructive Testing (NDT)

- **Ultrasonic Testing (UT)**: Detect internal voids, delaminations, cracks
- **Radiographic Testing (RT)**: X-ray or gamma ray imaging of internal structure
- **Eddy Current**: Surface and near-surface crack detection in metals
- **Magnetic Particle Inspection (MPI)**: Detect surface and near-surface cracks in ferromagnetic materials
- **Dye Penetrant Inspection (DPI)**: Detect surface-breaking defects

### Special Inspection Equipment

- **Borescopes**: Visual inspection of internal cavities
- **Leak Detectors**: Helium mass spectrometer, pressure decay, bubble test
- **Torque Wrenches**: Calibrated tools for torque audit (±2% accuracy)
- **Surface Roughness Testers**: Ra, Rz measurement for finish verification

### All inspection equipment must be:

- Calibrated to national standards (NIST traceable)
- Within calibration validity period
- Identified with unique ID for traceability
- Operated by trained and qualified personnel

## Nonconformance Management

### Nonconformance Report (NCR) Process

1. **Identification**
   - Inspection reveals feature out of specification
   - Inspector initiates NCR with unique ID (NCR-AAA-YYYY-NNNN)
   - Part/assembly tagged and segregated

2. **Documentation**
   - Record actual condition vs. specification
   - Include photos, measurements, sketches
   - Identify affected serial numbers and operations
   - Assess severity: Critical / Major / Minor

3. **Root Cause Analysis**
   - Investigate why nonconformance occurred
   - Use 5-Whys, Fishbone diagram, or other RCA methods
   - Identify contributing factors (design, process, material, human, equipment)

4. **Disposition Decision**
   - **Use-As-Is**: Accept as-is with engineering justification (no safety impact)
   - **Repair**: Correct the nonconformance to meet original specification
   - **Rework**: Disassemble and reassemble correctly
   - **Scrap**: Part/assembly cannot be economically corrected

5. **Approval**
   - Use-As-Is requires engineering and certification authority approval
   - Repair/Rework requires quality approval
   - Scrap requires material review board approval

6. **Implementation**
   - Perform approved disposition
   - Re-inspect to verify conformance
   - Update documentation with NCR reference
   - Release for next operation or delivery

7. **Corrective Action**
   - Implement corrective action to prevent recurrence
   - Update procedures, training, tooling as needed
   - Verify effectiveness of corrective action
   - Close NCR in quality system

### NCR Tracking and Trending

- **By Type**: What types of nonconformances are most common?
- **By Location**: Which operations or areas have highest NCR rates?
- **By Root Cause**: What are the systemic issues driving NCRs?
- **By Disposition**: How many require Use-As-Is vs. Rework?
- **By Recurrence**: Are the same issues repeating (ineffective corrective action)?

**Target**: <1% NCR rate, >90% closed within 30 days, zero repeat NCRs

## Inspection Data Management

### Data Collection

- **Real-time entry**: Record measurements immediately during inspection
- **Digital capture**: Use tablets, CMM software, electronic forms
- **Automatic transfer**: Link measurement equipment to quality database
- **Minimize transcription**: Reduce manual copying to prevent errors

### Data Storage

- **Quality Management System (QMS)**: Centralized database for all inspection data
- **Serial number traceability**: Link every measurement to specific part/assembly
- **Version control**: Track changes to inspection procedures and criteria
- **Archival**: Long-term retention per regulatory requirements (typically 25+ years for aerospace)

### Data Analysis

- **Statistical Process Control (SPC)**: Control charts for in-control process monitoring
- **Capability Studies**: Cpk, Ppk to assess process capability vs. requirements
- **Trend Analysis**: Identify drifting processes before nonconformance occurs
- **Correlation Studies**: Compare predicted (stack-up) vs. actual dimensions

### Data Reporting

- **Inspection Summary Reports**: Overview of inspection results for management
- **First Article Inspection Report (FAIR)**: AS9102 compliant report for new parts/processes
- **Certificate of Conformance (CoC)**: Attestation that product meets all requirements
- **Inspection Data Packages**: Complete traceability for certification authorities

## Quality Gates and Milestones

### M2 - Preliminary Design Review (PDR)

- [ ] Critical features identified
- [ ] Preliminary acceptance criteria defined
- [ ] Inspection methods conceptually selected

### M4 - Critical Design Review (CDR)

- [ ] All QIP hold points defined
- [ ] Detailed inspection procedures documented
- [ ] Acceptance criteria finalized and approved
- [ ] Inspection equipment identified and procured

### M5 - Installation Readiness Review (IRR)

- [ ] First Article Inspection completed
- [ ] Inspection procedures validated
- [ ] Personnel trained and qualified
- [ ] Equipment calibrated and ready

### Production

- [ ] Inspections performed per plan
- [ ] Data collected and analyzed
- [ ] Continuous improvement implemented
- [ ] Lessons learned fed back to design

## Interfaces

### Input Interfaces

- **From Design Engineering**: Requirements and specifications for features
- **From Assembly Planning**: Sequence and hold point locations
- **From CAE**: Predicted dimensions from stack-up analysis
- **From Certification Authority**: Regulatory inspection requirements

### Output Interfaces

- **To Assembly Operations**: Release to proceed or stop for corrective action
- **To Engineering**: Feedback on actual vs. design performance
- **To Continuous Improvement**: Trends and opportunities for process enhancement
- **To Certification**: Evidence of conformance for airworthiness approval

## Traceability and Evidence

All QIP hold point records must reference:

1. **Design Requirements**: UTCS anchors to specifications being verified
2. **Inspection Procedures**: UTCS anchors to approved inspection methods
3. **Equipment Calibration**: UTCS anchors to calibration records for tools used
4. **Inspection Results**: UTCS anchors to actual measurement data
5. **Disposition**: UTCS anchors to approval records for nonconformances

Example UTCS anchor chain:
```
UTCS-MI:CAD:AAA:SPEC:WTB-GAP:v2  (design requirement: 5.0 ± 1.5 mm)
  → UTCS-MI:CAV:QIP:AAA:INPROC-0001:v3  (inspection procedure)
  → UTCS-MI:CAV:CAL:CALIPER:CAL-042:2025-01  (calibration record)
  → UTCS-MI:CAV:QIP:AAA:DATA-SN001-0001:v1  (inspection data: 4.8 mm, Pass)
```

## Safety Considerations

### Hazard Log References

- **HZ-AAA-DEFECT-xxx**: Risk of undetected defects leading to structural failure
- **HZ-AAA-MISASSEMBLY-xxx**: Risk of incorrect assembly not caught by inspection
- **HZ-AAA-INSPECTOR-xxx**: Risk of inspector error or oversight

### Inspector Qualification

All inspectors must be:

- Trained on inspection procedures and acceptance criteria
- Qualified per AS9102 or equivalent standard
- Certified for NDT methods (Level II minimum)
- Current on human factors training (fatigue, complacency, confirmation bias)
- Subject to periodic proficiency testing

## KPIs for QIP

Tracked via CI/CD pipeline:

- **Inspection completion rate**: % of required hold points completed (target 100%)
- **First-pass yield**: % of inspections passing without NCR (target >95%)
- **NCR closure time**: Average days to close NCRs (target <30 days)
- **Inspector efficiency**: Inspections per day vs. plan (target ±10%)
- **Measurement repeatability**: Gage R&R within acceptable limits (target <10% of tolerance)
- **Defect escape rate**: Defects found downstream vs. at hold point (target <1%)

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Join operations with critical hold points
- [`../system-installation-steps/`](../system-installation-steps/) — System installations requiring inspection
- [`../fastener-schedules/`](../fastener-schedules/) — Fastener inspections and torque audits
- [`../tolerance-stackups/`](../tolerance-stackups/) — Dimensional requirements for inspection
- [`../digital-mockup-sims/`](../digital-mockup-sims/) — Predicted assembly states for comparison
- `../../../CAV/MEAS/` — Metrology equipment and measurement results
- `../../../CAV/NDT/` — Non-destructive testing procedures and results

## Standards and References

- **AS9102**: First Article Inspection Requirement
- **AS9100**: Quality Management Systems for Aviation, Space, and Defense
- **ISO 9001**: Quality Management Systems
- **ASME Y14.5**: Dimensioning and Tolerancing (inspection criteria)
- **ISO 10012**: Measurement Management Systems
- **MIL-STD-45662**: Calibration Systems Requirements (superseded by ISO/IEC 17025)
- **ASTM E1316**: Standard Terminology for Nondestructive Examinations
- **EASA Part 21**: Certification of Aircraft and Related Products

## Governance and Reviews

### Approval Authority

- **Hold Point Owner**: Quality Engineering Lead
- **Technical Approval**: Chief Engineer (domain-specific)
- **Quality Approval**: Quality Assurance Manager
- **Certification Approval**: Designated Engineering Representative (DER) or equivalent

### Review Gates

- **M4 (CDR)**: QIP finalized and approved
- **M5 (IRR)**: First article inspection completed
- **Production**: Periodic audits and effectiveness reviews
- **Post-Delivery**: In-service findings review and procedure updates

### Change Control

All updates to QIP hold points must:

1. Assess impact on inspection coverage and risk
2. Update inspection procedures and training materials
3. Validate changes via trial inspection or simulation
4. Obtain quality and engineering approval
5. Notify certification authority of changes to critical inspections

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 Quality Assurance Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
