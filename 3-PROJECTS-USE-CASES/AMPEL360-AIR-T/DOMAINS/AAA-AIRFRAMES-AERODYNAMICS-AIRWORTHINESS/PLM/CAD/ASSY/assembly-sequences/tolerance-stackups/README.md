# Tolerance Stackups

## Overview

This directory contains stack-up analysis spreadsheets, reports, and metrology correlation data for the **AMPEL360‑AIR‑T** BWB aircraft assembly. Tolerance stack-up analysis is essential for predicting dimensional variation in assembled structures and ensuring that critical features remain within specification despite accumulated manufacturing variations.

## Purpose

The tolerance-stackups directory serves as the central repository for:

- **Dimensional stack-up analyses** predicting assembly variation based on part tolerances
- **Worst-case and statistical analyses** using different tolerance accumulation methods
- **Metrology correlation studies** comparing predicted vs. measured assembly dimensions
- **Shimming and adjustment strategies** for managing stack-up at critical interfaces
- **UTCS traceability** linking tolerance analyses to design requirements and measurement data

## Contents Overview

### Analysis Types

1. **1D Linear Stack-ups**
   - Simple dimension chains in single direction
   - Gap accumulations at interfaces
   - Fastener hole pattern stack-ups

2. **2D and 3D Stack-ups**
   - Multi-dimensional tolerance propagation
   - Geometric Dimensioning & Tolerancing (GD&T) effects
   - Position, profile, and orientation tolerances

3. **Assembly Sequence Stack-ups**
   - Sequential tolerance accumulation through assembly steps
   - Impact of datum structure and build sequence
   - Reposition budget effects (see `../tool-access-plans/`)

4. **Variation Simulation (Monte Carlo)**
   - Statistical distribution of assembled dimensions
   - Probability of nonconformance (Ppk, Cpk)
   - Sensitivity analysis identifying critical contributors

5. **Thermal and Load Effects**
   - Dimensional changes due to temperature variation
   - Elastic deformation under assembly loads
   - Residual stress effects from manufacturing

## File Naming Convention

Following the canonical naming pattern:

```
ASM-AAA-{ZONE}-TSTACK-{IDX}.{ext}
```

Where:
- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)
- `{IDX}` = 4-digit serial number (e.g., 0001, 0025, 0100)
- `{ext}` = File extension based on content type

Examples:
- `ASM-AAA-ONB-TSTACK-0001.xlsx` — Wing-to-body interface gap stack-up
- `ASM-AAA-ONB-TSTACK-0012.pdf` — Fuselage section alignment stack-up report
- `ASM-AAA-OUT-TSTACK-0042.csv` — Wing panel edge margin stack-up

## Expected File Types

- `.xlsx` — Tolerance stack-up calculation spreadsheets
- `.pdf` — Stack-up analysis reports with diagrams
- `.csv` — Tolerance budgets, contributor lists, measurement data
- `.md` — Stack-up summaries, methodology notes, correlation studies
- `.json` — Metadata, UTCS traceability, measurement records
- `.jpg`, `.png` — Dimension chain diagrams, GD&T callouts
- `.step`, `.stp` — CAD models with tolerance annotations

## TFA Context

Tolerance stack-ups align with the TFA flow: **CB→UE (Constraint-Based → Uncertainty Envelope)**

- **CB**: Enforcement of dimensional constraints and tolerance specifications
- **UE**: Quantification of uncertainty envelopes and deterministic snapshots at quality gates

## Required Artifacts

Each tolerance stack-up analysis must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Stack-up Calculation | `.xlsx` or tool output | `UTCS-MI:ASM:TSTACK:{LOC}:{IDX}:v{X}` | 🔄 |
| Analysis Report | `.pdf` or `.md` | `UTCS-MI:ASM:TSTACK:{LOC}:{IDX}:REPORT:v{X}` | 🔄 |
| Dimension Chain Diagram | `.pdf` or drawing | `UTCS-MI:CAD:AAA:TSTACK:{IDX}:rev{X}` | 🔄 |
| Metrology Plan | `.md` or `.pdf` | `UTCS-MI:CAV:MEAS:PLAN:{IDX}:v{X}` | 🔄 |
| Correlation Report | `.pdf` or `.csv` | `UTCS-MI:CAV:MEAS:CORR:{IDX}:v{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Stack-up Analysis Methods

### Worst-Case Analysis

**Method**: Sum of maximum tolerance values (all parts at extreme limits simultaneously)

**Formula**: Total Variation = Σ|Tolerance_i|

**Advantages**:
- Conservative, guarantees 100% conformance if met
- Simple calculation
- No statistical assumptions required

**Disadvantages**:
- Overly pessimistic (low probability of all parts at extremes)
- May drive tight tolerances unnecessarily
- Expensive to achieve in production

**Application**: Critical safety features, regulatory requirements, low-volume production

### Root Sum Square (RSS) Analysis

**Method**: Statistical combination assuming normal distributions and independence

**Formula**: Total Variation = √(Σ(Tolerance_i)²)

**Advantages**:
- More realistic than worst-case
- Balances cost and risk
- Standard industry practice

**Disadvantages**:
- Assumes normal distributions (may not be true)
- Assumes independence (manufacturing correlations exist)
- ~0.27% nonconformance at 3σ limits

**Application**: Most structural assemblies, balanced cost/risk tolerance

### Monte Carlo Simulation

**Method**: Random sampling from specified distributions, thousands of iterations

**Advantages**:
- Handles any distribution type
- Includes correlations between dimensions
- Provides Cp, Cpk, Ppk capability metrics
- Shows full distribution of output dimension

**Disadvantages**:
- Requires software tools (3DCS, VisVSA, Cetol 6σ)
- Needs knowledge of actual part distributions
- More complex to set up and interpret

**Application**: Complex 3D assemblies, high-volume production, tight requirements

## Tolerance Budget Allocation

### Budget Strategy

Total assembly tolerance requirement is allocated to contributors:

| Contributor | Allocation Method | Typical % of Total |
| :--- | :--- | :--- |
| Part manufacturing tolerances | Design specifications | 40-50% |
| Assembly fixture variation | Tooling design | 15-20% |
| Repositioning (crane, AGV) | Process capability | 10-15% |
| Thermal effects | Analysis + measurement | 10-15% |
| Measurement uncertainty | Metrology system | 5-10% |
| Margin (contingency) | Reserved for unknowns | 5-10% |

### Budget Tracking Example

**Requirement**: Wing-to-body interface gap = 5.0 ± 1.5 mm

| Contributor | Allocated (mm) | RSS Contribution | Actual (mm) | Status |
| :--- | :--- | :--- | :--- | :--- |
| Wing fixture location | ±0.8 | 0.64 | ±0.6 | ✅ |
| Body fixture location | ±0.8 | 0.64 | ±0.7 | ✅ |
| Wing part variation | ±0.5 | 0.25 | ±0.4 | ✅ |
| Body part variation | ±0.5 | 0.25 | ±0.5 | ✅ |
| Crane positioning | ±0.4 | 0.16 | ±0.5 | ⚠️ |
| Thermal expansion | ±0.3 | 0.09 | ±0.2 | ✅ |
| Measurement error | ±0.2 | 0.04 | ±0.2 | ✅ |
| **RSS Total** | --- | **±1.37** | **±1.30** | ✅ |
| Margin remaining | --- | 0.13 mm | 0.20 mm | ✅ |

### Budget Management

- **Track actual vs. allocated**: Compare predicted to measured contributions
- **Reallocate as needed**: Transfer margin from over-performing to under-performing contributors
- **Root cause analysis**: Understand why contributors exceed allocation
- **Continuous improvement**: Update allocations based on production data

## GD&T Considerations

### Datum Structure Impact

Assembly stack-ups heavily depend on datum structure:

- **Primary datum**: Often largest, most stable feature (e.g., fuselage centerline)
- **Secondary datum**: Perpendicular to primary (e.g., wing station plane)
- **Tertiary datum**: Completes 6 DOF constraint (e.g., forward reference)

**Key principle**: Stack-up from part datums through assembly datums to final feature

### Geometric Tolerances

Common GD&T types in stack-up analysis:

- **Position**: Directly enters stack-up (e.g., hole location tolerance)
- **Profile**: Defines form + location, complex to stack
- **Parallelism/Perpendicularity**: Affects mating surface alignment
- **Flatness**: Impacts gap uniformity at interfaces
- **Runout**: Critical for rotating assemblies

### Material Condition Modifiers

- **MMC (Maximum Material Condition)**: Provides bonus tolerance, optimistic stack-up
- **LMC (Least Material Condition)**: Opposite of MMC, pessimistic stack-up
- **RFS (Regardless of Feature Size)**: No bonus tolerance, standard stack-up

## Metrology Correlation

### Purpose

Validate stack-up predictions by comparing to actual measurements:

1. **Build representative assemblies** (first articles, test specimens)
2. **Measure critical dimensions** using calibrated metrology equipment
3. **Compare to predictions** from tolerance stack-up analysis
4. **Identify discrepancies** and root causes
5. **Update models** to reflect actual manufacturing capability

### Correlation Metrics

- **Bias**: Systematic offset between predicted and measured (mean error)
- **Scatter**: Random variation around mean (standard deviation)
- **Correlation coefficient**: R² showing how well prediction matches reality

**Target**: R² > 0.8, |Bias| < 20% of tolerance, Scatter < 30% of tolerance

### Corrective Actions

If correlation is poor:

- **Underestimated variation**: Tighten part tolerances or improve process
- **Overestimated variation**: Relax tolerances to reduce cost
- **Bias present**: Adjust fixture settings, tooling offsets
- **High scatter**: Improve process control, reduce special causes
- **Wrong model**: Re-evaluate dimension chains, datum structure

## Shimming and Adjustment Strategies

### When Shimming is Required

- Stack-up variation exceeds specification
- Adjustment capability needed for production flexibility
- Thermal expansion compensation
- Field adjustment for retrofit or repair

### Shimming Approaches

1. **Predetermined Shim Sets**
   - Shims manufactured in standard thicknesses (e.g., 0.5, 1.0, 1.5, 2.0 mm)
   - Select appropriate thickness during assembly
   - Fast installation, but limited resolution

2. **Custom-Fit Shimming**
   - Measure gap during assembly
   - Machine or laser-cut shim to exact thickness
   - Optimal fit, but slower and more expensive

3. **Adjustable Fittings**
   - Slotted holes allowing translation
   - Eccentric bushings for fine adjustment
   - Threaded adjusters for load-bearing applications

4. **Tolerance Compensation Features**
   - Oversized holes with bushings
   - Flexible joint designs absorbing variation
   - Compliant mechanisms (springs, elastomers)

### Shimming Documentation

Each shimming operation must record:

- **Location**: Where shim was installed (station, frame, joint ID)
- **Gap measurement**: Measured gap before shimming
- **Shim thickness**: Actual shim installed
- **Final gap**: Measured gap after shimming (verification)
- **Shim part number**: Traceability to shim material/specification
- **UTCS anchor**: Link to metrology and assembly records

## Quality and Inspection

### Pre-Assembly Checks

- [ ] Part dimensions measured and within specification
- [ ] Fixture calibration current and within tolerance
- [ ] Metrology equipment calibrated
- [ ] Environmental conditions controlled (temperature)

### During Assembly

- [ ] Critical dimensions measured at hold points
- [ ] Stack-up predictions compared to actual measurements in real-time
- [ ] Shimming performed and documented where required
- [ ] Out-of-tolerance conditions identified and dispositioned

### Post-Assembly Validation

- [ ] Final dimensions measured and compared to stack-up predictions
- [ ] Correlation report generated
- [ ] Lessons learned documented for future assemblies
- [ ] UTCS traceability records completed

## Tolerance Analysis Software

### Common Tools

- **3DCS Variation Analyst**: Industry-leading 3D tolerance analysis, integrates with major CAD
- **VisVSA (Siemens)**: Variation simulation, works with NX and other platforms
- **Cetol 6σ (Sigmetrix)**: Comprehensive tolerance analysis with optimization
- **EZTol (Selerant)**: GD&T stack-up analysis and reporting
- **DCS Tolerance Analysis (Enventive)**: Lightweight, CAD-agnostic tool

### Tool Selection Criteria

- **CAD integration**: Native integration with design tools (CATIA, NX, etc.)
- **GD&T support**: Full ASME Y14.5/ISO 1101 geometric tolerance handling
- **Analysis methods**: Worst-case, RSS, Monte Carlo capabilities
- **Reporting**: Clear, audit-ready reports for certification
- **Collaboration**: Cloud-based, multi-user access

## Interfaces

### Input Interfaces

- **From CAD**: Part models with dimensional and GD&T specifications
- **From CAE**: Deformation analysis (thermal, structural)
- **From Manufacturing Engineering**: Process capability data (Cpk values)
- **From Quality**: Measurement system analysis (MSA), gage R&R studies

### Output Interfaces

- **To Design Engineering**: Tolerance specifications and stack-up feasibility
- **To Manufacturing**: Shimming plans, adjustment procedures
- **To Quality**: Metrology plans, inspection requirements, acceptance criteria
- **To Assembly Planning**: Critical dimensions requiring in-process verification

## Traceability and Evidence

All tolerance stack-up analyses must reference:

1. **Design Requirements**: UTCS anchors to dimensional specifications
2. **Part Specifications**: UTCS anchors to manufacturing drawings with tolerances
3. **Process Capability**: UTCS anchors to SPC data and process studies
4. **Measurement Data**: UTCS anchors to metrology results validating predictions

Example UTCS anchor chain:
```
UTCS-MI:CAD:AAA:SPEC:WTB-GAP:v2  (design requirement)
  + UTCS-MI:CAD:AAA:DRW:WING-57-10:revC  (part tolerances)
  + UTCS-MI:CAM:SPC:WING-PROCESS:2024-Q4  (process capability)
  → UTCS-MI:ASM:TSTACK:WTB:0001:v3  (stack-up analysis)
  → UTCS-MI:CAV:MEAS:WTB-GAP:S/N-001:v1  (measurement data)
  → UTCS-MI:CAV:MEAS:CORR:WTB:0001:v1  (correlation report)
```

## Safety Considerations

### Hazard Log References

- **HZ-AAA-INTERFERENCE-xxx**: Risk of component interference due to tolerance stack-up
- **HZ-AAA-LOAD-PATH-xxx**: Risk of improper load transfer if gaps excessive
- **HZ-AAA-SEAL-xxx**: Risk of seal damage or leakage from misalignment

### Critical Dimensions

Dimensions affecting safety require:

- **Worst-case analysis**: Conservative approach for critical features
- **100% inspection**: All units measured, no sampling
- **Margin above minimum**: Safety factors in tolerance allocation
- **Traceability**: Full documentation chain for certification

## KPIs for Tolerance Management

Tracked via CI/CD pipeline:

- **Stack-up closure rate**: % of predicted assemblies within specification (target >95%)
- **Correlation accuracy**: R² between predicted and measured (target >0.8)
- **Shimming rate**: % of assemblies requiring shims (target minimize)
- **First-time-right rate**: % assembled without rework for dimensional issues (target >90%)
- **Measurement uncertainty**: % of measurement error vs. tolerance (target <10%)

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Major joins requiring stack-up analysis
- [`../tool-access-plans/`](../tool-access-plans/) — Reposition budgets affecting stack-ups
- [`../qip-hold-points/`](../qip-hold-points/) — Dimensional inspection gates
- `../../CAE/` — Structural and thermal analysis affecting dimensions
- `../../../CAV/MEAS/` — Metrology results for correlation
- `../../DRW/` — Manufacturing drawings with tolerance specifications

## Standards and References

- **ASME Y14.5-2018**: Dimensioning and Tolerancing standard
- **ISO 1101:2017**: Geometrical tolerancing
- **ISO 14253-1**: Inspection by measurement - Decision rules
- **ASME Y14.43**: Dimensioning and Tolerancing Principles for Gages
- **ISO/TS 17450**: General concepts of Geometrical Product Specifications (GPS)
- **SAE AS8879**: Tolerance Analysis Using RSS and Monte Carlo Methods

## Governance and Reviews

### Approval Authority

- **Analysis Owner**: Dimensional Engineering Lead
- **Technical Approval**: Chief Engineer (Structures or Systems)
- **Quality Approval**: Quality Engineering Lead
- **Manufacturing Approval**: Manufacturing Engineering Lead

### Review Gates

- **M2 (Preliminary Design Review)**: Initial tolerance budgets and concept stack-ups
- **M4 (Critical Design Review)**: Detailed stack-up analyses and metrology plans
- **M5 (Installation Readiness)**: First article correlation and validation
- **Production**: Ongoing monitoring and continuous improvement

### Change Control

All updates to tolerance stack-ups must:

1. Assess impact on assembly feasibility and cost
2. Update affected drawings and specifications
3. Revise metrology plans and inspection procedures
4. Validate via analysis and measurement
5. Obtain multi-disciplinary approval

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 Dimensional Engineering Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
