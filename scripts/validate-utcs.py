#!/usr/bin/env python3
"""
UTCS Validation Script
Validates UTCS YAML files against the UTCS Core schema and performs integrity checks.
"""

import os
import sys
import yaml
import json
import hashlib
import re
from pathlib import Path
from jsonschema import validate, ValidationError, Draft7Validator

# Color codes for output
GREEN = '\033[92m'
RED = '\033[91m'
YELLOW = '\033[93m'
BLUE = '\033[94m'
RESET = '\033[0m'

def load_schema():
    """Load the UTCS Core JSON schema"""
    schema_path = Path(__file__).parent.parent / "standards" / "schemas" / "utcs-core.schema.json"
    with open(schema_path, 'r') as f:
        return json.load(f)

def find_utcs_files(root_dir="."):
    """Find all UTCS YAML files in utcs/ directories"""
    utcs_files = []
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if 'utcs' in Path(dirpath).parts:
            for filename in filenames:
                if filename.endswith(('.yaml', '.yml')):
                    utcs_files.append(Path(dirpath) / filename)
    return utcs_files

def validate_utcs_id(utcs_id):
    """Validate UTCS ID format"""
    pattern = r'^UTCS-MI:[A-Z]{3}:[A-Z0-9\-]+:[A-Z0-9\-]+:[0-9]{4}:v[0-9]+$'
    return re.match(pattern, utcs_id) is not None

def check_file_exists(base_path, relative_path):
    """Check if a file referenced in sheet.files exists"""
    # Handle relative paths
    file_path = base_path.parent / relative_path
    return file_path.exists()

def resolve_evidence_link(base_path, link):
    """Check if evidence link is resolvable"""
    # UTCS ID references are always considered valid (they may be in other repos)
    if link.startswith("UTCS-MI:"):
        return True
    
    # Check if it's a relative path that exists
    evidence_path = base_path.parent / link
    return evidence_path.exists()

def validate_content_hash(base_path, utcs_data):
    """Validate content hash if primary file exists"""
    if 'sheet' not in utcs_data or 'files' not in utcs_data['sheet']:
        return True, "No files to validate"
    
    # Get the primary file (usually the first one or one with role 'primary')
    files = utcs_data['sheet']['files']
    primary_file = files[0] if files else None
    
    if not primary_file:
        return True, "No primary file specified"
    
    file_path = base_path.parent / primary_file['path']
    
    # If file doesn't exist, skip hash validation (will be caught by file existence check)
    if not file_path.exists():
        return True, f"File not found (checked separately): {primary_file['path']}"
    
    # Skip hash validation for text files (md, txt, csv) as they may be edited
    if file_path.suffix.lower() in ['.md', '.txt', '.csv', '.json']:
        return True, "Text file - hash validation skipped"
    
    # For binary files, validate hash
    expected_hash = utcs_data.get('integrity', {}).get('content_hash', '')
    
    # Skip if placeholder hash
    if expected_hash.startswith('<') and expected_hash.endswith('>'):
        return True, "Placeholder hash - validation skipped"
    
    try:
        with open(file_path, 'rb') as f:
            content = f.read()
            actual_hash = hashlib.sha256(content).hexdigest()
            
        if actual_hash.lower() == expected_hash.lower():
            return True, "Hash matches"
        else:
            return False, f"Hash mismatch: expected {expected_hash[:16]}..., got {actual_hash[:16]}..."
    except Exception as e:
        return False, f"Error reading file: {str(e)}"

def validate_utcs_file(file_path, schema):
    """Validate a single UTCS file"""
    errors = []
    warnings = []
    
    try:
        # Load YAML
        with open(file_path, 'r') as f:
            utcs_data = yaml.safe_load(f)
        
        if not utcs_data:
            return [f"Empty or invalid YAML file"], []
        
        # Validate against JSON schema
        try:
            validate(instance=utcs_data, schema=schema)
        except ValidationError as e:
            errors.append(f"Schema validation failed: {e.message}")
            return errors, warnings
        
        # Additional validations
        
        # 1. UTCS ID format
        utcs_id = utcs_data.get('utcs_id', '')
        if not validate_utcs_id(utcs_id):
            errors.append(f"Invalid UTCS ID format: {utcs_id}")
        
        # 2. Bridge validation
        bridge = utcs_data.get('bridge', '')
        if isinstance(bridge, str):
            if bridge != "QS→FWD→UE→FE→CB→QB":
                warnings.append(f"Bridge string doesn't match canonical: {bridge}")
        
        # 3. File existence check
        if 'sheet' in utcs_data and 'files' in utcs_data['sheet']:
            for file_entry in utcs_data['sheet']['files']:
                if not check_file_exists(file_path, file_entry['path']):
                    warnings.append(f"Referenced file not found: {file_entry['path']}")
        
        # 4. Evidence links resolution
        if 'evidence' in utcs_data and 'links' in utcs_data['evidence']:
            for link in utcs_data['evidence']['links']:
                if not resolve_evidence_link(file_path, link):
                    warnings.append(f"Evidence link cannot be resolved: {link}")
        
        # 5. Content hash validation
        hash_valid, hash_msg = validate_content_hash(file_path, utcs_data)
        if not hash_valid:
            errors.append(f"Content hash validation failed: {hash_msg}")
        
        # 6. Domain validation
        domain = utcs_data.get('domain', '')
        valid_domains = ["AAA","AAP","CCC","CQH","DDD","EDI","EEE","EER","IIF","IIS","LCC","LIB","MEC","OOO","PPP"]
        if domain not in valid_domains:
            errors.append(f"Invalid domain: {domain}")
        
    except yaml.YAMLError as e:
        errors.append(f"YAML parsing error: {str(e)}")
    except Exception as e:
        errors.append(f"Unexpected error: {str(e)}")
    
    return errors, warnings

def main():
    """Main validation function"""
    print(f"{BLUE}=== UTCS Validation ==={RESET}\n")
    
    # Load schema
    try:
        schema = load_schema()
        print(f"{GREEN}✓{RESET} Loaded UTCS Core schema\n")
    except Exception as e:
        print(f"{RED}✗{RESET} Failed to load schema: {str(e)}")
        sys.exit(1)
    
    # Find UTCS files
    utcs_files = find_utcs_files()
    print(f"Found {len(utcs_files)} UTCS files\n")
    
    if not utcs_files:
        print(f"{YELLOW}⚠{RESET} No UTCS files found")
        sys.exit(0)
    
    # Validate each file
    total_errors = 0
    total_warnings = 0
    report_lines = []
    
    for file_path in utcs_files:
        errors, warnings = validate_utcs_file(file_path, schema)
        
        if errors:
            print(f"{RED}✗{RESET} {file_path}")
            for error in errors:
                print(f"  {RED}ERROR:{RESET} {error}")
                report_lines.append(f"ERROR: {file_path}: {error}")
            total_errors += len(errors)
        elif warnings:
            print(f"{YELLOW}⚠{RESET} {file_path}")
            for warning in warnings:
                print(f"  {YELLOW}WARNING:{RESET} {warning}")
                report_lines.append(f"WARNING: {file_path}: {warning}")
            total_warnings += len(warnings)
        else:
            print(f"{GREEN}✓{RESET} {file_path}")
            report_lines.append(f"OK: {file_path}")
    
    # Write report
    with open('utcs-validation-report.txt', 'w') as f:
        f.write(f"UTCS Validation Report\n")
        f.write(f"======================\n\n")
        f.write(f"Total files: {len(utcs_files)}\n")
        f.write(f"Errors: {total_errors}\n")
        f.write(f"Warnings: {total_warnings}\n\n")
        f.write("\n".join(report_lines))
    
    # Summary
    print(f"\n{BLUE}=== Summary ==={RESET}")
    print(f"Total files validated: {len(utcs_files)}")
    print(f"Errors: {total_errors}")
    print(f"Warnings: {total_warnings}")
    
    if total_errors > 0:
        print(f"\n{RED}Validation failed with {total_errors} error(s){RESET}")
        sys.exit(1)
    elif total_warnings > 0:
        print(f"\n{YELLOW}Validation passed with {total_warnings} warning(s){RESET}")
        sys.exit(0)
    else:
        print(f"\n{GREEN}All validations passed!{RESET}")
        sys.exit(0)

if __name__ == '__main__':
    main()
