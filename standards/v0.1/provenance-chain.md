# Provenance Chain Specification

**IDEALE Evidence Framework (IEF) v0.1**

## Overview

The Provenance Chain establishes an immutable record of artifact creation, modification, and transfer across organizations. It provides court-admissible evidence for IP disputes and enables transparent collaboration.

## Core Concepts

### 1. Provenance Record

Each artifact operation creates a provenance record:

```json
{
  "record_id": "uuid-v4",
  "record_type": "creation|modification|transfer|validation|approval",
  "artifact_id": "uuid-of-artifact",
  "artifact_version": "1.2.3",
  "timestamp": "2024-01-15T10:30:00Z",
  "actor": {
    "id": "did:example:organization",
    "type": "Organization|Person",
    "name": "Airbus SE",
    "role": "creator|modifier|validator|approver"
  },
  "action": {
    "type": "create|modify|transfer|validate|approve|reject",
    "description": "Created initial wing design model",
    "tool": {
      "name": "CATIA",
      "version": "V5 R21",
      "vendor": "Dassault Systèmes"
    }
  },
  "changes": {
    "summary": "Initial design release",
    "modified_elements": ["geometry", "metadata"],
    "impact_level": "major|minor|patch"
  },
  "signature": {
    "algorithm": "Ed25519",
    "value": "base64-signature",
    "public_key": "base64-public-key"
  },
  "previous_record": "uuid-of-parent-record",
  "blockchain_anchor": {
    "network": "ethereum|polygon|hyperledger",
    "transaction_hash": "0x...",
    "block_number": 12345678,
    "anchored_at": "2024-01-15T10:31:00Z"
  }
}
```

### 2. Provenance Chain

Multiple records form an immutable chain:

```
[Record 1: Creation]
    ↓ (signed by Airbus)
[Record 2: Modification]
    ↓ (signed by Safran)
[Record 3: Validation]
    ↓ (signed by Thales)
[Record 4: Approval]
    ↓ (signed by EASA)
```

Each record references its parent, creating a cryptographic chain of custody.

## Chain Types

### Creation Chain
Documents the artifact's origin:

```json
{
  "chain_type": "creation",
  "records": [
    {
      "event": "requirements_defined",
      "actor": "System Architect",
      "organization": "OEM"
    },
    {
      "event": "design_started",
      "actor": "Design Engineer",
      "tool": "CAD System"
    },
    {
      "event": "initial_review",
      "actor": "Design Lead",
      "decision": "approved"
    }
  ]
}
```

### Modification Chain
Tracks all changes:

```json
{
  "chain_type": "modification",
  "records": [
    {
      "modification_id": "mod-001",
      "changed_by": "Tier-1 Supplier",
      "reason": "Manufacturing optimization",
      "before_hash": "sha256:abc123...",
      "after_hash": "sha256:def456...",
      "diff": {
        "geometry_changes": ["wing_thickness"],
        "metadata_changes": ["material_spec"]
      }
    }
  ]
}
```

### Transfer Chain
Records cross-org handoffs:

```json
{
  "chain_type": "transfer",
  "records": [
    {
      "transfer_id": "xfer-001",
      "from_org": "Airbus SE",
      "to_org": "Safran SA",
      "transfer_date": "2024-01-20T14:00:00Z",
      "purpose": "Propulsion system integration",
      "access_level": "modify|read-only|validate",
      "contractual_ref": "PO-2024-001234",
      "acceptance": {
        "accepted_by": "Engineering Manager",
        "accepted_at": "2024-01-20T15:30:00Z",
        "signature": "base64-sig"
      }
    }
  ]
}
```

## Blockchain Anchoring

### Supported Networks

**Public Blockchains:**
- Ethereum (mainnet for production)
- Polygon (lower cost alternative)
- Timestamping services (OriginStamp, OpenTimestamps)

**Permissioned Blockchains:**
- Hyperledger Fabric
- Corda (for enterprise consortia)
- Private Ethereum networks

### Anchoring Process

1. **Batch Records**: Collect provenance records
2. **Merkle Tree**: Build tree of record hashes
3. **Root Hash**: Compute Merkle root
4. **Anchor Transaction**: Submit root to blockchain
5. **Receipt**: Store transaction ID and block number

```python
def anchor_to_blockchain(provenance_records):
    """Anchor provenance records to blockchain."""
    # Build Merkle tree
    record_hashes = [hash_record(r) for r in provenance_records]
    merkle_root = build_merkle_tree(record_hashes)
    
    # Submit to blockchain
    tx_hash = submit_transaction(merkle_root)
    
    # Wait for confirmation
    receipt = wait_for_confirmation(tx_hash)
    
    return {
        "merkle_root": merkle_root,
        "transaction_hash": tx_hash,
        "block_number": receipt.block_number,
        "timestamp": receipt.timestamp
    }
```

### Verification

```python
def verify_provenance_record(record, merkle_proof, blockchain_receipt):
    """Verify a provenance record against blockchain."""
    # 1. Verify record hash
    record_hash = hash_record(record)
    
    # 2. Verify Merkle proof
    computed_root = verify_merkle_proof(record_hash, merkle_proof)
    
    # 3. Verify blockchain anchor
    onchain_root = get_merkle_root_from_chain(
        blockchain_receipt.transaction_hash
    )
    
    return computed_root == onchain_root
```

## Multi-Signature Support

For critical operations, require multiple signatures:

```json
{
  "approval_record": {
    "artifact_id": "uuid",
    "decision": "approved|rejected",
    "required_signatures": 3,
    "signatures": [
      {
        "signer": "Chief Engineer",
        "organization": "Airbus",
        "signed_at": "2024-01-25T10:00:00Z",
        "signature": "sig1..."
      },
      {
        "signer": "Quality Manager",
        "organization": "Safran",
        "signed_at": "2024-01-25T11:00:00Z",
        "signature": "sig2..."
      },
      {
        "signer": "Certification Authority",
        "organization": "EASA",
        "signed_at": "2024-01-25T14:00:00Z",
        "signature": "sig3..."
      }
    ],
    "threshold_met": true
  }
}
```

## Legal Considerations

### Court Admissibility

Provenance chains are designed to meet legal requirements:

1. **Authenticity**: Cryptographic signatures prove authenticity
2. **Integrity**: Hashes prove data hasn't been tampered with
3. **Timestamp**: Blockchain provides trusted timestamps
4. **Chain of Custody**: Complete transfer records
5. **Non-repudiation**: Signers cannot deny their actions

### GDPR Compliance

- Personal data stored off-chain
- Only hashes and organizational identifiers on-chain
- Right to erasure via tombstone records
- Data minimization by design

### Evidence Export

Generate legal evidence packages:

```python
def export_legal_evidence(artifact_id):
    """Export provenance chain for legal proceedings."""
    return {
        "artifact": load_artifact(artifact_id),
        "provenance_chain": load_full_chain(artifact_id),
        "signatures": load_all_signatures(artifact_id),
        "blockchain_receipts": load_blockchain_anchors(artifact_id),
        "merkle_proofs": generate_merkle_proofs(artifact_id),
        "verification_report": generate_verification_report(artifact_id),
        "export_timestamp": datetime.now().isoformat(),
        "legal_certification": sign_by_authorized_officer()
    }
```

## Query & Audit

### Common Queries

```python
# Who created this artifact?
creator = provenance.get_creator(artifact_id)

# Who modified it and when?
modifications = provenance.get_modifications(artifact_id)

# What organizations handled this?
organizations = provenance.get_organizations(artifact_id)

# When was it transferred to Org X?
transfer = provenance.get_transfer(artifact_id, to_org="Safran SA")

# Full audit trail
audit_trail = provenance.get_full_trail(artifact_id)
```

### Audit Report

```json
{
  "artifact_id": "uuid",
  "artifact_name": "Wing Assembly Model",
  "audit_period": {
    "start": "2024-01-01",
    "end": "2024-01-31"
  },
  "summary": {
    "total_events": 47,
    "organizations_involved": 5,
    "modifications": 12,
    "transfers": 3,
    "approvals": 2
  },
  "timeline": [
    {
      "date": "2024-01-15",
      "event": "Created by Airbus",
      "verified": true
    },
    {
      "date": "2024-01-20",
      "event": "Transferred to Safran",
      "verified": true
    },
    {
      "date": "2024-01-25",
      "event": "Modified by Safran",
      "verified": true
    }
  ],
  "verification_status": "all_records_verified",
  "blockchain_anchors": 5,
  "generated_at": "2024-02-01T10:00:00Z"
}
```

## Reference Implementation

See:
- `evidence-engine/provenance-tracker/blockchain-anchor.py`

## Standards Compliance

- **W3C PROV-DM** (Provenance Data Model)
- **W3C Verifiable Credentials** (for signatures)
- **ISO 19115** (Geographic Information Metadata)
- **PROV-O** (Provenance Ontology)

## Future Enhancements (v0.2+)

- Zero-knowledge proofs for private provenance
- Cross-chain provenance bridges
- Automated dispute resolution
- AI-powered anomaly detection
