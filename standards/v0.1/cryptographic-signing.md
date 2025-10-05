# Cryptographic Signing Specification

**IDEALE Evidence Framework (IEF) v0.1**

## Overview

This specification defines how IDEALE artifacts must be cryptographically signed to ensure authenticity, integrity, and non-repudiation.

## Signing Requirements

### 1. Supported Algorithms

**Primary (REQUIRED):**
- **Ed25519** (recommended for new implementations)
- **RSA-4096** with SHA-256

**Secondary (OPTIONAL):**
- **ECDSA-P384** with SHA-384
- **RSA-2048** with SHA-256 (legacy, discouraged for new implementations)

### 2. Signature Format

Signatures MUST be encoded as:
- **JSON Web Signature (JWS)** - RFC 7515 for JSON artifacts
- **Detached signature files** (.sig) for binary artifacts

### 3. Key Management

#### Public Keys
- MUST be distributed via secure channels
- SHOULD be published in organizational key registries
- MAY be embedded in X.509 certificates

#### Private Keys
- MUST be stored in hardware security modules (HSM) or secure key stores
- MUST NOT be embedded in artifacts or version control
- MUST be protected with access controls

## Signing Process

### Step 1: Prepare Artifact

```python
import hashlib
import json

def prepare_artifact(artifact_path):
    """Prepare artifact for signing."""
    with open(artifact_path, 'rb') as f:
        content = f.read()
    
    # Canonical serialization
    if artifact_path.endswith('.json'):
        data = json.loads(content)
        canonical = json.dumps(data, sort_keys=True, separators=(',', ':'))
        content = canonical.encode('utf-8')
    
    return content
```

### Step 2: Generate Hash

```python
def generate_hash(content):
    """Generate SHA-256 hash of artifact."""
    return hashlib.sha256(content).hexdigest()
```

### Step 3: Sign Hash

```python
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import ed25519
from cryptography.hazmat.backends import default_backend

def sign_artifact(content, private_key_path):
    """Sign artifact with Ed25519."""
    # Load private key
    with open(private_key_path, 'rb') as f:
        private_key = serialization.load_pem_private_key(
            f.read(),
            password=None,
            backend=default_backend()
        )
    
    # Sign content
    signature = private_key.sign(content)
    
    return signature
```

### Step 4: Create Signature Bundle

```json
{
  "artifact_id": "uuid-of-artifact",
  "artifact_hash": "sha256:abcd1234...",
  "signature": {
    "algorithm": "Ed25519",
    "value": "base64-encoded-signature",
    "created": "2024-01-15T10:30:00Z",
    "creator": {
      "id": "did:example:organization",
      "type": "Organization",
      "name": "Airbus SE"
    },
    "public_key": {
      "id": "key-id",
      "type": "Ed25519VerificationKey2020",
      "publicKeyBase58": "..."
    }
  },
  "provenance": {
    "tool": "CATIA V5 R21",
    "operator": "engineer@company.eu",
    "timestamp": "2024-01-15T10:30:00Z",
    "purpose": "design_release"
  }
}
```

## Verification Process

### Step 1: Load Artifact and Signature

```python
def load_artifact_and_signature(artifact_path, signature_path):
    """Load artifact and its signature."""
    with open(artifact_path, 'rb') as f:
        content = f.read()
    
    with open(signature_path, 'r') as f:
        signature_bundle = json.load(f)
    
    return content, signature_bundle
```

### Step 2: Verify Hash

```python
def verify_hash(content, expected_hash):
    """Verify artifact hash matches expected value."""
    actual_hash = hashlib.sha256(content).hexdigest()
    
    if f"sha256:{actual_hash}" != expected_hash:
        raise ValueError("Hash mismatch: artifact has been modified")
    
    return True
```

### Step 3: Verify Signature

```python
import base64
from cryptography.hazmat.primitives.asymmetric import ed25519
from cryptography.exceptions import InvalidSignature

def verify_signature(content, signature_bundle, public_key_path):
    """Verify cryptographic signature."""
    # Load public key
    with open(public_key_path, 'rb') as f:
        public_key = serialization.load_pem_public_key(
            f.read(),
            backend=default_backend()
        )
    
    # Decode signature
    signature_value = base64.b64decode(
        signature_bundle['signature']['value']
    )
    
    # Verify signature
    try:
        public_key.verify(signature_value, content)
        return True
    except InvalidSignature:
        raise ValueError("Invalid signature: artifact authentication failed")
```

## Multi-Party Signatures

For cross-organizational collaboration, artifacts MAY carry multiple signatures:

```json
{
  "artifact_id": "uuid-of-artifact",
  "artifact_hash": "sha256:abcd1234...",
  "signatures": [
    {
      "signer": "Airbus SE",
      "role": "original_creator",
      "algorithm": "Ed25519",
      "value": "...",
      "timestamp": "2024-01-15T10:30:00Z"
    },
    {
      "signer": "Safran SA",
      "role": "modifier",
      "algorithm": "Ed25519",
      "value": "...",
      "timestamp": "2024-01-20T14:45:00Z",
      "parent_signature": "signature-1-hash"
    },
    {
      "signer": "Thales Group",
      "role": "validator",
      "algorithm": "RSA-4096",
      "value": "...",
      "timestamp": "2024-01-25T09:15:00Z"
    }
  ]
}
```

## Time Stamping

All signatures MUST include trusted timestamps:

- **RFC 3161** timestamp tokens (recommended)
- **Blockchain anchoring** (optional, see provenance-chain.md)

## Revocation

Organizations MUST maintain Certificate Revocation Lists (CRL) or use OCSP for key revocation.

## Compliance

- **eIDAS Regulation** (EU 910/2014) for qualified electronic signatures
- **NIST FIPS 186-4** for digital signature standards
- **ISO/IEC 14888** for digital signatures with appendix

## Security Considerations

1. **Key Length**: Minimum 2048 bits for RSA, 256 bits for ECC
2. **Key Rotation**: Every 2 years or upon compromise
3. **Algorithm Agility**: Support for algorithm upgrades
4. **Quantum Resistance**: Post-quantum migration path in v1.0 roadmap

## Reference Implementation

See:
- `evidence-engine/artifact-generator/sign-artifact.py`
- `evidence-engine/artifact-generator/verify-artifact.py`

## Conformance Testing

Implementations MUST pass:
_Conformance test suite and test vectors are not yet available in this repository. This section will be updated when they are provided._
