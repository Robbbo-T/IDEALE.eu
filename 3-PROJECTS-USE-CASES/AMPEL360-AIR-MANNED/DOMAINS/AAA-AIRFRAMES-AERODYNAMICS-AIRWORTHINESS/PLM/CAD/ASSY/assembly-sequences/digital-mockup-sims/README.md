# Digital Mockup Simulations (DMU)

This directory contains CAD animation sequences, rendered videos, and simulation reports validating assembly processes for the **AMPEL360-AIR-T** BWB aircraft.

## UTCS YAML Records for DMU

Use the `./utcs/` subfolder to store the canonical UTCS (UiX Threading Context/Content/Cache and Structure/Style/Sheet) YAML records for **artifacts in this directory**. These records are the traceability anchors that:
1. **Anchor geometry** revisions of input assemblies/tooling used in each DMU run.
2. Capture the canonical **TFA flow** (`QS→FWD→UE→FE→CB→QB`) and the **primary DMU loop** (`CB→UE`, coordinated via **FE**).
3. Record **provenance** (analyst, validation date) and link interference lists to `resolution-logs/` entries.

## Purpose

The digital-mockup-sims directory serves as the central repository for:

- **DMU animation sequences** showing step-by-step assembly motions and component paths
- **Interference detection reports** identifying collisions and clearance violations
- **Tool access simulations** validating fixture reach and ergonomic considerations
- **Assembly validation videos** for training and procedure review
- **UTCS-anchored evidence** of validated assembly processes

## Contents Overview

### Simulation Types

1. **Major Join Sequences**
   - Center body to wing mating simulations
   - Fuselage section assembly animations
   - Visualization of large component positioning and alignment

2. **System Installation Paths**
   - Main duct insertion through center body
   - Landing gear installation motion
   - Engine/propulsion system integration paths
   - Electrical harness routing visualization

3. **Tool Access Studies**
   - Crane and AGV (Automated Guided Vehicle) path planning
   - Fixture positioning and reach validation
   - Worker access and ergonomic analysis
   - Tooling interference checks

4. **Kinematic Simulations**
   - Control surface deployment and rigging
   - Landing gear extension/retraction validation
   - Door and panel operation clearances
   - Mechanism travel validation

5. **Interference Analysis**
   - Static interference detection between components
   - Dynamic clearance analysis during motion
   - Tolerance variation impact studies
   - Service access validation

## File Naming Conventions

**DMU artifacts:** `ASM-AAA-{ZONE}-DMU-{IDX}.{ext}`  
**UTCS YAML (in `./utcs/`):** `ASM-AAA-{ZONE}-DMU-{IDX}.yaml`

- `{ZONE}` = `ONB` (onboard/internal) or `OUT` (outboard/external)  
- `{IDX}` = 4-digit serial (`0001`, `0150`, …)

Examples:
- `ASM-AAA-ONB-DMU-0001.mp4` — Center body to wing join animation video
- `ASM-AAA-ONB-DMU-0001.md` — Simulation report and validation summary
- `ASM-AAA-ONB-DMU-0015.pdf` — ECS duct installation interference report
- `ASM-AAA-OUT-DMU-0042.avi` — Outer wing panel assembly sequence

## Expected File Types

- `.mp4`, `.avi`, `.mov` — Rendered animation videos
- `.md` — Simulation reports and validation summaries
- `.pdf` — Interference reports, clearance analysis documents
- `.json` — Simulation metadata, interference lists, kinematic data
- `.csv` — Clearance measurements, interference coordinates
- `.step`, `.stp` — DMU assembly snapshots at key states
- `.jpg`, `.png` — Screenshots of key assembly states or interferences
- `.pptx`, `.pdf` — Presentation materials for design reviews

## Software and Tools (Abbreviated)

- **CAD/DMU Platforms:** CATIA V5/V6, Siemens NX, Dassault 3DEXPERIENCE, PTC Creo.
- **Rendering & Visualization:** KeyShot, Blender, Unity/Unreal.
- **Analysis Tools:** CATIA DMU Space Analysis, 3DCS Variation Analyst, Process Simulate.

## TFA Context

DMU simulations adhere to the canonical TFA flow: **QS→FWD→UE→FE→CB→QB**.

- **QS** — Global context (geometry revs, rule sets, fixtures) threaded via UTCS.
- **FWD** — Predictive analyses (cycle time, access/ergonomics risk, queueing impacts).
- **UE** — Deterministic clash-free snapshots at gates (as-planned / as-built).
- **FE** — Orchestration across subsystems (join sequence vs. system installs).
- **CB** — Clearance/tool-access constraint enforcement during simulation.
- **QB** — Optional optimization for dense schedule/sequence or parameter sweeps.

> **Primary DMU loop:** **CB → UE** with **FE** coordination, recorded under UTCS.

## Required Artifacts

Each DMU simulation must include:

| Artifact | Format | UTCS Reference Pattern | Status |
| :--- | :--- | :--- | :---: |
| Animation Video | `.mp4` or `.avi` | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:v{X}` | 🔄 |
| Simulation Report | `.md` or `.pdf` | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:REPORT:v{X}` | 🔄 |
| Interference List | `.json` or `.csv` | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:INTERF:v{X}` | 🔄 |
| Clearance Report | `.pdf` or table | `UTCS-MI:ASM:DMU:{DESC}:{IDX}:CLEAR:v{X}` | 🔄 |
| DMU Assembly Model | `.step` or native | `UTCS-MI:CAD:AAA:ASSY:{ASSY_CODE}:rev{X}` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## CI Validation

CI verifies that each UTCS YAML in `./utcs/`:
1. Includes `bridge: "QS→FWD→UE→FE→CB→QB"` and `primary_path: "CB→UE"`.
2. Validates the `content_hash` of the associated DMU file.
3. References a valid `ethics_guard` (MAL-EEM) when applicable.

## Example UTCS IDs

| UTCS ID Pattern | Anchored Artifact Type |
|:-------------------------------------------------|:----------------------------------------------------------------|
| `UTCS-MI:ASM:DMU:WING-JOIN:0012:v2` | DMU animation video (`.mp4`) and report (`.md`) |
| `UTCS-MI:ASM:DMU:LG-CYCLE:0045:INTERF:v1` | Dynamic clash list (`.csv`) for landing-gear retraction |
| `UTCS-MI:CAD:AAA:ASSY:57-10:revC` | Clash-free assembly snapshot (`.step`) |

## Simulation Workflow, Quality Criteria, and Governance

*(Sections covering workflow, quality criteria, standards, and governance follow the detailed content provided previously.)*

---

## Directory Index (Hyperlinkable)

| Folder | Description |
| :--- | :--- |
| [Current Folder (`./`)](#) | Master DMU reports, validation summaries, and top-level simulation definitions. |
| [`utcs/`](./utcs/) | Canonical UTCS YAML records for all DMU artifacts in this directory. |
| [`thumbnails/`](./thumbnails/) | Visual previews or key frame images associated with DMU simulations. |
| [`major-join-sequences/`](./major-join-sequences/) | Simulations detailing the critical mating of main airframe sections. |
| [`system-installation-paths/`](./system-installation-paths/) | DMU models validating the installation path of large, complex systems. |
| [`tool-access-studies/`](./tool-access-studies/) | Simulations checking jig, fixture, crane, and AGV clearances during assembly. |
| [`kinematic-simulations/`](./kinematic-simulations/) | Dynamic simulations checking control surface and gear movement feasibility. |
| [`interference-analysis/`](./interference-analysis/) | Detailed reports and outputs from static and dynamic clash detection runs. |
| [`resolution-logs/`](./resolution-logs/) | Mapping of DMU findings to ECR/Deviation approvals. |
| [`simulation-reports/`](./simulation-reports/) | Detailed technical reports summarizing methodology and validation results. |

## Related Directories

- `../../../../assembly-sequences/major-section-joins/` — Major join sequences validated by DMU  
- `../../../../assembly-sequences/system-installation-steps/` — System installs requiring DMU validation  
- `../../../../assembly-sequences/tool-access-plans/` — Tooling and fixture access plans  
- `../../../../assembly-sequences/tolerance-stackups/` — Tolerance impacts on DMU clearances  
- `../PRT/` — Component part models used in DMU (sibling of `ASSY/`)  
- `../../../CAM/FIX/` — Fixture designs modeled in DMU
