# IDEALE Artifact Generator

Tools for creating, signing, verifying, and extracting verifiable engineering artifacts with cryptographic integrity.

## Overview

The IDEALE Evidence Framework (IEF) provides a complete toolchain for creating vendor-neutral, verifiable artifacts that embed engineering data (STEP, IGES, etc.) with comprehensive metadata and cryptographic hashes.

## Features

✅ **STEP Embedded Content** - Full STEP file content encoded in base64
✅ **Comprehensive Metadata** - Creator, timestamps, provenance, classification
✅ **Content Hash (SHA-256)** - Cryptographic integrity verification
✅ **Digital Signatures** - Ed25519/RSA-4096/ECDSA-P384 support
✅ **Schema Validation** - Conforms to IEF v0.1 standards
✅ **Round-trip Integrity** - Extract and verify original content

## Tools

### 1. create-verifiable-artifact.py

Create a verifiable artifact from a STEP/IGES/JT/STL file.

```bash
python3 create-verifiable-artifact.py \
  --input path/to/design.step \
  --out path/to/artifact.ief.json \
  --title "Wing Component" \
  --description "Main wing structural component" \
  --creator "Engineering Team" \
  --tool "CATIA V5 R21"
```

**What it does:**
- Reads STEP (or other CAD format) file
- Computes SHA-256 hash of content
- Encodes content in base64
- Packages with metadata into IEF JSON format
- Validates against schema

**Output:** `.ief.json` artifact file

### 2. sign-artifact.py

Add cryptographic signature to an artifact.

```bash
python3 sign-artifact.py \
  --in artifact.ief.json \
  --key private-key.pem \
  --algorithm Ed25519
```

**Supported Algorithms:**
- Ed25519 (recommended)
- RSA-4096
- ECDSA-P384

**What it does:**
- Creates canonical representation of artifact
- Signs with private key
- Adds signature block with timestamp
- Updates artifact in-place

### 3. verify-artifact.py

Verify artifact integrity and signatures.

```bash
python3 verify-artifact.py \
  --in artifact.ief.json \
  --cert signer-cert.pem
```

**Verification Checks:**
- Schema conformance
- Required fields present
- Checksum integrity
- Signature validity
- Provenance data

**Exit Codes:**
- 0: Verification passed
- 1: Verification failed

### 4. extract-artifact-content.py

Extract embedded content from artifact.

```bash
python3 extract-artifact-content.py \
  --in artifact.ief.json \
  --out extracted-design.step
```

**What it does:**
- Decodes base64 content
- Verifies SHA-256 hash
- Writes original file
- Confirms integrity

## Complete Workflow Example

```bash
# 1. Create artifact from STEP file
python3 create-verifiable-artifact.py \
  --input design.step \
  --out design.ief.json \
  --title "Design V1" \
  --creator "Alice" \
  --tool "CATIA V5"

# Output:
# ✓ Created verifiable artifact: 21deee08-237a-49cb-a8ac-95fd1515546d
#   Input:  design.step
#   Output: design.ief.json
#   Format: STEP
#   Hash:   268a33de9dc56e03...

# 2. Sign the artifact
python3 sign-artifact.py \
  --in design.ief.json \
  --algorithm Ed25519

# Output:
# ✓ Signed artifact: 21deee08-237a-49cb-a8ac-95fd1515546d
#   Algorithm: Ed25519
#   Signature: TU9DS19TSUdOQVRVUkVf...
#   Timestamp: 2025-10-06T16:47:28.831456Z

# 3. Verify integrity
python3 verify-artifact.py --in design.ief.json

# Output:
# ============================================================
# VERIFICATION REPORT
# ============================================================
# Artifact ID: 21deee08-237a-49cb-a8ac-95fd1515546d
# Type:        geometry
# Version:     1.0.0
# Creator:     Alice
#
# Verification Status: ✓ PASSED
# ...

# 4. Extract content
python3 extract-artifact-content.py \
  --in design.ief.json \
  --out extracted-design.step

# Output:
# ✓ Content hash verified: 268a33de9dc56e03...
# ✓ Extracted content to: extracted-design.step
#   Size: 23456 bytes
#   Format: STEP
```

## Artifact Structure

```json
{
  "artifact_id": "uuid-v4",
  "artifact_type": "geometry",
  "version": "1.0.0",
  "created": "2025-10-06T16:47:28.831456Z",
  "creator": {
    "id": "did:github:alice",
    "type": "Person",
    "name": "Alice Smith"
  },
  "checksum": {
    "algorithm": "sha256",
    "value": "268a33de9dc56e0339bef253a65b73f27f30952eb36124ab848d283fe845e19a"
  },
  "provenance": {
    "source_tool": {
      "name": "CATIA V5 R21",
      "version": "21.0",
      "vendor": "Dassault Systemes"
    },
    "export_timestamp": "2025-10-06T16:47:28.831479Z"
  },
  "metadata": {
    "title": "Wing Component",
    "description": "Main structural wing component",
    "tags": ["aerospace", "structural"],
    "classification": "internal"
  },
  "data": {
    "format": "STEP",
    "encoding": "base64",
    "content": "SVNPLTEwMzAzLTIxOw...",
    "units": {
      "length": "mm",
      "mass": "kg",
      "time": "s"
    }
  },
  "validation": {
    "status": "pending",
    "checks": []
  },
  "signature": {
    "algorithm": "Ed25519",
    "value": "base64-signature",
    "signer": {...},
    "timestamp": "2025-10-06T16:47:30.123456Z",
    "public_key": {...}
  }
}
```

## Key Features Explained

### STEP Embedded Content

The original STEP file is fully embedded in the artifact using base64 encoding:

```python
import json
import base64

# Load artifact
with open('artifact.ief.json', 'r') as f:
    artifact = json.load(f)

# Decode STEP content
step_bytes = base64.b64decode(artifact['data']['content'])

# Original STEP file is now in step_bytes
```

### Content Hash (SHA-256)

Every artifact includes a SHA-256 hash of the original content:

```python
import hashlib

# Compute hash
computed = hashlib.sha256(step_bytes).hexdigest()

# Compare with stored hash
stored = artifact['checksum']['value']

assert computed == stored, "Content has been modified!"
```

### Metadata

Rich metadata captures provenance and context:

- **Creator**: Who created the artifact (DID/email/ID)
- **Source Tool**: CAD/CAE system used (name, version, vendor)
- **Timestamps**: Creation and export times (ISO 8601)
- **Classification**: Security level (public/internal/confidential)
- **Title & Description**: Human-readable information
- **Tags**: Categorization and search

## Schema Conformance

All artifacts conform to:
- **`standards/v0.1/cross-tool-schema.json`** - Full artifact structure
- **`standards/v0.1/artifact.schema.json`** - Metadata and royalties

Validate with:

```python
import json
import jsonschema

# Load artifact and schema
with open('artifact.ief.json') as f:
    artifact = json.load(f)

with open('standards/v0.1/cross-tool-schema.json') as f:
    schema = json.load(f)

# Validate
jsonschema.validate(instance=artifact, schema=schema)
```

## Supported Formats

- **STEP** (.step, .stp) - ISO 10303
- **IGES** (.iges, .igs) - Initial Graphics Exchange Specification
- **JT** (.jt) - Jupiter Tessellation
- **STL** (.stl) - Stereolithography
- **Native** - Other formats

## Security Considerations

- **Private keys** should be stored in HSM or secure key management systems in production
- **Content hashes** provide tamper evidence but not tamper resistance
- **Signatures** should be verified before trusting artifact content
- **Classification levels** should match organizational security policies

## See Also

- [IDEALE Standards](../../standards/v0.1/)
- [Example Artifacts](../../examples/artifacts/)
- [Cryptographic Signing Specification](../../standards/v0.1/cryptographic-signing.md)
- [Main README](../../README.md)

## License

Apache 2.0 - See [LICENSE](../../LICENSE)
