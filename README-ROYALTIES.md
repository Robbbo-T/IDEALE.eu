# IDEALE.eu Meta-Royalties System

This directory contains configuration and tooling for the automated royalty distribution system that compensates creators, validators, and meta-creators (tooling/infrastructure providers).

## Overview

The meta-royalties system ensures that everyone who contributes to artifact creation receives fair compensation:
- **Creators**: Authors and designers of artifacts
- **Validators**: Reviewers and quality assurance
- **Infra & Tooling**: Maintainers of schemas, workflows, generators, and AI assistants
- **Treasury**: Organizational sustainability fund

## Configuration

### `config/royalties.json`

Defines the fee structure and distribution model:

```json
{
  "fee_bps": 10,                    // 0.1% fee on declared value
  "distribution": {
    "creators_bps_of_fee": 6000,    // 60% of fee to creators
    "validators_bps_of_fee": 2300,  // 23% to validators
    "infra_bps_of_fee": 1500,       // 15% to infra/tooling
    "treasury_bps_of_fee": 200      // 2% to treasury
  }
}
```

**Note**: Distribution BPS must sum to 10000 (100% of fee).

## Standards

### Artifact Schema (`standards/v0.1/artifact.schema.json`)

JSON Schema defining artifact metadata structure, including:
- Content hash (SHA-256)
- Declared value in EUR
- License information
- **Tooling declaration**: List of meta-assets used
- Revenue sharing allocations

### Meta-Assets Registry (`standards/v0.1/meta-assets.registry.json`)

Registry mapping meta-asset IDs to payout accounts:
- Schemas and standards
- Workflows and CI tools
- AI agents and assistants

### Policy Documentation (`standards/v0.1/meta-royalties.md`)

Complete policy documentation explaining:
- Meta-royalty pool mechanics
- Payment resolution process
- AI assistant attribution
- System invariants

## Usage

### Creating an Artifact

Create an `artifact.json` file declaring:

```json
{
  "artifact": {
    "content_hash": "sha256:...",
    "declared_value_eur": 10000,
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
          "weight": 0.2,
          "payoutHint": {"tt": "sink:ai-compute"}
        }
      ]
    },
    "revshare": {
      "allocations": [
        {"id": "did:github:alice", "share_bps": 6000},
        {"id": "did:github:bob", "share_bps": 4000}
      ]
    }
  }
}
```

### Manual Accrual

```bash
python3 scripts/accrue_royalty.py artifacts/my-design/artifact.json PR_MERGE
```

### Automated Accrual

The GitHub Actions workflow `.github/workflows/royalties-accrual.yml` automatically:
1. Detects artifact.json changes in PRs
2. Accrues royalties on merge to main
3. Updates the ledger at `royalties/ledger.jsonl`
4. Posts summary comments on PRs

## Ledger

The `royalties/ledger.jsonl` file contains append-only records of all royalty accruals:

```json
{
  "ts": "2025-10-05T18:20:15Z",
  "type": "ROYALTY_ACCRUE",
  "artifact_hash": "sha256:...",
  "event": "PR_MERGE",
  "declared_value_eur": 10000.0,
  "fee_eur": 10.0,
  "split": {
    "creators_eur": 6.0,
    "validators_eur": 2.3,
    "infra_eur": 1.5,
    "treasury_eur": 0.2
  },
  "allocations": [...],
  "meta": [...]
}
```

## Attribution for AI Assistants

AI assistants like GitHub Copilot can be attributed in two ways:

1. **Compute sink**: Credit goes to a repository fund
   ```json
   {"id": "agent:copilot", "payoutHint": {"tt": "sink:ai-compute"}}
   ```

2. **Human operator**: Credit goes to the person using the tool
   ```json
   {"id": "agent:copilot", "payoutHint": {"tt": "creator/username"}}
   ```

This ensures transparency and recognizes the role of AI tools while maintaining ethical compensation practices.

## Roadmap

- [ ] Liquidation/payout command (consolidate by period)
- [ ] Validator that checks tooling.used coherence
- [ ] Claims process for meta-asset maintainers
- [ ] Dashboard for tracking earnings and trends
- [ ] Multi-currency support beyond EUR

## License

This royalty system respects the Apache 2.0 license of the repository while enabling fair compensation for all contributors.
