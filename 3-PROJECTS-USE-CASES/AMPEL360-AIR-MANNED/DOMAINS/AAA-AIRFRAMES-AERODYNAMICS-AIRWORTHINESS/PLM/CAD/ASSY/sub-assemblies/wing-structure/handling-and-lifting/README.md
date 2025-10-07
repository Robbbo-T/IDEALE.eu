# Handling and Lifting Plans — Wing Structure

This directory contains handling and lifting documentation for wing structure sub-assemblies.

## Overview

Comprehensive plans for safe handling, lifting, and transportation of wing-box modules during manufacturing, storage, and final assembly. Includes fixture specifications, sling configurations, center of gravity data, and safety procedures.

## Naming Convention

Files follow the pattern: `HLP-ONB-WINGBOX-{IDX}.md` where:
- `HLP` = Handling and Lifting Plan
- `ONB` = Onboard zone (or `OUT` for outboard)
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `HLP-ONB-WINGBOX-001.md`

## Critical Information

Each handling plan must include:
- **Lifting fixture specification** - Type, capacity, UTCS reference
- **Mass (estimated and as-built)** - Total weight in kg
- **Center of gravity (CG)** - X, Y, Z coordinates from reference datum
- **Rigging configuration** - Sling types, angles, attachment points
- **Permissible orientations** - Safe handling positions and rotations
- **Exclusion zones** - Areas requiring protection or no-contact
- **Personal protective equipment (PPE)** - Required safety gear
- **Risk mitigation** - Specific hazards and protective measures

## Wing Structure Specific Considerations

- **Composite skin protection** - Prevent impact damage, use padded contact points
- **Spar deflection limits** - Maximum allowable bending during lift
- **Rib cutout clearances** - Maintain clearances for internal structure
- **Fuel tank integrity** - If integrated tanks, special handling procedures
- **Load distribution** - Ensure loads applied at hard points only

## TFA Context

Primary flow: **FE→CB**, ensuring safe handling procedures before module integration.

## UTCS Anchors

All handling plans must be referenced via UTCS-MI anchors:
- `UTCS-MI:SUB:HANDLE:WINGBOX-{IDX}:v1`
- Fixture references: `UTCS-MI:CAM:FIX:{FIXTURE-ID}:v{X}`

## Safety Requirements

All handling and lifting plans must be:
- Reviewed by CAI (Computer-Aided Integration) team
- Approved by Safety team
- Compliant with EASA CS-25 and workplace safety standards
- Validated through load testing when required
- Updated with as-built mass and CG data

## Related Files

- CAD Models - `../models/SA-AAA-WINGBOX-{IDX}.stp`
- Mass properties in UTCS - `../utcs/SA-AAA-WINGBOX-{IDX}.yaml`

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
