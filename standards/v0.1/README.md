# IEF v0.1 Standards

This directory contains the Minimum Viable Standards (MVS) for the IDEALE Evidence Framework (IEF) version 0.1.

## Core Standards

### Schema Definitions

#### context.schema.json
UTCS/CXP manifest schema (JSON Schema draft-07) defining the structure for context manifests in the Universal Transformation Context System.

#### artifact.schema.json
Artifact metadata schema with revenue share allocations for the creator royalties system. Defines the structure for declaring creators, their shares, and payout information.

#### cross-tool-schema.json
Schema for cross-tool artifact portability and transformation context.

### Specifications

#### sbom-baseline.md
SPDX 2.3 profile requirements for Software Bill of Materials (SBOM) baseline compliance.

#### creator-royalties.md
Complete specification for automatic creator remuneration including:
- Remunerated events (anchor, reuse, verify, derivative)
- Fee structure and distribution formulas
- Metadata schema for authorship
- Ledger structure and CI integration
- Compliance requirements
- Validation invariants

#### artifact-portability-spec.yaml
Specification for artifact portability across tools and organizations.

#### provenance-chain.md
Specification for maintaining cryptographic provenance chains for artifacts.

#### cryptographic-signing.md
Cryptographic signing requirements and standards for artifact verification.

### Implementation Guides

#### implementers-guide.md
30-minute quickstart guide for implementing IEF standards in your projects.

#### conformance-tests.md
Test suite requirements and validation criteria for IEF conformance.

### CI/CD

#### verify-action.yml
Reference GitHub Action for automated verification and badge generation.

## Using These Standards

### For Implementers

1. Start with [implementers-guide.md](implementers-guide.md)
2. Review relevant schema files for your use case
3. Implement conformance tests from [conformance-tests.md](conformance-tests.md)
4. Use [verify-action.yml](verify-action.yml) in your CI pipeline

### For Schema Validation

```bash
# Validate a context manifest
python3 -c "
import json
from jsonschema import validate, Draft7Validator
schema = json.load(open('standards/v0.1/context.schema.json'))
manifest = json.load(open('your-manifest.json'))
validate(manifest, schema)
print('✓ Valid')
"

# Validate an artifact with royalties
python3 -c "
import json
from jsonschema import validate, Draft202012Validator
schema = json.load(open('standards/v0.1/artifact.schema.json'))
artifact = json.load(open('your-artifact.json'))
validate(artifact, schema)
print('✓ Valid')
"
```

## Standard Versioning

**Current Version**: v0.1 (Minimum Viable Standards)

**Scope**:
- Schema definitions and validation
- Basic conformance testing
- Reference implementations
- Creator royalties system

**Future Versions**:
- **v0.2**: Signatures & attestations (SLSA / in-toto), integrity bundles
- **v0.3**: Sector trust mark pilots (Energy, Defense, Logistics, ESG)

## Compliance

These standards are designed to comply with:
- **GDPR**: No PII in artifacts, only hashes and DIDs
- **MiCA**: Utility token model for royalties (Phase B)
- **SPDX 2.3**: SBOM baseline requirements
- **Apache 2.0**: Open source licensing

## Contributing

When proposing changes to standards:

1. Open an issue describing the proposed change
2. Reference existing implementations and use cases
3. Ensure backward compatibility or provide migration path
4. Update relevant documentation
5. Add or update conformance tests

## See Also

- [Main README](../../README.md)
- [Creator Royalties Quick Start](../../docs/ROYALTIES_QUICKSTART.md)
- [Examples](../../examples/royalties/README.md)
- [Configuration](../../config/README.md)
