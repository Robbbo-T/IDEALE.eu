#!/usr/bin/env python3
"""
IDEALE Evidence Framework - Verifiable Artifact Creator
Creates portable, vendor-neutral engineering artifacts with cryptographic integrity.
"""

import argparse
import json
import hashlib
import uuid
from datetime import datetime
from pathlib import Path


def generate_artifact_id():
    """Generate a unique artifact identifier."""
    return str(uuid.uuid4())


def compute_checksum(content):
    """Compute SHA-256 checksum of content."""
    if isinstance(content, str):
        content = content.encode('utf-8')
    return hashlib.sha256(content).hexdigest()


def create_verifiable_artifact(input_path, output_path, metadata=None):
    """
    Create a verifiable IDEALE artifact from input file.
    
    Args:
        input_path: Path to source file (STEP, IGES, etc.)
        output_path: Path to output IEF JSON artifact
        metadata: Optional metadata dict
    
    Returns:
        Created artifact dict
    """
    input_file = Path(input_path)
    
    if not input_file.exists():
        raise FileNotFoundError(f"Input file not found: {input_path}")
    
    # Read input content
    with open(input_file, 'rb') as f:
        content = f.read()
    
    # Detect format
    suffix = input_file.suffix.lower()
    format_map = {
        '.step': 'STEP',
        '.stp': 'STEP',
        '.iges': 'IGES',
        '.igs': 'IGES',
        '.jt': 'JT',
        '.stl': 'STL'
    }
    data_format = format_map.get(suffix, 'native')
    
    # Create artifact structure
    artifact = {
        "artifact_id": generate_artifact_id(),
        "artifact_type": "geometry",
        "version": "1.0.0",
        "created": datetime.utcnow().isoformat() + "Z",
        "creator": {
            "id": metadata.get('creator_id', 'unknown') if metadata else 'unknown',
            "type": "Person",
            "name": metadata.get('creator_name', 'Anonymous') if metadata else 'Anonymous'
        },
        "checksum": {
            "algorithm": "sha256",
            "value": compute_checksum(content)
        },
        "provenance": {
            "source_tool": {
                "name": metadata.get('tool_name', 'Unknown') if metadata else 'Unknown',
                "version": metadata.get('tool_version', '') if metadata else '',
                "vendor": metadata.get('tool_vendor', '') if metadata else ''
            },
            "export_timestamp": datetime.utcnow().isoformat() + "Z"
        },
        "metadata": {
            "title": metadata.get('title', input_file.stem) if metadata else input_file.stem,
            "description": metadata.get('description', '') if metadata else '',
            "tags": metadata.get('tags', []) if metadata else [],
            "classification": metadata.get('classification', 'internal') if metadata else 'internal'
        },
        "data": {
            "format": data_format,
            "encoding": "base64",
            "content": content.hex(),  # For demo; use base64 in production
            "units": {
                "length": "mm",
                "mass": "kg",
                "time": "s"
            }
        },
        "validation": {
            "status": "pending",
            "checks": []
        }
    }
    
    # Write artifact
    output_file = Path(output_path)
    output_file.parent.mkdir(parents=True, exist_ok=True)
    
    with open(output_file, 'w') as f:
        json.dump(artifact, f, indent=2)
    
    print(f"✓ Created verifiable artifact: {artifact['artifact_id']}")
    print(f"  Input:  {input_path}")
    print(f"  Output: {output_path}")
    print(f"  Format: {data_format}")
    print(f"  Hash:   {artifact['checksum']['value'][:16]}...")
    
    return artifact


def main():
    parser = argparse.ArgumentParser(
        description='Create verifiable IDEALE artifacts'
    )
    parser.add_argument(
        '--input',
        required=True,
        help='Input file path (STEP, IGES, etc.)'
    )
    parser.add_argument(
        '--out',
        required=True,
        help='Output artifact path (.ief.json)'
    )
    parser.add_argument(
        '--title',
        help='Artifact title'
    )
    parser.add_argument(
        '--description',
        help='Artifact description'
    )
    parser.add_argument(
        '--creator',
        help='Creator name'
    )
    parser.add_argument(
        '--tool',
        help='Source tool name'
    )
    
    args = parser.parse_args()
    
    metadata = {
        'title': args.title,
        'description': args.description,
        'creator_name': args.creator,
        'tool_name': args.tool
    }
    
    create_verifiable_artifact(args.input, args.out, metadata)


if __name__ == '__main__':
    main()
