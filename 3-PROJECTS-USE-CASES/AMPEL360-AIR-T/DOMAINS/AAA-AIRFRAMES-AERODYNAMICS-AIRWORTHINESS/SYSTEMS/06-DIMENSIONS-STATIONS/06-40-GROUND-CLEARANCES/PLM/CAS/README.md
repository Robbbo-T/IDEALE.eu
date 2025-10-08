# CAS — Service and Maintenance

This directory contains Service procedures and maintenance planning for this sub-zone.

## Purpose

The CAS directory manages all aspects of Service procedures and maintenance planning, ensuring proper documentation and traceability throughout the product lifecycle.

## Contents

Typical artifacts include:
- Service procedures and manuals
- Maintenance task cards
- Inspection procedures
- Repair schemes
- Service bulletins
- Maintenance planning documents

## Naming Convention

Files should follow the format:
```
CAS-[ATA]-[COMPONENT]-[TYPE]-[VERSION].[ext]
```

Example: `CAS-06-DATUM-DEFINITION-v1.pdf`

## UTCS Integration

All artifacts must include UTCS anchors:
```
UTCS-MI:CAS:AAA:06-XX:[ARTIFACT]:rev[X]
```

## Key Interfaces

- **DELs/** — Certification deliverables
- **Other PLM directories** — Cross-functional coordination
- **SUPPLIERS/** — Vendor data integration

## Status

🚧 **In Development** — Structure ready for artifact population

---

**Related**:
- [PLM README](../README.md) — PLM directory overview
- [Sub-zone README](../../README.md) — Sub-zone documentation

---

## S1000D CSDB Structure

This CAS directory now includes the standard S1000D CSDB structure for technical publication authoring and management.

Validate: XSD → Schematron → BREX; PMs reference DMCs; DMRL-gated publish.

**S1000D Version**: Issue 6.0  
**Structure Updated**: 2025-10-08
