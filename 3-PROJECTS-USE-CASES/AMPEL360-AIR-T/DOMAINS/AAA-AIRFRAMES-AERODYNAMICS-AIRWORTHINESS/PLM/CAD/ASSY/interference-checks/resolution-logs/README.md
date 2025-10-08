# Resolution Logs — Interference Checks

This folder maps interference issues to Engineering Change Requests (ECRs) and Deviations, tracking the resolution process with approval records and evidence links.

---

## Purpose

Resolution logs provide complete traceability from interference detection through approved resolution. Every clash, clearance violation, or kinematic issue must be formally closed via an ECR or approved deviation before design release.

---

## Contents

* **Master resolution tracking matrix**
* **Issue-to-ECR mapping** (linking INT codes to change control)
* **Deviation approvals** (for accepted violations with operational constraints)
* **Resolution verification** (post-change validation reports)
* **Closure evidence** (DMU re-checks, updated clash exports)

---

## Naming Convention

Files follow the template: `INT-AAA-{ZONE}-RESLOG-{IDX}.{ext}`

* `{ZONE}` ∈ `{ONB|OUT|MASTER}`
* `{IDX}` = 4‑digit serial (e.g., `0001`, `0038`)
* `{ext}` ∈ `{md|csv|json|pdf}`

**Examples:**
* `INT-AAA-MASTER-RESLOG-0001.csv` — Complete resolution tracking matrix
* `INT-AAA-ONB-RESLOG-0023.md` — Landing gear clash resolution log
* `INT-AAA-OUT-RESLOG-0042.json` — Wing tip clearance deviation approval

---

## Required Content

Each resolution log must include:

* **Issue Reference**: Original INT code (CLASH, CLEAR, KIN, HARNESS)
* **UTCS Anchor**: Original evidence and geometric references
* **Severity**: Critical / Major / Minor
* **Detection Date**: When issue was first identified
* **ECR Number**: Engineering change request ID
* **Resolution Description**: Design change implemented or deviation granted
* **Approval Authority**: Design lead, systems integration, safety, certification
* **Verification Method**: DMU re-check, physical test, analysis
* **Closure Date**: When issue was formally closed
* **Post-Change UTCS**: Updated geometry references
* **Status**: Open / Under Review / Approved / Closed

---

## Resolution Log Format (CSV)

```csv
INT_Code,Issue_Type,Zone,Severity,Detection_Date,ECR_Number,Description,Resolution_Type,Approver,Closure_Date,Status,UTCS_Original,UTCS_Updated
INT-AAA-ONB-CLASH-0038,CLASH,ONB,Major,2024-11-15,ECR-2024-1523,Hydraulic pump interference with frame,Design_Change,J.Smith,2024-12-03,Closed,UTCS-MI:CAD:AAA:ASSY:57-10:revC,UTCS-MI:CAD:AAA:ASSY:57-10:revD
INT-AAA-OUT-CLEAR-0042,CLEARANCE,OUT,Minor,2024-11-20,DEV-2024-0087,Aileron edge 12mm vs 15mm req,Deviation,M.Johnson,2024-12-10,Approved,UTCS-MI:CAV:QIP:AAA:INT-0042:v1,UTCS-MI:CAV:QIP:AAA:INT-0042:v2
INT-AAA-ONB-KIN-0004,KINEMATIC,ONB,Critical,2024-10-05,ECR-2024-1401,Landing gear retraction path clash,Design_Change,A.Brown,2024-11-30,Closed,UTCS-MI:CAD:AAA:LG:32-11:revB,UTCS-MI:CAD:AAA:LG:32-11:revE
```

---

## Resolution Types

### 1. Design Change (ECR)
Geometry modified to eliminate interference:
* Part repositioning
* Bracket redesign
* Routing path adjustment
* Clearance increase through feature modification

### 2. Approved Deviation
Issue accepted with operational constraints or monitoring:
* Minor clearance shortfall with analysis justification
* Kinematic near-miss with operational limits
* Thermal margin reduction with temperature monitoring

### 3. Accepted Risk
Issue documented and accepted by certification authority:
* Legacy design constraint
* Cost/schedule impact outweighs risk
* Alternative mitigation (inspection, operational procedure)

---

## TFA Stage

**FE** (cross-functional coordination) → resolution → **UE** (verified state)

Resolution logs are managed through **FE** coordination, with final closure requiring **UE** verification that the issue no longer exists.

---

## Integration with Change Control

This folder links to:
* Program-level ECR database
* Quality Issue Pipeline (QIP) from `PLM/CAV/QIP/`
* Configuration Management system

---

## KPIs

* **Open issue count** (target: 0 at release)
* **Mean time to resolution (MTR)** in days
* **ECR-to-closure ratio** (%)
* **Deviation percentage** (should be <5%)

---

## Status

🔄 **In Progress** — Tracking 47 open issues

---

## References

* Parent: [../README.md](../README.md)
* Related: All other interference-checks subdirectories
* Standards: EASA CS‑25, ATA iSpec 2200, S1000D 6.0 (Configuration Management)
