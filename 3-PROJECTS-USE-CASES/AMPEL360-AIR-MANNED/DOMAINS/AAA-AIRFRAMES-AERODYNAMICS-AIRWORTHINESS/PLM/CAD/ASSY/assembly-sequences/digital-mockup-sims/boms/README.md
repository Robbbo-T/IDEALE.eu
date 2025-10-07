# Bills of Materials (BOM) — Sub-Assemblies

This directory contains **module BOMs (Engineering BOM/Assembly BOM) and component extracts** for sub-assemblies belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Bills of Materials provide structured lists of all components, parts, and materials required to manufacture and assemble each sub-assembly. BOMs are essential for:

* Manufacturing planning and procurement
* Cost estimation and tracking
* Configuration management
* Traceability and compliance
* Maintenance planning

## Contents

* **Engineering BOMs (EBOM)** — Design-centric view organized by function
* **Assembly BOMs (ABOM)** — Manufacturing-centric view organized by assembly sequence
* **Component Extracts** — Detailed part lists for specific modules
* **Material Specifications** — Raw material and standard parts
* **Change History** — BOM evolution and effectivity tracking

## Naming Convention

Files follow the template: `BOM-AAA-{MODULE}-{IDX}.{ext}`

* `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{ext}` ∈ `{csv|xlsx|xml|pdf}`

**Examples:**
* `BOM-AAA-WINGBOX-001.xlsx` — Wing box complete BOM
* `BOM-AAA-FUSE-002.csv` — Fuselage section BOM extract
* `BOM-AAA-STAB-001.pdf` — Stabilizer assembly BOM with drawings

## TFA Context

* **Primary Loop:** QS→UE
* **UTCS Anchors:** `UTCS-MI:BOM:AAA:{MODULE}-{IDX}:v1`
* **Domain:** AAA (Airframes, Aerodynamics, Airworthiness)
* **Configuration Control:** BOMs are configuration items requiring formal change control

## BOM Structure

### Engineering BOM (EBOM)
Organized by design function and component hierarchy:

```
Sub-Assembly (e.g., SA-AAA-WINGBOX-001)
├── Primary Structure
│   ├── Spars
│   │   ├── Front Spar (Part Number, Qty, Material)
│   │   └── Rear Spar
│   ├── Ribs
│   └── Skin Panels
├── Fasteners
│   ├── Hi-Lok Bolts
│   ├── Rivets
│   └── Nuts/Washers
└── Sealants & Coatings
    ├── Fuel Sealant
    └── Corrosion Protection
```

### Assembly BOM (ABOM)
Organized by manufacturing/assembly sequence:

```
Assembly Sequence
├── Step 1: Jig Setup
│   └── Tooling (not part of final assembly)
├── Step 2: Spar Installation
│   ├── Front Spar + Fasteners
│   └── Rear Spar + Fasteners
├── Step 3: Rib Installation
│   └── Ribs + Fasteners
└── Step 4: Skin Panel Installation
    └── Panels + Fasteners + Sealant
```

## Required Information

Each BOM entry must include:

1. **Part Identification**
   - Part Number (unique identifier)
   - Part Name/Description
   - Revision/Version
   - Drawing Reference

2. **Quantity and Units**
   - Quantity per assembly
   - Unit of measure (EA, KG, M, L)
   - Scrap/attrition allowance

3. **Classification**
   - Make/Buy designation
   - Standard/Custom part
   - Criticality level (safety critical, flight essential, etc.)
   - Source control drawing (if applicable)

4. **Material Specification**
   - Material type and grade
   - Heat treatment requirements
   - Surface finish/coating
   - Material certification requirements

5. **Procurement Information**
   - Lead time
   - Preferred supplier(s)
   - Alternate sources
   - Cost estimate

6. **Configuration Data**
   - Effectivity (applies to which aircraft)
   - Interchangeability group
   - Supersession information
   - Change history

## BOM Types

### Top-Level Assembly BOM
* Complete sub-assembly with all child components
* Includes purchased assemblies and fabricated parts
* Links to lower-level BOMs

### Fabrication BOM
* Raw materials and processes to create a part
* Machine time, labor hours
* Consumables (cutting fluids, abrasives, etc.)

### Installation BOM
* Parts needed for installation at assembly station
* Includes installation aids, sealants, lubricants
* Does not include tooling (tracked separately)

## BOM Management

### Version Control
* All BOMs are version controlled
* Changes tracked via Engineering Change Requests (ECRs)
* Effectivity dates and serial number applicability

### Approval Process
1. **Engineer** — Creates/updates BOM
2. **Lead Engineer** — Technical review
3. **Manufacturing** — Feasibility review
4. **Procurement** — Availability and cost review
5. **Quality** — Compliance verification
6. **Configuration Management** — Release approval

### Integration with PLM System
* BOMs synchronized with PLM database
* Automated BOM generation from CAD assemblies
* Real-time updates to manufacturing and procurement

## Related Directories

* `../` — Parent sub-assemblies directory
* `../utcs/` — Canonical UTCS YAML records
* `../../sub-assemblies/` — Source CAD models (geometry source for BOM)
* `../icd/` — Interface definitions (affects parts at interfaces)
* `../fastener-schedules/` — Fastener details (BOM references these)

## Standards and References

* **CS-25.603** — Materials (material specifications in BOM)
* **ISO 10303 (STEP)** — Product data representation and exchange
* **Company BOM Standard** — Corporate BOM structure and naming
* **PLM System Documentation** — Integration procedures

## Status

🔄 In Progress — BOMs under development and synchronization with CAD models

---

**Maintainer:** AAA Integration Team & Configuration Management  
**Approval Required:** Lead Engineer, Manufacturing, Quality, Configuration Control  
**Last Updated:** 2025-01-26
