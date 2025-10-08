# BREX — Business Rules Exchange (S1000D Issue 6.0)

**Node:** SYSTEMS/06-DIMENSIONS-STATIONS/06-10-REFERENCE-FRAME → **PLM/CAS/CSDB/BREX**
**Purpose:** Define **project/business rules** that all Data Modules (DMs) and Publication Modules (PMs) must satisfy.

> BREX is itself a **Data Module** (`dmType="businessRulesExchange"`). Its **filename must equal its DMC**, and every authored DM must reference it via `brexDmRef`.

---

## Files in this folder

* **Current BREX DM (example):**
  `[./DMC-AMP360-AAA-00-00-00-00A-000A-A_en-US_001-00.xml](./DMC-AMP360-AAA-00-00-00-00A-000A-A_en-US_001-00.xml)`

  * *Note:* The tokens `infoCode`, `infoCodeVariant`, and `itemLocationCode` must be valid per this BREX; the literal string `BREX` is **not** an information code.
* Optional support files (for maintainers):
  `./README.md` (this file) · `./CHANGELOG.md` (rule history)

> Do **not** include the BREX DM in PMs or user publications. It is an **authoring control** artifact.

---

## How authored DMs reference BREX

Each DM includes a `brexDmRef` in the **IDS**. Replace values with your actual BREX DMC.

```xml
<dmodule xmlns="http://www.s1000d.org/S1000D_6-0/xml_schema_flat"
         xmlns:xlink="http://www.w3.org/1999/xlink">
  <identAndStatusSection>
    <dmAddress>
      <dmIdent>
        <dmCode modelIdentCode="AMP360" systemDiffCode="AAA" systemCode="06" subSystemCode="10"
                subSubSystemCode="00" assyCode="00A" disassyCode="00" disassyCodeVariant="0"
                infoCode="040A" infoCodeVariant="A" itemLocationCode="A"/>
        <language languageIsoCode="en" countryIsoCode="US"/>
        <issueInfo issueNumber="001" inWork="00"/>
      </dmIdent>
    </dmAddress>
    <dmStatus>
      <brexDmRef>
        <dmRef>
          <dmRefIdent>
            <dmCode modelIdentCode="AMP360" systemDiffCode="AAA" systemCode="00" subSystemCode="00"
                    subSubSystemCode="00" assyCode="00A" disassyCode="00" disassyCodeVariant="0"
                    infoCode="000A" infoCodeVariant="A" itemLocationCode="A"/>
            <language languageIsoCode="en" countryIsoCode="US"/>
            <issueInfo issueNumber="001" inWork="00"/>
          </dmRefIdent>
        </dmRef>
      </brexDmRef>
    </dmStatus>
  </identAndStatusSection>
  <content/>
</dmodule>
```

---

## Rule Catalog (high level)

These categories must be **declared in the BREX DM** and are generally **enforced by Schematron**:

1. **DMC filename pattern**
   Pattern (project profile):
   `DMC-AMP360-AAA-{ATA}-{SNS}-00-00A-{IC}-{ILC}_{LANG}-{ISSUE}-{INWORK}.xml`

   * Filename **must equal** `<dmCode>` in the DM (1:1 parity)
   * `{ATA}-{SNS}` is `06-10` for this node

2. **IDS completeness**
   Require presence/values for:
   `responsiblePartnerCompany[@enterpriseCode]`, `security[@securityClassification]`, `qualityAssurance`, `issueInfo`, `language`.

3. **Enumerations (code lists)**
   Allow only values from `../../schemas/s1000d/codelists/` for:
   languages, countries, units, security classes, verification types, information codes (IC), item location codes (ILC).

4. **Quality assurance**
   Require a verification record (program-specific) or `qaReviewed="true"` and QA enterprise code.

5. **ICN references**
   `graphicRef` must resolve to an **ICN** present under `../Illustrations/ICN/` and, if referenced, hotspot/rendition must exist.

6. **PM referencing discipline**
   PMs may reference **DMCs only** (not file paths). Any PM DMC must appear in `../DMRL/dmrl.xml`.

7. **UTCS anchoring (project extension)**
   UTCS is **project-specific**, not part of S1000D. Declare a rule in BREX that each DM/PM shall carry a UTCS anchor in IDS **extension**, and enforce via Schematron. Example namespace/pattern is documented below.

---

## UTCS enforcement (via BREX + Schematron)

Add a project extension namespace and assert a pattern. BREX declares *that* UTCS is required; Schematron implements *how* it is checked.

**DM header extension (example):**

```xml
<identAndStatusSection xmlns:utcs="urn:AAA:utcs">
  ...
  <extension>
    <utcs:anchor>UTCS-MI:AAA:CAS:06-10:DMC-AMP360-...:rev[1]</utcs:anchor>
  </extension>
</identAndStatusSection>
```

**Schematron rule (example):**

```xml
<sch:pattern id="utcs-anchor">
  <sch:rule context="s1000d:dmodule/s1000d:identAndStatusSection/s1000d:extension/utcs:anchor">
    <sch:assert test="matches(normalize-space(.), '^UTCS-MI:[A-Z]{3}:(CAS|SYS):[0-9]{2}-[0-9]{2}:.+:rev\\[[0-9A-Za-z\\.]+\\]$')">
      UTCS anchor missing or invalid against project pattern.
    </sch:assert>
  </sch:rule>
</sch:pattern>
```

> CI must also reconcile each `utcs:anchor` with entries in `../../utcs/index.json` and in release baselines.

---

## Validation workflow (CI)

1. **XSD** → XML structure (schemas in `../../schemas/s1000d/xsd/`)
2. **Schematron** → cross-DM rules (in `../../schemas/s1000d/schematron/`)
3. **BREX checks** → project rules (this DM + `../../schemas/s1000d/brex-tests/`)
4. **DMRL gating** → PMs can only use DMs listed in `../DMRL/dmrl.xml`

**Failure mode:** Block merge/publish when any rule fails; emit actionable messages including **BREX Rule IDs**.

---

## Rule identifiers (for clear CI messages)

Use stable IDs in the BREX DM and reuse them in Schematron `@id` values:

* `BREX-DMC-001` — Filename = DMC 1:1
* `BREX-IDS-002` — Require `responsiblePartnerCompany` with enterprise code `AMP360`
* `BREX-SEC-003` — Security classification in approved range `01..05`
* `BREX-QA-004` — Require QA review/verification
* `BREX-LANG-005` — Language/country codes from codelist
* `BREX-UTCS-006` — UTCS anchor present and matches pattern

---

## Change control

When modifying rules:

1. Edit the BREX DM XML
2. Increment `<issueInfo>` (issue/inWork) and update `<issueDate>`
3. Append rationale to the DM history and `./CHANGELOG.md`
4. Re-run CI on representative DMs/PMs before merge

---

## Related

* `../DMRL/` — Data Module Requirements List (source of truth for PM scope)
* `../../schemas/s1000d/{xsd,schematron,brex-tests,codelists}/` — schemas and rule assets
* `../../Governance/policies/{metadata.yaml,security.yaml,controlled-language.yaml}` — governance enforced by BREX
* `../../utcs/index.json` — UTCS mirror for DMs/PMs/baselines

---

## Glossary (BREX context)

* **BREX:** Business Rules Exchange data module declaring project/business constraints
* **DM / DMC:** Data Module / Data Module Code (also the filename)
* **DMRL:** Data Module Requirements List used to gate publications
* **IDS:** identAndStatusSection — mandatory header metadata in every DM
* **IC / ILC:** Information Code / Item Location Code — parts of the DMC
* **PM:** Publication Module — book map referencing DMCs
* **Schematron:** Rule-based XML validation language used to implement BREX checks
* **UTCS:** Unified Traceability & Control System — project traceability anchors enforced via extension

