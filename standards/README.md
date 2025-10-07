# IDEALE Standards

This directory contains normative standards, schemas, policies, and checklists for the IDEALE project.

## 📋 Contents

### Normative Standards
- **[IDEALE-STD-0001-UTCS.md](IDEALE-STD-0001-UTCS.md)** - UTCS Core specification (v0.1.0)
  - Defines canonical YAML structure for PLM/CAx/TFA traceability
  - Establishes UTCS ID format and bridge patterns
  - Specifies integrity, provenance, and evidence requirements

### Schemas
- **[schemas/utcs-core.schema.json](schemas/utcs-core.schema.json)** - JSON Schema for UTCS YAML validation
  - Draft-07 compatible
  - Validates all required UTCS fields
  - Enforces domain enumerations and format patterns

### Policies
- **[policies/naming.md](policies/naming.md)** - Naming conventions and path rules
  - UTCS ID patterns
  - File naming conventions
  - Repository path structure requirements

### Checklists
- **[checklists/conformance.md](checklists/conformance.md)** - UTCS conformance checklist
  - 9-point validation checklist
  - Schema validation requirements
  - Traceability verification steps

## 🔧 Tools

### Validation Script
Located at `scripts/validate-utcs.py`

```bash
# Validate all UTCS files in the repository
python3 scripts/validate-utcs.py

# The script will:
# - Validate against JSON schema
# - Check UTCS ID format
# - Verify file existence
# - Validate evidence links
# - Check content hashes
# - Generate validation report
```

### Hash Update Script
Located at `scripts/update-utcs-hash.py`

```bash
# Update hash for a single UTCS file
python3 scripts/update-utcs-hash.py --utcs-file utcs/ASM-AAA-ONB-JOIN-0012.yaml

# Batch update all UTCS files in a directory
python3 scripts/update-utcs-hash.py --batch-update 3-PROJECTS-USE-CASES/.../utcs/

# Dry run to preview changes
python3 scripts/update-utcs-hash.py --utcs-file utcs/ASM-AAA-ONB-JOIN-0012.yaml --dry-run
```

## 🔄 CI/CD Integration

The UTCS validation is automatically run on every push and pull request via GitHub Actions.

**Workflow:** `.github/workflows/utcs-validation.yml`

The workflow:
1. Finds all YAML files in `utcs/` directories
2. Validates each against the UTCS Core schema
3. Performs integrity checks
4. Generates and uploads validation report

## 📚 UTCS Core Requirements

Every UTCS YAML file MUST include:

- `schema_version` - SemVer string (e.g., "1.0.0")
- `utcs_id` - Canonical ID matching pattern `UTCS-MI:{SCOPE}:{CLASS}:{ZONE}:{INDEX}:v{N}`
- `product` - Product name
- `domain` - One of 15 valid domains (AAA, AAP, CCC, CQH, DDD, EDI, EEE, EER, IIF, IIS, LCC, LIB, MEC, OOO, PPP)
- `bridge` - TFA bridge: `"QS→FWD→UE→FE→CB→QB"`
- `primary_path` - One of: `CB→UE`, `FE→CB→UE`, `FE→CB→QB→UE`
- `provenance` - With `owner` and `maintainer`
- `sheet.files[]` - Array of files with `path` and `role`
- `evidence.links[]` - Traceability links (UTCS IDs or paths)
- `integrity` - With `hash_algorithm: "SHA256"` and `content_hash` (64-char hex)

## 🔐 Security Classifications

Valid classifications:
- `INTERNAL` - Internal use only
- `INTERNAL–EVIDENCE-REQUIRED` - Internal with evidence requirements
- `RESTRICTED` - Restricted access

## 📖 Usage Examples

### Creating a New UTCS File

```yaml
schema_version: "1.0.0"
utcs_id: "UTCS-MI:CAD:AAA:ONB:0001:v1"
product: "AMPEL360-AIR-T"
domain: "AAA"
bridge: "QS→FWD→UE→FE→CB→QB"
primary_path: "FE→CB→UE"

provenance:
  owner: "Engineering Team"
  maintainer: "john.doe"

sheet:
  files:
    - path: "models/design-001.stp"
      role: "cad"
    - path: "docs/specification-001.md"
      role: "spec"

evidence:
  requirements: ["CS25.601", "CS25.607"]
  links:
    - "../requirements/REQ-001.md"
    - "UTCS-MI:TEST:AAA:ONB:0001:v1"

security:
  classification: "INTERNAL–EVIDENCE-REQUIRED"

integrity:
  hash_algorithm: "SHA256"
  content_hash: "a1b2c3d4e5f6...0123456789abcdef"
```

### Validating UTCS Files

```bash
# Install dependencies
pip install pyyaml jsonschema

# Run validation
python3 scripts/validate-utcs.py

# Check validation report
cat utcs-validation-report.txt
```

### Updating Content Hashes

```bash
# After updating an artifact, recalculate its hash
python3 scripts/update-utcs-hash.py \
  --utcs-file path/to/utcs/file.yaml \
  --artifact-path path/to/artifact.stp
```

## 🔍 Conformance Checklist

Before committing UTCS files, ensure:

1. ✅ Structure validates against `utcs-core.schema.json`
2. ✅ `utcs_id` and repository path are coherent with domain/ATA
3. ✅ `bridge` = `QS→FWD→UE→FE→CB→QB`
4. ✅ `primary_path` is one of the three valid options
5. ✅ All files in `sheet.files[]` exist and use relative paths
6. ✅ All `evidence.links[]` are resolvable (UTCS ID or valid path)
7. ✅ `content_hash` matches the actual artifact
8. ✅ Security classification is applied
9. ✅ Traceability to requirements (CS-25/CS-xx) is present

## 📦 Version History

- **v0.1.0** (2025-01) - Initial UTCS Core standard
  - Normative specification
  - JSON Schema validation
  - CI/CD integration
  - Hash calculation tools

## 🤝 Contributing

When updating standards:

1. Update the standard document in markdown
2. Update the JSON schema if structure changes
3. Update validation scripts if new checks are needed
4. Test with existing UTCS files
5. Update version numbers following SemVer
6. Document changes in version history

## 📞 Support

For questions about UTCS standards:
- Review the [IDEALE-STD-0001-UTCS.md](IDEALE-STD-0001-UTCS.md) specification
- Check existing UTCS files for examples
- Review validation error messages and reports

## 🔗 Related Documentation

- [1-DIMENSIONS/CANONICAL-TAXONOMY/](../1-DIMENSIONS/CANONICAL-TAXONOMY/) - UTCS canonical definitions
- [evidence-engine/](../evidence-engine/) - Evidence framework integration
- [3-PROJECTS-USE-CASES/.../utcs/](../3-PROJECTS-USE-CASES/) - Example UTCS files
