# Fastener Schedules — Wing Structure

This directory contains fastener installation schedules, torque specifications, and tightening sequences for wing structure sub-assemblies.

## Overview

Detailed fastener installation procedures for wing-box joints including spar-to-rib connections, skin attachment, and panel fastening. Specifies fastener types, installation sequences, torque values, and quality inspection requirements.

## Naming Convention

Files follow the pattern: `FAST-ONB-WINGBOX-{IDX}.csv` where:
- `FAST` = Fastener schedule
- `ONB` = Onboard zone (or `OUT` for outboard)
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)

Example: `FAST-ONB-WINGBOX-001.csv`

## Schedule Structure

Each fastener schedule CSV includes:
- `step_id` - Installation step identifier
- `pattern` - Pattern designation (A, B, C, etc.)
- `location` - Physical location description
- `fastener_code` - Fastener part number (e.g., NAS6204, BACB30)
- `qty` - Quantity of fasteners
- `torque_Nm` - Torque specification in Newton-meters
- `sequence_order` - Installation order (e.g., 1-4, 5-20)
- `note` - Special instructions or requirements

## Fastener Types

Common fasteners in wing structure:
- **NAS6204 series** - Hi-Lok structural fasteners
- **BACB30 series** - Aerospace bolts
- **MS20470 series** - Rivets for secondary structure
- **Custom fasteners** - Special application fasteners

## Installation Sequences

Typical installation order:
1. **PRETACK** - Corner tacks to stabilize alignment
2. **PRIMARY ROWS** - Main fastener rows (alternate sides to control stress)
3. **SECONDARY ROWS** - Additional fastening patterns
4. **VERIFICATION** - Gauge checks, gap measurements, torque verification

## Wing Structure Specific Requirements

- **Load path awareness** - Install fasteners along primary load paths first
- **Spar flange tightening** - Use star pattern to avoid distortion
- **Composite-to-metal joints** - Special torque limits to prevent crushing
- **Fuel seal integrity** - Wet installation procedures for sealed areas
- **Interference fit fasteners** - Cold working and installation procedures

## TFA Context

Primary flow: **FE→CB**, validating fastener specifications before assembly operations.

## UTCS Anchors

All fastener schedules must be referenced via UTCS-MI anchors:
- `UTCS-MI:SUB:FASTENER:WINGBOX-{IDX}:v1`
- Fastener standards: `UTCS-MI:STD:FAST:{FASTENER-TYPE}:v1`

## Quality Requirements

All fastener schedules must be:
- Reviewed by CAM (Computer-Aided Manufacturing) team
- Approved by QIP (Quality Inspection Plan) team
- Compliant with EASA CS-25 manufacturing standards
- Validated through assembly trials
- Include inspection hold points

## Template Files

- **`fastener-schedule-wing-structure.csv`** - Generic fastener schedule template with columns for Joint ID, Location/Station, Component A/B, Fastener Spec, Diameter, Grip/Length, Washer(s), Nut/Collar, Hole Class, Fit, Sealant/Adhesive, Torque, Torque Tolerance, Ref Drawing, and Notes. Use this as a starting point for new wing structure fastener schedules.

## Related Files

- ICD - `../icd/ICD-AAA-WINGBOX-{IDX}.md`
- BOM - `../boms/SA-AAA-WINGBOX-{IDX}.csv`
- Tolerance Stack-ups - `../tolerance-stackups/TOL-ONB-WINGBOX-{IDX}.md`

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
