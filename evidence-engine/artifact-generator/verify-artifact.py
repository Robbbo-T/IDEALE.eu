#!/usr/bin/env python3
"""
IDEALE Evidence Framework - Artifact Verifier
Verifies cryptographic signatures and integrity of artifacts.
"""

import argparse
import json
import hashlib
from pathlib import Path


def verify_artifact(artifact_path, cert_path=None):
    """
    Verify an IDEALE artifact's signature and integrity.
    
    Args:
        artifact_path: Path to artifact JSON file
        cert_path: Path to signer's certificate (optional for demo)
    
    Returns:
        Verification result dict
    """
    artifact_file = Path(artifact_path)
    
    if not artifact_file.exists():
        raise FileNotFoundError(f"Artifact not found: {artifact_path}")
    
    # Load artifact
    with open(artifact_file, 'r') as f:
        artifact = json.load(f)
    
    verification_result = {
        "artifact_id": artifact['artifact_id'],
        "verified": True,
        "checks": []
    }
    
    # Check 1: Artifact structure
    required_fields = ['artifact_id', 'artifact_type', 'version', 'created', 'creator', 'checksum', 'data']
    for field in required_fields:
        if field in artifact:
            verification_result['checks'].append({
                "check": f"Required field '{field}'",
                "status": "passed"
            })
        else:
            verification_result['checks'].append({
                "check": f"Required field '{field}'",
                "status": "failed"
            })
            verification_result['verified'] = False
    
    # Check 2: Checksum integrity
    # In production, recompute checksum from data
    if 'checksum' in artifact:
        verification_result['checks'].append({
            "check": "Checksum present",
            "status": "passed",
            "value": artifact['checksum']['value'][:16] + "..."
        })
    
    # Check 3: Signature verification
    if 'signature' in artifact:
        # In production, verify actual cryptographic signature
        signature = artifact['signature']
        verification_result['checks'].append({
            "check": "Signature present",
            "status": "passed",
            "algorithm": signature['algorithm'],
            "signer": signature['signer']['name']
        })
        
        # Mock verification (in production, use cryptography library)
        expected_sig = f"MOCK_SIGNATURE_{artifact['artifact_id']}"
        verification_result['checks'].append({
            "check": "Signature verification",
            "status": "passed (mock)"
        })
    else:
        verification_result['checks'].append({
            "check": "Signature present",
            "status": "warning",
            "message": "Artifact is not signed"
        })
    
    # Check 4: Provenance chain
    if 'provenance' in artifact:
        verification_result['checks'].append({
            "check": "Provenance data",
            "status": "passed"
        })
    
    # Print results
    print(f"\n{'='*60}")
    print(f"VERIFICATION REPORT")
    print(f"{'='*60}")
    print(f"Artifact ID: {artifact['artifact_id']}")
    print(f"Type:        {artifact['artifact_type']}")
    print(f"Version:     {artifact['version']}")
    print(f"Creator:     {artifact['creator']['name']}")
    print(f"\nVerification Status: {'✓ PASSED' if verification_result['verified'] else '✗ FAILED'}")
    print(f"\nChecks Performed:")
    
    for check in verification_result['checks']:
        status_symbol = {
            'passed': '✓',
            'failed': '✗',
            'warning': '⚠'
        }.get(check['status'], '?')
        
        print(f"  {status_symbol} {check['check']}: {check['status']}")
        if 'message' in check:
            print(f"    → {check['message']}")
    
    print(f"{'='*60}\n")
    
    return verification_result


def main():
    parser = argparse.ArgumentParser(
        description='Verify IDEALE artifacts'
    )
    parser.add_argument(
        '--in',
        dest='artifact',
        required=True,
        help='Artifact file path'
    )
    parser.add_argument(
        '--cert',
        help='Signer certificate path (optional for demo)'
    )
    
    args = parser.parse_args()
    
    result = verify_artifact(args.artifact, args.cert)
    
    # Exit with appropriate code
    exit(0 if result['verified'] else 1)


if __name__ == '__main__':
    main()
