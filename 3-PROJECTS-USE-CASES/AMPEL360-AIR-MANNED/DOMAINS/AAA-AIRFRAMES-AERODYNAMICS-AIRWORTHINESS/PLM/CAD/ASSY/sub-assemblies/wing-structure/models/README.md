# CAD Models — Wing Structure

This directory contains CAD models and DMU (Digital Mock-Up) assembly files for wing structure sub-assemblies.

## Overview

STEP format models of wing-box internals, spars, ribs, and composite panels that form the primary structural elements of the wing system. These models serve as the master geometry for manufacturing, analysis, and integration.

## Naming Convention

Files follow the pattern: `SA-AAA-WINGBOX-{IDX}.stp` or zone-specific variants:
- `SA-AAA-WINGBOX-{IDX}-ONB.stp` for onboard/internal elements
- `SA-AAA-WINGBOX-{IDX}-OUT.stp` for outboard/external elements

Where `{IDX}` is a 3-digit serial number (e.g., 001, 002, 003).

Example: `SA-AAA-WINGBOX-001.stp`

## File Formats

- `.stp`, `.step` - STEP AP242 format (ISO 10303-242) for neutral CAD exchange
- `.catpart`, `.catproduct` - CATIA V5 native format
- `.prt`, `.asm` - NX native format

## Contents

Each model file represents:
- Complete sub-assembly geometry
- Interface surfaces and datum features
- Fastener hole patterns
- Tooling reference points
- Mass properties embedded metadata

**Note**: A `.gitkeep` file is present to maintain this directory in version control when no model files are present.

## Model Requirements

All CAD models must be:
- Validated for geometric continuity and closure
- Contain embedded product metadata (part number, revision, material)
- Referenced in corresponding UTCS records
- Accompanied by interface control definitions (ICD)
- Compliant with AAA domain modeling standards

## TFA Context

Primary flow: **FE→CB**, establishing geometric baseline before manufacturing.

## UTCS Anchors

All models must be referenced via UTCS-MI anchors, for example:
- `UTCS-MI:CAD:AAA:ASSY:WINGBOX-{IDX}:revX`
- `UTCS-MI:CAD:AAA:PRT:{PART-ID}:revX`

## Related Files

Each CAD model should have associated:
- BOM (Bill of Materials) - `../boms/SA-AAA-WINGBOX-{IDX}.csv`
- ICD (Interface Control) - `../icd/ICD-AAA-WINGBOX-{IDX}.md`
- Handling Plan - `../handling-and-lifting/HLP-ONB-WINGBOX-{IDX}.md`
- UTCS Record - `../utcs/SA-AAA-WINGBOX-{IDX}.yaml`

## Version Control

- All models are configuration-controlled
- Revisions tracked through UTCS system
- Engineering changes documented in `../resolution-logs/`

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
