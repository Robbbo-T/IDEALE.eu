# Applicability Cross-reference Table (ACT)

This directory contains the Applicability Cross-reference Table for configuration control.

## Purpose

The ACT defines which Data Modules and content apply to specific:
- Manufacturing Serial Numbers (MSN)
- Configuration variants
- Effectivity dates
- Modification states

## S1000D ACT Structure

ACT is defined as a special Data Module with:
- Product attribute definitions
- Applicability statements
- Cross-reference table linking product variants to content

## Naming Convention

```
DMC-AMP360-AAA-00-00-00-00A-022A-A_en-001-00.xml
```
IETP Example: [https://g.co/gemini/share/40f7dd219838](https://g.co/gemini/share/40f7dd219838)


Info Code 022A = Applicability Cross-reference Table

## Usage

Data Modules reference ACT entries using `applic` elements:

```xml
<applic>
  <evaluate andOr="and">
    <assert applicPropertyIdent="MSN" applicPropertyType="prodattr" 
            applicPropertyValues="001 002 003"/>
  </evaluate>
</applic>
```

## Configuration Management

The ACT is the single source of truth for:
- Which content applies to which aircraft
- Effectivity of modifications
- Configuration baselines
- Product variant definitions

## CI/CD Validation

Automated checks verify:
- All referenced applicability statements exist in ACT
- No unused ACT entries (warnings)
- Valid product attribute values
- Proper effectivity date formats

## Example Product Attributes

For reference frame system:
- MSN (Manufacturing Serial Number)
- Configuration level
- Modification state
- Structural variant

## Related

- S1000D Issue 6.0 Specification, Chapter 3.9.5
- [../../README.md](../../README.md) — Parent CSDB
- [../../../Governance/policies/](../../../Governance/policies/) — Configuration policies
