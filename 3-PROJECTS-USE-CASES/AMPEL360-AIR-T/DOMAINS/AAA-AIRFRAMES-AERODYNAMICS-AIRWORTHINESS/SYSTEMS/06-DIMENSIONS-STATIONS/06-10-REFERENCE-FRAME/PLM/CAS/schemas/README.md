# Validation Schemas

This directory contains schemas for validating S1000D and UTCS content.

## Structure

### s1000d/
S1000D Issue 6.0 validation schemas:

- **xsd/** — XML Schema Definition files
- **schematron/** — Schematron business rule files
- **brex-tests/** — BREX validation test files
- **codelists/** — S1000D code list definitions

### utcs/
UTCS JSON Schema for provenance validation:
- `utcs.schema.json` — Core UTCS structure schema

## Validation Pipeline

Content validation follows this sequence:

1. **XSD Validation** — Structural correctness
   - Valid XML syntax
   - Required elements present
   - Correct element nesting

2. **Schematron Validation** — Business rules
   - Cross-references resolve
   - Applicability statements valid
   - Required metadata present

3. **BREX Validation** — Custom project rules
   - Project-specific requirements
   - Naming conventions
   - Content constraints

4. **DMRL Check** — Publication completeness
   - All required DMs present
   - No missing dependencies

## S1000D Issue 6.0 Schemas

The xsd/ directory should contain official S1000D Issue 6.0 XSD files:
- `dmodule.xsd` — Data Module schema
- `pm.xsd` — Publication Module schema
- `infoEntityResolver.xsd` — Information entity schema
- Supporting type definition files

## Schematron Rules

Business rules validate:
- DMC filename matches XML content
- `identAndStatusSection` completeness
- Applicability statement validity
- ICN reference existence
- CIR reference validity

## BREX (Business Rules Exchange)

Project-specific validation rules as DMC:
- Custom naming patterns
- Required quality assurance fields
- Mandatory applicability statements
- Publication-specific constraints

Example BREX DMC:
```
DMC-AMP360-AAA-00-00-00-00A-BREX-A_en-001-00.xml
```

## UTCS Schema

JSON Schema (Draft-07) for UTCS validation:
- Required fields (utcs_id, domain, etc.)
- ID format patterns
- Provenance structure
- Integrity hash validation

## CI/CD Integration

Validation runs automatically:
```bash
# XSD validation
xmllint --noout --schema schemas/s1000d/xsd/dmodule.xsd *.xml

# Schematron validation
java -jar schematron-validator.jar schemas/s1000d/schematron/*.sch *.xml

# UTCS validation
python3 scripts/validate-utcs.py
```

## Related

- [../CSDB/BREX/](../CSDB/BREX/) — BREX Data Module
- [../Governance/policies/](../Governance/policies/) — Validation policies
- S1000D Issue 6.0 Specification
