# CAD — Computer-Aided Design

This directory contains 3D geometry modeling, assemblies, and technical drawings for this sub-zone.

## Purpose

The CAD directory manages all aspects of 3D geometry modeling, assemblies, and technical drawings, ensuring proper documentation and traceability throughout the product lifecycle.

## Contents

Typical artifacts include:
- Part models (.stp, .igs, .catpart)
- Assembly models (.asm, .catproduct)
- Technical drawings (.dwg, .pdf)
- Surface geometry definitions
- Interface control drawings
- Manufacturing drawings

## Naming Convention

Files should follow the format:
```
CAD-[ATA]-[COMPONENT]-[TYPE]-[VERSION].[ext]
```

Example: `CAD-06-DATUM-DEFINITION-v1.pdf`

## UTCS Integration

All artifacts must include UTCS anchors:
```
UTCS-MI:CAD:AAA:06-XX:[ARTIFACT]:rev[X]
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
