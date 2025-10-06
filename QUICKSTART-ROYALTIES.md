# Quick Start: Meta-Royalties System

## What is it?

An automated royalty distribution system that compensates:
- **Creators** (60%) — artifact authors and designers
- **Validators** (23%) — reviewers and QA
- **Infrastructure** (15%) — schema/workflow/tool maintainers + AI assistants
- **Treasury** (2%) — organizational funds

## 5-Minute Setup

### 1. Create your artifact metadata

```bash
mkdir -p artifacts/my-project
cat > artifacts/my-project/artifact.json << 'JSON'
{
  "artifact": {
    "content_hash": "sha256:YOUR_CONTENT_HASH_HERE",
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
          "weight": 0.2,
          "payoutHint": {"tt": "sink:ai-compute"}
        }
      ]
    },
    "revshare": {
      "allocations": [
        {"id": "did:github:YOUR_USERNAME", "share_bps": 10000}
      ]
    }
  }
}
JSON
```

### 2. Validate your artifact

```bash
python3 << 'PY'
import json
from jsonschema import validate
schema = json.load(open('standards/v0.1/artifact.schema.json'))
artifact = json.load(open('artifacts/my-project/artifact.json'))
validate(artifact, schema)
print("✓ Valid!")
PY
```

### 3. Accrue royalties

```bash
python3 scripts/accrue_royalty.py artifacts/my-project/artifact.json PR_MERGE
```

### 4. View ledger

```bash
cat royalties/ledger.jsonl | jq '.'
```

## Key Concepts

### Content Hash
Generate SHA-256 of your artifact:
```bash
sha256sum your-artifact-file | awk '{print "sha256:" $1}'
```

### Share BPS
Basis points (1/100th of a percent):
- 10000 BPS = 100%
- 6000 BPS = 60%
- 100 BPS = 1%

### Weight
Relative contribution of each meta-asset:
- Higher weight = larger share of infra pool
- If all weights are 0 or null → equal distribution
- Example: weights [1.0, 0.5, 0.2] → 59%, 29%, 12%

### AI Assistant Attribution

**Option 1: Compute sink**
```json
{"id": "agent:copilot", "payoutHint": {"tt": "sink:ai-compute"}}
```

**Option 2: Human operator**
```json
{"id": "agent:copilot", "payoutHint": {"tt": "creator/your-username"}}
```

## GitHub Actions Integration

The workflow `.github/workflows/royalties-accrual.yml` automatically:
1. ✅ Detects artifact.json changes in PRs
2. ✅ Accrues royalties on merge to main
3. ✅ Updates ledger
4. ✅ Posts summary comments

## Configuration

Edit `config/royalties.json`:
```json
{
  "fee_bps": 10,  // 0.1% fee
  "distribution": {
    "creators_bps_of_fee": 6000,    // 60%
    "validators_bps_of_fee": 2300,  // 23%
    "infra_bps_of_fee": 1500,       // 15%
    "treasury_bps_of_fee": 200      // 2%
  }
}
```

**Important:** Distribution BPS must sum to 10000.

## More Help

- [README-ROYALTIES.md](./README-ROYALTIES.md) — Full documentation
- [EXAMPLES-ROYALTIES.md](./EXAMPLES-ROYALTIES.md) — Detailed examples
- [standards/v0.1/meta-royalties.md](./standards/v0.1/meta-royalties.md) — Policy

## Common Issues

**"Distribution must sum to 10000"**
- Check that creators + validators + infra + treasury = 10000 BPS

**"ValidationError: ... is not valid under any of the given schemas"**
- Validate JSON syntax with `jq '.' < artifact.json`
- Check required fields: content_hash, declared_value_eur, license, revshare

**"No such file or directory: 'royalties/ledger.jsonl'"**
- Normal on first run; directory created automatically

**Want to disable infra royalties?**
- Set `"infra_bps_of_fee": 0` in config/royalties.json
- Redistribute BPS to other pools (must still sum to 10000)
