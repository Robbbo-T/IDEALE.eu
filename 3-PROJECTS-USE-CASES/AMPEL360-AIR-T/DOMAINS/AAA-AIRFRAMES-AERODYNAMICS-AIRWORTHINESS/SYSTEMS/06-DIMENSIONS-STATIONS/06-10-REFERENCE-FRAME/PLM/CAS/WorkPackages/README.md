# WorkPackages

This directory contains executable task packages for maintenance operations.

## Purpose

WorkPackages bridge S1000D technical content to real-world maintenance tasks:
- Task cards for technicians
- Checklists for inspections
- Work schedules
- Job package definitions

## Mapping to Data Modules

WorkPackages reference Data Modules but are not S1000D content themselves:

```json
{
  "workPackageId": "WP-06-10-001",
  "title": "Reference Frame Inspection",
  "dmcReferences": [
    "DMC-AMP360-AAA-06-10-00-00A-000A-A_en-001-00",
    "DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-00"
  ],
  "applicability": {
    "msn": ["001", "002", "003"],
    "effectivity": "2025-01-01"
  },
  "estimatedHours": 4.0,
  "skills": ["Airframe Mechanic", "Inspector"]
}
```

## Work Package Types

- **Scheduled maintenance** — Routine inspections
- **Unscheduled maintenance** — Fault isolation and repair
- **Modification** — Configuration changes
- **Inspection** — Special inspections

## Structure

Files are organized by package type:
```
task-cards/
  WP-06-10-001-inspection.json
  WP-06-10-002-verification.json
checklists/
  CL-06-10-001-datum-check.json
schedules/
  SCHED-06-10-weekly.json
  SCHED-06-10-monthly.json
```

## Integration with Operations

WorkPackages link to:
- **Fleet data** — Aircraft status, configuration
- **Planning systems** — Maintenance schedules
- **Execution systems** — Digital work cards
- **Quality systems** — Sign-off and approval

## Applicability Control

WorkPackages respect ACT (Applicability Cross-reference Table):
- Only show applicable tasks for specific aircraft
- Filter by configuration
- Apply effectivity dates

## UTCS Traceability

Each WorkPackage gets UTCS anchor:
```
UTCS-MI:AAA:CAS:06-10:WP:001:rev[A]
```

Links to:
- Source DMs
- Approval records
- Execution logs
- Quality sign-offs

## Related

- [../CSDB/DataModules/](../CSDB/DataModules/) — Referenced DMs
- [../CSDB/DataModules/APPLICABILITY/ACT/](../CSDB/DataModules/APPLICABILITY/ACT/) — Applicability rules
- [./mapping.json](./mapping.json) — Example mapping file
