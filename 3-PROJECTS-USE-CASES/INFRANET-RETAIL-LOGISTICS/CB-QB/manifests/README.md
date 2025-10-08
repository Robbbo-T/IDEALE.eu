# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# UTCS Manifests

This directory contains UTCS manifest files that cryptographically anchor all artifacts in the INFRANET-RETAIL-LOGISTICS implementation.

## Purpose

UTCS (Universal Traceability & Configuration System) manifests provide:
- **Artifact inventory**: Complete list of implementation files
- **Integrity verification**: SHA-256 hashes (hex and base64) for all artifacts
- **Traceability**: Links artifacts to UTCS ID and TFA flow
- **Audit trail**: Timestamped generation for reproducibility

## Manifest Structure

```json
{
  "utcs_id": "UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]",
  "generated_utc": "ISO 8601 timestamp",
  "tfa_flow": "QS→FWD→UE→FE→CB→QB",
  "units": "n/a",
  "license": "Apache-2.0",
  "artifacts": {
    "artifact_name": "relative/path/to/artifact.ext"
  },
  "artifacts_sha256_hex": {
    "artifact_name": "64-character hex hash"
  },
  "artifacts_sha256_b64": {
    "artifact_name": "base64-encoded hash for DLT"
  },
  "assumptions": ["..."],
  "conformance_levels": {"bronze": "...", "silver": "...", "gold": "..."}
}
```

## Files

- **utcs-manifest.json** - Primary manifest with all artifact hashes

## Usage

### Verify Artifact Integrity

```bash
# Verify a single artifact
cd ../../../..
sha256sum QS-FWD/openapi/caha-api.yaml
# Compare with manifest hash

# Verify all artifacts (Python)
python3 << 'EOF'
import json
import hashlib
from pathlib import Path

manifest = json.load(open("CB-QB/manifests/utcs-manifest.json"))
for name, path in manifest["artifacts"].items():
    with open(path, 'rb') as f:
        actual = hashlib.sha256(f.read()).hexdigest()
        expected = manifest["artifacts_sha256_hex"][name]
        status = "✓" if actual == expected else "✗"
        print(f"{status} {name}: {path}")
EOF
```

### Generate Updated Manifest

```bash
# After modifying artifacts, regenerate hashes
cd ../../../..
python3 << 'EOF'
import hashlib
import base64
import json
from datetime import datetime, timezone
from pathlib import Path

# ... (see CB-QB/manifests generation script)
EOF
```

## Integration with DLT

Base64-encoded hashes (`artifacts_sha256_b64`) are suitable for embedding in:
- Hyperledger Fabric transactions
- Ethereum smart contracts
- IPFS content identifiers

Example DLT claim:
```json
{
  "utcsId": "UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]",
  "artifact": "openapi",
  "hash_b64": "6q3jybqLnK6dH08SeG+uACT7yNAkaDM1HXn4wj2hqvU=",
  "timestamp": "2025-02-01T12:00:00Z",
  "signedBy": "did:org:svc:mopc"
}
```

## Conformance

This manifest supports:
- **Bronze conformance**: Artifact integrity verification
- **Silver conformance**: Audit trail for policy decisions
- **Gold conformance**: DLT anchoring of critical evidence

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
