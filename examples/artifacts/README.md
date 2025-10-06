# Example Verifiable Artifacts

This directory contains example artifacts demonstrating the IDEALE Evidence Framework (IEF) artifact creation capabilities.

## Files

- **demo-component.ief.json** - Example verifiable artifact with embedded STEP content

## What's Included

Each IEF artifact contains:

1. **STEP Embedded Content**
   - Original STEP file content encoded in base64
   - Preserves complete geometry data
   - Can be extracted and used by any STEP-compatible CAD tool

2. **Comprehensive Metadata**
   - Artifact ID (UUID)
   - Creator information
   - Creation and export timestamps
   - Title and description
   - Classification level
   - Source tool provenance

3. **Content Hash (SHA-256)**
   - Cryptographic hash of the original STEP content
   - Ensures integrity verification
   - Enables tamper detection

## Usage Example

### Create an Artifact

```bash
python3 evidence-engine/artifact-generator/create-verifiable-artifact.py \
  --input examples/demo-component.step \
  --out examples/artifacts/demo-component.ief.json \
  --title "Demo Component" \
  --description "Example STEP artifact" \
  --creator "Your Name" \
  --tool "CAD System v1.0"
```

### Verify Content Integrity

```python
import json
import base64
import hashlib

# Load artifact
with open('demo-component.ief.json', 'r') as f:
    artifact = json.load(f)

# Decode embedded STEP content
step_content = base64.b64decode(artifact['data']['content'])

# Verify hash
computed_hash = hashlib.sha256(step_content).hexdigest()
stored_hash = artifact['checksum']['value']

print(f"Hash match: {computed_hash == stored_hash}")
```

### Extract STEP Content

```python
import json
import base64

# Load artifact
with open('demo-component.ief.json', 'r') as f:
    artifact = json.load(f)

# Extract and save STEP file
step_content = base64.b64decode(artifact['data']['content'])
with open('extracted-component.step', 'wb') as f:
    f.write(step_content)
```

## Schema Conformance

All artifacts in this directory conform to:
- `standards/v0.1/cross-tool-schema.json` - Full artifact structure
- `standards/v0.1/artifact.schema.json` - Metadata and royalties wrapper

## See Also

- [Artifact Generator Documentation](../../evidence-engine/artifact-generator/)
- [IDEALE Standards](../../standards/v0.1/)
- [Main README](../../README.md)
