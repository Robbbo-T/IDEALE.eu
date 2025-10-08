# DMRL — Data Module Requirements List

This directory contains the Data Module Requirements List (DMRL) for tracking publication requirements.

## Purpose

The DMRL is the authoritative list of Data Modules required for each publication:
- Defines which DMs are needed for AMM, SRM, IPD publications
- Tracks DM status (new, revised, deleted)
- Links DMs to Publication Modules
- Ensures publication completeness

## DMRL as a Data Module

The DMRL itself is a Data Module:
- **Info Code**: 014A (DMRL designation)
- **Filename**: `dmrl.xml` (follows DMC pattern)
- **DMC**: `DMC-AMP360-AAA-00-00-00-00A-014A-A_en-001-00`

## Current DMRL

**File**: `dmrl.xml`

This DMRL tracks all Data Modules for the ATA 06-10 Reference Frame system:

### Included Data Modules

1. **Descriptive DM** (06-10-00-00A-00GA-A) — Reference Frame System Description
2. **Procedural DM** (06-10-00-00A-000A-A) — Datum Points Inspection
3. **Fault Isolation DM** (06-10-00-00A-04DA-A) — Misalignment Troubleshooting
4. **Common Info DM** (00-00-00-00A-00UA-A) — Warnings and Cautions
5. **ACT DM** (00-00-00-00A-022A-A) — Applicability Cross-reference Table

## DMRL Structure

Each entry in the DMRL includes:
```xml
<dmRequirementsListEntry>
  <dmRef>
    <dmRefIdent>
      <dmCode ... />
    </dmRefIdent>
  </dmRef>
  <issueInfo issueNumber="001" inWork="00"/>
  <dmStatus dmStatusValue="new"/>
</dmRequirementsListEntry>
```

## Status Values

DM status in DMRL indicates lifecycle:
- **new** — Newly created DM
- **changed** — DM content modified
- **deleted** — DM removed from publication
- **revised** — DM updated with new issue

## Usage in Publication Process

### 1. Authoring Phase
When creating a new DM:
1. Author the DM in appropriate DataModules subdirectory
2. Add DM entry to DMRL
3. Reference DM in Publication Module
4. Validate DMRL completeness

### 2. Validation Phase
CI/CD checks verify:
- ✅ All PM-referenced DMs appear in DMRL
- ✅ All DMRL-listed DMs exist in CSDB
- ✅ DMC references match actual filenames
- ✅ Issue info is current and valid

### 3. Publication Phase
DMRL drives publication generation:
- Publication tools read DMRL
- Extract referenced DMs
- Assemble into publication structure
- Generate output (PDF/Web/IETP)

## Updating the DMRL

To add a new DM to publication:
1. Create and validate the DM
2. Edit `dmrl.xml`
3. Add new `<dmRequirementsListEntry>` with DM reference
4. Set appropriate `dmStatus` value
5. Update `issueInfo` of DMRL itself
6. Validate against DMRL schema
7. Commit changes

## Baseline Management

DMRL is critical for baselines:
- Included in every baseline snapshot
- Frozen at time of baseline creation
- Used to recreate exact publication state
- Provides audit trail of publication contents

Each baseline includes:
```
Baselines/{DATE}_{PUB}_{REV}/
  ├── dmrl.xml          ← Frozen DMRL
  ├── dms/              ← All referenced DMs
  ├── pm/               ← Publication Modules
  └── checksum/         ← Integrity verification
```

## CI/CD Validation Gates

DMRL validation enforces:
1. **Completeness** — No missing DMs
2. **Consistency** — DMCs match filenames
3. **Currency** — Issue info is up-to-date
4. **Coverage** — All PM references in DMRL

Failure at any gate blocks publication.

## Related

- [../PublicationModules/](../PublicationModules/) — PMs that reference DMRL
- [../DataModules/](../DataModules/) — DMs tracked by DMRL
- [../../Outputs/Baselines/](../../Outputs/Baselines/) — Baselines containing frozen DMRL
- S1000D Issue 6.0, Chapter 3.9.7 — DMRL specification

## Best Practices

- **Single Source of Truth** — DMRL is the authoritative list
- **Keep Current** — Update DMRL immediately when DMs change
- **Version Control** — Track DMRL changes in git
- **Validate Early** — Check DMRL completeness before publication
- **Baseline Freeze** — Never modify DMRL in published baselines
