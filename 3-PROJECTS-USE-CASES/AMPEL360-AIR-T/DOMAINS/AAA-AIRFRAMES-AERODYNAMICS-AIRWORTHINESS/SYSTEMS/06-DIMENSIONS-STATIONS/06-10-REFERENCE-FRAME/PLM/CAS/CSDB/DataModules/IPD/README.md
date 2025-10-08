# Illustrated Parts Data (IPD)

This directory contains Illustrated Parts Data modules for the reference frame system.

## Purpose

IPD modules provide:
- Parts catalogs with illustrations
- Part numbers and nomenclature
- Installation diagrams
- Assembly/disassembly sequences

## Content for 06-10 Reference Frame

Typical IPD content includes:
- Reference placards (part numbers, installation)
- Datum markers and measuring points
- Reference frame components
- Inspection tooling and fixtures

## Naming Convention

```
DMC-AMP360-AAA-06-10-00-00A-941A-A_en-001-00.xml
```

Info Code 941A = Illustrated Parts Data

## Structure

IPD DMs typically contain:
- `illustratedPartsCatalog` element
- `catalogSeqNumber` for each item
- `itemIdentData` with part numbers
- `refs` to ICN illustrations
- `functionalItemSpec` for item descriptions

## Related

- [../../Illustrations/ICN/](../../Illustrations/ICN/) — Parts illustrations
- [../../COMMON-INFO/](../../COMMON-INFO/) — Standard part descriptions
