# UTCS Quick Start Guide

## What is UTCS?

UTCS (UiX Threading Context/Content/Cache and Structure/Style/Sheet) is the canonical YAML data structure for PLM/CAx/TFA traceability in the IDEALE framework. It provides a standardized way to document artifacts, their provenance, integrity, and evidence.

## 5-Minute Getting Started

### 1. Understand the Standard

Read the [IDEALE-STD-0001-UTCS.md](IDEALE-STD-0001-UTCS.md) specification to understand:
- Required fields
- UTCS ID format
- TFA bridge pattern
- Integrity requirements

### 2. Create Your First UTCS File

Use this minimal template:

```yaml
schema_version: "1.0.0"
utcs_id: "UTCS-MI:CAD:AAA:ONB:0001:v1"
product: "AMPEL360-AIR-T"
domain: "AAA"
bridge: "QS→FWD→UE→FE→CB→QB"
primary_path: "FE→CB→UE"

provenance:
  owner: "Engineering Team"
  maintainer: "your.name"

sheet:
  files:
    - path: "../models/your-model.stp"
      role: "cad"

evidence:
  links:
    - "../requirements/your-requirement.md"

security:
  classification: "INTERNAL"

integrity:
  hash_algorithm: "SHA256"
  content_hash: "0000000000000000000000000000000000000000000000000000000000000000"
```

Save this in a `utcs/` directory within your artifact's location.

### 3. Calculate Content Hash

```bash
# Update the hash based on your actual artifact
python3 scripts/update-utcs-hash.py \
  --utcs-file path/to/utcs/your-file.yaml
```

### 4. Validate

```bash
# Validate all UTCS files in the repository
python3 scripts/validate-utcs.py
```

## Common Patterns

### Assembly Artifact

```yaml
schema_version: "1.0.0"
utcs_id: "UTCS-MI:ASM:AAA:ONB:0012:v1"
product: "AMPEL360-AIR-T"
domain: "AAA"
bridge: "QS→FWD→UE→FE→CB→QB"
primary_path: "FE→CB→UE"

provenance:
  owner: "AAA Integration Team"
  maintainer: "assembly.lead"
  reviewers: ["qa.lead", "safety.lead"]

threading:
  context:
    mission: "Wing-to-body join"
    env: "onboard"

sheet:
  files:
    - path: "ASM-WING-JOIN-0012.md"
      role: "procedure"
    - path: "FAST-WING-JOIN-0012.csv"
      role: "fastener-schedule"

evidence:
  requirements: ["CS25.601", "CS25.607"]
  links:
    - "../verification/TEST-WING-JOIN-0012.yaml"

security:
  classification: "INTERNAL–EVIDENCE-REQUIRED"

integrity:
  hash_algorithm: "SHA256"
  content_hash: "abc123...def"
```

### CAD Model

```yaml
schema_version: "1.0.0"
utcs_id: "UTCS-MI:CAD:AAA:WINGBOX:0001:v1"
product: "AMPEL360-AIR-T"
domain: "AAA"
bridge: "QS→FWD→UE→FE→CB→QB"
primary_path: "CB→UE"

provenance:
  owner: "Design Team"
  maintainer: "cad.engineer"

sheet:
  files:
    - path: "models/WINGBOX-001.stp"
      role: "cad"
    - path: "drawings/WINGBOX-001.pdf"
      role: "drawing"

evidence:
  requirements: ["REQ-STRUCTURAL-001"]
  links:
    - "../analysis/FEA-WINGBOX-001.yaml"

security:
  classification: "INTERNAL"

integrity:
  hash_algorithm: "SHA256"
  content_hash: "def456...abc"
```

## Validation Workflow

### Pre-Commit Check

Before committing UTCS files:

```bash
# 1. Update hashes for modified artifacts
python3 scripts/update-utcs-hash.py --batch-update path/to/utcs/

# 2. Validate all UTCS files
python3 scripts/validate-utcs.py

# 3. Review validation report
cat utcs-validation-report.txt
```

### CI/CD Integration

The validation runs automatically on:
- Every push to any branch
- Every pull request

Check the "Actions" tab in GitHub to see validation results.

## Troubleshooting

### "Schema validation failed: 'evidence' is a required property"

**Solution:** Add an evidence section with at least one link:

```yaml
evidence:
  links:
    - "../requirements/some-requirement.md"
```

### "Invalid UTCS ID format"

**Solution:** Ensure your UTCS ID matches the pattern:

```
UTCS-MI:{SCOPE}:{CLASS}:{ZONE}:{INDEX}:v{N}
```

Example: `UTCS-MI:CAD:AAA:ONB:0001:v1`

### "Hash mismatch"

**Solution:** Recalculate the hash:

```bash
python3 scripts/update-utcs-hash.py \
  --utcs-file path/to/utcs/file.yaml
```

### "Referenced file not found"

**Solution:** Ensure all paths in `sheet.files[]` are:
1. Relative to the UTCS file location
2. Point to existing files

Example:
```yaml
sheet:
  files:
    - path: "../models/design.stp"  # Goes up one level, then into models/
      role: "cad"
```

## Best Practices

1. **One UTCS file per artifact** - Each significant artifact should have its own UTCS file
2. **Use relative paths** - Always use relative paths for files and evidence links
3. **Version appropriately** - Increment the version number (`:vN`) when making incompatible changes
4. **Document thoroughly** - Use threading.context and structure sections to add context
5. **Link requirements** - Always include traceability to requirements in evidence.requirements
6. **Update hashes** - Keep content_hash up to date when artifacts change
7. **Review regularly** - Have reviewers listed in provenance.reviewers

## Domain Codes

Valid domain codes:

| Code | Domain |
|------|--------|
| AAA | Airframes, Aerodynamics, Airworthiness |
| AAP | Avionics, Autopilot, Payloads |
| CCC | Communications, Computing, Cybersecurity |
| CQH | Certification, Quality, Hazards |
| DDD | Design, Development, Documentation |
| EDI | Environment, Data, Integration |
| EEE | Electrical, Electronics, Energy |
| EER | Energy, Environment, Regulations |
| IIF | Integration, Interfaces, Facilities |
| IIS | Innovation, Interoperability, Standards |
| LCC | Lifecycle, Configuration, Compliance |
| LIB | Libraries, Licensing, IP-Blockchain |
| MEC | Manufacturing, Engineering, Certification |
| OOO | Operations, Optimization, Observability |
| PPP | Propulsion, Performance, Power |

## Next Steps

1. Review existing UTCS files in the repository for examples
2. Read the full [IDEALE-STD-0001-UTCS.md](IDEALE-STD-0001-UTCS.md) specification
3. Check [standards/README.md](README.md) for comprehensive documentation
4. Review the [conformance checklist](checklists/conformance.md)

## Need Help?

- **Validation errors**: Check `utcs-validation-report.txt` for details
- **Schema questions**: Review `schemas/utcs-core.schema.json`
- **Naming conventions**: See `policies/naming.md`
- **Examples**: Browse `3-PROJECTS-USE-CASES/.../utcs/` directories
