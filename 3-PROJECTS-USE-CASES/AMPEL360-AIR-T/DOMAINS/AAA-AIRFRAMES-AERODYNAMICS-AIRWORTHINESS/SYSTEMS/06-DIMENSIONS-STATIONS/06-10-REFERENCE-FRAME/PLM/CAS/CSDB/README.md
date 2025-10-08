# CSDB — Content Source Database

This directory contains the S1000D Content Source Database for ATA 06-10 REFERENCE FRAME.

## Purpose

The CSDB is the master repository for all technical content used to produce publications such as:
- Aircraft Maintenance Manual (AMM)
- Structural Repair Manual (SRM)
- Illustrated Parts Data (IPD)

## Directory Structure

### DataModules/
Contains all Data Modules organized by content type:

- **MAINTENANCE/06-10/** — Procedural, descriptive, and fault isolation DMs for reference frame systems
- **REPAIR/06-10/** — Repair schemes and damage assessment procedures
- **IPD/** — Illustrated parts data
- **COMMON-INFO/** — Common Information Repository (CIR) with reusable warnings, cautions, and notes
- **APPLICABILITY/ACT/** — Applicability Cross-reference Table for configuration control

### Illustrations/ICN/
Information Control Numbers (illustrations) with three levels:

- **master/** — Source files (SVG/CGM format)
- **renditions/** — Published versions (PDF/PNG/Web)
- **hotspots/** — Interactive overlay files

### PublicationModules/
Publication Module files that define the structure and content of published documents.

### DMRL/
Data Module Requirements List — master list of all required DMs for publications.

### BREX/
Business Rules Exchange — validation rules as a real DMC file.

## S1000D Compliance

All content follows S1000D Issue 6.0 standards:
- Data Module Codes (DMC) as filenames
- XML validation against XSD schemas
- Schematron business rule validation
- BREX custom rule validation
- Applicability (ACT) enforcement

## Related

- Parent: [../README.md](../README.md)
- Governance: [../Governance/](../Governance/)
- Schemas: [../schemas/](../schemas/)
