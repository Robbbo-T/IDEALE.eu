#!/usr/bin/env python3
"""
IDEALE Evidence Framework - Artifact Signer
Cryptographically signs artifacts for authenticity and integrity.
"""

import argparse
import json
import base64
from datetime import datetime
from pathlib import Path


def sign_artifact(artifact_path, key_path=None, algorithm='Ed25519'):
    """
    Sign an IDEALE artifact with cryptographic signature.
    
    Args:
        artifact_path: Path to artifact JSON file
        key_path: Path to private key (demo uses mock signature)
        algorithm: Signing algorithm
    
    Returns:
        Signed artifact dict
    """
    artifact_file = Path(artifact_path)
    
    if not artifact_file.exists():
        raise FileNotFoundError(f"Artifact not found: {artifact_path}")
    
    # Load artifact
    with open(artifact_file, 'r') as f:
        artifact = json.load(f)
    
    # In production, load actual private key and sign
    # For demo, create mock signature
    artifact_canonical = json.dumps(artifact, sort_keys=True, separators=(',', ':'))
    
    # Mock signature (in production, use cryptography library)
    mock_signature = base64.b64encode(
        f"MOCK_SIGNATURE_{artifact['artifact_id']}".encode()
    ).decode()
    
    # Add signature to artifact
    artifact['signature'] = {
        "algorithm": algorithm,
        "value": mock_signature,
        "signer": artifact['creator'],
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "public_key": {
            "id": "key-001",
            "type": f"{algorithm}VerificationKey2020",
            "publicKeyBase58": "MOCK_PUBLIC_KEY"
        }
    }
    
    # Update artifact file
    with open(artifact_file, 'w') as f:
        json.dump(artifact, f, indent=2)
    
    print(f"✓ Signed artifact: {artifact['artifact_id']}")
    print(f"  Algorithm: {algorithm}")
    print(f"  Signature: {mock_signature[:32]}...")
    print(f"  Timestamp: {artifact['signature']['timestamp']}")
    
    return artifact


def main():
    parser = argparse.ArgumentParser(
        description='Sign IDEALE artifacts'
    )
    parser.add_argument(
        '--in',
        dest='artifact',
        required=True,
        help='Artifact file path'
    )
    parser.add_argument(
        '--key',
        help='Private key path (optional for demo)'
    )
    parser.add_argument(
        '--algorithm',
        default='Ed25519',
        choices=['Ed25519', 'RSA-4096', 'ECDSA-P384'],
        help='Signing algorithm'
    )
    
    args = parser.parse_args()
    
    sign_artifact(args.artifact, args.key, args.algorithm)


if __name__ == '__main__':
    main()
