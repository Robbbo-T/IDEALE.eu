# S1000D Code Lists

This directory contains S1000D code list definitions.

## Purpose

Code lists define allowed values for enumerated attributes in S1000D:
- Security classifications
- Information codes
- Language codes
- Quality assurance types
- Issue types
- And many more...

## Standard Code Lists

From S1000D Issue 6.0 specification:

### Security Classifications
- `01` — Unclassified
- `02` — Restricted
- `03` — Confidential
- `04` — Secret
- `05` — Top Secret

### Info Codes (Sample)
- `000A` — Procedure
- `00GA` — Description
- `022A` — Applicability Cross-reference Table
- `00UA` — Common Information Repository
- `04DA` — Fault Isolation
- `520A` — Repair
- `941A` — Illustrated Parts Data
- `014A` — DMRL
- `BREX` — Business Rules Exchange

### Verification Types
- `tabtop` — Table Top
- `onobject` — On Object
- `ttandoo` — Table Top and On Object

### Issue Types
- `new` — New issue
- `changed` — Changed
- `deleted` — Deleted
- `rinstate-changed` — Reinstated with changes
- `rinstate-status` — Reinstated, status only
- `revised` — Revised

### Info Code Variants
- `A` — Standard variant
- `B`, `C`, `D`... — Alternate variants

### Language Codes (ISO 639-1)
- `en` — English
- `de` — German
- `fr` — French
- `es` — Spanish
- `ja` — Japanese

### Country Codes (ISO 3166-1)
- `US` — United States
- `GB` — United Kingdom
- `DE` — Germany
- `FR` — France
- `ES` — Spain
- `JP` — Japan

## File Format

Code lists can be XML or JSON:

```xml
<codeList>
  <code value="01">
    <description>Unclassified</description>
  </code>
  <code value="02">
    <description>Restricted</description>
  </code>
</codeList>
```

## Usage

Code lists are referenced during:
- XSD validation
- Schematron validation
- BREX validation
- Authoring tool pick-lists

## Custom Code Lists

Project-specific extensions:
- Enterprise codes
- Product model codes
- Custom info code variants
- Organization-specific classifications

## Related

- S1000D Issue 6.0 Specification, Appendices
- [../xsd/](../xsd/) — Schema definitions using code lists
- [../../Governance/policies/](../../Governance/policies/) — Policy enforcement
