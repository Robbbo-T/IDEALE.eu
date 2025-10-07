# Interface Control Definitions — Wing Structure

This directory contains Interface Control Definitions for wing structure sub-assemblies.

## Overview

Defines mating conditions, fastener patterns, tolerances, and datum schemes for wing-box interfaces with center body, pylon mounts, and outboard wing sections. These specifications govern how wing structure modules connect to the main airframe.

## Naming Convention

Files follow the pattern: `ICD-AAA-WINGBOX-{IDX}.md` where:
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `ICD-AAA-WINGBOX-001.md`

## Interface Types

Wing structure interfaces include:
- **Center body joints** - Main wing-to-fuselage attachment
- **Pylon mounts** - Engine pylon attachment points
- **Outboard sections** - Wing segment-to-segment joints
- **Control surface hinges** - Movable surface attachment
- **Systems penetrations** - Fuel, hydraulics, electrical routing

## Contents

Each ICD document should specify:
- Interface geometry and surface definitions
- Datum reference frames (DRF)
- Fastener hole patterns and locations
- Bolt type, size, and material specifications
- Interface tolerance requirements (positional, angular)
- Allowable gaps and clearances
- Shim allowances
- Seal and gasket specifications
- Electrical bonding requirements
- Interface test and verification procedures

## TFA Context

Primary flow: **FE→CB**, coordinating wing structure interfaces with mating components.

## UTCS Anchors

All ICDs must be referenced via UTCS-MI anchors:
- `UTCS-MI:ICD:AAA:WINGBOX:{IDX}:v1`
- Related CAD: `UTCS-MI:CAD:AAA:ASSY:WINGBOX-{IDX}:revX`

## Interface Coordination

ICDs must be cross-referenced with:
- Mating component ICDs (center body, pylons)
- Fastener schedules (`../fastener-schedules/`)
- Tolerance stack-ups (`../tolerance-stackups/`)
- Assembly sequences
- Digital mock-up (DMU) verification

## Quality Requirements

All ICDs must be:
- Reviewed by AAA Integration Lead
- Approved by CAI (Computer-Aided Integration) Lead
- Validated through assembly trials or DMU
- Updated with as-built deviations
- Verified against clearance requirements

## Template Files

- **`wing-structure-ICD-template.md`** - Generic ICD template covering Referenced Documents, Coordinate Systems & Datums, Mechanical Interfaces, Systems Interfaces, Tolerances & Assembly Clearances, Environment & Loads, Verification, and Change Control. Use this as a starting point for new wing structure ICDs.

## Related Files

- CAD Models - `../models/SA-AAA-WINGBOX-{IDX}.stp`
- Fastener Schedules - `../fastener-schedules/FAST-ONB-WINGBOX-{IDX}.csv`
- Tolerance Stack-ups - `../tolerance-stackups/TOL-ONB-WINGBOX-{IDX}.md`
- UTCS Record - `../utcs/ICD-AAA-WINGBOX-{IDX}.yaml`

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
