# Outputs

This directory contains published outputs and immutable baselines.

## Structure

### PUBLISH/
Published deliverables ready for distribution:
- **AMM-Published/** — Aircraft Maintenance Manual (PDF/Web/IETP)
- **SRM-Published/** — Structural Repair Manual (PDF/Web/IETP)
- **IPD-Published/** — Illustrated Parts Data (PDF/Web/IETP)

### Baselines/
Immutable baseline snapshots for configuration control.

Each baseline includes:
- `pm/` — Publication Module files
- `dms/` — All Data Module files
- `dmrl.xml` — Data Module Requirements List
- `checksum/` — SHA-256 checksums for all files
- `utcs-snapshot.json` — UTCS provenance snapshot

## Baseline Naming

```
{YYYY-MM-DD}_AMM06-10_{BASELINE_ID}/
```

Example:
```
2025-01-31_AMM06-10_REV-A/
  ├─ pm/
  ├─ dms/
  ├─ dmrl.xml
  ├─ checksum/
  └─ utcs-snapshot.json
```

## Publishing Process

1. Validate all DMs (XSD, Schematron, BREX)
2. Check DMRL completeness
3. Resolve all ACT applicability
4. Generate publication (PDF/Web/IETP)
5. Create baseline snapshot
6. Calculate checksums
7. Capture UTCS provenance
8. Archive in Baselines/

## Baseline Immutability

Once created, baselines are **immutable**:
- Read-only permissions
- Cryptographic checksums verify integrity
- Never delete or modify
- Create new baseline for changes

## CI/CD Gates

Before publishing:
- ✅ All DMs pass validation
- ✅ All PM references resolve
- ✅ DMRL is complete
- ✅ ACT applicability is valid
- ✅ All ICNs exist
- ✅ Governance policies satisfied

## UTCS Anchors

Each baseline gets a UTCS anchor:
```
UTCS-MI:AAA:CAS:06-10:AMM:PUBLISH:2025-01-31:rev[1]
```

## Related

- [../CSDB/](../CSDB/) — Source content
- [../Governance/](../Governance/) — Publishing policies
