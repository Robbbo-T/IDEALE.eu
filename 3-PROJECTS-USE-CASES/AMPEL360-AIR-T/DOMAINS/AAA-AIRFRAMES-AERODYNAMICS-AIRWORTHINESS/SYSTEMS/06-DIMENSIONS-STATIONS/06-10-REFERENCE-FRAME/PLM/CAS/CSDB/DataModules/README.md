# CSDB / DataModules — ATA 06-10 Reference Frame (S1000D Issue 6.0)

**Node:** SYSTEMS/06-DIMENSIONS-STATIONS/06-10-REFERENCE-FRAME → **PLM/CAS/CSDB/DataModules**
**Scope:** Aircraft reference frame, datums, stations, waterlines, buttock lines supporting AMM/SRM/IPD.
**Standards:** S1000D Issue 6.0 (XML, DMC/pmCode, DMRL, BREX, ACT) · ASD-STE · UTCS provenance.

---

## 1) Authoring folders (for this ATA 06-10 node)

```
DataModules/
├─ MAINTENANCE/
│  └─ 06-10/
│     ├─ procedural/         # AMM procedures (dmType="procedural")
│     ├─ descriptive/        # AMM descriptive/background (dmType="descriptive")
│     └─ fault-isolation/    # Fault isolation trees (dmType="faultIsolation")
├─ REPAIR/
│  └─ 06-10/
│     ├─ repair-schemes/     # SRM repair schemes
│     └─ damage-assessment/  # Damage limits/assessment
├─ IPD/
│  └─ 06-10/
│     └─ illustrated-parts-data/
├─ COMMON-INFO/              # CIR: shared warnings/notes/tools/materials
│  ├─ warnings/
│  ├─ standard-notes/
│  └─ common-materials/
└─ APPLICABILITY/
   └─ ACT/                   # Applicability Cross-Reference Table
```

> **Re-use first:** prefer **COMMON-INFO** items and **ACT** references over duplicating content.

---

## 2) Naming & coding (enforced by CI)

* **DM filename = DMC** (no free text).
* **DMC pattern** (project profile):
  `DMC-{PROD}-{DOMAIN}-{ATA}-{SNS}-{DIS}-{ITM}-{IC}-{ILC}_{LANG}_{ISSUE}-{INWORK}.xml`

  * `{ATA}-{SNS}` here = `06-10` for this node.
  * `{IC}/{ILC}` values and permitted dmTypes are governed by **BREX**.
* **Examples (placeholders for IC/ILC):**

  * Procedural AMM: `DMC-AMP360-AAA-06-10-00-00A-<IC>-<ILC>_en-001-00.xml`
  * Descriptive AMM: `DMC-AMP360-AAA-06-10-00-00A-<IC>-<ILC>_en-001-00.xml`
  * Fault isolation: `DMC-AMP360-AAA-06-10-00-00A-<IC>-<ILC>_en-001-00.xml`

> **IC/ILC** must match your **BREX** code lists in `../../schemas/s1000d/codelists/` and be allowed by the BREX DM.

---

## 3) Data Module Inventory (hyperlinkable)

> **Source of truth:** This list should be **generated from `../DMRL/dmrl.xml`** by CI. Until then, the curated set below uses project naming and points to expected file locations. Update DMRL in lockstep.

### 3.1 MAINTENANCE / 06-10 — **procedural** (`dmType="procedural"`)

* [DMC-AMP360-AAA-06-10-00-00A-040A-A_en-001-00.xml](./MAINTENANCE/06-10/procedural/DMC-AMP360-AAA-06-10-00-00A-040A-A_en-001-00.xml) — Establish aircraft reference frame (setup & verification)
* [DMC-AMP360-AAA-06-10-00-00A-040A-A_en-001-01.xml](./MAINTENANCE/06-10/procedural/DMC-AMP360-AAA-06-10-00-00A-040A-A_en-001-01.xml) — Verify station/waterline/buttock line reference points
* [DMC-AMP360-AAA-06-10-00-00A-040A-A_en-001-02.xml](./MAINTENANCE/06-10/procedural/DMC-AMP360-AAA-06-10-00-00A-040A-A_en-001-02.xml) — Install/replace reference placards and labels

> **Note:** `040A` used as a placeholder IC/ILC for servicing/setup; replace with project-approved codes per BREX.

### 3.2 MAINTENANCE / 06-10 — **descriptive** (`dmType="descriptive"`)

* [DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-00.xml](./MAINTENANCE/06-10/descriptive/DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-00.xml) — Reference frame overview and datum definitions
* [DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-01.xml](./MAINTENANCE/06-10/descriptive/DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-01.xml) — Station (STA), Waterline (WL), Buttock Line (BL) schemes
* [DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-02.xml](./MAINTENANCE/06-10/descriptive/DMC-AMP360-AAA-06-10-00-00A-00GA-A_en-001-02.xml) — Measurement references for jigs/fixtures/inspection

> **Note:** `00GA` used as placeholder IC/ILC for general description; replace per BREX.

### 3.3 MAINTENANCE / 06-10 — **fault isolation** (`dmType="faultIsolation"`)

* [DMC-AMP360-AAA-06-10-00-00A-04DA-A_en-001-00.xml](./MAINTENANCE/06-10/fault-isolation/DMC-AMP360-AAA-06-10-00-00A-04DA-A_en-001-00.xml) — Inaccurate dimensional readings — locate source of error
* [DMC-AMP360-AAA-06-10-00-00A-04DA-A_en-001-01.xml](./MAINTENANCE/06-10/fault-isolation/DMC-AMP360-AAA-06-10-00-00A-04DA-A_en-001-01.xml) — Discrepant reference points — verification decision tree

> **Note:** `04DA` used as placeholder IC/ILC for diagnostic/fault isolation; replace per BREX.

### 3.4 REPAIR / 06-10

* **repair-schemes**

  * [DMC-AMP360-AAA-06-10-00-00A-0RXA-A_en-001-00.xml](./REPAIR/06-10/repair-schemes/DMC-AMP360-AAA-06-10-00-00A-0RXA-A_en-001-00.xml) — Repair scheme — damaged reference placard
* **damage-assessment**

  * [DMC-AMP360-AAA-06-10-00-00A-0RDA-A_en-001-00.xml](./REPAIR/06-10/damage-assessment/DMC-AMP360-AAA-06-10-00-00A-0RDA-A_en-001-00.xml) — Damage assessment — datums/markers

> **Note:** `0RXA/0RDA` are placeholders; replace with approved IC/ILC for SRM content per BREX.

### 3.5 IPD / 06-10 — **illustrated-parts-data**

* [DMC-AMP360-AAA-06-10-00-00A-IPDA-A_en-001-00.xml](./IPD/06-10/illustrated-parts-data/DMC-AMP360-AAA-06-10-00-00A-IPDA-A_en-001-00.xml) — Illustrated parts data — reference placards and measuring points

> **Note:** `IPDA` is a placeholder; use the IPD information code mandated by your BREX.

### 3.6 COMMON-INFO (CIR)

* **warnings**

  * [DMC-AMP360-AAA-00-00-00-00A-WRNA-A_en-001-00.xml](./COMMON-INFO/warnings/DMC-AMP360-AAA-00-00-00-00A-WRNA-A_en-001-00.xml) — Standard warnings — measurement & laser safety
* **standard-notes**

  * [DMC-AMP360-AAA-00-00-00-00A-NTEA-A_en-001-00.xml](./COMMON-INFO/standard-notes/DMC-AMP360-AAA-00-00-00-00A-NTEA-A_en-001-00.xml) — Notes — units, tolerances, datum usage
* **common-materials**

  * [DMC-AMP360-AAA-00-00-00-00A-MATA-A_en-001-00.xml](./COMMON-INFO/common-materials/DMC-AMP360-AAA-00-00-00-00A-MATA-A_en-001-00.xml) — Materials & consumables — marking/cleaning

### 3.7 APPLICABILITY / ACT

* [DMC-AMP360-AAA-00-00-00-00A-ACTA-A_en-001-00.xml](./APPLICABILITY/ACT/DMC-AMP360-AAA-00-00-00-00A-ACTA-A_en-001-00.xml) — Applicability Cross-Reference Table (ACT)

> ⚠️ **Replace all placeholder IC/ILC tokens** (`040A`, `00GA`, `04DA`, `0RXA`, `0RDA`, `IPDA`, `WRNA`, `NTEA`, `MATA`, `ACTA`) with the exact values allowed by your BREX codelists. CI will enforce.

---

## 4) Cross-references you’ll need

* **ICNs (figures):** store artwork under `../Illustrations/ICN/{master,renditions,hotspots}` and reference by **ICN code** via `graphicRef` in the DM.
* **PMs:** book structures and instances live in `../PublicationModules/` and must reference **DMCs** (not file paths).
* **DMRL:** working list at `../DMRL/dmrl.xml` (copied into baselines on release).
* **BREX:** BREX DM (filename **is a DMC**) at `../BREX/`.
* **UTCS mirror:** write entries for each DM/PM at `../../utcs/index.json`.

---

## 5) Minimal DM skeleton (Issue 6.0)

> Replace placeholders; keep namespaces per your XSDs.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<dmodule xmlns:xlink="http://www.w3.org/1999/xlink"
         xmlns="http://www.s1000d.org/S1000D_6-0/xml_schema_flat"
         xlink:type="simple">
  <identAndStatusSection>
    <dmAddress>
      <dmIdent>
        <dmCode
          modelIdentCode="AMP360"
          systemDiffCode="AAA"
          systemCode="06"
          subSystemCode="10"
          subSubSystemCode="00"
          assyCode="00A"
          disassyCode="00"
          disassyCodeVariant="0"
          infoCode="XXXX"      <!-- per BREX -->
          infoCodeVariant="A"  <!-- per BREX -->
          itemLocationCode="A" />
        <language countryIsoCode="US" languageIsoCode="en"/>
        <issueInfo inWork="00" issueNumber="001"/>
      </dmIdent>
      <dmAddressItems>
        <issueDate year="2025" month="01" day="31"/>
        <responsiblePartnerCompany enterpriseCode="AAA"/>
      </dmAddressItems>
    </dmAddress>
    <dmStatus>
      <security securityClassification="01" commercialExportControl="false"/>
      <qualityAssurance qaResponsiblePartnerCompany="AAA" qaReviewed="true"/>
    </dmStatus>
  </identAndStatusSection>

  <content>
    <!-- your procedural/descriptive/faultIsolation content here -->
  </content>
</dmodule>
```

---

## 6) CI gates (must pass)

* Filename **matches DMC**; `identAndStatusSection` complete (`responsiblePartnerCompany`, `security`, `qualityAssurance`, `issueInfo`).
* Validates against **XSD**, **Schematron**, and **BREX**.
* **PMs** reference **DMCs only**; every referenced DMC exists in **DMRL**.
* **ACT** resolves all applicability references; warns on unused rows.
* Every `graphicRef` resolves to an **ICN** (and hotspot/rendition if referenced).
* UTCS entry exists/updated at `../../utcs/index.json`.

---

## 7) Glossary (terms & acronyms)

* **ACT (Applicability Cross-Reference Table):** A DM containing applicability keys and resolutions used by PMs/DMs to bind content to effectivity.
* **AMM (Aircraft Maintenance Manual):** Maintenance procedural and descriptive content used for on-aircraft tasks.
* **ASD-STE:** Controlled language standard (Simplified Technical English) used for clarity and consistency in text.
* **ATA:** Air Transport Association chapter/section coding (e.g., 06-10).
* **BREX (Business Rules Exchange):** A special DM that declares project/business rules (allowed elements, codes, constraints) that tools enforce.
* **CAS (Continuous Airworthiness Services):** The service documentation lane; here, implemented as an S1000D CSDB tree.
* **CSDB (Common Source Database):** Authoring repository of S1000D source DMs, PMs, ICNs, etc.
* **DMC (Data Module Code):** The unique identifier encoded in the DM filename and in `<dmCode>`; filenames **must equal** their DMC.
* **DMRL (Data Module Requirements List):** A list of DMs required/allowed for a publication or product configuration.
* **FI (Fault Isolation):** Diagnostic content guiding the maintainer to a fault cause via decisions/tests.
* **IC (Information Code):** Part of the DMC identifying the information type; constrained by BREX.
* **ICN (Illustration Control Number):** Identifier for graphics referenced from DMs.
* **ILC (Item Location Code):** Part of the DMC specifying where in the structure the information applies; constrained by BREX.
* **IETP (Interactive Electronic Technical Publication):** Published interactive format that consumes DMs/PMs.
* **IPD (Illustrated Parts Data):** Data modules that describe parts, figures, and callouts for spares.
* **Issue/InWork:** Versioning in `<issueInfo>` where `issueNumber` is the major release and `inWork` is the minor (draft) level.
* **IDS (identAndStatusSection):** Mandatory DM header with address, status, QA, and security metadata.
* **PM (Publication Module):** The book map/structure and its instances referencing DMCs to create a publication.
* **RPS:** Required parts/specifications section within certain DMs (term varies by program; governed by BREX).
* **S1000D:** International specification for technical publications using a modular, XML-based approach.
* **SRM (Structural Repair Manual):** Repair-focused data for damage assessment and repair schemes.
* **STE:** See ASD-STE.
* **UTCS (Unified Traceability & Control System):** Project-wide IDs that thread DMs/PMs/publications for provenance.

---

## 8) Useful links (relative)

* Publication Modules → `../PublicationModules/`
* DMRL → `../DMRL/dmrl.xml`
* BREX → `../BREX/`
* ICNs → `../Illustrations/ICN/`
* Schemas/Rules → `../../schemas/s1000d/{xsd,schematron,brex-tests,codelists}/`
* UTCS mirror → `../../utcs/index.json`

---

### 9) Keep this list in sync (optional CI snippet)

Mark this README section between markers and let CI rewrite it from DMRL:

```
<!-- DM-INVENTORY:BEGIN -->
... auto-generated list goes here ...
<!-- DM-INVENTORY:END -->
```

Scripts read `../DMRL/dmrl.xml`, resolve DMCs to relative paths, and regenerate the list. Commit fails if drift is detected.

