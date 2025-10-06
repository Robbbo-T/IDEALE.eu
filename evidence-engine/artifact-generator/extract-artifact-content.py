#!/usr/bin/env python3
"""
IDEALE Artifact Content Extractor
Extracts embedded content from IEF artifacts for verification or reuse.
"""

import argparse
import json
import base64
import hashlib
from pathlib import Path


def extract_content(artifact_path, output_path=None, verify=True):
    """
    Extract embedded content from an IDEALE artifact.
    
    Args:
        artifact_path: Path to artifact JSON file
        output_path: Optional output path for extracted content
        verify: Whether to verify content hash
    
    Returns:
        Extracted content bytes
    """
    artifact_file = Path(artifact_path)
    
    if not artifact_file.exists():
        raise FileNotFoundError(f"Artifact not found: {artifact_path}")
    
    # Load artifact
    with open(artifact_file, 'r') as f:
        artifact = json.load(f)
    
    # Check encoding
    encoding = artifact['data'].get('encoding', 'base64')
    if encoding != 'base64':
        raise ValueError(f"Unsupported encoding: {encoding}")
    
    # Decode content
    content = base64.b64decode(artifact['data']['content'])
    
    # Verify hash if requested
    if verify and 'checksum' in artifact:
        computed_hash = hashlib.sha256(content).hexdigest()
        stored_hash = artifact['checksum']['value']
        
        if computed_hash != stored_hash:
            raise ValueError(f"Hash mismatch! Artifact may be corrupted.\n"
                           f"Expected: {stored_hash}\n"
                           f"Got:      {computed_hash}")
        
        print(f"✓ Content hash verified: {computed_hash[:16]}...")
    
    # Write to output file if specified
    if output_path:
        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)
        
        with open(output_file, 'wb') as f:
            f.write(content)
        
        print(f"✓ Extracted content to: {output_path}")
        print(f"  Size: {len(content)} bytes")
        print(f"  Format: {artifact['data']['format']}")
    
    return content


def main():
    parser = argparse.ArgumentParser(
        description='Extract content from IDEALE artifacts'
    )
    parser.add_argument(
        '--in',
        dest='artifact',
        required=True,
        help='Artifact file path (.ief.json)'
    )
    parser.add_argument(
        '--out',
        help='Output file path for extracted content'
    )
    parser.add_argument(
        '--no-verify',
        action='store_true',
        help='Skip hash verification'
    )
    
    args = parser.parse_args()
    
    extract_content(args.artifact, args.out, verify=not args.no_verify)


if __name__ == '__main__':
    main()
