# CAD Rules — AAA · 06-DIMENSIONS-STATIONS · 06-00-GENERAL

**Path:** `3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/SYSTEMS/06-DIMENSIONS-STATIONS/06-00-GENERAL/PLM/CAD/`
**Scope:** Mandatory CAD conventions for **dimensions, stationing, and coordinate references** across AAA artifacts. Applies to parts, assemblies, and drawings stored under this `CAD/` node. Supersedes local team habits.

---

## 1) Coordinate & Station Reference System (CSR)

**Global coordinate frame (GCF):**

* **X**: forward
* **Y**: right (starboard)
* **Z**: up

**Primary datum scheme (default):**

* **Datum A (DTA-A):** intersection of **STA 0 / BL 0 / WL 0**.
* **Datum B (DTA-B):** plane **BL 0** (aircraft centerline).
* **Datum C (DTA-C):** plane **WL 0** (reference waterline).

**Stationing definitions:**

* **STA** (Station): linear coordinate along +X from **STA 0** in **millimetres**.
* **BL** (Buttock Line): lateral offset along ±Y from **BL 0** (centre). Right side is **+BL**.
* **WL** (Water Line): vertical offset along +Z from **WL 0** (baseline).

**Model origin and axes:**

* Place the **part local CS origin** at a functional datum or interface CS that is rigidly definable from A/B/C.
* Assemblies must carry a **GCF** at the root level named `GCF_AAA06`.
* Do not mirror solids; use pattern/assembly symmetry. Negative scales are **forbidden**.

---

## 2) Units, Precision, and Tolerances

* **Units:** length **mm**, angle **deg**, mass **kg**.
* **Modeler tolerance/accuracy:** ≤ **0.01 mm** absolute; angular grid ≤ **0.05°**.
* **Default dimensional tolerances** (unless a drawing or spec states otherwise):

  * Machined: **±0.10 mm**
  * Sheet/formed: **±0.30 mm**
  * Weldment overall: **±0.50 mm**
  * Hole positional (true position, RFS): **Ø0.20 mm** (AAP-fit features may be tighter)

Include geometric tolerancing using ISO 1101 / ASME Y14.5 consistently; select one per project and state it in **Section 9 metadata**.

---

## 3) Mandatory CAD Folder Layout (under `CAD/`)

```
CAD/
├─ parts/              # Native part models
├─ assemblies/         # Native assembly models
├─ drawings/           # 2D drawings (native + PDF/A)
├─ templates/          # Start parts, title blocks, datum macros
├─ exports/            # Neutral formats & viewables
│  ├─ step/            # STEP AP242
│  ├─ jt/              # JT visualization
│  └─ pdf/             # 2D PDFs & 3D PDFs if used
├─ checks/             # Model-check logs, QA reports
├─ materials/          # Material cards, allowables snapshots
└─ refs/               # Coordinate frames, station maps, CS macros
```

Directories are **fixed**; do not introduce ad-hoc subfolders.

---

## 4) File Types & Deliverables

* **Native 3D:** repository-standard CAD (per domain PLM policy).
* **Exchange:** **STEP AP242** (`*.stp`/`*.step`) with PMI when model-based definition is authoritative.
* **Visualization:** **JT** (`*.jt`).
* **2D release:** **PDF/A-2b**.
* **Mass properties:** CSV export with part number, rev, density, mass, CG (X/Y/Z in GCF), MoI (Ixx…Izz).

**Release set (per item):**

* `exports/step/<part-number>__r<rev>.step`
* `exports/jt/<part-number>__r<rev>.jt`
* `drawings/<drawing-number>__r<rev>.pdf` (if drawing-led)
* `exports/pdf/<model-number>__bom__r<rev>.pdf` (assembly BOM, optional)
* `exports/step/<assembly-number>__r<rev>.step` (if assembly released)

---

## 5) Naming & Numbering

**UTCS anchor (AIR-T canonical):**
`UTCS: AIR.ATA.06-DIMENSIONS-STATIONS.GENERAL.<ComponentOrAssembly>:REV-<X>`

**File names:**

```
<part-number>__<short-name>__r<rev>.<ext>
<asm-number>__<short-name>__r<rev>.<ext>
<drw-number>__<short-name>__r<rev>.pdf
```

**Part/assembly numbering pattern (fixed):**

```
AAA06-00-YY-#### 
```

* `AAA`  = domain
* `06`   = chapter
* `00`   = GENERAL subsection
* `YY`   = sub-subsystem code per AAA deck (e.g., 01 Primary elements, 02 Secondary…)
* `####` = sequential item code (0001…9999)

Example: `AAA06-00-01-0042` → AAA / STA & stations / GENERAL / **Primary elements** / item 42.

---

## 6) Required CAD Attributes (populate in native model)

| Attribute                     | Value format / rule                                        |                                             |           |
| ----------------------------- | ---------------------------------------------------------- | ------------------------------------------- | --------- |
| `PartNumber`                  | `AAA06-00-YY-####`                                         |                                             |           |
| `Description`                 | Clear noun–modifier phrase (≤ 80 chars)                    |                                             |           |
| `Domain`                      | `AAA`                                                      |                                             |           |
| `Chapter`                     | `06`                                                       |                                             |           |
| `Section`                     | `00-GENERAL`                                               |                                             |           |
| `YYCode`                      | `01..20` (see Section 8)                                   |                                             |           |
| `UTCS`                        | `AIR.ATA.06-DIMENSIONS-STATIONS.GENERAL.<Item>:REV-<X>`    |                                             |           |
| `Material`                    | Controlled list (materials/ folder); include spec + temper |                                             |           |
| `Finish`                      | Controlled list; include coating thickness if relevant     |                                             |           |
| `Mass`                        | kg (auto from model)                                       |                                             |           |
| `CG_X/Y/Z`                    | mm in **GCF**                                              |                                             |           |
| `MoI_Ixx/Iyy/Izz/Ixy/Ixz/Iyz` | kg·mm² in **GCF**                                          |                                             |           |
| `Units`                       | `mm, deg, kg`                                              |                                             |           |
| `Owner`                       | Team or role; avoid personal names                         |                                             |           |
| `LifecycleState`              | `DRAFT                                                     | IN_REVIEW                                   | RELEASED` |
| `ComplianceSet`               | `ISO 1101                                                  | ASME Y14.5` and referenced CSR spec version |           |

Attributes are **mandatory** for release. CI will block missing or malformed values.

---

## 7) Model Quality Rules

* **No broken external references**; assemblies resolve with **relative** paths.
* Delete construction junk (unused sketches/CS) before review.
* **Threaded features** use standard libraries; do not custom-sketch threads.
* **Draft & fillets**: final dressing features placed **after** functional geometry.
* **No negative bodies** (boolean subtract) that mask design intent unless documented in `Description`.
* **No mirrored solids**; use pattern/assembly symmetry.
* **Mass properties** must match specification within:

  * Part mass **±1%**, Assembly mass **±0.5%** (vs. DELs/Calc).
* **Check reports**: place model-check log into `checks/` on every PR.

---

## 8) YY Sub-Subsystem Codes for `06-00-GENERAL` (AAA Deck A)

Use **exactly** these YY codes when creating sub-subsystem folders and numbers:

| YY | Sub-subsystem label                |
| -- | ---------------------------------- |
| 01 | Primary elements                   |
| 02 | Secondary elements                 |
| 03 | Joints & fasteners                 |
| 04 | Mechanisms & hinges                |
| 05 | Kinematics & alignment             |
| 06 | Loads & environments               |
| 07 | Materials & processes              |
| 08 | Thermal interfaces & isolation     |
| 09 | Contamination & cleanliness        |
| 10 | Safety & hazard controls           |
| 11 | Sensors & instrumentation          |
| 12 | Control & actuation interfaces     |
| 13 | Harness routing & connectors       |
| 14 | Manufacturing process plans        |
| 15 | Inspection & NDI                   |
| 16 | Verification & qualification tests |
| 17 | Reliability, FMEA, FTA             |
| 18 | Compliance evidence                |
| 19 | Logistics, handling & packaging    |
| 20 | MGSE/tooling & fixtures            |

**Folder example (fixed grammar):**
`06-DIMENSIONS-STATIONS/06-00-GENERAL/06-00-11-SENSORS-INSTRUMENTATION/…`
BEZ lives under the **YY** folder (not at `06-00-GENERAL/`).

---

## 9) Drawing Rules (2D)

* Title block carries **PartNumber**, **Description**, **Units**, **Datum schema**, **UTCS**, **Rev**.
* Dimensions are **true length in CSR**; avoid dual dimensions.
* Use **basic dimensions** with GD&T for interfaces; tolerance on non-critical dims per §2.
* Every drawing release generates a **PDF/A-2b** in `drawings/` with the naming pattern in §5.

---

## 10) Version Control & CI

* Track binaries via **Git LFS**: `*.step, *.stp, *.jt, *.3mf, *.igs, *.iges, *.pdf`.
* PR checks enforce: attribute completeness, unit system, CSR presence, file naming, mass-property CSV in `exports/`.
* Release tags mirror **LifecycleState = RELEASED** and bump **REV**.

---

## 11) Cross-References

* **DELs/**: mass-property reports, interface control notes for station maps.
* **PAx/**: ONB/OUT packaging rules (e.g., neutral export with CS definitions).
* **PLM/**: sibling `CAE/` maintains load cases for §6; keep IDs consistent with CAD attributes.
* **policy/**: CSR specification document ID `AAA-CSR-06`.

---

## 12) Examples (normative)

* **UTCS anchor:** `AIR.ATA.06-DIMENSIONS-STATIONS.GENERAL.PRIMARY-ELEMENTS:REV-A`
* **Part file:** `AAA06-00-01-0042__primary-frame-A__rA.step`
* **Assembly file:** `AAA06-00-12-0007__interface-bracket-asm__rC.step`
* **Drawing file:** `AAA06-00-03-0120__fastener-map__rB.pdf`

---

## 13) Change Log (this README)

* **v1.0** — Initial release. Enforces CSR, YY codes, UTCS anchors, CI checks, and deliverable set for AAA/06-00 CAD.
