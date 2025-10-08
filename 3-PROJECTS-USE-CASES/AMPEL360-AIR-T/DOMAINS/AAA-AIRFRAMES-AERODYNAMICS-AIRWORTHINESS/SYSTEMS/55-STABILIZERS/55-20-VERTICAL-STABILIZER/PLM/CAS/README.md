# CAS/CSDB — S1000D authoring for 55-STABILIZERS/55-20

This directory contains Computer-Aided Service artifacts with S1000D CSDB structure.

**Domain**: AAA (Airframes, Aerodynamics, Airworthiness)  
**ATA Chapter**: 55  
**System**: 55-STABILIZERS  
**Sub-System**: 55-20

## Purpose

The CAS directory manages all aspects of Service procedures and maintenance planning using S1000D standards, ensuring proper documentation and traceability throughout the product lifecycle.

## S1000D CSDB Structure

### CSDB/DataModules/
- **COMMON-INFO/** — Warnings, standard notes, common materials
- **APPLICABILITY/ACT/** — Applicability cross-tables
- **MAINTENANCE/55-55-20/** — Scheduled tasks, fault isolation
- **REPAIR/55-55-20/** — Repair schemes, damage assessment
- **IPD/55-55-20/** — Illustrated parts data

### CSDB/Illustrations/ICN/
- **master/** — Master illustrations
- **renditions/** — Various renditions
- **hotspots/** — Interactive hotspots

### CSDB/PublicationModules/
Publication modules that reference Data Modules (AMM, SRM, IPD structures)

### CSDB/DMRL/
Data Module Requirements List (DMRL) for gated publishing

### CSDB/BREX/
Business Rules Exchange (BREX) for validation

## Validation Process

1. **XSD Validation** — Schema validation against S1000D XSD
2. **Schematron** — Business rules validation
3. **BREX** — Custom business rules exchange validation
4. **DMRL-gated publish** — Controlled publication process

## UTCS Integration

All artifacts must include UTCS anchors:
```
UTCS-MI:AAA:CAS:55-55-20:[ARTIFACT]:rev[X]
```

## Workflows

- **processes/** — BPMN/CMMN workflows, SOPs
- **inputs/** — UE hooks, failures, AOG, fleet data
- **WorkPackages/** — Task cards, checklists, schedules with mapping.json
- **Data/FLEET_IN_SERVICE/** — Service bulletins status, reliability series
- **ExchangePackages/** — Incoming/outgoing transmittals, manifests, checksums

## Outputs

- **PUBLISH/** — Published AMM, SRM, IPD documents
- **Baselines/** — Version baselines with UTCS snapshots

## Governance

Policies in `Governance/policies/`:
- acceptance.yaml
- publishing.yaml
- security.yaml
- controlled-language.yaml
- metadata.yaml

## Status

🚧 **Ready for S1000D Content** — CSDB structure established

## Related

- [PLM README](../README.md)
- [Sub-system README](../../README.md)
- [Domain README](../../../../README.md)

---

**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-10-08  
**S1000D Version**: Issue 6.0
