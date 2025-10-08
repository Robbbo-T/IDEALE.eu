# BREX Business Rules

This directory contains BREX (Business Rules Exchange) validation test files.

## Purpose

BREX defines project-specific validation rules beyond standard S1000D:
- Naming conventions
- Mandatory fields
- Allowed values
- Custom constraints

## BREX Data Module

The BREX rules are defined in a Data Module:
- Location: `../../CSDB/BREX/DMC-AMP360-AAA-00-00-00-00A-000A-A_en-US_001-00.xml`
- Info Code: BREX (special code for BREX DMs)
- Referenced by all DMs in `brexDmRef` element

## Example BREX Rules

### Rule 1: DMC Naming Pattern
```
All Data Module filenames must match pattern:
DMC-AMP360-AAA-{ATA}-{SNS}-00-00A-{INFO}-A_en-{ISSUE}-{INWORK}.xml
```

### Rule 2: Enterprise Code
```
responsiblePartnerCompany/@enterpriseCode must be "AMP360"
```

### Rule 3: Language
```
language/@languageIsoCode must be "en"
language/@countryIsoCode must be "US"
```

### Rule 4: Security Classification
```
security/@securityClassification must be one of: 01, 02, 03, 04, 05
```

### Rule 5: Quality Assurance
```
qualityAssurance/firstVerification/@verificationType must be present
Allowed values: tabtop, onobject, ttandoo
```

### Rule 6: Applicability
```
All DMs must have applic element
displayText or evaluate must be present
```

### Rule 7: Issue Info
```
issueInfo/@issueNumber format: nnn (3 digits)
issueInfo/@inWork format: nn (2 digits)
```

## BREX Test Files

Test files validate BREX compliance:
- `brex-test-valid.xml` — Valid DM passing all BREX rules
- `brex-test-invalid-dmc.xml` — Fails DMC naming rule
- `brex-test-invalid-enterprise.xml` — Fails enterprise code rule
- `brex-test-invalid-qa.xml` — Fails QA rule

## Usage

Test BREX compliance during CI:

```bash
# Run BREX validation
s1000d-brex-validate --brex CSDB/BREX/DMC-*.xml \
  CSDB/DataModules/**/*.xml
```

## CI/CD Integration

BREX validation is mandatory gate:
- Stage: After XSD and Schematron
- Failure: Blocks merge
- Reports: Detailed rule violations

## Related

- [../../CSDB/BREX/](../../CSDB/BREX/) — BREX Data Module
- S1000D Issue 6.0, Chapter 3.11 (BREX)
- [../../Governance/policies/](../../Governance/policies/) — Policy enforcement
