# ECR/Deviation Resolution Logs — AAA Domain

This directory contains Engineering Change Request (ECR) and deviation resolution logs for sub-assemblies of the AMPEL360-AIR-T BWB aircraft.

## Overview

Tracking of design changes, non-conformances, deviations, and their resolutions for sub-assembly modules. This ensures complete traceability of all modifications from baseline configurations.

## Naming Convention

Files follow the pattern: `SA-AAA-{MODULE}-{IDX}-RESLOG` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `SA-AAA-WINGBOX-001-RESLOG.md`

## Contents

This directory should contain:
- Engineering Change Requests (ECR)
- Non-conformance reports (NCR)
- Deviation approvals
- Root cause analyses
- Corrective and preventive actions (CAPA)
- Impact assessments (design, cost, schedule)
- Approval records and sign-offs
- Implementation status tracking
- Verification and closure documentation

## TFA Context

Primary flow: **FE**, coordinating change impacts across module dependencies.

## UTCS Anchors

All artifacts must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:SUB:RESLOG:{MODULE}-{IDX}:v1`
- `UTCS-MI:ECR:AAA:{MODULE}-{IDX}:{ECR-NUM}`

## Change Control Requirements

All resolution logs must:
- Reference the baseline configuration
- Document the nature and reason for change
- Include technical impact assessment
- List affected documents and artifacts
- Track approval workflow and signatures
- Include verification evidence
- Update related UTCS anchors
- Cross-reference to updated BOMs and drawings

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules
- [`../boms/`](../boms/) - Module BOMs
- [`../icd/`](../icd/) - Interface control definitions

## Governance

All ECRs and deviations must be:
- Reviewed by AAA Integration Lead
- Assessed for cross-domain impacts
- Approved by Change Control Board
- Verified before closure
- Archived for audit purposes

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions, required artifacts, and governance procedures.
