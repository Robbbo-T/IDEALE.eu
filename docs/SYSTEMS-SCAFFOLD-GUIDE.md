# SYSTEMS Scaffold Guide — S1000D CAS/CSDB

This guide explains how to use the `scaffold-systems-cas.sh` script to create standardized SYSTEMS structures with S1000D Issue 6.0 compliant technical publication infrastructure.

## Overview

The SYSTEMS scaffold creates a complete, TFA-V2/UTCS-aligned system structure with embedded S1000D Common Source Database (CSDB) for technical publications and maintenance documentation.

### What Gets Created

For each system, the scaffold generates:

1. **System-level structure** with README and META.json
2. **Subsystem directories** for each specified subsystem
3. **Standard directories** (DELs, PLM, QUANTUM_OA, PROCUREMENT, SUPPLIERS, policy, tests)
4. **Complete PLM tree** (CAD, CAE, CAO, CAM, CAI, CAV, CAS, CMP, CAP)
5. **S1000D CAS/CSDB** with all required subdirectories and stub files

## Quick Start

### Basic Usage

```bash
cd /path/to/IDEALE.eu
./scripts/scaffold-systems-cas.sh DOMAIN SYS NAME ATA SUBSYSTEM1 SUBSYSTEM2 ...
```

### Example: Airport Parking & Mooring System

```bash
./scripts/scaffold-systems-cas.sh AAP 10-PARKING-MOORING PARKING-MOORING 10 \
  "00-GENERAL" "10-PARKING" "20-MOORING" "30-STORAGE" "40-RETURN-TO-SERVICE"
```

This creates:
```
3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAP-AIRPORT-ADAPTABLE-PLATFORMS/SYSTEMS/
└── 10-PARKING-MOORING/
    ├── README.md
    ├── META.json
    ├── 00-GENERAL/
    ├── 10-PARKING/
    ├── 20-MOORING/
    ├── 30-STORAGE/
    └── 40-RETURN-TO-SERVICE/
```

## Parameters Explained

| Parameter | Description | Example |
|-----------|-------------|---------|
| `DOMAIN` | Three-letter domain code | `AAP`, `AAA`, `PPP`, `LCC` |
| `SYS` | System identifier (ATA-NAME format) | `10-PARKING-MOORING` |
| `NAME` | Human-readable system name | `PARKING-MOORING` |
| `ATA` | ATA chapter number | `10`, `27`, `54` |
| `SUBSYSTEM1...N` | List of subsystems | `"00-GENERAL" "10-PARKING"` |

### Domain Codes

Common domain codes in AMPEL360-AIR-T:

- `AAA` — Airframes, Aerodynamics, Airworthiness
- `AAP` — Airport Adaptable Platforms
- `PPP` — Propulsion, Power, Fuel Systems
- `LCC` — Linkages, Control, Communications
- `IIS` — Information & Intelligence Systems
- `CCC` — Cockpit, Cabin, Cargo
- `DDD` — Drainage, Dehumidification, Drying
- `EEE` — Electrical, Endotransponders, Circulation
- `EDI` — Electronics, Digital, Instruments
- `EER` — Environmental, Emissions, Remediation
- `MEC` — Mechanical Systems & Modules
- `CQH` — Cryogenics, Quantum, H2

### Subsystem Naming

Subsystems follow the pattern: `{NN}-{NAME}`

- `00-GENERAL` — System-level governance and common items
- `10-{NAME}` — First subsystem
- `20-{NAME}` — Second subsystem
- etc.

**Example subsystems for ATA 10 (Parking & Mooring)**:
- `00-GENERAL` — General parking/mooring governance
- `10-PARKING` — Ground parking procedures
- `20-MOORING` — Aircraft mooring operations
- `30-STORAGE` — Long-term storage
- `40-RETURN-TO-SERVICE` — Return to service procedures

## Structure Created

### Subsystem Structure

Each subsystem gets:

```
{NN}-{SUBNAME}/
├── README.md                      # Subsystem overview with UTCS anchors
├── META.json                      # Subsystem metadata
├── utcs.json                      # UTCS threading configuration
├── DELs/                          # Design Evidence Lists
├── policy/                        # Subsystem-specific policies
├── tests/                         # Test data and validation
├── PLM/
│   ├── CAD/                       # Computer-Aided Design
│   ├── CAE/                       # Computer-Aided Engineering
│   ├── CAO/                       # Computer-Aided Optimization
│   ├── CAM/                       # Computer-Aided Manufacturing
│   ├── CAI/                       # Computer-Aided Integration
│   ├── CAV/                       # Computer-Aided Verification
│   ├── CAS/                       # Computer-Aided Service (S1000D CSDB)
│   ├── CMP/                       # Computer-Aided Management/Program
│   └── CAP/                       # Computer-Aided Processes
├── QUANTUM_OA/
│   ├── GA/                        # Genetic Algorithms
│   ├── LP/                        # Linear Programming
│   ├── MILP/                      # Mixed-Integer Linear Programming
│   ├── QP/                        # Quadratic Programming
│   ├── QUBO/                      # Quadratic Unconstrained Binary Optimization
│   ├── QAOA/                      # Quantum Approximate Optimization Algorithm
│   ├── QOX/                       # Quantum Optimization Experimental
│   └── SA/                        # Simulated Annealing
├── PROCUREMENT/
│   └── VENDORSCOMPONENTS/         # Vendor evaluation and sourcing
└── SUPPLIERS/
    ├── BIDS/                      # Supplier bids and proposals
    └── SERVICES/                  # Service agreements
```

### S1000D CAS/CSDB Structure

Inside each `PLM/CAS/` directory:

```
PLM/CAS/
├── README.md                      # CAS overview and usage guide
├── META.mapping.json              # SYSTEMS ↔ ATA mapping
├── processes/                     # BPMN/CMMN workflows, SOPs
├── inputs/                        # UE hooks, failures, AOG, fleet data
├── CSDB/                          # Common Source Database
│   ├── DataModules/               # Technical content (DMCs)
│   │   ├── COMMON-INFO/           # Warnings, notes, materials
│   │   │   ├── warnings/
│   │   │   ├── standard-notes/
│   │   │   └── common-materials/
│   │   ├── APPLICABILITY/ACT/     # Applicability Cross-reference Table
│   │   ├── MAINTENANCE/{ATA}-{SNS}/
│   │   │   ├── scheduled-tasks/
│   │   │   └── fault-isolation/
│   │   ├── REPAIR/{ATA}-{SNS}/
│   │   │   ├── repair-schemes/
│   │   │   └── damage-assessment/
│   │   └── IPD/{ATA}-{SNS}/       # Illustrated Parts Data
│   │       └── illustrated-parts-data/
│   ├── Illustrations/ICN/         # Information Control Numbers
│   │   ├── master/                # Master illustrations
│   │   ├── renditions/            # Different output formats
│   │   └── hotspots/              # Interactive hotspot definitions
│   ├── PublicationModules/        # Publication structures (PMs)
│   │   ├── PM-{PROD}-AMM-{ATA}-STRUCT.xml
│   │   ├── PM-{PROD}-AMM-{ATA}-{SNS}-001.xml
│   │   ├── PM-{PROD}-SRM-{ATA}-STRUCT.xml
│   │   └── PM-{PROD}-IPD-{ATA}-{SNS}-001.xml
│   ├── DMRL/                      # Data Module Requirements List
│   │   └── dmrl.xml
│   └── BREX/                      # Business Rules Exchange
│       └── DMC-{PROD}-{DOMAIN}-00-00-00-00A-000A-A_{LANG}_001-00.xml
├── WorkPackages/                  # Task cards and schedules
│   ├── task-cards/
│   ├── checklists/
│   ├── schedules/
│   └── mapping.json
├── Data/FLEET_IN_SERVICE/         # Fleet data
│   ├── service-bulletins-status/
│   └── reliability-series/
├── ExchangePackages/              # Import/export packages
│   ├── incoming/
│   └── outgoing/
│       ├── transmittals/
│       ├── manifests/
│       └── checksums/
├── Outputs/                       # Published outputs
│   ├── PUBLISH/
│   │   ├── AMM-Published/         # Aircraft Maintenance Manual
│   │   ├── SRM-Published/         # Structural Repair Manual
│   │   └── IPD-Published/         # Illustrated Parts Data
│   └── Baselines/                 # Date-stamped releases
├── schemas/                       # Validation schemas
│   ├── s1000d/
│   │   ├── xsd/                   # XML Schema Definitions
│   │   ├── schematron/            # Schematron validation rules
│   │   ├── brex-tests/            # BREX test suites
│   │   └── codelists/             # S1000D code lists
│   └── utcs/
│       └── utcs.schema.json       # UTCS schema integration
├── Governance/policies/           # Governance policies
│   ├── metadata.yaml              # Metadata requirements
│   ├── acceptance.yaml            # Acceptance criteria
│   ├── publishing.yaml            # Publishing rules
│   ├── security.yaml              # Security classification
│   └── controlled-language.yaml   # STE policy
└── utcs/                          # UTCS integration
    └── index.json                 # UTCS pattern definitions
```

## Files Created

### Stub Files

The scaffold creates placeholder files for key S1000D artifacts:

1. **DMRL** (`CSDB/DMRL/dmrl.xml`) — Data Module Requirements List placeholder
2. **Publication Modules** — PM templates for AMM, SRM, IPD
3. **BREX** — Business Rules Exchange template
4. **WorkPackages mapping** (`WorkPackages/mapping.json`)
5. **META.mapping.json** — SYSTEMS ↔ ATA mapping
6. **Governance policies** — 5 YAML policy files
7. **UTCS index** (`utcs/index.json`)
8. **UTCS schema** (`schemas/utcs/utcs.schema.json`)

### README Files

- System-level README with overview and subsystem list
- Subsystem README for each subsystem
- CAS/CSDB README for each subsystem

### Metadata Files

- System META.json with system metadata
- Subsystem META.json for each subsystem
- Subsystem utcs.json for each subsystem
- CAS META.mapping.json for each subsystem

## UTCS Integration

The scaffold embeds UTCS anchors throughout:

### System Level
```
UTCS-MI:{DOMAIN}:SYS:{SYS}:{artifact}:rev[X]
```

Example: `UTCS-MI:AAP:SYS:10-PARKING-MOORING:README:rev[A]`

### Subsystem Level
```
UTCS-MI:{DOMAIN}:SYS:{SYS}:{SNS}:{artifact}:rev[X]
```

Example: `UTCS-MI:AAP:SYS:10-PARKING-MOORING:10-PARKING:README:rev[A]`

### CAS/CSDB Artifacts
```
UTCS-MI:{DOMAIN}:CAS:{ATA}-{SNS}:{artifact}:rev[X]
```

Example: `UTCS-MI:AAP:CAS:10-10:DMC-MAINTENANCE:rev[A]`

## S1000D Workflow

Once the structure is scaffolded, follow this workflow:

### 1. Create Data Modules

Author technical content in `CSDB/DataModules/`:

```bash
CSDB/DataModules/MAINTENANCE/10-10-PARKING/scheduled-tasks/
└── DMC-AMP360-AAP-10-10-00-00A-040A-A_en-US_001-00.xml
```

### 2. Add Illustrations

Place graphics in `CSDB/Illustrations/ICN/master/`:

```bash
CSDB/Illustrations/ICN/master/
└── ICN-AMP360-AAP-10-10-00001-001-01.png
```

### 3. Update DMRL

Add data module references to `CSDB/DMRL/dmrl.xml`.

### 4. Configure Publication Modules

Edit PMs in `CSDB/PublicationModules/` to reference data modules.

### 5. Validate

Run validation pipeline:
1. XSD validation
2. Schematron validation
3. BREX validation
4. DMRL completeness check

### 6. Publish

Generate outputs in `Outputs/PUBLISH/{AMM,SRM,IPD}-Published/`.

### 7. Baseline

Archive releases in `Outputs/Baselines/{YYYY-MM-DD}_AMM{ATA}-{SNS}/`.

## Examples by Domain

### Example 1: Propulsion System (PPP)

```bash
./scripts/scaffold-systems-cas.sh PPP 71-POWER-PLANT POWER-PLANT 71 \
  "00-GENERAL" "10-ENGINE" "20-COWLING" "30-INSTRUMENTATION" "40-FIRE-DETECTION"
```

Creates propulsion system with ATA 71 mapping.

### Example 2: Flight Controls (LCC)

```bash
./scripts/scaffold-systems-cas.sh LCC 27-FLIGHT-CONTROLS FLIGHT-CONTROLS 27 \
  "00-GENERAL" "10-AILERON" "20-RUDDER" "30-ELEVATOR" "40-TRIM"
```

Creates flight control system with ATA 27 mapping.

### Example 3: Electrical System (EEE)

```bash
./scripts/scaffold-systems-cas.sh EEE 24-ELECTRICAL-POWER ELECTRICAL-POWER 24 \
  "00-GENERAL" "10-GENERATOR" "20-DISTRIBUTION" "30-PROTECTION" "40-STORAGE"
```

Creates electrical system with ATA 24 mapping.

## Best Practices

### 1. Plan Before Scaffolding

- Define complete subsystem list before running
- Align with ATA iSpec 2200 chapters where applicable
- Consider maintenance task breakdown

### 2. Customize After Scaffolding

- Review and update README files
- Configure governance policies for your organization
- Add project-specific BREX rules
- Populate DMRL with actual requirements

### 3. Follow S1000D Standards

- Use proper DMC codes
- Validate against S1000D Issue 6.0 XSD
- Follow Simplified Technical English (STE)
- Maintain illustration quality standards

### 4. Integrate with Existing Systems

- Link to existing PLM systems
- Connect to MRO platforms
- Interface with ERP for parts data
- Feed reliability data from operations

### 5. Version Control

- Use Git for CSDB version control
- Tag baselines appropriately
- Document publication releases
- Maintain change history

## Troubleshooting

### Issue: Permission Denied

```bash
chmod +x scripts/scaffold-systems-cas.sh
```

### Issue: Directory Already Exists

The script will fail if the target directory exists. Either:
1. Choose a different system name
2. Remove existing directory
3. Manually merge structures

### Issue: Invalid Subsystem Format

Subsystems must follow `{NN}-{NAME}` format with leading zeros.

✅ Good: `00-GENERAL`, `10-PARKING`  
❌ Bad: `0-GENERAL`, `10PARKING`

## Related Documentation

- [S1000D Specification](http://www.s1000d.org/) — International specification
- [ATA iSpec 2200](https://www.ataelearnportal.com/) — Air Transport Association chapters
- [UTCS Standard](../standards/IDEALE-STD-0001-UTCS.md) — UTCS specification
- [Scripts README](../scripts/README.md) — All available scripts

---

**Need Help?**

- Open an issue on GitHub
- Consult the [CONTRIBUTING guide](../CONTRIBUTING.md)
- Review existing SYSTEMS structures in the repository

---

**Maintained by**: IDEALE.eu Community  
**Last Updated**: 2025-01-27
