# IDEALE Standards v0.1

This directory contains the v0.1 standards and schemas for the IDEALE Evidence Framework (IEF) and the meta-royalties system.

## Core IEF Standards

### Schemas

- **context.schema.json** — UTCS/CXP manifest schema (JSON Schema draft-07)
- **cross-tool-schema.json** — Cross-tool interoperability schema
- **artifact.schema.json** — Artifact metadata schema with tooling attribution

### Documentation

- **sbom-baseline.md** — SPDX 2.3 profile requirements
- **conformance-tests.md** — Test suite requirements
- **implementers-guide.md** — 30-minute quickstart guide
- **cryptographic-signing.md** — Digital signature requirements
- **provenance-chain.md** — Provenance tracking specification

### Verification

- **verify-action.yml** — Reference GitHub Action for verification and badging
- **artifact-portability-spec.yaml** — Portability specification

## Meta-Royalties Standards

### Registry

- **meta-assets.registry.json** — Registry of meta-assets (schemas, workflows, AI assistants) with payout information

**Structure:**
```json
{
  "$id": "ideale://registry/meta-assets.v0.1",
  "assets": [
    {
      "id": "ideale://standards/artifact.schema.v0.1",
      "maintainers": [
        {
          "id": "did:github:ideale-core",
          "payout": {"tt": "creator/ideale-core", "iban": null}
        }
      ]
    }
  ]
}
```

### Policy

- **meta-royalties.md** — Policy documentation for meta-royalties system

Defines:
- Meta-asset pool mechanics
- Payment resolution process
- AI assistant attribution rules
- System invariants and compatibility

## Using These Standards

### Validate an artifact against the schema

```bash
python3 << 'PY'
import json
from jsonschema import validate, Draft7Validator

schema = json.load(open('standards/v0.1/artifact.schema.json'))
artifact = json.load(open('artifacts/my-artifact/artifact.json'))

Draft7Validator.check_schema(schema)
validate(artifact, schema)
print("✓ Artifact is valid")
PY
```

### Register a new meta-asset

Edit `meta-assets.registry.json` and add your asset:

```json
{
  "id": "ideale://tools/my-tool.v1.0",
  "maintainers": [
    {
      "id": "did:github:my-username",
      "payout": {"tt": "creator/my-username", "iban": "DE89..."}
    }
  ]
}
```

### Reference meta-assets in artifacts

In your `artifact.json`:

```json
{
  "artifact": {
    "tooling": {
      "used": [
        {
          "id": "ideale://tools/my-tool.v1.0",
          "version": "1.0.0",
          "weight": 1.0
        }
      ]
    }
  }
}
```

## Schema Validation

All JSON schemas in this directory are validated against JSON Schema Draft-07:

```bash
python3 -c "
from jsonschema import Draft7Validator
import json
import glob

for schema_file in glob.glob('standards/v0.1/*.schema.json'):
    schema = json.load(open(schema_file))
    Draft7Validator.check_schema(schema)
    print(f'✓ {schema_file}')
"
```

## Version History

**v0.1** (Current)
- Initial release of IEF standards
- Artifact metadata schema with tooling attribution
- Meta-assets registry
- Meta-royalties policy framework

## Future Versions

**v0.2** (Planned)
- Signatures & attestations (SLSA / in-toto)
- Integrity bundles
- Enhanced provenance chains

**v0.3** (Planned)
- Sector trust mark pilots (Energy, Defense, Logistics, ESG)
- Multi-currency support
- Advanced payout automation

## Contributing

To propose changes to these standards:

1. Open an issue describing the proposed change
2. If approved, submit a PR with:
   - Updated schema/documentation
   - Migration guide (if breaking change)
   - Test cases
3. Follow governance approval process

See [CONTRIBUTING.md](../../CONTRIBUTING.md) and [GOVERNANCE.md](../../GOVERNANCE.md)

## Conformance

Implementations claiming IEF v0.1 conformance must:
- ✅ Validate artifacts against `artifact.schema.json`
- ✅ Support SPDX 2.3 SBOMs per `sbom-baseline.md`
- ✅ Pass conformance tests in `conformance-tests.md`
- ✅ Implement verification per `verify-action.yml`

## See Also

- [README-ROYALTIES.md](../../README-ROYALTIES.md) — Meta-royalties system documentation
- [QUICKSTART-ROYALTIES.md](../../QUICKSTART-ROYALTIES.md) — Quick start guide
- [EXAMPLES-ROYALTIES.md](../../EXAMPLES-ROYALTIES.md) — Usage examples
- Main [README.md](../../README.md) — Project overview
