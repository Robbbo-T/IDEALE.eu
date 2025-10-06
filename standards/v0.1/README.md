# IDEALE Standards v0.1

This directory contains the **v0.1 Minimum Viable Standards (MVS)** for the **IDEALE Evidence Framework (IEF)** and the **meta-royalties** system.

---

## Core Standards

### Schema Definitions

- **context.schema.json** — UTCS/CXP manifest schema (JSON Schema Draft-07)
- **artifact.schema.json** — Artifact metadata schema (authorship, revshare, tooling attribution)
- **cross-tool-schema.json** — Cross-tool portability & transformation context

### Specifications

- **artifact-portability-spec.yaml** — Tool/vendor-neutral portability spec
- **provenance-chain.md** — Cryptographic provenance chain specification
- **cryptographic-signing.md** — Digital signature requirements
- **sbom-baseline.md** — SPDX 2.3 baseline profile
- **conformance-tests.md** — Test suite requirements & validation criteria
- **implementers-guide.md** — 30-minute quickstart for implementers

> If you are implementing royalties specifically, also see:
> - **meta-royalties.md** — Policy & mechanics for meta-assets
> - *(optional)* project-level guides (e.g., `README-ROYALTIES.md` in repo root)

---

## Meta-Royalties Standards

### Registry

- **meta-assets.registry.json** — Registry of meta-assets (schemas, workflows, CI actions, AI assistants) with payout info.

**Structure (excerpt):**
```json
{
  "$id": "ideale://registry/meta-assets.v0.1",
  "assets": [
    {
      "id": "ideale://standards/artifact.schema.v0.1",
      "maintainers": [
        {
          "id": "did:github:ideale-core",
          "payout": { "tt": "creator/ideale-core", "iban": null }
        }
      ]
    }
  ]
}
````

### Referencing Meta-Assets in Artifacts

```json
{
  "artifact": {
    "tooling": {
      "used": [
        { "id": "ideale://tools/my-tool.v1.0", "version": "1.0.0", "weight": 1.0 }
      ]
    }
  }
}
```

---

## Using These Standards

### Validate an Artifact Against Draft-07

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

### Validate All Schemas in This Directory

```bash
python3 - << 'PY'
from jsonschema import Draft7Validator
import json, glob
for path in glob.glob('standards/v0.1/*.schema.json'):
    with open(path) as fh:
        Draft7Validator.check_schema(json.load(fh))
    print(f"✓ {path}")
PY
```

---

## Versioning

**Current:** `v0.1`
Scope:

* Schema definitions & validation (Draft-07)
* Portability & provenance specs
* Conformance tests & reference CI action
* Meta-assets registry and policy

**Planned:**

* `v0.2`: Signatures & attestations (SLSA / in-toto), integrity bundles, enhanced provenance chains
* `v0.3`: Sector trust-mark pilots (Energy/Defense/Logistics/ESG), multi-currency support, advanced payout automation

---

## Compliance Notes

* **GDPR**: No PII in artifacts (hashes/DIDs only)
* **SPDX 2.3**: SBOM baseline per `sbom-baseline.md`
* **Licensing**: Apache-2.0

---

## Conformance Checklist (v0.1)

* ✅ Validate artifacts against `artifact.schema.json`
* ✅ Support SPDX 2.3 SBOMs per `sbom-baseline.md`
* ✅ Pass tests in `conformance-tests.md`
* ✅ Implement verification using `verify-action.yml`

---

## Contributing

1. Open an issue describing the proposed change
2. If approved, submit a PR with:

   * Updated schema/docs
   * Migration guide (if breaking)
   * Test cases and updated conformance checks
3. Follow the project governance process

See [../../CONTRIBUTING.md](../../CONTRIBUTING.md) and [../../GOVERNANCE.md](../../GOVERNANCE.md)

---

## See Also

* Repo root: [../../README.md](../../README.md)
* Meta-royalties docs: [../../README-ROYALTIES.md](../../README-ROYALTIES.md)
* Quick start (royalties): *(if present)* `../../docs/ROYALTIES_QUICKSTART.md`
* Examples: *(if present)* `../../examples/royalties/README.md`


