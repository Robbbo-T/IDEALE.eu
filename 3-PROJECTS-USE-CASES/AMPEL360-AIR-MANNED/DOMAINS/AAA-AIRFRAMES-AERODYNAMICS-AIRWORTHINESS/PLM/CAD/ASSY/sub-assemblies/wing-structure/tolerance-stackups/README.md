# Tolerance Stack-up Analyses — Wing Structure

This directory contains tolerance stack-up reports and dimensional analyses for wing structure sub-assemblies.

## Overview

Sequential tolerance analyses for wing-box assemblies ensuring dimensional compliance of critical interfaces, spar alignment, rib positioning, and pylon mount locations. Includes statistical analyses and metrology correlation data.

## Naming Convention

Files follow the pattern: `TOL-ONB-WINGBOX-{IDX}.md` where:
- `TOL` = Tolerance stack-up
- `ONB` = Onboard zone (or `OUT` for outboard)
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `TOL-ONB-WINGBOX-001.md`

## Analysis Types

Wing structure tolerance analyses include:
- **Interface gap analyses** - Wing-to-body, wing-to-pylon clearances
- **Spar alignment** - Front and rear spar positioning
- **Rib station location** - Rib placement along span
- **Hole pattern tolerance** - Fastener hole positional accuracy
- **Contour tolerance** - Outer mold line (OML) profile accuracy

## Analysis Components

Each stack-up report should include:
- **Dimensional chain** - Path from datum to critical feature
- **Tolerance contributors** - Individual component tolerances
- **Statistical method** - Root Sum Square (RSS) or worst-case
- **Total stack-up** - Cumulative tolerance
- **Specification limits** - Allowable tolerance range
- **Pass/Fail assessment** - Compliance determination
- **Sensitivity analysis** - Key contributors to variation

## Wing Structure Critical Dimensions

Key dimensions requiring stack-up analysis:
- **Pylon interface location** - Critical for engine alignment
- **Wing root attachment** - Interface with center body
- **Control surface hinge points** - Aileron, flap, spoiler locations
- **Fuel tank closure** - Seal integrity requirements
- **Outer mold line (OML)** - Aerodynamic profile accuracy

## TFA Context

Primary flow: **CB→UE**, ensuring dimensional compliance before module release.

## UTCS Anchors

All tolerance analyses must be referenced via UTCS-MI anchors:
- `UTCS-MI:SUB:TSTACK:WINGBOX-{IDX}:v1`
- Metrology data: `UTCS-MI:CAE:METROLOGY:WINGBOX-{IDX}:v1`

## Analysis Methods

Standard approaches:
- **Worst-case** - Conservative approach for critical interfaces
- **Root Sum Square (RSS)** - Statistical approach for non-critical dimensions
- **Monte Carlo simulation** - For complex multi-dimensional analyses
- **As-built correlation** - Validation with actual measurements

## Quality Requirements

All tolerance stack-ups must be:
- Reviewed by CAE (Computer-Aided Engineering) team
- Approved by Metrology team
- Compliant with EASA CS-25 dimensional requirements
- Validated with as-built measurement data
- Updated when design changes occur

## Related Files

- ICD - `../icd/ICD-AAA-WINGBOX-{IDX}.md`
- CAD Models - `../models/SA-AAA-WINGBOX-{IDX}.stp`
- Resolution Logs - `../resolution-logs/RESLOG-ONB-WINGBOX-{IDX}.md` (if deviations occur)

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
