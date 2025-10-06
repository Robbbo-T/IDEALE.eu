# Creator Royalties Quick Start Guide

## Overview

The IDEALE creator royalties system automatically remunerates creators when their artifacts are used, providing:
- **Automatic accrual** on anchor, reuse, verify, and derivative events
- **Transparent distribution** (60% creators, 25% validators, 15% treasury)
- **Cryptographic traceability** with complete audit trail
- **Off-chain today, on-chain tomorrow** seamless migration path

## Quick Start

### 1. Create an Artifact with Royalty Metadata

Create a file ending in `.artifact.json` with creator allocations:

```json
{
  "artifact": {
    "content_hash": "sha256:YOUR_HASH_HERE",
    "declared_value_eur": 10000,
    "license": "Apache-2.0",
    "revshare": {
      "total_bps": 10000,
      "allocations": [
        {
          "id": "did:github:alice",
          "role": "author",
          "share_bps": 7000,
          "payout": {"tt": "creator/alice", "iban": null}
        },
        {
          "id": "did:github:bob",
          "role": "coauthor",
          "share_bps": 3000,
          "payout": {"tt": "creator/bob", "iban": null}
        }
      ],
      "derivative_policy": "accumulate_by_reference"
    }
  }
}
```

**Key fields:**
- `content_hash`: SHA-256 hash of your artifact (prefixed with "sha256:")
- `declared_value_eur`: Estimated value in EUR (used for fee calculation)
- `total_bps`: Always 10000 (100% in basis points)
- `allocations`: List of creators with their share (must sum to 10000)
- `share_bps`: Creator's share in basis points (7000 = 70%)

### 2. Accrue Royalties

When an event occurs, run:

```bash
python3 scripts/accrue_royalty.py path/to/artifact.json <event> [value]
```

**Events:**
- `anchor` - First anchoring of the artifact
- `reuse` - Use by another organization
- `verify` - Premium verification/certification  
- `derivative` - Creation of derived work

**Examples:**

```bash
# Anchor with artifact's declared value
python3 scripts/accrue_royalty.py my-component.artifact.json anchor

# Reuse with custom transaction value
python3 scripts/accrue_royalty.py my-component.artifact.json reuse 50000

# Premium verification
python3 scripts/accrue_royalty.py my-component.artifact.json verify 5000
```

### 3. Review Royalty Ledger

All accruals are recorded in `royalties/ledger.jsonl`:

```bash
# View all entries
cat royalties/ledger.jsonl | jq

# View entries for specific artifact
grep "YOUR_HASH" royalties/ledger.jsonl | jq

# Sum royalties for a creator
cat royalties/ledger.jsonl | jq -r '.allocations[] | select(.id=="did:github:alice") | .amount_eur' | paste -sd+ | bc
```

### 4. Automatic CI Integration

The system automatically detects artifact files in pull requests:

1. Create or update any file ending in `.artifact.json`
2. Open a pull request
3. GitHub Actions workflow detects and accrues royalties
4. Comment posted with accrual preview

## Configuration

Edit `config/royalties.json` to adjust:

```json
{
  "version": "0.1",
  "fee_bps": 10,                    // 0.1% fee
  "distribution": {
    "creators_bps_of_fee": 6000,    // 60% to creators
    "validators_bps_of_fee": 2500,  // 25% to validators
    "treasury_bps_of_fee": 1500     // 15% to treasury
  },
  "min_payout_threshold_tt": 50,
  "payout_period_days": 14
}
```

## Fee Calculation Example

Given:
- Transaction value: €10,000
- Fee: 10 bps (0.1%)
- Creator A: 70% share
- Creator B: 30% share

Calculation:
1. Fee: €10,000 × 0.001 = €10
2. Creators pool: €10 × 60% = €6
3. Creator A: €6 × 70% = €4.20
4. Creator B: €6 × 30% = €1.80

## Validation

Validate your artifact metadata:

```bash
python3 -c "
import json
from jsonschema import validate
schema = json.load(open('standards/v0.1/artifact.schema.json'))
artifact = json.load(open('your-file.artifact.json'))
validate(artifact, schema)
print('✓ Valid')
"
```

## On-Chain Migration

When ready for on-chain distribution:

1. Deploy `contracts/RevenueSplit.sol`
2. Register artifacts with their allocations
3. Call `distribute()` to split TT tokens automatically
4. Ledger bridges off-chain history to on-chain state

## See Also

- [Creator Royalties Specification](../standards/v0.1/creator-royalties.md)
- [Artifact Schema](../standards/v0.1/artifact.schema.json)
- [Examples](../examples/royalties/)
- [Ledger Format](../royalties/README.md)

## FAQ

**Q: Can I change the fee percentage?**  
A: Yes, edit `config/royalties.json`, but keep it ≤100 bps (1%) per standard.

**Q: What if allocations don't sum to 10000?**  
A: The script will fail validation. Always ensure `sum(share_bps) == 10000`.

**Q: Can I add more creators later?**  
A: Create a new artifact version with updated allocations. The old one remains immutable.

**Q: How do I handle derivatives?**  
A: Set `derivative_policy` to `accumulate_by_reference` and reference parent artifacts.

**Q: Is PII stored on-chain?**  
A: No. Only hashes and DIDs are recorded. PII stays off-chain per GDPR.
