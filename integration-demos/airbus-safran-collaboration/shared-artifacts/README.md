# Shared Artifacts

This directory contains artifacts exchanged between Airbus and Safran during the collaboration demo.

## Purpose

Demonstrates the exchange of verifiable IDEALE artifacts (IEF format) between organizations without vendor lock-in, while maintaining full provenance and IP protection.

## Workflow

1. **Airbus creates artifact** (`wing-v1.ief.json`)
   - Designs wing component in CATIA
   - Exports as verifiable IDEALE artifact
   - Signs with Airbus private key

2. **Transfer to Safran**
   - Safran verifies artifact signature
   - Opens in Siemens NX (different tool)
   - No information loss across tools

3. **Safran modifies artifact** (`wing-v2.ief.json`)
   - Makes propulsion integration changes
   - Signs modifications with Safran key
   - Returns to Airbus

4. **Provenance anchored**
   - Complete chain of custody tracked
   - Blockchain anchor for immutability
   - Both organizations' IP protected

## Artifact Structure

Each `.ief.json` file follows the IDEALE Evidence Framework format:

```json
{
  "artifact_id": "uuid-v4",
  "artifact_type": "3d-model",
  "version": "1.0.0",
  "creator": {
    "name": "Organization Name",
    "did": "did:example:organization"
  },
  "checksum": {
    "algorithm": "SHA-256",
    "value": "..."
  },
  "signature": {
    "algorithm": "Ed25519",
    "value": "...",
    "signer": "..."
  },
  "provenance": {
    "...": "..."
  }
}
```

## Example Files

- `wing-v1.ief.json` - Initial wing design by Airbus
- `wing-v2.ief.json` - Modified design by Safran
- `wing-v3.ief.json` - Final approved version

## Security Features

✅ **Cryptographic signatures** - Each organization signs their contributions
✅ **Checksum verification** - Detect any tampering
✅ **Complete provenance** - Track every modification
✅ **IP attribution** - Clear ownership of contributions

## Related Directories

- `../provenance-log/` - Complete audit trail of all operations
- `../ip-attribution/` - IP ownership and contribution records

## Reference

See [IDEALE Artifact Schema](../../../standards/v0.1/artifact.schema.json) for complete specification.
