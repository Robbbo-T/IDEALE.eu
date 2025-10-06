# IDEALE.eu Canonical Taxonomy

This directory contains the **canonical taxonomy** for the IDEALE.eu framework, defining the standardized nomenclature, classifications, and architectural patterns used across all projects and use cases.

## Overview

The canonical taxonomy ensures consistency, interoperability, and clear communication across the entire IDEALE.eu ecosystem. It provides:

- **Standardized project definitions** with clear missions and TFA usage patterns
- **Domain classifications** covering all aspects of advanced systems engineering
- **PLM/CAx categories** for lifecycle management and computer-aided workflows
- **Architecture & policy terms** defining the quantum-inspired computational framework

## Contents

### 1. [projects.csv](./projects.csv)
Defines the **8 canonical use cases** that demonstrate the full capabilities of the IDEALE framework across different industries and applications.

**Columns:**
- `Canonical Name`: Official project identifier
- `Focus`: Primary domain or platform type
- `Mission`: Core objectives and capabilities
- `TFA Use`: Technology and Functional Architecture components utilized

**Projects:**
1. **AMPEL360-AIR-T** - Manned Air Vehicle Platform
2. **AMPEL360-SPACE-T** - Manned Space Vehicle Platform
3. **ASI-T2-INTELLIGENCE** - Advanced Intelligence and Information Systems
4. **GAIA-AIR-UNMANNED** - Unmanned Air Vehicle Platform
5. **INFRANET-RETAIL-LOGISTICS** - Ground & Retail Logistics Platform
6. **GAIA-SEA-PROBES** - Unmanned Sea Probe/AUV Platform
7. **GAIA-SPACE-SATELLITES** - Space Satellite Systems
8. **H2-CHAIN-MRO** - Hydrogen MRO and Lifecycle Management

### 2. [domains.csv](./domains.csv)
Defines the **15 canonical domains** that organize engineering disciplines and functional areas across all projects.

**Columns:**
- `Category`: Classification type (Canonical Domain)
- `Acronym/Term`: Three-letter domain code
- `Definition`: Detailed description of scope and coverage

**Domains:**
- **AAA** - Airframes, Aerodynamics, Airworthiness
- **AAP** - Airport Adaptable Platforms
- **CCC** - Cockpit, Cabin, Cargo
- **CQH** - Cryogenics, Quantum, H2
- **DDD** - Drainage, Dehumidification, Drying
- **EDI** - Electronics, Digital, Instruments
- **EEE** - Electrical, Endotransponders, Circulation
- **EER** - Environmental, Emissions, Remediation
- **IIF** - Industrial Infrastructure, Facilities
- **IIS** - Information, Intelligence, Systems
- **LCC** - Linkages, Control, Communications
- **LIB** - Logistics, Inventory, Blockchain
- **MEC** - Mechanical Systems, Modules
- **OOO** - OS, Ontologies, Office Interfaces
- **PPP** - Propulsion, Fuel Systems

### 3. [plm-cax.csv](./plm-cax.csv)
Defines the **8 PLM/CAx categories** that structure product lifecycle management and computer-aided processes.

**Columns:**
- `Category`: Classification type (PLM/CAx)
- `Acronym/Term`: Three-letter CAx code
- `Definition`: Detailed description of tools and workflows

**Categories:**
- **CAD** - Computer-Aided Design
- **CAE** - Computer-Aided Engineering
- **CAO** - Computer-Aided Optimization
- **CAM** - Computer-Aided Manufacturing
- **CAI** - Computer-Aided Integration
- **CAV** - Computer-Aided Verification
- **CAS** - Customer Aftermarket Service
- **CMP** - Compliance/Corporate Management

### 4. [architecture-policy.csv](./architecture-policy.csv)
Defines the **architectural patterns and policy terms** that form the Technology and Functional Architecture (TFA) framework.

**Columns:**
- `Category`: Classification type (Architecture)
- `Acronym/Term`: Architectural component identifier
- `Definition`: Detailed description of purpose and functionality

**Key Terms:**
- **MAL-EEM** - Machine Learning Ethics, Empathy, Explainability, and Mitigation
- **UTCS** - UiX Threading Context/Content/Cache and Structure/Style/Sheet
- **TFA** - Technology and Functional Architecture
- **QAFbW** - Quantum-Augmented Flight by Wire
- **CB** - Classical Bit / Solver
- **FE** - Federation Entanglement
- **FWD** - Forward Wave Dynamics
- **QB** - Qubit Inspired Solver
- **QS** - Quantum Superposition State
- **UE** - Unit/Unique Element

## Usage

### For Project Teams
When creating or documenting a new project:
1. Reference the appropriate canonical domain codes from `domains.csv`
2. Select relevant PLM/CAx categories from `plm-cax.csv`
3. Identify which TFA components from `architecture-policy.csv` apply to your use case
4. Align with the mission and focus patterns in `projects.csv`

### For Developers
Use these canonical definitions when:
- Structuring directory hierarchies
- Creating configuration files
- Generating metadata and manifests
- Building cross-project integrations
- Implementing provenance chains

### For Documentation
Reference canonical terms to ensure:
- Consistent terminology across all documentation
- Clear communication with stakeholders
- Alignment with industry standards
- Traceability of architectural decisions

## CSV Format Notes

All CSV files in this directory follow these conventions:
- **Header row**: Column names are descriptive and self-explanatory
- **Quoted fields**: Fields containing commas, newlines, or special characters are enclosed in double quotes
- **Character encoding**: UTF-8 (supports special characters like H₂, subscripts, etc.)
- **Line endings**: Unix-style (LF)
- **Delimiter**: Comma (,)

## Validation

To validate these CSV files:

```bash
# Check CSV syntax and structure
python3 << 'PY'
import csv
import sys

files = [
    '1-DIMENSIONS/CANONICAL-TAXONOMY/projects.csv',
    '1-DIMENSIONS/CANONICAL-TAXONOMY/domains.csv',
    '1-DIMENSIONS/CANONICAL-TAXONOMY/plm-cax.csv',
    '1-DIMENSIONS/CANONICAL-TAXONOMY/architecture-policy.csv'
]

for filepath in files:
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            rows = list(reader)
            print(f"✓ {filepath}: {len(rows)} rows validated")
    except Exception as e:
        print(f"✗ {filepath}: {e}")
        sys.exit(1)

print("\n✓ All CSV files validated successfully")
PY
```

## Maintenance

### Version Control
These canonical definitions are versioned with the repository. Changes should:
- Be proposed via pull request
- Include rationale and impact analysis
- Be reviewed by architecture team
- Be accompanied by updates to affected projects

### Change Process
1. **Propose**: Open an issue describing the change and reasoning
2. **Review**: Architecture team evaluates impact
3. **Approve**: Requires consensus from key stakeholders
4. **Update**: Modify CSV files and update dependent documentation
5. **Migrate**: Update existing projects to align with changes

### Backward Compatibility
When modifying canonical definitions:
- Prefer additions over modifications
- Document deprecations clearly
- Provide migration guides for breaking changes
- Maintain changelog of taxonomy evolution

## Integration with IDEALE Framework

The canonical taxonomy integrates with:

- **[2-PROGRAM-TEMPLATE](../../2-PROGRAM-TEMPLATE/)**: Template structure follows domain organization
- **[3-PROJECTS-USE-CASES](../../3-PROJECTS-USE-CASES/)**: All projects implement canonical patterns
- **[standards/v0.1](../../standards/v0.1/)**: Schemas reference canonical terms
- **[0-STRATEGY](../../0-STRATEGY/)**: Strategic roadmap aligns with project definitions

## Related Documentation

- **[Main README](../../README.md)**: Repository overview and structure
- **[Program Template](../../2-PROGRAM-TEMPLATE/README.md)**: Domain and service structure
- **[Standards v0.1](../../standards/v0.1/README.md)**: Evidence framework specifications
- **[Governance](../../GOVERNANCE.md)**: Decision-making processes for taxonomy changes

## Contributing

To propose changes to the canonical taxonomy:
1. Review existing definitions thoroughly
2. Open an issue with your proposal
3. Include use cases and examples
4. Be prepared to update documentation
5. Follow the change process outlined above

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for general contribution guidelines.

---

**Maintained By**: IDEALE.eu Architecture Team  
**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Status**: Canonical Reference
