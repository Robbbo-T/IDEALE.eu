# Schematron Validation Rules

This directory contains Schematron files for business rule validation.

## Purpose

Schematron validates S1000D content beyond what XSD can check:
- Cross-references between elements
- Context-dependent rules
- Business logic constraints
- Project-specific requirements

## Standard S1000D Rules

Example rules that should be implemented:

### DMC Validation
```xml
<rule context="dmCode">
  <!-- Verify DMC matches filename -->
  <assert test="matches(base-uri(), concat(@modelIdentCode, '-', ...))">
    DMC in XML must match filename
  </assert>
</rule>
```

### IDS Completeness
```xml
<rule context="dmStatus">
  <!-- Ensure required fields present -->
  <assert test="security">
    Security classification required
  </assert>
  <assert test="responsiblePartnerCompany">
    Responsible partner company required
  </assert>
  <assert test="qualityAssurance">
    Quality assurance verification required
  </assert>
</rule>
```

### Cross-References
```xml
<rule context="dmRef">
  <!-- Verify referenced DM exists in DMRL -->
  <assert test="...">
    Referenced DMC must be in DMRL
  </assert>
</rule>

<rule context="graphic">
  <!-- Verify ICN file exists -->
  <assert test="...">
    Referenced ICN must exist
  </assert>
</rule>
```

### Applicability
```xml
<rule context="applic">
  <!-- Verify applicability references ACT -->
  <assert test="...">
    Applicability must reference valid ACT entry
  </assert>
</rule>
```

## Usage

Run Schematron validation:

```bash
# Using Schematron validator
java -jar saxon.jar -s:DM.xml -xsl:schematron-compiled.xsl
```

## File Organization

- `s1000d-common.sch` — Common rules for all DMs
- `s1000d-descriptive.sch` — Rules for descriptive DMs
- `s1000d-procedural.sch` — Rules for procedural DMs
- `s1000d-fault.sch` — Rules for fault isolation
- `s1000d-ipd.sch` — Rules for IPD
- `project-specific.sch` — AMP360-specific rules

## Related

- [../xsd/](../xsd/) — Structural validation
- [../brex-tests/](../brex-tests/) — Custom business rules
- S1000D Issue 6.0, Chapter 7 (Quality Assurance)
