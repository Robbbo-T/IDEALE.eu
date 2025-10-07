---

id: ASIT-AMPEL360-AIR-T-AAA-KIN-THUMB
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/kinematics/thumbnails/README.md
llc: SYSTEMS
classification: INTERNAL–EVIDENCE-REQUIRED
version: "1.0.0"
release_date: 2025-10-07
maintainer: "AAA Integration Team"
bridge: "QS→FWD→UE→FE→CB→QB"
ethics_guard: MAL-EEM
utcs_mi: v5.0
canonical_hash: "TBD"

---

# Thumbnails — Kinematics/AAA

## Purpose

This folder contains **visual previews and key frame images** associated with MBD (Multi-Body Dynamics) simulations for the **AMPEL360‑AIR‑T** kinematics domain, providing quick visual reference for kinematic studies.

## Contents

* **Key frame images** — Representative snapshots of mechanism positions during motion
* **Animation previews** — Thumbnail animations showing complete motion cycles
* **Position sequences** — Multi-frame sequences showing critical positions
* **Clearance visualizations** — Images highlighting clearance margins
* **Issue documentation** — Visual documentation of kinematic problems and resolutions

## Naming Convention

Files follow the pattern: `KIN-AAA-{ZONE}-{KIND}-{IDX}-{FRAME}.{ext}`

* `{ZONE}` ∈ `{ONB|OUT}` — Onboard (internal) or Outboard (external)
* `{KIND}` ∈ `{SURF|GEAR|DOOR|JOINT|ACT|ROM|ENV}`
* `{IDX}` = 4‑digit serial number
* `{FRAME}` = Frame identifier (e.g., `retracted`, `extended`, `mid`, `t0`, `t50`, `t100`)
* `{ext}` = File extension (png, jpg, gif, mp4)
* Examples:
  * `KIN-AAA-OUT-SURF-0001-neutral.png` — Control surface in neutral position
  * `KIN-AAA-OUT-SURF-0001-max-up.png` — Control surface at maximum up deflection
  * `KIN-AAA-ONB-GEAR-0001-retracted.png` — Landing gear fully retracted
  * `KIN-AAA-ONB-GEAR-0001-extended.png` — Landing gear fully extended
  * `KIN-AAA-ONB-GEAR-0001-cycle.gif` — Landing gear retraction/extension animation

## Image Types

### Static Images (PNG/JPG)
* **Position snapshots** — Mechanism at specific positions
* **Clearance views** — Highlighting clearance margins
* **Assembly views** — Context showing mechanism in aircraft
* **Detail views** — Close-up of critical features

### Animations (GIF/MP4)
* **Full cycle** — Complete motion from start to end
* **Key events** — Critical phases of motion (door opening, gear lock engagement)
* **Multi-view** — Simultaneous views from multiple angles
* **Clearance sweep** — Showing envelope vs. structure throughout motion

## Image Specifications

* **Resolution:** Minimum 1920x1080 for static images
* **Format:** PNG for technical diagrams, JPG for rendered views
* **Animation:** GIF for short loops (< 5 seconds), MP4 for longer sequences
* **Frame rate:** 30 fps for animations
* **Compression:** Balanced quality vs. file size for repository storage

## Organization

Thumbnails are organized to match the source artifact structure:

```
thumbnails/
├── control-surface-models/
│   ├── KIN-AAA-OUT-SURF-0001-*.png
│   └── KIN-AAA-OUT-SURF-0002-*.png
├── landing-gear-cycles/
│   ├── KIN-AAA-ONB-GEAR-0001-*.png
│   └── KIN-AAA-ONB-GEAR-0001-cycle.gif
├── door-mechanisms/
│   └── KIN-AAA-ONB-DOOR-0001-*.png
└── envelopes-vs-structure/
    └── KIN-AAA-OUT-ENV-0001-clearance.png
```

## Key Frames

Standard key frame identifiers for common mechanisms:

### Control Surfaces
* `neutral` — Surface at 0° deflection
* `max-up` — Maximum upward deflection
* `max-down` — Maximum downward deflection
* `mid-up` — Mid-range upward position
* `mid-down` — Mid-range downward position

### Landing Gear
* `retracted` — Fully retracted in bay
* `extended` — Fully extended and locked
* `mid-transit` — Mid-retraction position
* `test-position` — Test or maintenance position

### Doors
* `closed` — Door fully closed and sealed
* `open` — Door fully open
* `mid-open` — Door mid-swing position
* `emergency-open` — Emergency egress position

## UTCS Integration

Thumbnails are referenced in UTCS records via the Cache section:

```yaml
Threading:
  Cache:
    thumbnails:
      - path: ./thumbnails/control-surface-models/KIN-AAA-OUT-SURF-0001-neutral.png
        description: "Aileron neutral position"
      - path: ./thumbnails/control-surface-models/KIN-AAA-OUT-SURF-0001-max-up.png
        description: "Aileron maximum up deflection"
      - path: ./thumbnails/control-surface-models/KIN-AAA-OUT-SURF-0001-cycle.gif
        description: "Aileron full travel animation"
```

## Cross-References

* **Control Surface Models** — Source kinematics for control surface images
* **Landing Gear Cycles** — Source kinematics for landing gear images
* **Door Mechanisms** — Source kinematics for door images
* **Envelopes vs. Structure** — Source clearance analysis for visualization
* **UTCS Records** — UTCS YAML files referencing thumbnails

## Status

🔄 In Progress — Thumbnail library under development

---

**Related:** [Kinematics README](../README.md) · [UTCS Records](../utcs/) · [ROM Reports](../rom-reports/)
