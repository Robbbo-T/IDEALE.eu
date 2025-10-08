# Quick Start Guide: Adding New ATA Chapters to AMPEL360-AIR-T

This guide provides step-by-step instructions for implementing new ATA chapter systems in the AMPEL360-AIR-T project.

## Prerequisites

1. Identify the ATA chapter number (01-100)
2. Check [ata-chapters.csv](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv) for domain assignment
3. Understand if the domain uses ZONES/ (AAA only) or SYSTEMS/ (all others)

## Step-by-Step Process

### Step 1: Locate the Primary Domain

Find the domain directory in:
```
3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/[DOMAIN-NAME]/
```

Example domain directories:
- `AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/`
- `PPP-PROPULSION-FUEL-SYSTEMS/`
- `LCC-LINKAGES-CONTROL-COMMUNICATIONS/`
- `EDI-ELECTRONICS-DIGITAL-INSTRUMENTS/`
- etc.

### Step 2: Choose Organization Type

**For AAA domain (structural):**
```
AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/
└─ ZONES/
   └─ [ATA-CHAPTER-NAME]/
      └─ [SUB-ZONE]/  ← BEZ applied here
```

**For all other domains (functional):**
```
[DOMAIN]/
└─ SYSTEMS/
   └─ [ATA-CHAPTER-NAME]/  ← BEZ applied here
```

### Step 3: Create Directory Structure

#### For AAA (with sub-zones):
```bash
cd DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES

# Create zone and sub-zone
mkdir -p 52-DOORS/52-10-PASSENGER-DOORS

# Navigate to sub-zone
cd 52-DOORS/52-10-PASSENGER-DOORS
```

#### For other domains (direct system):
```bash
cd DOMAINS/PPP-PROPULSION-FUEL-SYSTEMS/SYSTEMS

# Create system directory
mkdir -p 28-FUEL-SYSTEMS

# Navigate to system
cd 28-FUEL-SYSTEMS
```

### Step 4: Create BEZ Structure

Run this command from within your sub-zone or system directory:

```bash
# Create all BEZ directories
mkdir -p DELs/{EASA-submissions,MoC-records,airworthiness-statements,data-packages,final-design-reports}
mkdir -p PAx/{ONB,OUT}
mkdir -p PLM/{CAD,CAE,CAI,CAM,CAO,CAP,CAS,CAV,CMP}
mkdir -p PROCUREMENT/VENDORSCOMPONENTS
mkdir -p QUANTUM_OA/{GA,LP,MILP,QAOA,QOX,QP,QUBO,SA}
mkdir -p SUPPLIERS/{BIDS,SERVICES}
mkdir -p policy tests

# Create placeholder files
echo '{\n  "name": "[REPLACE-WITH-NAME]",\n  "description": "[REPLACE-WITH-DESCRIPTION]",\n  "version": "0.1.0"\n}' > META.json
touch domain-config.yaml
```

### Step 5: Create README.md

Create a README.md file in your sub-zone/system directory using this template:

```markdown
# [ATA-NUMBER]-[SYSTEM-NAME] — [Full Title]

**ATA Chapter**: [NUMBER] ([Title])  
**Domain**: [DOMAIN-CODE] ([Domain Name])  
**Project**: AMPEL360-AIR-T

## Overview

Brief description of the system and its scope.

## Scope

List of key components and responsibilities.

## Directory Structure

[Paste BEZ directory tree here]

## Key Interfaces

### Structural Interfaces
- List connections to other structural systems

### Systems Interfaces
- List connections to other functional systems

## Compliance Requirements

### Certification Standards
- EASA CS-25 relevant sections
- Other applicable standards

### Analysis Requirements
- List required analyses

## TFA Flow

This system follows the canonical TFA flow:
**QS → FWD → UE → FE → CB → QB**

[Brief description of each component's role]

## UTCS Anchors

All artifacts must include UTCS anchors for traceability:
```
UTCS-MI:CAD:[DOMAIN]:[ATA]:[SYSTEM]:rev[X]
UTCS-MI:CAE:[DOMAIN]:[ATA]:[ANALYSIS]:rev[X]
UTCS-MI:DEL:[DOMAIN]:[ATA]:[CERT]:rev[X]
```

## Status

🚧 **In Development** — Structure defined, artifacts to be populated

## Related Documentation

- [ZONES/SYSTEMS README](../README.md)
- [Domain README](../../README.md)
- [ATA Chapter Assignment](../../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)

---

**Maintained by**: [Team Name]  
**Last Updated**: [Date]
```

### Step 6: Create PLM Subdirectory READMEs (Optional)

For key PLM directories, create README.md files:

```bash
# Example: CAD directory
cat > PLM/CAD/README.md << 'EOF'
# CAD — Computer-Aided Design

This directory contains geometric models and assemblies for [system name].

## Contents

- **ASSY/** — Assembly models
- **PRT/** — Part models
- **DRW/** — Technical drawings
- **SRF/** — Surface models

## Naming Convention

Files follow: `[ATA]-[PART]-[VERSION].[ext]`

Example: `28-FUEL-TANK-MAIN-v1.stp`

## UTCS Anchors

All CAD files must include UTCS metadata in companion YAML files.

---

**Status**: 🚧 In Development
EOF
```

### Step 7: Update Parent README

Update the parent ZONES/README.md or SYSTEMS/README.md to include your new chapter:

Add to the "Zones Defined" or "Systems Defined" section:

```markdown
### [ATA-NUMBER]-[SYSTEM-NAME]/
**ATA Chapter [NUMBER]** - [Title]

[Brief description]

Sub-zones/Systems:
- `[ATA-SUBSYSTEM]/` — [Description]
```

### Step 8: Commit Your Changes

```bash
cd /home/runner/work/IDEALE.eu/IDEALE.eu
git add .
git commit -m "Add ATA [NUMBER] - [System Name] structure"
git push
```

## Naming Conventions

### ATA Chapter Directory Names
Format: `[ATA-NUMBER]-[DESCRIPTIVE-NAME]/`

Examples:
- `28-FUEL-SYSTEMS/`
- `53-FUSELAGE-STRUCTURES/`
- `71-POWER-PLANT/`
- `24-ELECTRICAL-POWER/`

### Sub-Zone Names (AAA only)
Format: `[ATA-NUMBER]-[SUBSYSTEM-NUMBER]-[DESCRIPTIVE-NAME]/`

Examples:
- `53-10-CENTER-BODY/`
- `53-20-FORWARD-SECTION/`
- `57-10-BOX-SECTION/`

### Use uppercase with hyphens
- ✅ `28-FUEL-SYSTEMS/`
- ✅ `53-10-CENTER-BODY/`
- ❌ `28_fuel_systems/`
- ❌ `53-10-center-body/`

## Common Patterns

### Single-System Chapters
Most chapters map to a single system:
```
DOMAIN/SYSTEMS/[ATA-CHAPTER]/
└─ [BEZ structure]
```

### Multi-Component Chapters (AAA only)
Structural chapters may have multiple sub-zones:
```
AAA/ZONES/[ATA-CHAPTER]/
├─ [ATA]-10-[COMPONENT-A]/
│  └─ [BEZ structure]
├─ [ATA]-20-[COMPONENT-B]/
│  └─ [BEZ structure]
└─ [ATA]-30-[COMPONENT-C]/
   └─ [BEZ structure]
```

### Shared Chapters
Some chapters are shared between domains (e.g., ATA 54 - Nacelles/Pylons):
- Primary domain: PPP (propulsion responsibility)
- Secondary domain: AAA (structural interfaces)
- Implementation: Create in both domains with clear cross-references

## Validation Checklist

Before committing:

- [ ] Directory structure follows naming convention
- [ ] Complete BEZ structure created at lowest level
- [ ] README.md created with all required sections
- [ ] UTCS anchor format documented
- [ ] Parent README.md updated
- [ ] Cross-references to related systems documented
- [ ] TFA flow described
- [ ] Compliance requirements listed
- [ ] Status indicator added (🚧, ✅, etc.)

## Examples

### Example 1: Simple System (EEE Domain)
```bash
cd DOMAINS/EEE-ELECTRICAL-ENDOTRANSPONDERS-CIRCULATION/SYSTEMS
mkdir -p 33-LIGHTS
cd 33-LIGHTS
# [Create BEZ structure]
# [Create README.md]
```

### Example 2: Complex Zone (AAA Domain)
```bash
cd DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES
mkdir -p 55-STABILIZERS/55-10-HORIZONTAL-STABILIZER
mkdir -p 55-STABILIZERS/55-20-VERTICAL-STABILIZER
cd 55-STABILIZERS/55-10-HORIZONTAL-STABILIZER
# [Create BEZ structure]
# [Create README.md]
```

## Getting Help

If you have questions:

1. Check [ata-chapters.csv](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv) for domain assignment
2. Review [ATA-STRUCTURE-EXAMPLE.md](./ATA-STRUCTURE-EXAMPLE.md) for patterns
3. Look at existing implementations:
   - AAA: `53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/`
   - PPP: `71-POWER-PLANT/`
4. See [COMPLETE-DOMAIN-STRUCTURE.md](./COMPLETE-DOMAIN-STRUCTURE.md) for full reference

## References

- [ATA Chapters CSV](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)
- [ATA Chapters Documentation](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md)
- [Canonical Domains](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/domains.README.md)
- [Complete Domain Structure](./COMPLETE-DOMAIN-STRUCTURE.md)
- [ATA Structure Example](./ATA-STRUCTURE-EXAMPLE.md)

---

**Last Updated**: 2025-01-27  
**Maintained by**: IDEALE.eu Architecture Team
