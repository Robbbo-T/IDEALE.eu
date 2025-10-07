# UTCS Records — Digital Mock-Up Simulations (53-10)

This directory contains **UTCS YAML records** for all Digital Mock-Up (DMU) simulation artifacts in the 53-10 Center Body zone.

## Overview

The UTCS (Universal Traceability and Certification System) records provide standardized metadata for DMU simulations, including clearance analyses, interference checks, tool access validation, and assembly path studies.

## Purpose

- **Simulation tracking** - Complete provenance of DMU studies and results
- **Traceability anchors** - UTCS-MI references linking simulations to assemblies
- **Clearance validation** - Document minimum clearances and interference results
- **Tool access verification** - Record tool reach and access constraints
- **Assembly sequencing** - Link DMU results to assembly sequences
- **Evidence chain** - Support CAV verification and DELs deliverables

## Naming Convention

UTCS YAML files follow the pattern: `ASM-AAA-ONB-DMU-{IDX}.yaml` where:
- `ASM` = Assembly simulation type
- `AAA` = Domain (Airframes, Aerodynamics, Airworthiness)
- `ONB` = On-board simulation context
- `DMU` = Digital Mock-Up
- `{IDX}` = 4-digit simulation index (e.g., 0053, 0054)

Example: `ASM-AAA-ONB-DMU-0053.yaml`

## YAML Schema

Each UTCS record includes:
- **schema_version** - UTCS Core version (1.0.0)
- **utcs_id** - Unique identifier following pattern `UTCS-MI:ASM:AAA:DMU:{IDX}:v{N}`
- **product** - Aircraft program (AMPEL360-AIR-T)
- **domain** - AAA domain
- **bridge** - Full TFA chain: `QS→FWD→UE→FE→CB→QB`
- **primary_path** - `CB→UE` (with FE orchestration)
- **provenance** - Owner and maintainer information
- **sheet** - File manifest with assembly/sub-assembly references
- **evidence** - Links to CAV, DELs, assembly sequences
- **integrity** - SHA256 hash for content verification

## TFA Context

Primary flow: **CB → UE** (Coordinated by FE)
- **CB** (Content & Build) generates DMU evidence
- **UE** (User Experience) validates clearances and access
- **FE** (Frontend Engineering) orchestrates the DMU workflow
- **QS** maintains baseline context
- **QB** optional for path optimization

## UTCS Anchor Format

All DMU anchors follow the format:
```
UTCS-MI:ASM:AAA:DMU:{IDX}:v{N}
```

Examples:
- `UTCS-MI:ASM:AAA:DMU:0053:v1` - Clearance/handling DMU
- `UTCS-MI:ASM:AAA:DMU:0054:v1` - Tool access validation
- `UTCS-MI:ASM:AAA:DMU:0055:v1` - Assembly path study

## Simulation Types

Common DMU simulation categories:
- **Clearance Analysis** - Minimum clearances between components
- **Interference Check** - Hard/soft interference detection
- **Tool Access** - Torque tool, fastener installation validation
- **Assembly Path** - Installation/removal path feasibility
- **Handling Study** - Crane/fixture clearance during assembly
- **Maintenance Access** - Service and inspection accessibility

## Integration Points

DMU UTCS records link to:
- **ASSY/** - Master assemblies and sub-assemblies being simulated
- **assembly-sequences/** - Operation sequences validated by DMU
- **../../CAV/** - Verification evidence and clearance reports
- **../../DELs/** - Certification deliverables requiring DMU proof
- **../../PAx/** - Packaging domain for handling/logistics

## CI/CD Validation

UTCS records are validated by `scripts/validate-utcs.py` to ensure:
- Schema compliance (v1.0.0)
- Valid UTCS ID format
- Referenced assembly files exist
- Evidence links are resolvable
- Content hash integrity
- Bridge and primary_path correctness

## Related Directories

- [`../`](../) - DMU simulation documentation and results
- [`../../assembly-sequences/`](../../assembly-sequences/) - Assembly operations
- [`../../../utcs/`](../../../utcs/) - CAD baseline UTCS records
- [`../../../../CAV/`](../../../../CAV/) - Verification evidence
- [`../../../../DELs/`](../../../../DELs/) - Certification deliverables

## References

See [Digital Mock-Up Sims README](../README.md) for simulation procedures and DMU result interpretation.
