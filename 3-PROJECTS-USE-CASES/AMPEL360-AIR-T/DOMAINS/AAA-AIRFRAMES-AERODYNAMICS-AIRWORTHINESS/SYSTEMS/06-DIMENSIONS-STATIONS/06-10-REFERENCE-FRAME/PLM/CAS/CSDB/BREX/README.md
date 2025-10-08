# BREX — Business Rules Exchange

This directory contains the BREX (Business Rules Exchange) Data Module for project-specific validation rules.

## Purpose

BREX defines custom validation rules beyond standard S1000D:
- Project-specific naming conventions
- Mandatory metadata fields
- Allowed enumeration values
- Content structure constraints
- Quality assurance requirements

## BREX as a Data Module

Unlike other validation artifacts, BREX is itself a **Data Module** with:
- **Info Code**: BREX (special designation)
- **Filename**: Must match the DMC exactly
- **Referenced by**: All other DMs via `brexDmRef` element

## Current BREX DM

**File**: `DMC-AMP360-AAA-00-00-00-00A-000A-A_en-US_001-00.xml`

This BREX DM defines validation rules for:
- AMP360 enterprise code
- DMC naming patterns
- Security classifications
- Quality assurance verification types
- Language and country codes
- Issue numbering format

## BREX Rule Examples

### Enterprise Code Rule
All DMs must use `enterpriseCode="AMP360"` in `responsiblePartnerCompany`.

### DMC Pattern Rule
All Data Module filenames must follow the pattern:
```
DMC-AMP360-AAA-{ATA}-{SNS}-00-00A-{INFO}-A_en-{ISSUE}-{INWORK}.xml
```

### Security Classification Rule
Security classification must use codes from approved list: 01-05.

### Quality Assurance Rule
All DMs must include `firstVerification` with valid `verificationType`.

## Validation Workflow

BREX validation occurs after XSD and Schematron:
1. **XSD Validation** — Structural correctness
2. **Schematron Validation** — Business logic rules
3. **BREX Validation** — Project-specific requirements ✓
4. **DMRL Check** — Publication completeness

## Updating BREX Rules

To modify BREX rules:
1. Edit the BREX DM XML content
2. Update `issueInfo` to reflect new version
3. Update `dmAddressItems/issueDate`
4. Document changes in DM history
5. Test validation against existing DMs
6. Commit and push changes

All DMs automatically reference this BREX DM via their `brexDmRef` element.

## CI/CD Integration

BREX validation is enforced in the CI/CD pipeline:
- **Stage**: After Schematron validation
- **Failure Mode**: Blocks merge to main branch
- **Reports**: Detailed violation messages with rule references

## Related

- [../DMRL/](../DMRL/) — Data Module Requirements List
- [../../schemas/s1000d/brex-tests/](../../schemas/s1000d/brex-tests/) — BREX test examples
- S1000D Issue 6.0, Chapter 3.11 — BREX specification
- [../../Governance/policies/metadata.yaml](../../Governance/policies/metadata.yaml) — Metadata policy enforced by BREX

## Notes

The BREX DM must be maintained as the single source of truth for project validation rules. Any changes to validation requirements should be reflected in this BREX DM, not scattered across multiple configuration files.
