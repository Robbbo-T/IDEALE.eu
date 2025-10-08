# S1000D Schemas

This directory contains validation schemas and business rules for S1000D Issue 6.0 content.

## Purpose

Schemas provide comprehensive validation framework:
- **Structural validation** via XML Schema (XSD)
- **Business rule validation** via Schematron
- **Project-specific rules** via BREX tests
- **Code list definitions** for enumerations
- **Multi-layer validation** ensuring quality

## Directory Structure

### xsd/
XML Schema Definition files for structural validation.

Contains (or should contain) official S1000D Issue 6.0 schemas:
- `dmodule.xsd` — Data Module schema
- `pm.xsd` — Publication Module schema
- Supporting type definitions

See [xsd/README.md](./xsd/README.md) for details.

### schematron/
Schematron files for business rule validation.

Validates:
- Cross-references between elements
- Context-dependent rules
- DMC filename matching
- IDS completeness

See [schematron/README.md](./schematron/README.md) for details.

### brex-tests/
Test files for BREX validation.

Contains:
- Valid/invalid test cases
- BREX rule documentation
- Validation examples

See [brex-tests/README.md](./brex-tests/README.md) for details.

### codelists/
S1000D code list definitions.

Enumerations for:
- Security classifications
- Info codes
- Verification types
- Language/country codes

See [codelists/README.md](./codelists/README.md) for details.

## Validation Pipeline

Content passes through multiple validation stages:

```
1. XSD Validation
   ↓ (structural correctness)
2. Schematron Validation
   ↓ (business rules)
3. BREX Validation
   ↓ (project-specific rules)
4. DMRL Check
   ↓ (publication completeness)
5. ACT Validation
   ↓ (applicability)
6. ICN Check
   ✓ (illustration existence)
```

Each stage must pass before proceeding to next.

## Validation Tools

### XML Lint
For XSD validation:
```bash
xmllint --noout --schema schemas/s1000d/xsd/dmodule.xsd \
  CSDB/DataModules/**/*.xml
```

### Saxon
For Schematron validation:
```bash
java -jar saxon.jar -s:DM.xml -xsl:schematron-compiled.xsl
```

### Custom Validators
Project-specific validation scripts in `/scripts`:
- `validate-utcs.py` — UTCS validation
- `validate-brex.py` — BREX compliance
- `check-dmrl.py` — DMRL completeness

## CI/CD Integration

Validation runs automatically in CI/CD pipeline:

```yaml
stages:
  - validate

validate_s1000d:
  stage: validate
  script:
    - xmllint --schema schemas/s1000d/xsd/dmodule.xsd CSDB/DataModules/**/*.xml
    - python3 scripts/validate-schematron.py
    - python3 scripts/validate-brex.py
  allow_failure: false
```

Failures block merge to main branch.

## Error Reporting

Validation errors include:
- **Location** — File, line, column
- **Rule** — Which validation rule failed
- **Message** — Human-readable description
- **Severity** — Error (blocking) or Warning (advisory)

Example error:
```
ERROR: CSDB/DataModules/MAINTENANCE/06-10/DMC-AMP360-AAA-06-10-00-00A-000A-A_en-001-00.xml
Line 42: Missing required element 'security' in 'dmStatus'
Rule: IDS-001 (Metadata completeness)
```

## Schema Maintenance

### Updating Schemas
1. Obtain new schema version from S1000D.org
2. Test against existing content
3. Update schema files in `xsd/`
4. Update Schematron rules if needed
5. Run full validation suite
6. Document schema version change

### Custom Rules
Project-specific rules go in:
- **Schematron** — For business logic
- **BREX DM** — For project requirements
- **CI scripts** — For custom checks

## Versioning

Schemas are versioned:
- **S1000D Version**: Issue 6.0
- **Schema Release**: Tracked in schema files
- **Local Modifications**: Documented in this README

Current versions:
- XSD: S1000D Issue 6.0
- Schematron: Project-specific
- BREX: Rev A
- Codelists: S1000D Issue 6.0

## Related

- [../../CSDB/BREX/](../../CSDB/BREX/) — BREX Data Module
- [../../Governance/policies/](../../Governance/policies/) — Validation policies
- [../utcs/](../utcs/) — UTCS validation schema
- [S1000D Specification](http://www.s1000d.org/)

## Best Practices

- **Validate Early** — Check content during authoring
- **Automate Validation** — Use CI/CD pipeline
- **Keep Schemas Current** — Update to latest S1000D release
- **Document Customizations** — Track project-specific rules
- **Test Thoroughly** — Validate against all content types
