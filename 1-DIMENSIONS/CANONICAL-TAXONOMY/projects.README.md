# Canonical Projects (8 Use Cases)

This file defines the **8 canonical use cases** that demonstrate the full capabilities of the IDEALE.eu framework across different industries and applications.

## Purpose

The canonical projects serve as:
- **Reference implementations** for the IDEALE framework
- **Portfolio diversity** across air, space, sea, ground, and digital domains
- **TFA demonstration** showcasing different quantum-inspired patterns
- **Integration templates** for new projects and partners

## File Structure

**Format**: CSV (Comma-Separated Values)  
**Encoding**: UTF-8  
**Columns**:
1. `Canonical Name` - Official project identifier (directory name in `3-PROJECTS-USE-CASES/`)
2. `Focus` - Primary domain or platform type
3. `Mission` - Core objectives and capabilities (quoted to allow commas)
4. `TFA Use` - Technology and Functional Architecture components utilized (quoted)

## Projects Overview

### 1. AMPEL360-AIR-T
**Manned Air Vehicle Platform**
- H₂ hybrid-electric passenger transport with Blended Wing Body (BWB) architecture
- Uses QB for optimal flight path planning and resource distribution
- Primary domains: AAA, PPP, CQH, LCC
- PLM emphasis: CAD, CAE, CAV, CAS

### 2. AMPEL360-SPACE-T
**Manned Space Vehicle Platform**
- Human-rated suborbital/orbital tourism with rapid turnaround
- Uses FWD for trajectory prediction and reentry risk management
- Primary domains: AAA, PPP, CQH, IIS
- PLM emphasis: CAE, CAV, CAS

### 3. ASI-T2-INTELLIGENCE
**Advanced Intelligence and Information Systems**
- AI/ML-powered decision support across product lines
- Uses QS feeding into FE decision chains with MAL-EEM oversight
- Primary domains: IIS, OOO, LCC
- PLM emphasis: CAO, CMP, CAS

### 4. GAIA-AIR-UNMANNED
**Unmanned Air Vehicle Platform**
- Autonomous UAVs for logistics and surveillance
- Uses CB + QB for real-time pathfinding and payload optimization
- Primary domains: AAA, EDI, LCC, IIS
- PLM emphasis: CAD, CAE, CAI, CAS

### 5. INFRANET-RETAIL-LOGISTICS
**Ground & Retail Logistics Platform**
- Supply chain optimization with blockchain provenance
- Uses QS for immutable asset records, CB for constraints, QB for TSP/VRP & MILP/QUBO
- Primary domains: LIB, IIF, EER
- PLM emphasis: CMP, CAS

### 6. GAIA-SEA-PROBES
**Unmanned Sea Probe/AUV Platform**
- Deep-sea autonomous underwater vehicles with cryogenic power
- Uses UE snapshots for sensor health monitoring under extreme pressure
- Primary domains: MEC, EEE, EDI, CQH
- PLM emphasis: CAE, CAV, CAS

### 7. GAIA-SPACE-SATELLITES
**Space Satellite Systems**
- Satellite constellation deployment and management with orbital optimization
- Uses FWD for collision prediction and maneuvering strategies
- Primary domains: AAA, EDI, LCC, IIS
- PLM emphasis: CAE, CAI, CAV

### 8. H2-CHAIN-MRO
**Hydrogen MRO and Lifecycle Management**
- Global maintenance, repair, and overhaul chain for H₂ propulsion systems
- Uses UE for maintenance snapshots, QS for immutable audit ledger
- Primary domains: PPP, CQH, LIB, IIF
- PLM emphasis: CAS, CMP, CAV

## TFA Usage Patterns

The projects demonstrate different TFA component combinations:

| TFA Component | Projects Using It |
|---------------|-------------------|
| **QS** (Quantum Superposition State) | ASI-T2-INTELLIGENCE, INFRANET-RETAIL-LOGISTICS, H2-CHAIN-MRO |
| **FWD** (Forward Wave Dynamics) | AMPEL360-SPACE-T, GAIA-SPACE-SATELLITES |
| **UE** (Unit/Unique Element) | GAIA-SEA-PROBES, H2-CHAIN-MRO |
| **CB** (Classical Bit) | GAIA-AIR-UNMANNED, INFRANET-RETAIL-LOGISTICS |
| **QB** (Qubit Inspired Solver) | AMPEL360-AIR-T, GAIA-AIR-UNMANNED, INFRANET-RETAIL-LOGISTICS |
| **FE** (Federation Entanglement) | ASI-T2-INTELLIGENCE |

## Industry Sectors

Projects are aligned with strategic dimensions in `1-DIMENSIONS/`:

- **AEROSPACE**: AMPEL360-AIR-T, AMPEL360-SPACE-T, GAIA-AIR-UNMANNED, GAIA-SPACE-SATELLITES
- **DEFENSE**: ASI-T2-INTELLIGENCE, GAIA-AIR-UNMANNED, GAIA-SEA-PROBES
- **ENERGY**: AMPEL360-AIR-T, H2-CHAIN-MRO
- **ESG**: INFRANET-RETAIL-LOGISTICS, H2-CHAIN-MRO
- **INTELLIGENCE**: ASI-T2-INTELLIGENCE
- **LOGISTICS**: INFRANET-RETAIL-LOGISTICS, GAIA-AIR-UNMANNED

## Usage in Repository

Each project has a dedicated directory under `3-PROJECTS-USE-CASES/[CANONICAL-NAME]/` containing:
- Domain-specific implementations
- TFA component configurations
- MAL and MAP service integrations
- PLM/CAx workflows and artifacts

## Naming Convention

Project names follow the pattern:
- **Prefix**: Portfolio identifier (AMPEL360, GAIA, ASI, H2, INFRANET)
- **Platform**: Domain type (AIR, SPACE, SEA, GROUND, etc.)
- **Suffix**: Platform characteristics (MANNED, UNMANNED, -T for Transport, etc.)

Special cases:
- ASI-T2: Advanced Systems Integration - Tier 2
- H2-CHAIN: Hydrogen supply chain
- INFRANET: Infrastructure network (retail/logistics)

## Adding New Projects

To add a canonical project:
1. Define mission and TFA usage
2. Map to relevant domains (15 canonical)
3. Identify PLM/CAx workflows needed
4. Add row to this CSV file
5. Create project directory structure
6. Update main repository README

## Change History

| Date | Change | Rationale |
|------|--------|-----------|
| 2025-01-27 | Renamed GAIA-GROUND-RETAILS to INFRANET-RETAIL-LOGISTICS | Aligns to INFRANET portfolio naming convention |
| 2025-01-27 | Initial canonical taxonomy creation | Standardize project definitions |

---

**See Also**:
- [domains.csv](./domains.csv) - Canonical domain definitions
- [architecture-policy.csv](./architecture-policy.csv) - TFA component definitions
- [Main README](./README.md) - Canonical taxonomy overview
