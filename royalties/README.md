# Royalties Ledger Directory

This directory contains the append-only ledger tracking all royalty accruals in the IDEALE.eu system.

## Files

### ledger.jsonl

The primary ledger file storing all royalty distribution records in JSON Lines format (one JSON object per line).

**Location:** `royalties/ledger.jsonl`

**Format:** Each line is a complete JSON object representing one accrual event.

## Ledger Entry Structure

```json
{
  "ts": "2025-10-05T18:20:15Z",
  "type": "ROYALTY_ACCRUE",
  "artifact_hash": "sha256:1234567890abcdef...",
  "event": "PR_MERGE",
  "declared_value_eur": 10000.0,
  "fee_bps": 10,
  "fee_eur": 10.0,
  "split": {
    "creators_eur": 6.0,
    "validators_eur": 2.3,
    "infra_eur": 1.5,
    "treasury_eur": 0.2
  },
  "allocations": [
    {"id": "did:github:alice", "share_bps": 6000, "amount_eur": 3.6},
    {"id": "did:github:bob", "share_bps": 4000, "amount_eur": 2.4}
  ],
  "meta": [
    {
      "id": "ideale://standards/artifact.schema.v0.1",
      "version": "0.1.0",
      "weight": 1.0,
      "amount_eur": 0.882353,
      "payout": {"tt": "creator/ideale-core", "iban": null}
    }
  ]
}
```

## Viewing the Ledger

### Show all entries (pretty-printed)
```bash
cat royalties/ledger.jsonl | jq '.'
```

### Show summary of all entries
```bash
cat royalties/ledger.jsonl | jq -r '[.ts, .event, .fee_eur] | @tsv' | column -t
```

### Calculate total fees accrued
```bash
cat royalties/ledger.jsonl | jq -s 'map(.fee_eur) | add'
```

### Show infrastructure earnings
```bash
cat royalties/ledger.jsonl | jq -s 'map(.split.infra_eur) | add'
```

### Filter by event type
```bash
cat royalties/ledger.jsonl | jq 'select(.event == "PR_MERGE")'
```

### Show earnings by creator
```bash
cat royalties/ledger.jsonl | jq -s '
  [.[] | .allocations[]] | 
  group_by(.id) | 
  map({id: .[0].id, total: (map(.amount_eur) | add)})
'
```

## Ledger Guarantees

1. **Append-only** — Entries are never modified or deleted
2. **Immutable** — Once written, records are permanent
3. **Traceable** — Every entry links to a specific artifact hash
4. **Timestamped** — All entries include ISO 8601 timestamps
5. **Transparent** — Complete distribution breakdown included

## Automated Updates

The ledger is automatically updated by:
- **GitHub Actions** — On artifact.json changes in PRs/merges
- **Manual accrual** — Via `scripts/accrue_royalty.py`

See [.github/workflows/royalties-accrual.yml](../.github/workflows/royalties-accrual.yml)

## File Format

The ledger uses JSON Lines (.jsonl) format:
- Each line is a valid, self-contained JSON object
- Lines are separated by newline characters
- Order is chronological (oldest first)
- No trailing commas or array wrappers

This format allows:
- Streaming processing of large files
- Easy appending without parsing entire file
- Line-by-line analysis with standard tools

## Backup and Archival

The ledger should be:
- **Backed up regularly** — Part of repository backups
- **Version controlled** — Tracked in Git for history
- **Archived periodically** — For long-term storage compliance

## Payout Processing

While the ledger tracks accruals, actual payouts are handled separately:
1. Review ledger entries for a period
2. Aggregate by recipient
3. Process payments via configured channels (TT, IBAN, etc.)
4. Record payout transactions externally

See [README-ROYALTIES.md](../README-ROYALTIES.md) for roadmap on automated payout processing.

## See Also

- [scripts/accrue_royalty.py](../scripts/accrue_royalty.py) — Accrual script
- [config/royalties.json](../config/royalties.json) — Distribution configuration
- [README-ROYALTIES.md](../README-ROYALTIES.md) — Full system documentation
