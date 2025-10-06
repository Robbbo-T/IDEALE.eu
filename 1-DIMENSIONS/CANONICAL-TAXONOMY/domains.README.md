# Canonical Domains (15)

This file defines the **15 canonical domains** that organize engineering disciplines and functional areas across all IDEALE.eu projects.

## Purpose

The canonical domains provide:
- **Standardized organization** for engineering artifacts and documentation
- **Cross-project consistency** in terminology and scope
- **Clear boundaries** between functional disciplines
- **Integration points** for multi-domain systems

## File Structure

**Format**: CSV (Comma-Separated Values)  
**Encoding**: UTF-8  
**Columns**:
1. `Category` - Classification type (always "Canonical Domain")
2. `Acronym/Term` - Three-letter domain code (used in directory names)
3. `Definition` - Detailed description of scope and coverage (quoted)

## Domain Descriptions

### AAA - Airframes, Aerodynamics, Airworthiness
Covers structural design, flight physics, and regulatory compliance. Includes:
- Structural analysis and composite design
- Aerodynamic performance and optimization
- Certification and compliance evidence
- Loads, stress, and fatigue analysis
- **Applicable to**: AMPEL360-AIR-T, AMPEL360-SPACE-T, GAIA-AIR-UNMANNED, GAIA-SPACE-SATELLITES

### AAP - Airport Adaptable Platforms
Covers compatibility and operational readiness with various ground infrastructure systems. Includes:
- Ground support equipment interfaces
- Refueling and turnaround operations
- Airport system integration
- Ground handling procedures
- **Applicable to**: AMPEL360-AIR-T, GAIA-AIR-UNMANNED

### CCC - Cockpit, Cabin, Cargo
Covers HMI, passenger experience (PAx), and payload management systems. Includes:
- Cockpit ergonomics and displays
- Cabin comfort and safety systems
- Cargo loading and management
- Human factors engineering
- **Applicable to**: AMPEL360-AIR-T, AMPEL360-SPACE-T

### CQH - Cryogenics, Quantum, H2
Covers Hydrogen fluid storage and integrated quantum hardware/software. Includes:
- Cryogenic fluid systems and thermal management
- Quantum computing hardware integration
- H₂ storage tanks and distribution
- Low-temperature sensor systems
- **Applicable to**: AMPEL360-AIR-T, H2-CHAIN-MRO, GAIA-SEA-PROBES

### DDD - Drainage, Dehumidification, Drying
Covers environmental control and fluid drainage systems. Includes:
- Moisture control and condensation management
- Drainage pathways and collection
- Deicing and anti-icing systems
- Environmental sealing
- **Applicable to**: All air and space vehicles

### EDI - Electronics, Digital, Instruments
Covers avionics, sensors, and flight instrumentation. Includes:
- Sensor suites and data acquisition
- Digital processing systems
- Flight instruments and displays
- Avionics architecture
- **Applicable to**: All vehicles and autonomous systems

### EEE - Electrical, Endotransponders, Circulation
Covers power systems and circulation mechanics. Includes:
- Electrical power generation and distribution
- Battery and energy storage systems
- Transponder systems
- Electrical circulation and routing
- **Applicable to**: All projects

### EER - Environmental, Emissions, Remediation
Covers ecological impact and sustainable practices. Includes:
- Emissions monitoring and reduction
- Environmental impact assessments
- Sustainability reporting (ESG)
- Remediation strategies
- **Applicable to**: All projects (ESG compliance)

### IIF - Industrial Infrastructure, Facilities
Covers manufacturing plants and maintenance facilities. Includes:
- Factory layout and tooling
- Maintenance facility requirements
- Ground infrastructure
- Supply chain facilities
- **Applicable to**: INFRANET-RETAIL-LOGISTICS, H2-CHAIN-MRO

### IIS - Information, Intelligence, Systems
Covers data management, analytics, and operational intelligence. Includes:
- Data lakes and analytics platforms
- AI/ML decision support systems
- Operational intelligence
- Information security
- **Applicable to**: ASI-T2-INTELLIGENCE, all projects (data layer)

### LCC - Linkages, Control, Communications
Covers control laws and communication systems. Includes:
- Flight control systems and laws
- Mechanical linkages
- Communication protocols
- Command and control architecture
- **Applicable to**: All vehicles and autonomous systems

### LIB - Logistics, Inventory, Blockchain
Covers supply chain and decentralized ledger provenance. Includes:
- Supply chain optimization
- Inventory management
- Blockchain-based provenance
- Parts tracking and traceability
- **Applicable to**: INFRANET-RETAIL-LOGISTICS, H2-CHAIN-MRO, all projects (provenance)

### MEC - Mechanical Systems, Modules
Covers hydraulics, actuators, and landing gear. Includes:
- Hydraulic systems
- Actuators and servos
- Landing gear mechanisms
- Mechanical assemblies
- **Applicable to**: All vehicles

### OOO - OS, Ontologies, Office Interfaces
Covers semantic data and enterprise IT integration. Includes:
- Operating system requirements
- Data ontologies and semantic web
- Enterprise system integration
- Office productivity interfaces
- **Applicable to**: All projects (data interoperability)

### PPP - Propulsion, Fuel Systems
Covers engines, motors, and H₂ fuel management. Includes:
- Propulsion systems (jet, rocket, electric)
- Fuel storage and distribution
- Engine control systems
- Thrust vectoring
- **Applicable to**: AMPEL360-AIR-T, AMPEL360-SPACE-T, H2-CHAIN-MRO

## Domain Usage Matrix

| Domain | High Usage Projects | Medium Usage Projects | Low Usage Projects |
|--------|--------------------|-----------------------|-------------------|
| **AAA** | AMPEL360-AIR-T, AMPEL360-SPACE-T | GAIA-AIR-UNMANNED | GAIA-SPACE-SATELLITES |
| **LIB** | INFRANET-RETAIL-LOGISTICS, H2-CHAIN-MRO | All projects | - |
| **IIS** | ASI-T2-INTELLIGENCE | All projects | - |
| **CQH** | AMPEL360-AIR-T, H2-CHAIN-MRO | GAIA-SEA-PROBES | - |
| **PPP** | AMPEL360-AIR-T, AMPEL360-SPACE-T | H2-CHAIN-MRO | - |

## Directory Structure

Each domain appears in two locations:

1. **Program Template**: `2-PROGRAM-TEMPLATE/DOMAINS/[ACRONYM]-[NAME]/`
   - Contains generic structure and templates
   - Includes PLM/CAx subdirectories
   - Provides reference implementations

2. **Project Instances**: `3-PROJECTS-USE-CASES/[PROJECT]/DOMAINS/[ACRONYM]-[NAME]/`
   - Project-specific implementations
   - Actual artifacts and data
   - Configuration overrides

## PLM/CAx Integration

Each domain can contain all 8 PLM/CAx categories:
- **CAD/** - Design artifacts
- **CAE/** - Engineering analysis
- **CAO/** - Optimization workflows
- **CAM/** - Manufacturing data
- **CAI/** - Integration planning
- **CAV/** - Verification evidence
- **CAS/** - Service documentation
- **CMP/** - Compliance records

## Naming Convention

Domain directories follow the pattern:
```
[AAA]-[FULL-NAME-WITH-HYPHENS]/
```

Examples:
- `AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/`
- `LIB-LOGISTICS-INVENTORY-BLOCKCHAIN/`
- `CQH-CRYOGENICS-QUANTUM-H2/`

## Cross-Domain Dependencies

Common integration patterns:

| Primary Domain | Depends On | Reason |
|---------------|-----------|---------|
| **AAA** | LCC, MEC, PPP | Control surfaces, actuators, thrust |
| **CQH** | PPP, EEE, DDD | Fuel systems, power, thermal |
| **LIB** | IIS, OOO, EER | Data management, standards, ESG |
| **IIS** | EDI, OOO, LCC | Sensors, ontologies, comms |

## Adding New Domains

The 15 canonical domains are considered **stable and complete**. Adding new domains requires:
1. Architecture committee review
2. Gap analysis vs. existing domains
3. Impact assessment on all projects
4. Migration plan for existing artifacts
5. Documentation updates across repository

Consider whether the proposed domain is:
- A **subdomain** of an existing domain (add as subdirectory)
- A **cross-cutting concern** (add as service in MAL/MAP layer)
- Truly **canonical** (requires broad applicability)

## Change History

| Date | Change | Rationale |
|------|--------|-----------|
| 2025-01-27 | Initial canonical taxonomy creation | Standardize domain definitions |

---

**See Also**:
- [projects.csv](./projects.csv) - Canonical project definitions
- [plm-cax.csv](./plm-cax.csv) - PLM/CAx categories that appear within domains
- [Main README](./README.md) - Canonical taxonomy overview
