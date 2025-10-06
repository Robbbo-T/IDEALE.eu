# PLM/CAx Categories (8)

This file defines the **8 PLM/CAx categories** that structure product lifecycle management and computer-aided processes across all IDEALE.eu projects.

## Purpose

The PLM/CAx categories provide:
- **Standardized workflows** from design through end-of-life
- **Tool-agnostic structure** supporting multiple CAx vendors
- **Lifecycle traceability** for all engineering artifacts
- **Integration framework** for the IDEALE Evidence Framework (IEF)

## File Structure

**Format**: CSV (Comma-Separated Values)  
**Encoding**: UTF-8  
**Columns**:
1. `Category` - Classification type (always "PLM/CAx")
2. `Acronym/Term` - Three-letter CAx code (used in directory names)
3. `Definition` - Detailed description of tools and workflows (quoted)

## Category Descriptions

### CAD - Computer-Aided Design
**Geometric modeling, parts, and assemblies.**

Includes:
- **PRT/** - Part modeling (custom parts, standard parts, materials)
- **ASSY/** - Assembly models (BOMs, kinematics, interference checks)
- **DRW/** - 2D technical drawings (with GD&T, annotations)
- Parametric and direct modeling
- Surface and solid modeling
- Sheet metal and composites

**Tools**: CATIA, Siemens NX, SolidWorks, FreeCAD  
**Outputs**: STEP AP242, JT, 3MF, native CAD formats  
**Standards**: ISO 10303 (STEP), ISO 16792 (Digital Mock-Up)

### CAE - Computer-Aided Engineering
**Simulation and analysis (CFD, FEM, MBD, EMI).**

Includes:
- **CFD/** - Computational Fluid Dynamics (aerodynamics, thermal)
- **FEM/** - Finite Element Method (structural, thermal, modal)
- **MBD/** - Multi-Body Dynamics (kinematics, control systems)
- **EMI/** - Electromagnetic Interference (shielding, grounding)
- System-level simulation
- Virtual testing and validation

**Tools**: ANSYS, Abaqus, OpenFOAM, SimScale, MapleSim  
**Outputs**: Results databases, contour plots, animations, reports  
**Standards**: ISO 18876 (FEM), ASME V&V standards

### CAO - Computer-Aided Optimization
**Requirements management and early-stage systems engineering.**

Includes:
- Requirements capture and traceability
- System architecture modeling (SysML)
- Trade studies and decision analysis
- Design space exploration
- Multi-objective optimization
- Technology readiness assessment (TRL)

**Tools**: DOORS, Cameo Systems Modeler, ModeFRONTIER, HEEDS  
**Outputs**: Requirements databases, traceability matrices, trade study reports  
**Standards**: ISO/IEC 15288 (Systems Engineering), ISO 29148 (Requirements)

### CAM - Computer-Aided Manufacturing
**NC programming and machining setup.**

Includes:
- **NC/** - Numerical Control programs (G-code, post-processors)
- **SET/** - Setup sheets (tooling, fixtures, work coordinates)
- Tool path generation
- Machining simulation
- Additive manufacturing (3D printing)
- Quality planning (FMEA, control plans)

**Tools**: Mastercam, Fusion 360, PowerMill, Cura (AM)  
**Outputs**: G-code, tool lists, setup sheets, process plans  
**Standards**: ISO 6983 (G-code), ISO/ASTM 52900 (Additive Manufacturing)

### CAI - Computer-Aided Integration
**Assembly planning and interface control.**

Includes:
- Assembly sequence planning
- Interface control documents (ICDs)
- Integration test procedures
- Configuration management
- System integration verification
- Harness and routing design

**Tools**: Teamcenter, Windchill, 3DCS, Delmia  
**Outputs**: Assembly work instructions, ICDs, integration schedules  
**Standards**: ISO 10007 (Configuration Management), MIL-HDBK-61A (Config Mgmt)

### CAV - Computer-Aided Verification
**QA, metrology, and certification evidence.**

Includes:
- Inspection planning (CMM, optical scanning)
- Quality control procedures
- Metrology data analysis
- Non-destructive testing (NDT)
- Certification evidence packages
- Test reports and conformance statements

**Tools**: PC-DMIS, GOM Inspect, PolyWorks, Minitab  
**Outputs**: Inspection reports, dimensional analysis, AS9102 FAIRs  
**Standards**: ISO 9001, AS9100, ISO 17025 (Lab Calibration)

### CAS - Customer Aftermarket Service
**Maintenance (AMM), repair (SRM), and in-service data (EIS).**

Includes:
- Aircraft Maintenance Manual (AMM) content
- Structural Repair Manual (SRM) procedures
- Illustrated Parts Catalog (IPC)
- Service bulletins and airworthiness directives
- Maintenance planning and scheduling
- Spare parts management
- In-service performance tracking

**Tools**: S1000D authoring, ATA iSpec 2200, Quantum (MRO software)  
**Outputs**: Technical publications, service bulletins, maintenance schedules  
**Standards**: S1000D, ATA iSpec 2200, GEIA-STD-0007

### CMP - Compliance/Corporate Management
**EOL, ESG, and digital thread automation.**

Includes:
- **EOL/** - End-of-Life (decommissioning, recycling)
- **ESG/** - Environmental, Social, Governance reporting
- **RECYCLING/** - Material recovery and circular economy
- Digital thread and digital twin management
- Regulatory compliance automation
- Sustainability metrics and reporting

**Tools**: PLM systems (Teamcenter, Windchill), ESG platforms (Sphera, Enablon)  
**Outputs**: ESG reports, compliance certificates, material declarations  
**Standards**: ISO 14001 (Environmental), ISO 26000 (Social Responsibility), EU regulations

## Workflow Integration

The 8 categories form an integrated workflow:

```
CAO (Requirements) 
  ↓
CAD (Design) 
  ↓
CAE (Analysis) ← feedback loop
  ↓
CAM (Manufacturing)
  ↓
CAI (Integration)
  ↓
CAV (Verification)
  ↓
CAS (Service) → CMP (Compliance/EOL)
```

## Domain Integration

PLM/CAx categories appear within each canonical domain:

```
[DOMAIN]/
  ├── PLM/
  │   ├── CAD/
  │   ├── CAE/
  │   ├── CAO/
  │   ├── CAM/
  │   ├── CAI/
  │   ├── CAV/
  │   ├── CAS/
  │   └── CMP/
  ├── README.md
  ├── domain-config.yaml
  └── META.json
```

Example:
- `AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/PLM/CAD/PRT/` - Airframe parts
- `PPP-PROPULSION-FUEL-SYSTEMS/PLM/CAE/CFD/` - Engine CFD analysis
- `LIB-LOGISTICS-INVENTORY-BLOCKCHAIN/PLM/CMP/ESG/` - Supply chain ESG

## Evidence Framework Integration

Each PLM/CAx category generates artifacts for the IDEALE Evidence Framework:

| Category | Artifact Types | Provenance Requirements |
|----------|----------------|-------------------------|
| **CAD** | Parts, assemblies, drawings | UTCS_ID, material specs, revision history |
| **CAE** | Simulation results, reports | Model provenance, validation evidence |
| **CAO** | Requirements, trade studies | Traceability matrices, decision rationale |
| **CAM** | NC programs, process plans | Tool certification, operator credentials |
| **CAI** | ICDs, integration plans | Interface verification, test results |
| **CAV** | Inspection reports, certs | Calibration records, measurement uncertainty |
| **CAS** | Maintenance records, bulletins | Service history, parts traceability |
| **CMP** | ESG reports, compliance docs | Regulatory citations, audit trails |

All artifacts must include:
- **artifact.json** - Metadata conforming to `standards/v0.1/artifact.schema.json`
- **Cryptographic hash** - SHA-256 of artifact content
- **UTCS_ID** - Universal Traceability Chain System identifier
- **Authorship** - Contributors and royalty shares
- **Tool attribution** - Software used to generate artifact

## Project Usage Patterns

Different projects emphasize different categories:

| Project | Primary CAx | Secondary CAx |
|---------|-------------|---------------|
| **AMPEL360-AIR-T** | CAD, CAE, CAV | CAO, CAM, CAI, CAS |
| **AMPEL360-SPACE-T** | CAE, CAV, CAS | CAD, CAO, CAI |
| **ASI-T2-INTELLIGENCE** | CAO, CMP | CAV, CAS |
| **GAIA-AIR-UNMANNED** | CAD, CAE, CAI | CAV, CAS |
| **INFRANET-RETAIL-LOGISTICS** | CMP, CAS | CAO, CAV |
| **GAIA-SEA-PROBES** | CAE, CAV, CAS | CAD, CAI |
| **GAIA-SPACE-SATELLITES** | CAE, CAI, CAV | CAD, CAS |
| **H2-CHAIN-MRO** | CAS, CMP, CAV | CAE |

## Tool Portability

The IDEALE framework emphasizes **tool-agnostic portability**:

- **Neutral formats**: STEP, JT, STL, OBJ (geometry); HDF5, CSV (data)
- **Open standards**: ISO 10303, ISO 14306 (JT), S1000D
- **Cross-tool metadata**: `standards/v0.1/cross-tool-schema.json`
- **Transformation context**: Documenting tool-specific conversions

See `standards/v0.1/artifact-portability-spec.yaml` for details.

## Naming Convention

PLM/CAx directories follow the pattern:
```
PLM/[CAx]/[SUBDOMAIN]/[ARTIFACTS]
```

Examples:
- `PLM/CAD/PRT/custom-parts/` - Custom part models
- `PLM/CAE/CFD/simulations/` - CFD simulation results
- `PLM/CAS/AMM/procedures/` - Maintenance procedures

## Adding New Categories

The 8 PLM/CAx categories are considered **comprehensive and stable**. Adding new categories requires:
1. Gap analysis vs. existing categories
2. Industry standards alignment
3. Tool ecosystem support
4. Migration plan for existing projects
5. Schema updates in `standards/v0.1/`

Consider whether the proposed category is:
- A **subcategory** of existing PLM/CAx (add as subdirectory)
- A **cross-cutting service** (add to MAL/MAP layer)
- Truly **canonical** (requires broad tool support)

## Change History

| Date | Change | Rationale |
|------|--------|-----------|
| 2025-01-27 | Initial canonical taxonomy creation | Standardize PLM/CAx definitions |

---

**See Also**:
- [domains.csv](./domains.csv) - Canonical domains containing PLM structures
- [architecture-policy.csv](./architecture-policy.csv) - TFA components for optimization
- [standards/v0.1/artifact-portability-spec.yaml](../../standards/v0.1/) - Tool portability specification
- [Main README](./README.md) - Canonical taxonomy overview
