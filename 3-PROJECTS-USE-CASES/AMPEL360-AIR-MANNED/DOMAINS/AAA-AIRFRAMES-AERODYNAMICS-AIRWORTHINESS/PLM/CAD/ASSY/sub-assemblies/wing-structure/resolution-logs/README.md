# Resolution Logs — Wing Structure

This directory contains Engineering Change Request (ECR) and deviation resolution logs for wing structure sub-assemblies.

## Overview

Tracking of design changes, non-conformances, deviations, and their resolutions for wing-box modules. Ensures complete traceability of all modifications from baseline configurations through manufacturing and assembly.

## Naming Convention

Files follow the pattern: `RESLOG-ONB-WINGBOX-{IDX}.md` where:
- `RESLOG` = Resolution log
- `ONB` = Onboard zone (or `OUT` for outboard)
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `RESLOG-ONB-WINGBOX-001.md`

## Log Structure

Each resolution log contains entries with:
- `ID` - Unique issue identifier (e.g., RL01, RL02)
- `Issue` - Brief description of the problem or change
- `Decision/ECR` - Resolution reference (ECR number, procedure reference)
- `Status` - Current state (Open, In Progress, Closed)
- `Notes` - Additional details, corrective actions, verification

## Common Wing Structure Issues

Typical issues tracked:
- **Hole ovality** - Fastener hole dimensional non-conformance
- **Surface defects** - Composite skin damage, scratches, delamination
- **Dimension deviations** - Out-of-tolerance features
- **Assembly fit issues** - Interference, excessive gaps
- **Material substitutions** - Alternative materials or suppliers
- **Design modifications** - Engineering changes for improvement
- **Process deviations** - Non-standard manufacturing procedures

## Issue Categories

- **Design Changes** - Intentional modifications to improve design
- **Non-Conformances (NCR)** - Parts/assemblies not meeting specifications
- **Deviations** - Approved departures from requirements
- **Corrective Actions (CAPA)** - Actions to prevent recurrence
- **Concessions** - Acceptance of non-conforming items with justification

## TFA Context

Primary flow: **FE**, coordinating change impacts across wing structure dependencies.

## UTCS Anchors

All resolution logs must be referenced via UTCS-MI anchors:
- `UTCS-MI:SUB:RESLOG:WINGBOX-{IDX}:v1`
- ECR references: `UTCS-MI:ECR:AAA:WINGBOX-{IDX}:{ECR-NUM}`

## Change Control Requirements

All logged issues must:
- Reference the baseline configuration
- Document nature and reason for issue
- Include technical impact assessment
- List affected documents and artifacts
- Track approval workflow and signatures
- Include verification evidence
- Update related UTCS anchors
- Cross-reference updated BOMs and drawings

## Resolution Process

Standard workflow:
1. **Issue identification** - Detection and documentation
2. **Root cause analysis** - Investigation of underlying cause
3. **Disposition** - Decision on corrective action (rework, accept, scrap)
4. **Implementation** - Execute corrective action
5. **Verification** - Confirm resolution effectiveness
6. **Closure** - Final approval and documentation

## Related Files

- BOM - `../boms/SA-AAA-WINGBOX-{IDX}.csv` (updated if parts change)
- ICD - `../icd/ICD-AAA-WINGBOX-{IDX}.md` (updated if interfaces affected)
- Tolerance Stack-ups - `../tolerance-stackups/TOL-ONB-WINGBOX-{IDX}.md` (if dimensional)
- UTCS Record - `../utcs/SA-AAA-WINGBOX-{IDX}.yaml`

## Governance

All ECRs and deviations must be:
- Reviewed by AAA Integration Lead
- Assessed for cross-module impacts
- Approved by Change Control Board (CCB)
- Verified before closure
- Archived for certification audit trail

## Template Files

- **`issues-log.csv`** - Generic issues log template with columns for ID, Title, Owner, Priority, Status, Opened (ISO), Due (ISO), Category, Reference/Link, and Notes. Use this as a starting point for tracking technical issues and decisions related to wing structure development.

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
