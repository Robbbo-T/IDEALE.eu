# CAS — Continuous Airworthiness Services (S1000D CSDB)
**System:** 06-DIMENSIONS-STATIONS → **06-10 REFERENCE FRAME**  
**UTCS:** UTCS-MI:AAA:CAS:06-10:REFERENCE-FRAME:rev[1.0] · **Status:** S1000D-ready · **Owner:** AAA/ CAS

---

## Overview
This CAS node is the **authoring & sustainment CSDB** for ATA **06-10 Reference Frame** (aircraft reference frame, datums, stations, waterlines, buttock lines). Content here supports AMM procedures, fault isolation, and repair tasks that reference the reference grid, as well as **illustrated parts** and ground/inspection placards.

**Standards:** S1000D Issue 6.0 (XML, DMC/pmCode, DMRL, BREX, ACT), ASD-STE (controlled language), S2000M (spares), UTCS for provenance.

---

## Folder map (CSDB authoring → publish)
- **CSDB/**
  - **[DataModules](./CSDB/DataModules/)** — S1000D XML/MD sources
    - **[MAINTENANCE](./CSDB/DataModules/MAINTENANCE/)**  
      - **[06-10](./CSDB/DataModules/MAINTENANCE/06-10/)** (procedural / descriptive / fault isolation)
    - **[REPAIR](./CSDB/DataModules/REPAIR/)**  
      - **[06-10](./CSDB/DataModules/REPAIR/06-10/)**
    - **[IPD](./CSDB/DataModules/IPD/)** (Illustrated Parts Data sources)
    - **[COMMON-INFO](./CSDB/DataModules/COMMON-INFO/)** (CIR: warnings, standard notes, common tools/fluids)
    - **[APPLICABILITY/ACT](./CSDB/DataModules/APPLICABILITY/ACT/)** (Applicability Cross-Reference Table)
  - **Illustrations/ICN/**
    - **[master](./CSDB/Illustrations/ICN/master/)** (CGM/SVG source)
    - **[renditions](./CSDB/Illustrations/ICN/renditions/)** (web/pdf)
    - **[hotspots](./CSDB/Illustrations/ICN/hotspots/)** (overlays)
  - **[PublicationModules](./CSDB/PublicationModules/)**  
    - e.g. `PM-AMP360-AMM-06-10-STRUCT.xml`, `PM-AMP360-AMM-06-10-001.xml`
  - **[DMRL](./CSDB/DMRL/)** — working Data Module Requirements List
  - **[BREX](./CSDB/BREX/)** — BREX DM (filename **is a DMC**)
- **[WorkPackages](./WorkPackages/)** — executable task/job packages (JSON map → DMCs/ACT)
- **Outputs/**
  - **[PUBLISH](./Outputs/PUBLISH/)** — published AMM/SRM/IPD (PDF/Web/IETP)
  - **[Baselines](./Outputs/Baselines/)** — immutable snapshots (pm/ dms/ dmrl.xml/ checksum/ utcs-snapshot.json)
- **ExchangePackages/**
  - **[incoming](./ExchangePackages/incoming/)**, **[outgoing](./ExchangePackages/outgoing/)** (manifests, checksums, transmittals)
- **schemas/**
  - **[s1000d/xsd](./schemas/s1000d/xsd/)** · **[schematron](./schemas/s1000d/schematron/)** · **[brex-tests](./schemas/s1000d/brex-tests/)** · **[codelists](./schemas/s1000d/codelists/)**
  - **[utcs](./schemas/utcs/)** — UTCS JSON Schema
- **Governance/**
  - **[policies](./Governance/policies/)** (security, controlled-language, metadata)
  - **[kpi](./Governance/kpi/)** (publish/QA KPIs)
- **[utcs](./utcs/)** — UTCS entries for DMs/PMs/publishes

---

## Naming & coding (S1000D/UTCS)

### Data Module Code (examples, adjust ILC/IC/LC for your project)
- **Procedural AMM DM:**  
  `DMC-AMP360-AAA-06-10-00-00A-000A-A_en-001-00.xml`
- **Descriptive grid reference DM:**  
  `DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-00.xml`
- **Fault isolation DM:**  
  `DMC-AMP360-AAA-06-10-00-00A-04DA-A_en-001-00.xml`
- **BREX DM (businessRulesExchange):**  
  `DMC-AMP360-AAA-00-00-00-00A-BREX-A_en-001-00.xml` (filename **must** match the DMC in the XML)

### Publication Modules (no “PMC” suffix)
- Structure PM: `PM-AMP360-AMM-06-10-STRUCT.xml`  
- Instance PMs: `PM-AMP360-AMM-06-10-001.xml`, `PM-AMP360-IPD-06-10-001.xml`

### ICN (illustrations)
- Code in DM `graphicRef`, files under ICN:  
  `ICN-AMP360-AAA-06-10-DATUM-GRID-001.svg` (+ hotspot overlay if used)

### UTCS anchors (examples)
- DMRL: `UTCS-MI:AAA:CAS:06-10:DMRL:rev[A]`  
- BREX: `UTCS-MI:AAA:CAS:BREX:RULESET:rev[A]`  
- Publish baseline: `UTCS-MI:AAA:CAS:06-10:AMM:PUBLISH:2025-01-31:rev[1]`

---

## Quickstart (authors)

1. **Model applicability** in **[ACT](./CSDB/DataModules/APPLICABILITY/ACT/)** (MSN, config, effectivity).
2. Author DMs under **[MAINTENANCE/06-10](./CSDB/DataModules/MAINTENANCE/06-10/)** or **[REPAIR/06-10](./CSDB/DataModules/REPAIR/06-10/)**; **filename = DMC**.
3. Reuse **CIR** (warnings/notes/tools) from **[COMMON-INFO](./CSDB/DataModules/COMMON-INFO/)**.
4. Store figures in **ICN** (`master/` + `renditions/` + optional `hotspots/`); reference by **ICN code**.
5. Add/extend the **AMM PM** in **[PublicationModules](./CSDB/PublicationModules/)**.
6. Update **[DMRL](./CSDB/DMRL/)** to include new/changed DMs.
7. Run CI locally (XSD → Schematron → BREX → DMRL); fix any gating errors.
8. Publish to **[Outputs/PUBLISH](./Outputs/PUBLISH/)**; create a **Baseline** with checksums & **UTCS snapshot**.

---

## CI gates (must pass)
- **Filename = DMC**; `identAndStatusSection` fields present & valid (`responsiblePartnerCompany`, `security`, `issueInfo`, `qualityAssurance`).
- **XSD → Schematron → BREX** validation (Issue 6.0).
- **PMs reference DMCs** only; every referenced DMC appears in **DMRL**.
- **ACT** resolves all applicability calls; warn on **unused ACT rows**.
- **ICNs** in `graphicRef` exist (+ hotspots/renditions if referenced).
- **Baselines** are immutable; include `pm/`, `dms/`, `dmrl.xml`, `checksum/`, `utcs-snapshot.json`.

---

## Governance & policies
- **Controlled language:** ASD-STE profile → see **[controlled-language.yaml](./Governance/policies/controlled-language.yaml)**
- **Security & export:** required IDS metadata → **[security.yaml](./Governance/policies/security.yaml)**
- **Metadata completeness:** **[metadata.yaml](./Governance/policies/metadata.yaml)** (CI-enforced)

---

## Cross-references
- AAA Domain README → [`../../../../../../README.md`](../../../../../../README.md)  
- ATA 06 zone → [`../../../`](../../../)  
- Zone index (AAA ZONES) → [`../../../../`](../../../../)

---

## Notes (scope for 06-10)
Typical content includes:
- Datum definition, BL/WL/STA **grids** and **placards**
- **Measurement references** for jigs/fixtures/inspection
- **Clearance maps** derived from the reference frame
- IPD items for **reference placards** and **measuring points**

> CAS = **Continuous Airworthiness Services**. This tree is an S1000D-friendly **CSDB**; compliance is proven by XML correctness, validations (XSD/Schematron/BREX), applicability (ACT), and DMRL gating — not by folder names.

```

