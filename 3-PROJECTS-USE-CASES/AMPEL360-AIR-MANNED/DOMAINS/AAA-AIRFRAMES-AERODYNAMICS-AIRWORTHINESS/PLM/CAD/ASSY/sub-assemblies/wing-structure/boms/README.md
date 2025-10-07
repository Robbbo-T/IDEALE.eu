# Bills of Materials — Wing Structure

This directory contains Bills of Materials for wing structure sub-assemblies.

## Overview

Detailed component lists for wing-box modules including spars, ribs, shear ties, composite panels, and fasteners. Each BOM defines all parts, materials, quantities, and supplier information required for a specific wing structure module.

## Naming Convention

Files follow the pattern: `SA-AAA-WINGBOX-{IDX}.csv` where:
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `SA-AAA-WINGBOX-001.csv`

## File Formats

BOMs are provided in CSV format for data exchange and automation:
- `.csv` - Comma-separated values (preferred)
- `.json` - JSON format (for structured data)
- `.md` - Markdown format (for human-readable documentation)

## BOM Structure

Each BOM CSV includes the following columns:
- `line` - Line item number (typically increments of 10)
- `part_number` - Unique part identifier
- `description` - Part description
- `qty` - Quantity per assembly
- `unit` - Unit of measure (ea, kg, m, etc.)
- `material` - Material specification (e.g., Al-Li 2195, Ti-6Al-4V, Carbon Composite)
- `finish` - Surface finish or coating (e.g., Alodine, Paint, Anodize)
- `notes` - Additional information
- `utcs_anchor` - UTCS reference for traceability

## Content Guidelines

Each BOM entry should include:
- Primary structure components (spars, ribs)
- Secondary structure (stiffeners, doublers)
- Fasteners and hardware
- Sealants and adhesives
- Material specifications per industry standards
- UTCS anchors for all components

## TFA Context

Primary flow: **QS→UE**, maintaining provenance of wing structure components.

## UTCS Anchors

All BOMs must be referenced via UTCS-MI anchors:
- `UTCS-MI:BOM:AAA:WINGBOX:{IDX}:v1`
- Component references: `UTCS-MI:CAD:AAA:PRT:{PART-ID}:revX`

## Configuration Management

All BOMs must be:
- Derived from CAD assembly structures
- Reviewed by AAA Integration Team
- Approved by Configuration Management
- Synchronized with engineering changes (ECRs)
- Updated with as-built configurations

## Related Files

- CAD Models - `../models/SA-AAA-WINGBOX-{IDX}.stp`
- UTCS Record - `../utcs/BOM-AAA-WINGBOX-{IDX}.yaml`
- Resolution Logs - `../resolution-logs/RESLOG-ONB-WINGBOX-{IDX}.md`

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
