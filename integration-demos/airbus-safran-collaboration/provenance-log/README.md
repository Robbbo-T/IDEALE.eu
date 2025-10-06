# Provenance Log

This directory contains the complete audit trail of all operations performed on artifacts during the Airbus-Safran collaboration demo.

## Purpose

Provides a tamper-proof, chronological record of every action taken on shared artifacts, ensuring:
- **Full transparency** of all modifications
- **Legal defensibility** for IP disputes
- **Regulatory compliance** for audit requirements
- **Court-admissible evidence** of artifact history

## Log Structure

Provenance records follow the [W3C PROV-DM](https://www.w3.org/TR/prov-dm/) standard and are stored in JSON format.

### Record Types

1. **Creation** - Initial artifact creation
2. **Modification** - Changes to existing artifacts
3. **Transfer** - Artifact sent between organizations
4. **Validation** - Verification and approval steps
5. **Blockchain Anchor** - Immutable timestamp on chain

## Example Provenance Record

```json
{
  "record_id": "uuid-v4",
  "record_type": "modification",
  "artifact_id": "uuid-of-artifact",
  "artifact_version": "1.2.0",
  "timestamp": "2024-01-15T10:30:00Z",
  "actor": {
    "id": "did:example:safran",
    "type": "Organization",
    "name": "Safran SA",
    "role": "modifier"
  },
  "action": {
    "type": "modify",
    "description": "Optimized wing geometry for propulsion integration",
    "tool": {
      "name": "Siemens NX",
      "version": "12.0",
      "vendor": "Siemens"
    }
  },
  "changes": {
    "geometry_changes": ["wing_thickness", "mounting_interface"],
    "metadata_changes": ["material_spec"]
  },
  "signature": {
    "algorithm": "Ed25519",
    "value": "...",
    "timestamp": "2024-01-15T10:30:05Z"
  },
  "parent_record": "uuid-of-previous-record",
  "blockchain_anchor": {
    "network": "polygon",
    "transaction_hash": "0x...",
    "block_number": 12345678
  }
}
```

## Provenance Chain

Records form an immutable chain of custody:

```
[Record 1: Creation by Airbus]
    ↓ (signed by Airbus)
[Record 2: Transfer to Safran]
    ↓ (verified by Safran)
[Record 3: Modification by Safran]
    ↓ (signed by Safran)
[Record 4: Transfer back to Airbus]
    ↓ (verified by Airbus)
[Record 5: Validation & Approval]
    ↓ (signed by both parties)
[Record 6: Blockchain Anchor]
    ↓ (immutable timestamp)
```

## Files

- `provenance-chain.jsonl` - JSON Lines format, one record per line
- `blockchain-receipts.json` - Blockchain anchoring receipts
- `verification-log.json` - Signature verification results

## Usage

### Query provenance by artifact ID
```bash
cat provenance-chain.jsonl | jq 'select(.artifact_id=="<artifact-id>")'
```

### View complete chain
```bash
cat provenance-chain.jsonl | jq -s 'sort_by(.timestamp)'
```

### Verify blockchain anchors
```python
python evidence-engine/provenance-tracker/verify-blockchain-anchor.py \
  --log provenance-log/provenance-chain.jsonl
```

## Standards Compliance

- **W3C PROV-DM** (Provenance Data Model)
- **W3C Verifiable Credentials** (for signatures)
- **ISO 19115** (Geographic Information Metadata)
- **PROV-O** (Provenance Ontology)

## Security Features

✅ **Cryptographic signatures** on every record
✅ **Blockchain anchoring** for immutability
✅ **Chain of custody** with parent references
✅ **Timestamp verification** against blockchain
✅ **Non-repudiation** - actors cannot deny actions

## Related Directories

- `../shared-artifacts/` - Artifacts referenced in provenance records
- `../ip-attribution/` - Ownership records derived from provenance

## Reference

See [Provenance Chain Specification](../../../standards/v0.1/provenance-chain.md) for complete details.
