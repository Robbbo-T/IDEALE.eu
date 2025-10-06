# Resolution Logs

## Overview

This directory contains issue tracking records, Engineering Change Requests (ECRs), deviation approvals, and resolution documentation for the **AMPEL360‑AIR‑T** assembly sequences. Resolution logs provide traceability for design changes, manufacturing deviations, and corrective actions taken during assembly development and execution.

## Purpose

The resolution-logs directory serves as the central repository for:

- **Issue tracking records** documenting problems identified during assembly planning or execution
- **Engineering Change Requests (ECRs)** for design modifications affecting assembly sequences
- **Deviation approvals** for authorized departures from standard procedures
- **Corrective action records** documenting root cause analysis and preventive measures
- **UTCS traceability** linking resolution records to affected artifacts and procedures

## Contents Overview

### Log Types

1. **Assembly Issues**
   - Interference conflicts discovered during DMU or physical assembly
   - Tool access problems requiring procedure modifications
   - Tolerance stack-up issues requiring shimming or design changes
   - Schedule impacts and resource conflicts

2. **Engineering Change Requests (ECRs)**
   - Design changes affecting assembly procedures
   - Tooling modifications requiring sequence updates
   - Material substitutions impacting assembly methods
   - Process improvements from lessons learned

3. **Deviation Approvals**
   - Use-As-Is dispositions for nonconforming assemblies
   - Authorized procedural deviations with engineering justification
   - Temporary waivers pending permanent solutions
   - Field modifications and retrofit procedures

4. **Corrective Actions**
   - Root cause analysis for recurring issues
   - Preventive measures implemented
   - Procedure updates and training revisions
   - Effectiveness verification of corrective actions

## File Naming Convention

```
RESLOG-AAA-{TYPE}-{YYYY}-{NNNN}.{ext}
```

Where:
- `{TYPE}` = Issue type (ISSUE, ECR, DEV, CA)
- `{YYYY}` = Year
- `{NNNN}` = Sequential number within year
- `{ext}` = File extension (`.md`, `.pdf`, `.json`)

Examples:
- `RESLOG-AAA-ISSUE-2025-0001.md` — Assembly issue log
- `RESLOG-AAA-ECR-2025-0042.pdf` — Engineering change request
- `RESLOG-AAA-DEV-2025-0015.json` — Deviation approval record

## Expected File Types

- `.md` — Issue descriptions, resolution summaries
- `.pdf` — Formal ECR/deviation approval documents
- `.json` — Structured metadata and traceability records
- `.csv` — Issue tracking summaries and status reports
- `.jpg`, `.png` — Photos documenting issues or resolutions

## Resolution Log Template

Standard format for resolution logs:

```markdown
# Resolution Log: {TITLE}

## Metadata
- **Log ID**: RESLOG-AAA-{TYPE}-{YYYY}-{NNNN}
- **Date Opened**: YYYY-MM-DD
- **Date Closed**: YYYY-MM-DD (or "Open")
- **Reporter**: [Name/Role]
- **Owner**: [Name/Role]
- **Priority**: Critical / High / Medium / Low
- **Status**: Open / In Progress / Resolved / Closed

## Issue Description
[Detailed description of the problem, deviation, or change request]

## Impact Assessment
- **Affected Artifacts**: [List with UTCS anchors]
- **Assembly Impact**: [Describe impact on assembly sequence, schedule, cost]
- **Safety Impact**: [Any safety implications]
- **Certification Impact**: [Any airworthiness or regulatory implications]

## Root Cause Analysis
[Analysis of underlying causes using 5-Whys, Fishbone, or other RCA methods]

## Resolution
[Detailed description of solution implemented or deviation approved]

## Approvals
| Role | Name | Signature | Date |
| :--- | :--- | :--- | :--- |
| Engineering | ... | ... | ... |
| Quality | ... | ... | ... |
| Manufacturing | ... | ... | ... |
| Certification (if required) | ... | ... | ... |

## Corrective/Preventive Actions
1. [Action description] — Owner: [Name] — Due: [Date] — Status: [Complete/Pending]
2. ...

## Related Documents
- UTCS Anchor: [Link to affected assembly procedure]
- ECR Number: [If applicable]
- NCR Number: [If applicable]
- DMU Simulation: [Link to updated simulation]

## Lessons Learned
[Key takeaways for future assemblies]
```

## Issue Status Workflow

```
Open → In Progress → Resolved → Closed
                ↓
              Rejected (with justification)
```

### Status Definitions

- **Open**: Issue identified and logged, awaiting assignment
- **In Progress**: Active investigation and resolution work
- **Resolved**: Solution implemented, awaiting verification
- **Closed**: Verified effective, no further action required
- **Rejected**: Issue determined invalid or not requiring action

## Priority Levels

### Critical
- Safety impact or risk of structural failure
- Certification show-stopper
- Production line stoppage imminent
- **Response Time**: Immediate (within 4 hours)

### High
- Significant schedule impact (>1 week delay)
- Major rework or design change required
- Multiple assemblies affected
- **Response Time**: Within 24 hours

### Medium
- Moderate schedule or cost impact
- Single assembly affected
- Workaround available
- **Response Time**: Within 3 days

### Low
- Minor inconvenience or optimization opportunity
- Documentation update only
- No schedule impact
- **Response Time**: Within 2 weeks

## Engineering Change Request (ECR) Process

1. **Initiation**
   - Problem identified requiring design/process change
   - ECR initiated with justification and impact assessment
   - Assigned to responsible engineer

2. **Analysis**
   - Technical feasibility evaluated
   - Cost/benefit analysis performed
   - Schedule impact assessed
   - Alternative solutions considered

3. **Design**
   - Solution designed and documented
   - Updated procedures/drawings prepared
   - DMU validation if geometry changes
   - Test plan developed if needed

4. **Review and Approval**
   - Multi-disciplinary review (Design, Mfg, Quality, Safety)
   - Certification authority notified if required
   - Management approval for cost/schedule impacts
   - ECR approved or rejected

5. **Implementation**
   - Procedures and drawings updated
   - Tooling modified if required
   - Training materials revised
   - First article validation

6. **Verification**
   - Effectiveness of change verified
   - No adverse impacts confirmed
   - Documentation completed
   - ECR closed

## Deviation Approval Process

### When Deviation Required

- Nonconformance identified that cannot be reworked economically
- Process capability insufficient to meet specification
- Temporary situation requiring immediate workaround
- Field modification for operational necessity

### Approval Authority

- **Minor Deviation**: Quality Engineering + Manufacturing Engineering
- **Major Deviation**: Above + Design Engineering + Program Management
- **Critical/Safety**: Above + Certification Authority approval required

### Disposition Options

1. **Use-As-Is**: Accept nonconformance with engineering justification
2. **Repair**: Correct to meet original specification
3. **Rework**: Disassemble and reassemble correctly
4. **Return to Vendor**: If part/material defect
5. **Scrap**: Cannot be corrected economically

## Corrective Action Process

### CAPA (Corrective and Preventive Action)

1. **Problem Definition**
   - Clear statement of the issue
   - Data and evidence collected
   - Impact and scope defined

2. **Root Cause Analysis**
   - 5-Whys method
   - Fishbone (Ishikawa) diagram
   - Fault tree analysis
   - Identify contributing factors

3. **Corrective Action**
   - Address immediate problem
   - Contain affected units
   - Implement interim solution if needed

4. **Preventive Action**
   - Address root cause to prevent recurrence
   - Update procedures and training
   - Modify design or process if needed
   - Implement process controls

5. **Verification**
   - Monitor effectiveness
   - Measure KPIs to confirm improvement
   - Audit for sustained compliance
   - Close CAPA when verified effective

## KPIs for Resolution Tracking

Tracked via CI/CD pipeline:

- **Open issue count**: Active issues by priority level
- **Mean time to resolution**: Average days from open to closed
- **ECR cycle time**: Average days from ECR initiation to implementation
- **Deviation rate**: Number of deviations per 100 assemblies (target <1%)
- **Repeat issue rate**: % of issues recurring after corrective action (target <5%)
- **On-time closure**: % of issues closed by due date (target >90%)

## Interfaces

### Input Interfaces

- **From Assembly Operations**: Issues discovered during execution
- **From Quality Inspection**: Nonconformances requiring disposition
- **From Design Engineering**: Change requests for design improvements
- **From Lessons Learned**: Feedback from production and field service

### Output Interfaces

- **To Assembly Procedures**: Updated procedures incorporating resolutions
- **To Design Engineering**: Feedback for design improvements
- **To Training**: Updated training materials based on lessons learned
- **To Continuous Improvement**: Trends and opportunities for process enhancement

## Traceability and Evidence

All resolution logs must reference:

1. **Affected Artifacts**: UTCS anchors to assembly procedures, drawings, models
2. **Approval Records**: Digital signatures or approval documents
3. **Implementation Evidence**: UTCS anchors to updated procedures or test results
4. **Verification Records**: Data demonstrating effectiveness of resolution

Example UTCS anchor chain:
```
UTCS-MI:ASM:JOIN:ONB:0012:v1  (original procedure)
  → RESLOG-AAA-ISSUE-2025-0023  (issue identified)
  → RESLOG-AAA-ECR-2025-0042  (ECR to address)
  → UTCS-MI:ASM:JOIN:ONB:0012:v2  (updated procedure)
  → UTCS-MI:CAV:QIP:AAA:VERIFICATION-0042:v1  (verification)
```

## Related Directories

- [`../major-section-joins/`](../major-section-joins/) — Assembly procedures affected by resolutions
- [`../system-installation-steps/`](../system-installation-steps/) — System procedures requiring updates
- [`../digital-mockup-sims/`](../digital-mockup-sims/) — DMU validations of design changes
- [`../utcs/`](../utcs/) — UTCS records for resolution traceability
- `../../../CAV/QIP/` — Nonconformance reports and quality issues

## Standards and References

- **AS9100D**: Quality Management Systems (Clause 10 - Improvement)
- **ISO 9001:2015**: Corrective and Preventive Action requirements
- **EASA Part 21**: Design change approval process
- **SAE AS9102**: First Article Inspection after design changes
- **MIL-STD-973**: Configuration Management
- **EIA-649B**: Configuration Management Standard

## Governance and Reviews

### Approval Authority

- **Resolution Owner**: Depends on issue type (Engineering, Quality, Manufacturing)
- **ECR Approval**: Change Control Board (multi-disciplinary)
- **Deviation Approval**: Material Review Board (MRB)
- **CAPA Approval**: Quality Manager + affected discipline leads

### Review Gates

- **Weekly**: Open issue review and prioritization
- **Monthly**: ECR and deviation trending analysis
- **Quarterly**: CAPA effectiveness review
- **Annually**: Lessons learned compilation and process improvements

### Change Control

All resolution logs are permanent records:

1. Cannot be deleted, only superseded or closed
2. All revisions tracked with date and author
3. Approval signatures required before closure
4. Archived per regulatory retention requirements (typically 25+ years)

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 Quality Assurance Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
