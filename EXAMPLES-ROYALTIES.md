# Meta-Royalties Examples

This document provides practical examples of using the IDEALE.eu meta-royalties system.

## Example 1: Basic Artifact with AI Assistant

A designer creates an artifact using standard schemas and AI assistance (Copilot):

```json
{
  "artifact": {
    "content_hash": "sha256:abc123...",
    "declared_value_eur": 5000,
    "license": "Apache-2.0",
    "tooling": {
      "used": [
        {
          "id": "ideale://standards/artifact.schema.v0.1",
          "version": "0.1.0",
          "weight": 1.0
        },
        {
          "id": "agent:copilot",
          "version": null,
          "weight": 0.3,
          "payoutHint": {"tt": "sink:ai-compute"}
        }
      ]
    },
    "revshare": {
      "allocations": [
        {"id": "did:github:designer-alice", "share_bps": 10000}
      ]
    }
  }
}
```

**Royalty Breakdown (0.1% fee = 5 EUR):**
- Creator (Alice): 3.00 EUR (60%)
- Validators: 1.15 EUR (23%)
- Infra/Tooling: 0.75 EUR (15%)
  - Schema: 0.58 EUR (weight 1.0 / 1.3)
  - Copilot: 0.17 EUR (weight 0.3 / 1.3) → goes to ai-compute fund
- Treasury: 0.10 EUR (2%)

## Example 2: Complex Artifact with Multiple Tools

A team uses multiple meta-assets including workflows and validation tools:

```json
{
  "artifact": {
    "content_hash": "sha256:def456...",
    "declared_value_eur": 25000,
    "license": "Apache-2.0",
    "tooling": {
      "used": [
        {
          "id": "ideale://standards/artifact.schema.v0.1",
          "version": "0.1.0",
          "weight": 1.0
        },
        {
          "id": "ideale://workflows/ief-verify.v0.1",
          "version": "0.1.0",
          "weight": 0.8
        },
        {
          "id": "ideale://tools/sbom-generator.v0.1",
          "version": "0.1.0",
          "weight": 0.5
        },
        {
          "id": "agent:copilot",
          "version": null,
          "weight": 0.4,
          "payoutHint": {"tt": "creator/team-lead"}
        }
      ]
    },
    "revshare": {
      "allocations": [
        {"id": "did:github:team-lead", "share_bps": 4000},
        {"id": "did:github:engineer-1", "share_bps": 3000},
        {"id": "did:github:engineer-2", "share_bps": 3000}
      ]
    }
  }
}
```

**Royalty Breakdown (0.1% fee = 25 EUR):**
- Creators: 15.00 EUR (60%)
  - Team Lead: 6.00 EUR (40%)
  - Engineer 1: 4.50 EUR (30%)
  - Engineer 2: 4.50 EUR (30%)
- Validators: 5.75 EUR (23%)
- Infra/Tooling: 3.75 EUR (15%)
  - Schema: 1.39 EUR (weight 1.0 / 2.7)
  - IEF Verify: 1.11 EUR (weight 0.8 / 2.7)
  - SBOM Generator: 0.69 EUR (weight 0.5 / 2.7)
  - Copilot: 0.56 EUR (weight 0.4 / 2.7) → credited to team-lead
- Treasury: 0.50 EUR (2%)

## Example 3: No Meta-Assets (Legacy Compatibility)

An artifact that doesn't use any registered meta-tools:

```json
{
  "artifact": {
    "content_hash": "sha256:ghi789...",
    "declared_value_eur": 8000,
    "license": "Apache-2.0",
    "revshare": {
      "allocations": [
        {"id": "did:github:solo-creator", "share_bps": 10000}
      ]
    }
  }
}
```

**Royalty Breakdown (0.1% fee = 8 EUR):**
- Creator: 4.80 EUR (60%)
- Validators: 1.84 EUR (23%)
- Infra/Tooling: 1.20 EUR (15%) → goes to treasury (no meta-assets)
- Treasury: 0.16 EUR (2%)

## Example 4: Equal Weight Distribution

When weights are not specified or all set to 0, meta-assets split equally:

```json
{
  "artifact": {
    "content_hash": "sha256:jkl012...",
    "declared_value_eur": 15000,
    "license": "MIT",
    "tooling": {
      "used": [
        {"id": "ideale://standards/artifact.schema.v0.1", "version": "0.1.0"},
        {"id": "ideale://workflows/ief-verify.v0.1", "version": "0.1.0"},
        {"id": "agent:copilot", "payoutHint": {"tt": "sink:ai-compute"}}
      ]
    },
    "revshare": {
      "allocations": [
        {"id": "did:github:creator-bob", "share_bps": 10000}
      ]
    }
  }
}
```

**Royalty Breakdown (0.1% fee = 15 EUR):**
- Creator: 9.00 EUR (60%)
- Validators: 3.45 EUR (23%)
- Infra/Tooling: 2.25 EUR (15%)
  - Schema: 0.75 EUR (equal split)
  - IEF Verify: 0.75 EUR (equal split)
  - Copilot: 0.75 EUR (equal split) → goes to ai-compute fund
- Treasury: 0.30 EUR (2%)

## Example 5: Custom Payout Hints

Using custom payout hints to override registry defaults:

```json
{
  "artifact": {
    "content_hash": "sha256:mno345...",
    "declared_value_eur": 12000,
    "license": "Apache-2.0",
    "tooling": {
      "used": [
        {
          "id": "ideale://custom-tool/processor.v1.0",
          "version": "1.0.0",
          "weight": 1.0,
          "payoutHint": {
            "tt": "creator/custom-tool-maintainer",
            "iban": "DE89370400440532013000"
          }
        },
        {
          "id": "agent:gpt5",
          "version": "5.0",
          "weight": 0.5,
          "payoutHint": {
            "tt": "creator/ai-operator-charlie"
          }
        }
      ]
    },
    "revshare": {
      "allocations": [
        {"id": "did:github:charlie", "share_bps": 10000}
      ]
    }
  }
}
```

**Royalty Breakdown (0.1% fee = 12 EUR):**
- Creator (Charlie): 7.20 EUR (60%)
- Validators: 2.76 EUR (23%)
- Infra/Tooling: 1.80 EUR (15%)
  - Custom Tool: 1.20 EUR (weight 1.0 / 1.5) → custom-tool-maintainer
  - GPT-5: 0.60 EUR (weight 0.5 / 1.5) → ai-operator-charlie
- Treasury: 0.24 EUR (2%)

## Command Line Usage

### Accrue Royalties for an Event

```bash
# PR merge event
python3 scripts/accrue_royalty.py artifacts/my-design/artifact.json PR_MERGE

# Release event
python3 scripts/accrue_royalty.py artifacts/my-design/artifact.json RELEASE

# Custom event with value override
python3 scripts/accrue_royalty.py artifacts/my-design/artifact.json SALE 20000
```

### View Ledger

```bash
# Show all entries
cat royalties/ledger.jsonl | jq '.'

# Show summary
cat royalties/ledger.jsonl | jq -r '[.ts, .event, .fee_eur] | @tsv'

# Calculate total fees
cat royalties/ledger.jsonl | jq -s 'map(.fee_eur) | add'

# Show infra earnings
cat royalties/ledger.jsonl | jq -s 'map(.split.infra_eur) | add'
```

## Key Principles

1. **Transparency**: All accruals are recorded in the append-only ledger
2. **Flexibility**: Weights allow proportional attribution
3. **Attribution**: AI assistants are recognized and compensated through operators or funds
4. **Compatibility**: Optional tooling declaration maintains backward compatibility
5. **Governance**: Fee distribution percentages are configurable

## Next Steps

See `README-ROYALTIES.md` for full documentation and roadmap items.
