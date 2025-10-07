# UTCS Schemas

This directory contains machine-readable schemas for UTCS (UiX Threading Context/Content/Cache and Structure/Style/Sheet) validation.

## Contents

- **[utcs-core.schema.json](utcs-core.schema.json)** - JSON Schema (Draft-07) for UTCS Core validation

## Purpose

Schemas provide automated validation for:
- Required field presence
- Format pattern enforcement
- Type checking
- Enumeration constraints
- Nested object validation

## Schema Details

### utcs-core.schema.json

**Standard:** JSON Schema Draft-07  
**Validates:** UTCS YAML files  
**Required Fields:** 10 mandatory sections

Key validations:
- `schema_version` - SemVer format (X.Y.Z)
- `utcs_id` - Pattern: `UTCS-MI:{SCOPE}:{CLASS}:{ZONE}:{INDEX}:v{N}`
- `domain` - Enum of 15 valid codes
- `bridge` - TFA sequence: `QS→FWD→UE→FE→CB→QB`
- `primary_path` - One of 3 valid paths
- `integrity.content_hash` - 64-character hex string

## Usage

### With Python

```python
import json
import yaml
from jsonschema import validate

# Load schema
with open('standards/schemas/utcs-core.schema.json') as f:
    schema = json.load(f)

# Load and validate UTCS file
with open('path/to/utcs-file.yaml') as f:
    utcs_data = yaml.safe_load(f)

validate(instance=utcs_data, schema=schema)
```

### With Validation Script

```bash
python3 scripts/validate-utcs.py
```

## Related Documentation

- [IDEALE-STD-0001-UTCS.md](../IDEALE-STD-0001-UTCS.md) - Normative specification
- [../README.md](../README.md) - Standards overview
- [../../scripts/validate-utcs.py](../../scripts/validate-utcs.py) - Validation tool
