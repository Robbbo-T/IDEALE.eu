# UTCS — Traceability Anchors

This directory contains UTCS (UiX Threading Context/Content/Cache and Structure/Style/Sheet) traceability records for all CAS artifacts.

## Purpose

UTCS provides:
- **Unique identifiers** for every artifact
- **Provenance tracking** with approval chain
- **Cryptographic integrity** via content hashing
- **Traceability** to requirements, configuration, and evidence
- **Audit trail** for certification and compliance

## UTCS Anchor Pattern

All artifacts use standardized UTCS IDs:
```
UTCS-MI:AAA:CAS:06-10:{ARTIFACT-TYPE}:rev[X]
```

Examples:
- `UTCS-MI:AAA:CAS:06-10:DMRL:rev[A]`
- `UTCS-MI:AAA:CAS:06-10:DM:DESCRIPTIVE:rev[1]`
- `UTCS-MI:AAA:CAS:06-10:PM:AMM-STRUCT:rev[1]`
- `UTCS-MI:AAA:CAS:06-10:ICN:DATUM-GRID:rev[1]`

## Index File

**File**: `index.json`

The UTCS index tracks all artifacts with:
- Unique UTCS ID
- Artifact type (DataModule, PublicationModule, DMRL, BREX, Illustration)
- File path relative to CAS root
- DMC/PM code/ICN identifier
- Title and description
- Status (new, active, revised, superseded)
- Issue date
- Content hash (SHA-256)

### Index Structure

```json
{
  "schema_version": "1.0.0",
  "index_type": "S1000D-CSDB",
  "domain": "AAA",
  "system": "06-10",
  "utcs_anchors": [
    {
      "utcs_id": "UTCS-MI:AAA:CAS:06-10:DM:DESCRIPTIVE:rev[1]",
      "artifact_type": "DataModule",
      "file_path": "CSDB/DataModules/MAINTENANCE/06-10/DMC-...",
      "dmc": "DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-00",
      "title": "Reference Frame System - Description",
      "status": "new",
      "issue_date": "2025-01-31",
      "checksum": "sha256:..."
    }
  ]
}
```

## Usage

### For Authors
When creating a new artifact:
1. Create the artifact file (DM, PM, ICN, etc.)
2. Generate UTCS ID following the pattern
3. Add entry to `index.json`
4. Calculate SHA-256 checksum of artifact
5. Update checksum in UTCS entry

### For CI/CD
Automated UTCS validation:
```bash
# Validate UTCS index
python3 scripts/validate-utcs.py

# Check for:
# - Schema compliance
# - Unique UTCS IDs
# - Valid file paths
# - Checksum matches
# - No orphaned entries
```

### For Baselines
When creating a baseline:
1. Capture current UTCS index as `utcs-snapshot.json`
2. Include in baseline directory
3. Use for provenance and audit trail
4. Link to certification records

## UTCS Schema

**Location**: `../schemas/utcs/utcs.schema.json`

JSON Schema (Draft-07) validates:
- Required fields (utcs_id, domain, artifact_type, status)
- ID format patterns
- Artifact type enumerations
- Status values
- Checksum format (sha256:...)
- Date formats (YYYY-MM-DD)

## Checksum Calculation

Calculate SHA-256 checksums:
```bash
# For XML files
sha256sum CSDB/DataModules/MAINTENANCE/06-10/DMC-*.xml

# For all files
find CSDB -type f -name "*.xml" -o -name "*.svg" | \
  xargs sha256sum > checksums.txt
```

Update UTCS index with calculated checksums.

## Provenance Chain

UTCS enables full provenance tracking:
```
Requirement → Design → DM → PM → Publication → Baseline
     ↓           ↓       ↓      ↓         ↓          ↓
  UTCS-REQ   UTCS-DES  UTCS-DM  UTCS-PM  UTCS-PUB  UTCS-BASE
```

Each UTCS entry can reference:
- **source_utcs** — What this was derived from
- **related_utcs** — Related artifacts
- **supersedes_utcs** — Previous version
- **superseded_by_utcs** — Next version

## Certification Support

UTCS anchors support certification by providing:
- **Immutable identifiers** that don't change with file moves
- **Cryptographic verification** of content integrity
- **Audit trail** of all changes with dates
- **Traceability** to requirements and evidence
- **Provenance** chain for compliance demonstration

## Integration with Standards

UTCS complements existing standards:
- **S1000D** — UTCS IDs supplement DMC/pmCode
- **ATA iSpec 2200** — UTCS links to ATA chapters
- **CS-25** — UTCS traces to certification basis
- **S2000M** — UTCS links spare parts to documentation

## Blockchain Anchoring (Optional)

For critical artifacts, UTCS can be anchored to blockchain:
```yaml
blockchain_anchor:
  chain: "Ethereum"
  transaction_hash: "0xabc123..."
  block_number: 18234567
  anchor_date: "2025-01-31T12:00:00Z"
```

This provides tamper-proof certification records.

## Maintenance

### Adding New Artifact
1. Create artifact file
2. Generate UTCS ID
3. Add entry to index.json
4. Calculate checksum
5. Validate with schema

### Updating Artifact
1. Modify artifact file
2. Update issue number/date
3. Recalculate checksum
4. Update UTCS entry
5. Optionally create new UTCS ID for major revisions

### Superseding Artifact
1. Create new artifact with new UTCS ID
2. Mark old UTCS entry as "superseded"
3. Add "superseded_by_utcs" reference to old entry
4. Add "supersedes_utcs" reference to new entry

## CI/CD Validation

UTCS validation gates:
- ✅ Schema conformance
- ✅ Unique UTCS IDs
- ✅ File paths resolve
- ✅ Checksums match
- ✅ No orphaned entries
- ✅ Status values valid
- ✅ Date formats correct

## Related

- [../schemas/utcs/](../schemas/utcs/) — UTCS JSON Schema
- [../Outputs/Baselines/](../Outputs/Baselines/) — Baselines with UTCS snapshots
- [../Governance/](../Governance/) — Policies enforced via UTCS
- [../../../../../../standards/IDEALE-STD-0001-UTCS.md](../../../../../../standards/IDEALE-STD-0001-UTCS.md) — UTCS specification

## Best Practices

- **Generate Early** — Create UTCS IDs when authoring starts
- **Keep Current** — Update checksums when content changes
- **Validate Often** — Run UTCS validation in CI pipeline
- **Snapshot Baselines** — Always include UTCS snapshot in baselines
- **Link Artifacts** — Use UTCS IDs to link related content
- **Audit Trail** — Maintain history of UTCS ID changes
