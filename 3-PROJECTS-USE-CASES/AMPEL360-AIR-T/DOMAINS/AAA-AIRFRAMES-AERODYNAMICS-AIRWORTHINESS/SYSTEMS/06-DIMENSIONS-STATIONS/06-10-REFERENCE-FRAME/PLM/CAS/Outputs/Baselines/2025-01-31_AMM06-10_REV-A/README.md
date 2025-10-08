# Baseline: 2025-01-31_AMM06-10_REV-A

This is an immutable baseline snapshot of the Aircraft Maintenance Manual for ATA 06-10 Reference Frame.

## Baseline Information

- **Date**: 2025-01-31
- **Publication**: AMM (Aircraft Maintenance Manual)
- **System**: 06-10 Reference Frame
- **Revision**: A
- **UTCS Anchor**: `UTCS-MI:AAA:CAS:06-10:AMM:PUBLISH:2025-01-31:rev[1]`

## Contents

### pm/
Publication Module files:
- `PM-AMP360-AMM-06-10-STRUCT.xml` — Structure PM

### dms/
All Data Modules included in this publication:
- Descriptive DMs (06-10 system description)
- Procedural DMs (inspection, maintenance)
- Fault Isolation DMs
- Common Information Repository
- Applicability Cross-reference Table

### dmrl.xml
Data Module Requirements List defining all required DMs for this publication.

### checksum/
SHA-256 checksums for all files to verify integrity:
- `checksums.txt` — Complete checksum list
- Individual checksum files for critical artifacts

### utcs-snapshot.json
Complete UTCS provenance snapshot at time of baseline creation.

## Immutability

This baseline is **immutable**:
- ✅ Read-only permissions enforced
- ✅ Cryptographic checksums verify integrity
- ✅ UTCS anchor provides tamper-proof reference
- ❌ Never modify or delete baseline content
- ❌ Never reuse baseline identifiers

## Verification

Verify baseline integrity:

```bash
cd Outputs/Baselines/2025-01-31_AMM06-10_REV-A
sha256sum -c checksum/checksums.txt
```

Expected output: All files should show "OK"

## Usage

This baseline is used for:
- Configuration management
- Certification records
- Version control
- Audit trail
- Historical reference
- Rollback capability

## Next Revision

To create a new revision:
1. Make changes in working CSDB
2. Validate all changes
3. Create new baseline with next revision ID
4. Link to previous baseline in metadata

## Related

- [../../CSDB/](../../CSDB/) — Source content
- [../PUBLISH/](../PUBLISH/) — Published outputs
- [../../utcs/](../../utcs/) — UTCS traceability
