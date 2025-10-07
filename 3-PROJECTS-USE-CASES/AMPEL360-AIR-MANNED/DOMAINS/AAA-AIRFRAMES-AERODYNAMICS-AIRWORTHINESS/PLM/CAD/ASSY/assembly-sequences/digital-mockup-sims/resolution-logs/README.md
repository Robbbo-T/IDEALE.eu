# Resolution Logs — Sub-Assemblies

This directory contains **ECR/Deviation mapping and approvals for module-specific issues** for sub-assemblies belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Resolution logs track all Engineering Change Requests (ECRs), deviations, nonconformances, and their resolutions for each sub-assembly. These logs are essential for:

* Configuration control and traceability
* Quality management and compliance
* Lessons learned and continuous improvement
* Certification evidence
* Change impact analysis

## Contents

* **Engineering Change Requests (ECR)** — Formal change proposals and approvals
* **Deviation Reports** — Documented deviations from specifications
* **Nonconformance Records (NCR)** — Quality issues and their dispositions
* **Resolution Actions** — Corrective and preventive actions taken
* **Approval Records** — Sign-offs from responsible parties
* **Impact Assessments** — Analysis of change effects on related systems

## Naming Convention

Files follow the template: `RESLOG-AAA-{MODULE}-{IDX}.{ext}`

* `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{md|pdf|xlsx}`

**Examples:**
* `RESLOG-AAA-WINGBOX-001.xlsx` — Wing box ECR log and tracking
* `RESLOG-AAA-FUSE-002.pdf` — Fuselage section deviation report
* `RESLOG-AAA-STAB-001.md` — Stabilizer NCR resolution summary

## TFA Context

* **Primary Loop:** FE
* **UTCS Anchors:** `UTCS-MI:SUB:RESLOG:{MODULE}-{IDX}:v1`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Quality Critical:** All entries require proper authorization and closure

## Issue Types

### 1. Engineering Change Request (ECR)
**Purpose:** Propose and document design changes

**Contents:**
* Change description and justification
* Affected assemblies and interfaces
* Technical impact analysis
* Cost and schedule impact
* Risk assessment
* Approval signatures

**Dispositions:**
* Approved — Implement as proposed
* Approved with Modifications — Implement with changes
* Rejected — Do not implement
* Deferred — Hold for future consideration

### 2. Deviation Request
**Purpose:** Request permission to build/accept non-conforming hardware

**Contents:**
* Specification or drawing being deviated from
* Actual vs. required condition
* Justification for deviation
* Structural/functional impact analysis
* Affected serial numbers/effectivity
* Temporary vs. permanent disposition

**Dispositions:**
* Approved for specific units
* Rejected — must meet specification
* Use-as-is — acceptable without change
* Repair — rework to acceptable condition
* Scrap — cannot be used

### 3. Nonconformance Report (NCR)
**Purpose:** Document quality issues discovered during manufacturing or inspection

**Contents:**
* Description of nonconformance
* Inspection/measurement data
* Root cause analysis
* Containment actions
* Corrective actions
* Preventive actions

**Dispositions:**
* Use-as-is — acceptable as found
* Repair — rework to specification
* Rework — return to previous operation
* Scrap — reject and dispose
* Return to Supplier — vendor issue

## Log Structure

Each resolution log maintains chronological records:

| ID | Date | Type | Module | Description | Status | Disposition | Approver | Closure Date |
|:---|:-----|:-----|:-------|:------------|:-------|:------------|:---------|:-------------|
| ECR-001 | 2025-01-15 | ECR | WINGBOX-001 | Spar hole pattern change | Open | Pending Review | - | - |
| DEV-002 | 2025-01-18 | Deviation | FUSE-002 | Out-of-tolerance gap | Closed | Use-as-is | J. Smith | 2025-01-20 |
| NCR-003 | 2025-01-22 | NCR | STAB-001 | Surface finish issue | Closed | Repair | M. Jones | 2025-01-25 |

## Required Information

Each log entry must include:

1. **Issue Identification**
   - Unique ID number
   - Date discovered/initiated
   - Type (ECR, Deviation, NCR)
   - Affected module(s)
   - Originator name and contact

2. **Technical Description**
   - Detailed description of issue or change
   - Specification/drawing reference
   - Actual vs. required condition (for deviations/NCRs)
   - Root cause (for NCRs)

3. **Impact Analysis**
   - Structural impact assessment
   - Functional impact assessment
   - Interface effects
   - Related assemblies affected
   - Schedule and cost impact

4. **Resolution**
   - Proposed disposition
   - Technical justification
   - Alternative solutions considered
   - Corrective actions
   - Preventive actions

5. **Approval**
   - Design approval (Engineering)
   - Quality approval (QA)
   - Manufacturing approval (Production)
   - Customer approval (if required)
   - Certification authority approval (if required)

6. **Closure**
   - Implementation date
   - Verification of implementation
   - Lessons learned
   - Database updates (CAD, BOM, ICD, etc.)

## Workflow

### ECR Process
1. **Initiate** — Engineer identifies need for change
2. **Document** — Create ECR with justification
3. **Analyze** — Impact assessment (technical, cost, schedule)
4. **Review** — Multi-disciplinary review
5. **Approve** — Configuration Control Board (CCB) decision
6. **Implement** — Update drawings, BOMs, procedures
7. **Verify** — Confirm proper implementation
8. **Close** — Document completion and lessons learned

### Deviation/NCR Process
1. **Discover** — Issue identified during inspection or manufacturing
2. **Document** — Create deviation request or NCR
3. **Contain** — Prevent use of nonconforming hardware
4. **Analyze** — Root cause and impact analysis
5. **Disposition** — Determine use-as-is, repair, scrap
6. **Approve** — Quality and engineering sign-off
7. **Implement** — Execute approved disposition
8. **Verify** — Confirm resolution effectiveness
9. **Close** — Document and update systems

## Metrics and Reporting

Key performance indicators tracked:

* **Open vs. Closed Items** — Current backlog
* **Age Distribution** — Time to closure
* **Disposition Types** — Use-as-is, repair, scrap percentages
* **Root Cause Analysis** — Common causes identification
* **Repeat Issues** — Effectiveness of corrective actions
* **Approval Cycle Time** — Decision-making efficiency

## Related Directories

* `../` — Parent sub-assemblies directory
* `../utcs/` — Canonical UTCS YAML records (updated with changes)
* `../icd/` — Interfaces affected by changes
* `../boms/` — BOMs updated per ECRs
* `../../sub-assemblies/` — CAD models affected by changes
* `../../../PLM/CAV/QIP/` — Quality inspection findings

## Standards and References

* **CS-25.605** — Fabrication methods (repair standards)
* **CS-25.613** — Material strength (deviation limits)
* **Company Change Control Procedure** — ECR process
* **Quality Management System** — NCR procedures
* **Configuration Management Plan** — Change authority matrix

## Status

🔄 In Progress — Resolution logs being established and populated

---

**Maintainer:** AAA Integration Team & Configuration Management  
**Approval Authority:** Configuration Control Board (CCB)  
**Quality Oversight:** Quality Assurance Manager  
**Last Updated:** 2025-01-26
