# PAx/ONB — Onboard Systems Integration

This directory contains packaging and integration artifacts for **onboard systems** within this sub-zone.

## Purpose

The ONB (Onboard) directory manages integration of systems and components that are installed within the aircraft's internal structure, including:
- Internal systems packaging designs
- Onboard equipment installation plans
- Internal wiring and harness routing
- Avionics and systems integration
- Internal access and maintenance provisions

## Contents

Typical artifacts include:
- Packaging layout drawings
- Installation interface specifications
- Weight and balance data
- Integration test procedures
- Installation clearance analyses
- Internal systems coordination documents

## Naming Convention

Files should follow the format:
```
PAx-ONB-[SYSTEM]-[TYPE]-[VERSION].[ext]
```

Example: `PAx-ONB-AVIONICS-LAYOUT-v1.pdf`

## Key Interfaces

- **PLM/CAD/** — 3D models and assemblies
- **PLM/CAI/** — Integration coordination
- **SUPPLIERS/** — Vendor-supplied equipment specifications

## Traceability

All artifacts must include UTCS anchors for configuration management and traceability.

## Status

🚧 **In Development** — Structure ready for artifact population

---

**Related**:
- [PAx/OUT/](../OUT/) — External systems integration
- [PLM/CAI/](../../PLM/CAI/) — Integration planning
