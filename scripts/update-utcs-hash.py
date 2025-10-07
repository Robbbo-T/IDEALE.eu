#!/usr/bin/env python3
"""
UTCS Hash Calculator
Calculate SHA256 hash for UTCS artifacts and update content_hash in YAML files.
"""

import os
import sys
import yaml
import hashlib
import argparse
from pathlib import Path

def calculate_sha256(file_path):
    """Calculate SHA256 hash of a file"""
    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        # Read file in chunks to handle large files
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()

def update_utcs_hash(utcs_file, artifact_path=None, dry_run=False):
    """Update content_hash in UTCS YAML file"""
    utcs_path = Path(utcs_file)
    
    if not utcs_path.exists():
        print(f"Error: UTCS file not found: {utcs_file}")
        return False
    
    # Load UTCS YAML
    with open(utcs_path, 'r') as f:
        utcs_data = yaml.safe_load(f)
    
    # Determine artifact path
    if artifact_path is None:
        # Try to get from sheet.files[0]
        if 'sheet' in utcs_data and 'files' in utcs_data['sheet'] and utcs_data['sheet']['files']:
            relative_path = utcs_data['sheet']['files'][0]['path']
            artifact_path = utcs_path.parent / relative_path
        else:
            print(f"Error: No artifact path specified and no files in sheet")
            return False
    else:
        artifact_path = Path(artifact_path)
    
    if not artifact_path.exists():
        print(f"Error: Artifact file not found: {artifact_path}")
        return False
    
    # Calculate hash
    print(f"Calculating SHA256 for: {artifact_path}")
    content_hash = calculate_sha256(artifact_path)
    print(f"Hash: {content_hash}")
    
    # Update UTCS data
    if 'integrity' not in utcs_data:
        utcs_data['integrity'] = {}
    
    utcs_data['integrity']['hash_algorithm'] = 'SHA256'
    utcs_data['integrity']['content_hash'] = content_hash
    
    if dry_run:
        print(f"\nDry run - would update {utcs_file} with:")
        print(f"  hash_algorithm: SHA256")
        print(f"  content_hash: {content_hash}")
        return True
    
    # Write back to UTCS file
    with open(utcs_path, 'w') as f:
        yaml.dump(utcs_data, f, default_flow_style=False, sort_keys=False, allow_unicode=True)
    
    print(f"✓ Updated {utcs_file}")
    return True

def batch_update(directory, dry_run=False):
    """Batch update all UTCS files in a directory"""
    utcs_dir = Path(directory)
    
    if not utcs_dir.exists():
        print(f"Error: Directory not found: {directory}")
        return False
    
    # Find all YAML files
    yaml_files = list(utcs_dir.glob("*.yaml")) + list(utcs_dir.glob("*.yml"))
    
    if not yaml_files:
        print(f"No YAML files found in {directory}")
        return False
    
    print(f"Found {len(yaml_files)} UTCS files\n")
    
    success_count = 0
    for yaml_file in yaml_files:
        try:
            if update_utcs_hash(yaml_file, dry_run=dry_run):
                success_count += 1
            print()
        except Exception as e:
            print(f"Error processing {yaml_file}: {str(e)}\n")
    
    print(f"\nSuccessfully updated {success_count}/{len(yaml_files)} files")
    return success_count == len(yaml_files)

def main():
    parser = argparse.ArgumentParser(
        description='Calculate and update SHA256 hashes for UTCS artifacts',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Update hash for a single UTCS file (uses sheet.files[0] path)
  %(prog)s --utcs-file utcs/ASM-AAA-ONB-JOIN-0012.yaml

  # Update hash for a single UTCS file with explicit artifact path
  %(prog)s --utcs-file utcs/ASM-AAA-ONB-JOIN-0012.yaml --artifact-path ../ASM-AAA-ONB-JOIN-0012.md

  # Batch update all UTCS files in a directory
  %(prog)s --batch-update utcs/

  # Dry run (show what would be updated without making changes)
  %(prog)s --utcs-file utcs/ASM-AAA-ONB-JOIN-0012.yaml --dry-run
        """
    )
    
    parser.add_argument(
        '--utcs-file',
        help='Path to UTCS YAML file'
    )
    parser.add_argument(
        '--artifact-path',
        help='Path to artifact file (if not using sheet.files[0])'
    )
    parser.add_argument(
        '--batch-update',
        help='Batch update all UTCS files in directory'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show what would be updated without making changes'
    )
    
    args = parser.parse_args()
    
    if args.batch_update:
        success = batch_update(args.batch_update, dry_run=args.dry_run)
        sys.exit(0 if success else 1)
    elif args.utcs_file:
        success = update_utcs_hash(args.utcs_file, args.artifact_path, dry_run=args.dry_run)
        sys.exit(0 if success else 1)
    else:
        parser.print_help()
        sys.exit(1)

if __name__ == '__main__':
    main()
