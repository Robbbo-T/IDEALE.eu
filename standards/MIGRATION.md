# Migration Guide to IDEALE-STD-0001

This guide helps you migrate existing UTCS files to conform with the new IDEALE-STD-0001 specification.

## Overview

IDEALE-STD-0001 introduces:
- Stricter schema validation
- Required fields for traceability
- Standardized formats
- Automated validation

## Common Migration Issues

### Issue 1: Schema Version Format

**Problem:**
```yaml
schema_version: "1.0"  # ❌ Invalid - missing patch version
```

**Solution:**
```yaml
schema_version: "1.0.0"  # ✅ Valid SemVer format
```

**Fix Command:**
```bash
# Find and replace in all UTCS files
find . -path "*/utcs/*.yaml" -exec sed -i 's/schema_version: "1\.0"/schema_version: "1.0.0"/' {} \;
```

### Issue 2: Missing Evidence Section

**Problem:**
```yaml
# No evidence section at all
```

**Solution:**
```yaml
evidence:
  links:
    - "../requirements/relevant-requirement.md"
```

**Manual Steps:**
1. Identify the requirements your artifact addresses
2. Add at least one link to requirements or verification results
3. Use relative paths from the UTCS file location

### Issue 3: Invalid Domain Code

**Problem:**
```yaml
domain: "AIRFRAME"  # ❌ Not in enum
```

**Solution:**
```yaml
domain: "AAA"  # ✅ Valid domain code
```

**Valid Domains:**
AAA, AAP, CCC, CQH, DDD, EDI, EEE, EER, IIF, IIS, LCC, LIB, MEC, OOO, PPP

### Issue 4: Missing Primary Path

**Problem:**
```yaml
bridge: "QS→FWD→UE→FE→CB→QB"
# primary_path missing
```

**Solution:**
```yaml
bridge: "QS→FWD→UE→FE→CB→QB"
primary_path: "FE→CB→UE"  # Add appropriate path
```

**Choose based on artifact type:**
- `CB→UE` - Direct compliance to engineering
- `FE→CB→UE` - Analysis through compliance to engineering  
- `FE→CB→QB→UE` - Analysis through compliance and blockchain

### Issue 5: Content Hash Format

**Problem:**
```yaml
integrity:
  hash_algorithm: "SHA256"
  content_hash: "<sha256-of-file>"  # ❌ Placeholder
```

**Solution:**
```yaml
integrity:
  hash_algorithm: "SHA256"
  content_hash: "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd"
```

**Fix Command:**
```bash
# Calculate and update hash automatically
python3 scripts/update-utcs-hash.py --utcs-file path/to/file.yaml
```

### Issue 6: Provenance Missing Required Fields

**Problem:**
```yaml
provenance:
  creator: "John Doe"  # ❌ Wrong field name
```

**Solution:**
```yaml
provenance:
  owner: "Engineering Team"
  maintainer: "john.doe"
  reviewers: ["qa.lead"]  # Optional but recommended
```

## Migration Workflow

### Step 1: Backup

```bash
# Create backup of all UTCS files
find . -path "*/utcs/*.yaml" -exec cp {} {}.backup \;
```

### Step 2: Automated Fixes

Run the migration script:

```bash
# Run validation to identify issues
python3 scripts/validate-utcs.py > migration-report.txt

# Review the report
cat migration-report.txt
```

### Step 3: Manual Fixes

For each error in the report:

1. **Schema version errors** - Update to SemVer format (X.Y.Z)
2. **Missing evidence** - Add evidence.links[] with at least one entry
3. **Invalid domain** - Map to valid domain code
4. **Missing primary_path** - Add based on artifact type
5. **Missing provenance fields** - Add owner and maintainer

### Step 4: Update Hashes

```bash
# For single file
python3 scripts/update-utcs-hash.py --utcs-file path/to/file.yaml

# For entire directory
python3 scripts/update-utcs-hash.py --batch-update path/to/utcs/
```

### Step 5: Re-validate

```bash
# Validate all files
python3 scripts/validate-utcs.py

# Check for remaining issues
cat utcs-validation-report.txt
```

## Batch Migration Script

Here's a Python script to help with common migrations:

```python
#!/usr/bin/env python3
"""
Batch migrate UTCS files to IDEALE-STD-0001
"""

import yaml
import sys
from pathlib import Path

def migrate_utcs_file(file_path):
    """Migrate a single UTCS file"""
    with open(file_path, 'r') as f:
        data = yaml.safe_load(f)
    
    changed = False
    
    # Fix schema_version format
    if 'schema_version' in data:
        version = data['schema_version']
        if version.count('.') == 1:  # e.g., "1.0"
            data['schema_version'] = f"{version}.0"
            changed = True
            print(f"  ✓ Fixed schema_version: {version} → {data['schema_version']}")
    
    # Add evidence if missing
    if 'evidence' not in data:
        data['evidence'] = {
            'links': ['<TODO: Add evidence link>']
        }
        changed = True
        print(f"  ✓ Added evidence section (needs manual update)")
    
    # Add primary_path if missing but bridge exists
    if 'bridge' in data and 'primary_path' not in data:
        data['primary_path'] = 'FE→CB→UE'  # Default
        changed = True
        print(f"  ✓ Added primary_path (verify correctness)")
    
    # Fix provenance field names
    if 'provenance' in data:
        prov = data['provenance']
        if 'creator' in prov and 'owner' not in prov:
            prov['owner'] = prov.pop('creator')
            changed = True
            print(f"  ✓ Renamed provenance.creator to owner")
    
    if changed:
        with open(file_path, 'w') as f:
            yaml.dump(data, f, default_flow_style=False, sort_keys=False)
        return True
    return False

def main():
    utcs_files = list(Path('.').rglob('utcs/*.yaml'))
    print(f"Found {len(utcs_files)} UTCS files\n")
    
    migrated = 0
    for file_path in utcs_files:
        print(f"Processing: {file_path}")
        if migrate_utcs_file(file_path):
            migrated += 1
        print()
    
    print(f"\nMigrated {migrated}/{len(utcs_files)} files")
    print("\nNext steps:")
    print("1. Review changed files")
    print("2. Update TODOs manually")
    print("3. Run: python3 scripts/update-utcs-hash.py --batch-update <dir>")
    print("4. Run: python3 scripts/validate-utcs.py")

if __name__ == '__main__':
    main()
```

Save as `scripts/migrate-utcs.py` and run:

```bash
python3 scripts/migrate-utcs.py
```

## Domain Mapping

If your UTCS files use descriptive domain names, map them:

| Old Domain | New Code | Full Name |
|------------|----------|-----------|
| AIRFRAME | AAA | Airframes, Aerodynamics, Airworthiness |
| AVIONICS | AAP | Avionics, Autopilot, Payloads |
| COMMUNICATIONS | CCC | Communications, Computing, Cybersecurity |
| QUALITY | CQH | Certification, Quality, Hazards |
| DESIGN | DDD | Design, Development, Documentation |
| ELECTRICAL | EEE | Electrical, Electronics, Energy |
| ENERGY | EER | Energy, Environment, Regulations |
| INTEGRATION | IIF | Integration, Interfaces, Facilities |
| STANDARDS | IIS | Innovation, Interoperability, Standards |
| LIFECYCLE | LCC | Lifecycle, Configuration, Compliance |
| LIBRARY | LIB | Libraries, Licensing, IP-Blockchain |
| MANUFACTURING | MEC | Manufacturing, Engineering, Certification |
| OPERATIONS | OOO | Operations, Optimization, Observability |
| PROPULSION | PPP | Propulsion, Performance, Power |

## Validation Checklist

After migration, ensure each file has:

- [ ] `schema_version` in X.Y.Z format
- [ ] Valid `utcs_id` matching pattern
- [ ] `domain` is one of 15 valid codes
- [ ] `bridge` = "QS→FWD→UE→FE→CB→QB"
- [ ] `primary_path` is valid
- [ ] `provenance.owner` and `provenance.maintainer` present
- [ ] `sheet.files[]` with at least one entry
- [ ] `evidence.links[]` with at least one entry
- [ ] `integrity.content_hash` is 64-char hex (not placeholder)

## Testing

After migration:

```bash
# 1. Run validation
python3 scripts/validate-utcs.py

# 2. Check for errors
grep "ERROR" utcs-validation-report.txt

# 3. Check for warnings
grep "WARNING" utcs-validation-report.txt

# 4. Fix any remaining issues
# (Repeat until validation passes)
```

## Rollback

If migration fails:

```bash
# Restore from backups
find . -name "*.yaml.backup" -exec bash -c 'mv "$1" "${1%.backup}"' _ {} \;
```

## Support

If you encounter issues during migration:

1. Check the validation report: `utcs-validation-report.txt`
2. Review the standard: `standards/IDEALE-STD-0001-UTCS.md`
3. See examples in: `3-PROJECTS-USE-CASES/.../utcs/`
4. Check the Quick Start: `standards/QUICKSTART.md`

## Timeline

Suggested migration timeline:

1. **Week 1**: Backup and automated fixes
2. **Week 2**: Manual fixes for complex cases
3. **Week 3**: Hash updates and validation
4. **Week 4**: Final review and cleanup

Start with less critical artifacts first to gain experience before migrating critical files.
