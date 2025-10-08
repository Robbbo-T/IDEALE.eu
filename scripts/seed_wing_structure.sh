#!/usr/bin/env bash
set -Eeuo pipefail

# --------- CONFIG ---------
BASE="3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/PLM/CAD/ASSY/sub-assemblies/wing-structure"
# -------------------------

mkdir -p "$BASE"/{models,boms,icd,handling-and-lifting,fastener-schedules,tolerance-stackups,resolution-logs,thumbnails,utcs}

write_if_absent() {
  # Usage: write_if_absent path <<'EOF'
  #   ...content...
  # EOF
  local f="$1"
  shift || true
  if [[ -e "$f" ]]; then
    echo "skip (exists): $f"
    # consume heredoc on stdin if piped
    if [ -t 0 ]; then :; else cat >/dev/null; fi
  else
    mkdir -p "$(dirname "$f")"
    cat >"$f"
    echo "created: $f"
  fi
}

# ---- Root README ----
write_if_absent "$BASE/README.md" <<'EOF'
# Wing Structure – Sub-Assemblies

This subtree hosts PLM/CAD artifacts for the **wing-structure** assembly and its sub-assemblies.

## Directory map
- `models/` – Native CAD, neutral formats (STEP/IGES/JT), drawings
- `boms/` – Bills of Material (`*.csv`)
- `icd/` – Interface Control Documents (`*.md`)
- `fastener-schedules/` – Joint & fastener definition tables (`*.csv`)
- `tolerance-stackups/` – Stack-up calculations (`*.csv`)
- `handling-and-lifting/` – Handling, rigging, lifting guidance (`*.md`)
- `resolution-logs/` – Technical issue/decision logs (`*.csv`, `*.md`)
- `thumbnails/` – Lightweight previews/renders
- `utcs/` – Test/verification case definitions (YAML/MD)

## Naming conventions (suggested)
`<program>-<assy>-<subassy>-<component>_<rev>`  
Examples: `AMPEL360-WING-RIB-RIB05_A`, `AMPEL360-WING-SPAR-FS-PRIMARY_A`

> Keep heavy/binary data out of Git LFS-free repos; consider LFS for large CAD.
EOF

# ---- Git hygiene ----
write_if_absent "$BASE/.gitignore" <<'EOF'
# CAD/derivative cruft
*.tmp
*.bak
*.log
~$*
.DS_Store
Thumbs.db

# Analysis caches
**/__pycache__/
*.ipynb_checkpoints

# Exports / large renders (optional)
exports/
renders/
EOF

write_if_absent "$BASE/.gitattributes" <<'EOF'
# Treat common CAD/neutral formats as binary to avoid mangled diffs
*.stp  binary
*.step binary
*.igs  binary
*.iges binary
*.jt   binary
*.x_t  binary
*.x_b  binary
*.stl  binary
*.3mf  binary

# Native system formats (examples across platforms)
*.sldprt binary
*.sldasm binary
*.slddrw binary
*.ipt    binary
*.iam    binary
*.idw    binary
*.f3d    binary
*.prt    binary
*.asm    binary
*.dmg    binary
*.cgr    binary
*.catpart    binary
*.catproduct binary

# Drawings (often binary/structured)
*.dwg binary
# DXF can be text; if you prefer text diffs, comment the next line
*.dxf binary
EOF

# ---- models/ ----
write_if_absent "$BASE/models/README.md" <<'EOF'
# models/

Place native CAD, drawings, and neutral exports here. Suggested subfolders:
- `native/` – e.g., SolidWorks, NX, CATIA, Inventor, Fusion
- `neutral/` – STEP/IGES/JT/Parasolid
- `drawings/` – PDF/DXF/DWG for released prints

**Do not** check in autosave/backup files. Use release tags per PDM/PLM policy.
EOF
: > "$BASE/models/.gitkeep"  # lightweight placeholder

# ---- boms/ ----
write_if_absent "$BASE/boms/BOM-wing-structure.csv" <<'EOF'
WBS,Level,Part Number,Nomenclature,Qty,UoM,Material,Finish,Mass [kg],Source (Make/Buy),CAGE,Spec/STD,Drawing,CAD File,Notes
1.0,0,AMPEL360-WING-ASSY,WING STRUCTURE ASSY,1,EA,,,TBD,MAKE,,,AMPEL360-WING-ASSY.pdf,AMPEL360-WING-ASSY.step,Top-level assembly
1.1,1,AMPEL360-WING-SPAR-FS,FRONT SPAR,1,EA,AA 7xxx,TBD,TBD,MAKE,,,AMPEL360-WING-SPAR-FS.pdf,AMPEL360-WING-SPAR-FS.step,
1.2,1,AMPEL360-WING-SPAR-RS,REAR SPAR,1,EA,AA 7xxx,TBD,TBD,MAKE,,,AMPEL360-WING-SPAR-RS.pdf,AMPEL360-WING-SPAR-RS.step,
1.3,1,AMPEL360-WING-RIB-RIB05,RIB 05,1,EA,AA 2xxx,TBD,TBD,MAKE,,,AMPEL360-WING-RIB-RIB05.pdf,AMPEL360-WING-RIB-RIB05.step,
1.4,1,AMPEL360-WING-SKIN-UPPER,UPPER SKIN PANEL,1,EA,Composite,TBD,TBD,BUY,,,AMPEL360-WING-SKIN-UPPER.pdf,AMPEL360-WING-SKIN-UPPER.step,
EOF

# ---- icd/ ----
write_if_absent "$BASE/icd/wing-structure-ICD-template.md" <<'EOF'
# Interface Control Document (ICD) – Wing Structure

**Item:** AMPEL360 Wing Structure  
**Purpose:** Define, control, and baseline all interfaces to/from the wing-structure assembly.

## 1. Referenced Documents
- Drawings: …
- Specs/Standards: …
- Models: …

## 2. Coordinate Systems & Datums
- Global aircraft CS definition
- Wing local CS (origin, axes, handedness)
- Primary datums (A/B/C), setup/fixturing datums

## 3. Mechanical Interfaces
| Interface ID | Mates / Features | Location / CS | Allowables / Gaps | Fasteners / Spec | Notes |
|---|---|---|---|---|---|
| INT-WS-001 | Front spar to fuselage frame | … | … | … | … |

## 4. Systems Interfaces (if applicable)
- Electrical (harness routes, connectors, pinouts)
- Fluids (hydraulic/pneumatic lines, fittings)
- Sensors (AOA, strain gauges), brackets & clearances

## 5. Tolerances & Assembly Clearances
- Fit classes, hole classes, positional tolerances

## 6. Environment & Loads at Interface
- Temperature, vibration, icing, corrosion, fluids

## 7. Verification
- Inspections, gage methods, acceptance criteria

## 8. Change Control
- ICD Owner, baseline version, change history
EOF

# ---- fastener schedules ----
write_if_absent "$BASE/fastener-schedules/fastener-schedule-wing-structure.csv" <<'EOF'
Joint ID,Location/Station,Component A,Component B,Fastener Spec,Diameter,Grip/Length,Washer(s),Nut/Collar,Hole Class,Fit,Sealant/Adhesive,Torque [N·m],Torque Tolerance,Ref Drawing,Notes
J-WS-FS-001,STA 220 FS,FRONT SPAR,UPPER SKIN,NAS1100,4.0 mm,10 mm,NAS1149-CW,NAS1291,Close,Interference,PR1422,BY SPEC,±10%,DRW-WS-FAST-01,
J-WS-RS-002,STA 350 RS,REAR SPAR,RIB 05,MS20426,3/16 in,0.625 in,AN960-10L,MS21042-3,Std,Clearance,None,BY SPEC,±10%,DRW-WS-FAST-02,
EOF

# ---- tolerance stackups ----
write_if_absent "$BASE/tolerance-stackups/tolerance-stackup-template.csv" <<'EOF'
Stack ID,Feature / Requirement,Chain Path,Nominal,Upper Tol,Lower Tol,Method (Worst/RSS),Cpk Target,Contributors,Contributor Type,Variation Source,Calculated Result,Margin,Notes
TSU-WS-001,Spar-to-rib hole position,FS->RIB05->Skin,10.00,0.10,-0.10,RSS,1.33,"Machining FS; Machining RIB05; Drill-match",GeoTol,Process,0.12,-0.02,
EOF

# ---- handling & lifting ----
write_if_absent "$BASE/handling-and-lifting/handling-and-lifting-guidance.md" <<'EOF'
# Handling & Lifting – Wing Structure

> **Safety first:** Use approved rigging only. Verify CG, slings, and WLL per stress/ME sign-off.

## CG & Lift Points
- Provisional CG location: TBD (update from mass properties)
- Approved lift points: TBD (eyebolts/brackets PNs)

## Hardware
- Slings/Shackles: WLL ≥ 5× component weight
- Edge protection and softeners required on skins

## Procedures
1. Inspect lift points and hardware.
2. Attach slings; ensure equalized load.
3. Lift slowly; check for interference.
4. Use guide lines; no personnel under load.

## References
- Company Lifting Standard: …
- ASME B30.x (as applicable)
EOF

# ---- resolution logs ----
write_if_absent "$BASE/resolution-logs/issues-log.csv" <<'EOF'
ID,Title,Owner,Priority,Status,Opened (ISO),Due (ISO),Category,Reference/Link,Notes
ISS-WS-001,Confirm front spar material callout,Structures Lead,High,Open,2025-01-15,2025-01-22,Design,DRW-WS-SPAR-FS-A,Awaiting supplier data
EOF

# ---- thumbnails ----
write_if_absent "$BASE/thumbnails/.gitkeep" <<'EOF'
EOF

# ---- UT(C) test cases ----
write_if_absent "$BASE/utcs/utc-template.yaml" <<'EOF'
# Universal/Test Case Template – Wing Structure
test_case_id: UTC-WS-001
title: Fit check – RIB05 to FRONT SPAR
objective: Verify positional and clearance requirements per ICD for RIB05 to FS interface.
configuration:
  cad_model: AMPEL360-WING-RIB-RIB05_A
  drawing_ref: DRW-WS-RIB05-A
  tools:
    - CMM
    - Go/No-Go gauges
steps:
  - description: Locate datum features A/B/C on RIB05
  - description: Measure hole pattern vs. ICD INT-WS-001
  - description: Dry fit with FS and record gaps
acceptance_criteria:
  - "Positional tolerance ≤ 0.10 mm @ MMC"
  - "Edge margin ≥ 1.5×D"
evidence:
  - type: measurement_report
    file: to-be-added.pdf
status: Draft
EOF

# ---- convenience: quick index ----
write_if_absent "$BASE/INDEX.md" <<'EOF'
# Quick Index
- BOM: `boms/BOM-wing-structure.csv`
- ICD template: `icd/wing-structure-ICD-template.md`
- Fastener schedule: `fastener-schedules/fastener-schedule-wing-structure.csv`
- Tolerance stack-up: `tolerance-stackups/tolerance-stackup-template.csv`
- Issues log: `resolution-logs/issues-log.csv`
- Handling & lifting: `handling-and-lifting/handling-and-lifting-guidance.md`
- UT(C) template: `utcs/utc-template.yaml`
EOF

echo
echo "Wing Structure sub-assemblies seed created at: $BASE"

# Optional visual tree (if available)
if command -v tree >/dev/null 2>&1; then
  echo
  tree -a "$BASE" | sed 's/^/  /'
else
  echo
  echo "(tip) Install 'tree' to visualize. For now:"
  find "$BASE" -maxdepth 2 -type d -print | sed 's/^/  /'
fi
