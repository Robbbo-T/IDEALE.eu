# Interface Control Definitions (ICD) — Sub-Assemblies

This directory contains **Interface Control Definitions detailing mating geometry and tolerances** for sub-assemblies belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Interface Control Definitions (ICDs) establish precise specifications for how sub-assemblies connect to each other and to the main airframe structure. ICDs are critical for:

* Ensuring proper fit between mating parts
* Defining datum schemes and coordinate systems
* Specifying fastener patterns and hole tolerances
* Documenting clearance and gap requirements
* Managing interface changes across multiple assemblies

## Contents

* **Interface Drawings** — Detailed drawings of mating surfaces and features
* **Tolerance Specifications** — Dimensional and geometric tolerances for interfaces
* **Fastener Patterns** — Hole locations, sizes, and installation requirements
* **Datum Definitions** — Reference coordinate systems for assembly
* **Clearance Requirements** — Minimum gaps for installation and operation
* **Change History** — Interface evolution and configuration control

## Naming Convention

Files follow the template: `ICD-AAA-{MODULE1}-to-{MODULE2}-{IDX}.{ext}`

* `{MODULE1}`, `{MODULE2}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|BODY|WING}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{md|pdf|dwg|stp}`

**Examples:**
* `ICD-AAA-WINGBOX-to-BODY-001.pdf` — Wing-to-body interface definition
* `ICD-AAA-STAB-to-FUSE-001.pdf` — Stabilizer-to-fuselage interface
* `ICD-AAA-LGBAY-to-WING-001.dwg` — Landing gear bay integration interface
* `ICD-AAA-PYLON-to-WING-002.md` — Pylon attachment interface specification

## TFA Context

* **Primary Loop:** FE→CB
* **UTCS Anchors:** `UTCS-MI:ICD:AAA:{MODULE}-{IDX}:v1`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Change Control:** All ICD changes require multi-party review and approval

## Required Information

Each ICD document must include:

### 1. Interface Identification
* **Part Numbers** — Specific assemblies being mated
* **Interface Name/Code** — Unique identifier for the interface
* **Drawing References** — Links to detailed CAD models
* **Configuration** — Applicable aircraft configurations

### 2. Geometric Definition
* **Mating Surfaces** — Surface profiles, contours, flatness requirements
* **Datum Structure** — Primary, secondary, tertiary datums for alignment
* **Coordinate Systems** — Origin, axes orientation, units
* **Critical Dimensions** — Key measurements affecting fit

### 3. Fastener Specification
* **Hole Pattern** — X-Y coordinates of all fastener holes
* **Hole Size and Tolerance** — Nominal diameter, tolerance, countersink depth
* **Fastener Type** — Bolt/rivet type, material, grip length
* **Installation Torque** — Cross-reference to fastener schedule

### 4. Clearance and Gaps
* **Nominal Gaps** — Designed spacing between parts
* **Tolerance Ranges** — Minimum and maximum allowable gaps
* **Shimming Provisions** — Locations and thickness ranges for shims
* **Sealant Requirements** — Type and application for sealed joints

### 5. Interface Loads
* **Load Transfer Mechanism** — How forces transmit across the interface
* **Allowable Loads** — Maximum loads for each direction
* **Load Cases** — Flight conditions and ground operations
* **Stress Analysis** — References to structural analysis reports

### 6. Assembly Requirements
* **Assembly Sequence** — Order of mating operations
* **Tooling Requirements** — Jigs, fixtures, alignment tools
* **Alignment Methods** — Procedures for achieving proper fit
* **Inspection Points** — Quality checks during assembly

### 7. Systems Integration
* **Wire Bundles** — Routing through/across interface
* **Hydraulic/Pneumatic Lines** — Pass-through provisions
* **Environmental Sealing** — Pressure sealing requirements
* **Access Provisions** — Maintenance access across interface

## Interface Categories

### Primary Structural Interfaces
* Wing-to-body connections
* Stabilizer attachments
* Landing gear mounts
* **Criticality:** Flight safety critical, extensive analysis required

### Secondary Structural Interfaces
* Non-load bearing panels
* Interior structure connections
* **Criticality:** Important for fit and finish, reduced analysis depth

### Systems Interfaces
* Equipment mounting provisions
* Systems pass-throughs
* **Criticality:** Functional requirements, coordination with systems domains

## Change Management

All interface changes must follow strict change control:

1. **Change Request** — Formal ECR with justification
2. **Impact Analysis** — Assessment of effects on both sides of interface
3. **Multi-Party Review** — Both assemblies' design teams must approve
4. **UTCS Update** — New version with change tracking
5. **Configuration Control** — Effectivity and incorporation planning

## Related Directories

* `../` — Parent sub-assemblies directory
* `../utcs/` — Canonical UTCS YAML records
* `../tolerance-stackups/` — Tolerance analysis affecting interfaces
* `../../sub-assemblies/` — Source CAD models showing interfaces
* `../../interference-checks/` — Clearance verification

## Standards and References

* **CS-25.603** — Materials and workmanship (interface quality)
* **CS-25.605** — Fabrication methods (joint design)
* **ASME Y14.5** — Geometric dimensioning and tolerancing
* **Company ICD Standard** — Corporate interface documentation requirements

## Status

🔄 In Progress — Interface Control Definitions under development

---

**Maintainer:** AAA Integration Team  
**Approval Required:** Both interfacing assembly leads, Chief Engineer  
**Change Authority:** Configuration Control Board (CCB)  
**Last Updated:** 2025-01-26
