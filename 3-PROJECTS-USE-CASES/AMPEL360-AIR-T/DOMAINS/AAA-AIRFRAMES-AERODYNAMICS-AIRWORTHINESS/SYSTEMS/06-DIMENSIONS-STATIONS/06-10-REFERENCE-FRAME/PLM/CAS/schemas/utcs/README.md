# UTCS Schema

This directory contains the JSON Schema for UTCS (UiX Threading Context/Content/Cache and Structure/Style/Sheet) validation.

## Purpose

The UTCS schema provides:
- **Structural validation** for UTCS YAML/JSON files
- **Format enforcement** for UTCS identifiers
- **Type checking** for required fields
- **Pattern matching** for IDs and checksums
- **Enumeration constraints** for status and types

## Schema File

**File**: `utcs.schema.json`

JSON Schema (Draft-07) specification defining:
- Required fields
- Field types and formats
- Pattern validation
- Enumeration values
- Nested object structures

## Key Validations

### UTCS ID Format
```
Pattern: ^UTCS-MI:[A-Z]{3}:[A-Z0-9\-]+:[A-Z0-9\-]+:[A-Z0-9\-]+:rev\[[A-Za-z0-9]+\]$
```

Examples:
- `UTCS-MI:AAA:CAS:06-10:DMRL:rev[A]` ✓
- `UTCS-MI:AAA:CAS:06-10:DM:DESCRIPTIVE:rev[1]` ✓
- `UTCS-MI:IIS:CAS:91:PM:STRUCT:rev[B]` ✓

### Domain Codes
Valid domain codes:
- `AAA` — Airframes, Aerodynamics, Airworthiness
- `APS` — Avionics, Propulsion, Systems
- `HFS` — Human Factors, Safety
- `IIS` — Information, Intelligence, Systems
- `POS` — Production, Operations, Support

### Artifact Types
Valid artifact types:
- `DataModule` — S1000D Data Module
- `PublicationModule` — S1000D Publication Module
- `DMRL` — Data Module Requirements List
- `BREX` — Business Rules Exchange
- `Illustration` — ICN graphic file
- `ACT` — Applicability Cross-reference Table
- `WorkPackage` — Maintenance task package
- `Baseline` — Immutable publication snapshot

### Status Values
Valid status values:
- `new` — Newly created artifact
- `active` — Current production version
- `revised` — Updated content
- `superseded` — Replaced by newer version
- `archived` — Historical reference only

### Checksum Format
```
Pattern: ^sha256:[a-f0-9]{64}$|^sha256:pending$
```

Examples:
- `sha256:a3b5c7d9e1f2a4b6c8d0e2f4a6b8c0d2e4f6a8b0c2d4e6f8a0b2c4d6e8f0a2b4` ✓
- `sha256:pending` ✓ (before calculation)

### Date Format
```
Pattern: ^[0-9]{4}-[0-9]{2}-[0-9]{2}$
```

Examples:
- `2025-01-31` ✓
- `2025-12-01` ✓

## Usage

### With Python
```python
import json
import yaml
from jsonschema import validate, ValidationError

# Load schema
with open('schemas/utcs/utcs.schema.json') as f:
    schema = json.load(f)

# Load UTCS file
with open('utcs/index.json') as f:
    utcs_data = json.load(f)

# Validate
try:
    validate(instance=utcs_data, schema=schema)
    print("✓ UTCS file is valid")
except ValidationError as e:
    print(f"✗ Validation error: {e.message}")
```

### With Validation Script
```bash
# Validate all UTCS files
python3 scripts/validate-utcs.py

# Output:
# ✓ utcs/index.json - Valid
# ✓ Outputs/Baselines/.../utcs-snapshot.json - Valid
```

### With CI/CD
Automated validation in pipeline:
```yaml
jobs:
  validate-utcs:
    steps:
      - name: Validate UTCS
        run: python3 scripts/validate-utcs.py
      - name: Check for failures
        run: |
          if [ $? -ne 0 ]; then
            echo "UTCS validation failed"
            exit 1
          fi
```

## Schema Structure

### Root Object
```json
{
  "required": [
    "schema_version",
    "utcs_id",
    "domain",
    "artifact_type",
    "status"
  ],
  "properties": {
    "schema_version": { "type": "string", "pattern": "^[0-9]+\\.[0-9]+\\.[0-9]+$" },
    "utcs_id": { "type": "string", "pattern": "^UTCS-MI:..." },
    "domain": { "enum": ["AAA", "APS", "HFS", "IIS", "POS"] },
    "artifact_type": { "enum": ["DataModule", "PublicationModule", ...] },
    "status": { "enum": ["new", "active", "revised", ...] }
  }
}
```

### Optional Fields
Additional fields validated when present:
- `file_path` — String, relative path
- `dmc` — String, pattern `^DMC-[A-Z0-9\\-]+$`
- `pm_code` — String, publication module code
- `icn` — String, pattern `^ICN-[A-Z0-9\\-]+$`
- `title` — String, human-readable description
- `issue_date` — String, YYYY-MM-DD format
- `checksum` — String, sha256:... format

## Error Messages

Common validation errors and fixes:

### Invalid UTCS ID
```
Error: 'UTCS-AAA-CAS-06-10-DMRL-rev[A]' does not match pattern
Fix: Add 'MI:' after 'UTCS-'
Correct: 'UTCS-MI:AAA:CAS:06-10:DMRL:rev[A]'
```

### Invalid Domain
```
Error: 'XYZ' is not one of ['AAA', 'APS', 'HFS', 'IIS', 'POS']
Fix: Use valid domain code from enumeration
```

### Missing Required Field
```
Error: 'status' is a required property
Fix: Add status field with valid value: new, active, revised, superseded, or archived
```

### Invalid Checksum Format
```
Error: 'sha256:abc' does not match pattern
Fix: Use complete 64-character hex digest or 'sha256:pending'
Correct: 'sha256:a3b5c7d9...' (64 hex chars)
```

## Schema Versioning

Schema version follows SemVer:
- **Major** — Breaking changes to structure
- **Minor** — New optional fields
- **Patch** — Documentation or pattern fixes

Current version: `1.0.0`

## Extending the Schema

To add new fields:
1. Edit `utcs.schema.json`
2. Add field to `properties` section
3. Add to `required` array if mandatory
4. Define type and validation rules
5. Update this README with documentation
6. Increment schema version
7. Test against existing UTCS files

## Related

- [../../utcs/](../../utcs/) — UTCS index files using this schema
- [../../Outputs/Baselines/](../../Outputs/Baselines/) — Baseline UTCS snapshots
- [../../../../../../../standards/IDEALE-STD-0001-UTCS.md](../../../../../../../standards/IDEALE-STD-0001-UTCS.md) — UTCS specification
- [JSON Schema Documentation](https://json-schema.org/)

## Validation Tools

### Python
- `jsonschema` package
- Draft-07 validator

### JavaScript
- `ajv` package
- JSON Schema validator

### Command Line
- `check-jsonschema` tool
- Validates against any JSON Schema

## Best Practices

- **Validate Early** — Check UTCS files before commit
- **Automate Validation** — Include in CI/CD pipeline
- **Keep Schema Current** — Update as needs evolve
- **Document Changes** — Maintain schema changelog
- **Test Thoroughly** — Validate against all existing files
