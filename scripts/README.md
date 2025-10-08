# IDEALE.eu Scripts

This directory contains utility scripts for repository management, scaffolding, validation, and automation.

## Available Scripts

### Scaffolding

#### `scaffold-systems-cas.sh`

Creates a complete SYSTEMS tree structure with TFA-V2/UTCS alignment and S1000D Issue 6.0 compliant CAS/CSDB subtrees.

**Purpose**: Generate standard SYSTEMS skeleton under `3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/{DOMAIN}/SYSTEMS/` with comprehensive S1000D-compliant technical publication infrastructure.

**Usage**:
```bash
./scaffold-systems-cas.sh [DOMAIN] [SYS] [NAME] [ATA] [SNS_LIST...]
```

**Parameters**:
- `DOMAIN` — Domain code (e.g., AAA, AAP, PPP, LCC, IIS)
- `SYS` — System number and name (e.g., 10-PARKING-MOORING)
- `NAME` — System name (e.g., PARKING-MOORING)
- `ATA` — ATA chapter for CAS data modules (e.g., 10)
- `SNS_LIST` — Space-separated list of subsystems (e.g., "00-GENERAL 10-PARKING 20-MOORING")

**Example**:
```bash
# Create a parking/mooring system with 5 subsystems
./scaffold-systems-cas.sh AAP 10-PARKING-MOORING PARKING-MOORING 10 \
  "00-GENERAL" "10-PARKING" "20-MOORING" "30-STORAGE" "40-RETURN-TO-SERVICE"
```

**What it creates**:
- Complete subsystem structure with DELs, PLM, QUANTUM_OA, PROCUREMENT, SUPPLIERS, policy, tests
- PLM directories: CAD, CAE, CAO, CAM, CAI, CAV, CAS, CMP, CAP
- S1000D CAS/CSDB with:
  - DataModules (COMMON-INFO, APPLICABILITY, MAINTENANCE, REPAIR, IPD)
  - Illustrations/ICN (master, renditions, hotspots)
  - PublicationModules (AMM, SRM, IPD)
  - DMRL, BREX
  - WorkPackages, Data/FLEET_IN_SERVICE, ExchangePackages
  - Outputs (PUBLISH, Baselines)
  - Schemas (s1000d, utcs)
  - Governance policies
- README files with UTCS anchors
- META.json and utcs.json files

**Standards compliance**:
- TFA-V2 (Threading Flow Architecture V2)
- UTCS (UiX Threading Context/Content/Cache and Structure/Style/Sheet)
- S1000D Issue 6.0 (International specification for technical publications)
- ATA iSpec 2200 (Air Transport Association chapters)

---

#### `scaffold-ata54.sh`

Scaffolds ATA Chapter 54 (Nacelles/Pylons) structure.

**Usage**:
```bash
./scaffold-ata54.sh
```

---

#### `seed_wing_structure.sh`

Seeds wing structure artifacts for airframe domains.

**Usage**:
```bash
./seed_wing_structure.sh
```

---

### Validation

#### `validate-utcs.py`

Validates UTCS YAML files against the UTCS Core schema and performs integrity checks.

**Usage**:
```bash
./validate-utcs.py [root_directory]
```

**What it validates**:
- JSON Schema compliance
- UTCS ID format
- Bridge sequence (QS→FWD→UE→FE→CB→QB)
- Content hash integrity
- File references
- Evidence links

---

#### `validate_readme_links.py`

Validates links in README files across the repository.

**Usage**:
```bash
./validate_readme_links.py
```

---

### Royalties & Metadata

#### `accrue_royalty.py`

Accrues royalties for artifacts based on the meta-royalties system.

**Usage**:
```bash
./accrue_royalty.py [options]
```

See [README-ROYALTIES.md](../README-ROYALTIES.md) for details on the royalties system.

---

#### `update-utcs-hash.py`

Updates content hashes in UTCS files.

**Usage**:
```bash
./update-utcs-hash.py [file_or_directory]
```

---

## Script Development Guidelines

When adding new scripts to this directory:

1. **Make scripts executable**: `chmod +x script-name.sh`
2. **Add shebang**: Start with `#!/usr/bin/env bash` or `#!/usr/bin/env python3`
3. **Use strict mode**: For bash scripts, use `set -euo pipefail`
4. **Document**: Add usage information in comments and to this README
5. **Test**: Test in `/tmp` before running on actual repository data
6. **Follow conventions**: Use existing scripts as templates

---

## Related Documentation

- [UTCS Standard](../standards/IDEALE-STD-0001-UTCS.md) — UTCS specification
- [Meta-Royalties System](../README-ROYALTIES.md) — Royalties documentation
- [Contributing Guide](../CONTRIBUTING.md) — How to contribute

---

**Maintained by**: IDEALE.eu Community  
**Last Updated**: 2025-01-27
