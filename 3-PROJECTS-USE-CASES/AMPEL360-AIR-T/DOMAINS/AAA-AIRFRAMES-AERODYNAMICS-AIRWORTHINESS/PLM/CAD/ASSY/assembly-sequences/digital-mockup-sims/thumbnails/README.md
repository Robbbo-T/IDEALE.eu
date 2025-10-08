# Thumbnails — Sub-Assemblies

This directory contains **visual previews of sub-assemblies for quick identification** belonging to the AAA Domain of **AMPEL360‑AIR‑T**.

## Purpose

Thumbnails provide rapid visual reference for sub-assemblies, enabling quick identification and review without opening full CAD models. These images are essential for:

* Design reviews and presentations
* Documentation and reports
* Training materials
* Configuration management visual verification
* Web-based artifact browsers
* Quick visual comparison between revisions

## Contents

* **Preview Images** — Rendered views of sub-assemblies
* **Keyframe Captures** — Critical assembly sequence snapshots
* **Comparison Views** — Before/after change visualization
* **Exploded Views** — Component identification images
* **Section Views** — Internal structure visibility
* **Metadata Files** — JSON metadata for each thumbnail

## Naming Convention

Thumbnail files follow the template: `{MODULE}-{IDX}_view-{VIEW}.{ext}`

* `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL}`
* `{IDX}` = 3‑digit serial (e.g., `001`, `002`)
* `{VIEW}` ∈ `{ISO|FRONT|TOP|SIDE|EXPL|SECT}`
* `{ext}` ∈ `{png|jpg|jpeg}`

**Examples:**
* `WINGBOX-001_view-ISO.png` — Wing box isometric view
* `FUSE-002_view-SECT.jpg` — Fuselage section cut view
* `STAB-001_view-EXPL.png` — Stabilizer exploded view
* `LGBAY-001_view-FRONT.jpg` — Landing gear bay front view

## Standard Views

### Isometric (ISO)
* Default 3D view showing overall shape
* Orientation: Front-left or front-right isometric
* Shows major features and proportions
* Most commonly used for quick identification

### Front View (FRONT)
* View along aircraft longitudinal axis
* Shows spanwise dimensions
* Useful for symmetry verification

### Top View (TOP)
* View from above (plan view)
* Shows planform shape
* Critical for wing and stabilizer profiles

### Side View (SIDE)
* View along lateral axis
* Shows vertical dimensions and profiles
* Important for fuselage and control surfaces

### Exploded View (EXPL)
* Components separated to show relationships
* Assembly sequence visualization
* Training and documentation use

### Section View (SECT)
* Cut-through view showing internal structure
* Reveals internal components and arrangements
* Critical for understanding load paths

## Image Specifications

### Resolution and Format
* **Resolution:** 1920×1080 pixels (Full HD) minimum
* **Format:** PNG for line drawings and diagrams, JPEG for photorealistic renders
* **Color Space:** sRGB
* **Bit Depth:** 24-bit (8 bits per channel)
* **Compression:** PNG lossless, JPEG quality ≥90%

### Rendering Settings
* **Lighting:** Three-point lighting (key, fill, back)
* **Shadows:** Soft shadows enabled for depth perception
* **Anti-aliasing:** 4× MSAA or equivalent
* **Background:** White (#FFFFFF) or light gray (#F0F0F0)
* **Perspective:** Orthographic for technical views, perspective for presentation views

### Annotations
* **Optional:** Arrows, callouts, dimension lines
* **Color:** Red (#FF0000) or yellow (#FFFF00) for visibility
* **Font:** Arial or Helvetica, 14-16pt minimum
* **Position:** Non-overlapping with critical features

## Metadata JSON Template

Each thumbnail should have an accompanying `.json` metadata file:

```json
{
  "image_id": "WINGBOX-001_view-ISO",
  "file_name": "WINGBOX-001_view-ISO.png",
  "title": "Wing Box Sub-Assembly - Isometric View",
  "description": "Complete wing box showing spars, ribs, and skin panels in isometric orientation.",
  
  "source_artifact": {
    "utcs_id": "UTCS-MI:CAD:AAA:ASSY:WINGBOX-001:rev3",
    "file_path": "../wing-structure/SA-AAA-WINGBOX-001.stp",
    "revision": "rev3",
    "description": "Wing box primary structure assembly"
  },
  
  "image_properties": {
    "resolution": "1920x1080",
    "format": "PNG",
    "color_space": "sRGB",
    "file_size_bytes": 847320,
    "capture_date": "2025-01-26T14:30:00Z",
    "software": "CATIA Live Rendering",
    "rendering_quality": "High"
  },
  
  "view_orientation": {
    "camera_position": "Front-Left Isometric",
    "zoom_level": "Medium",
    "focal_point": "Wing box center",
    "viewing_angle_deg": {
      "azimuth": 45,
      "elevation": 30
    }
  },
  
  "annotations": [
    {
      "type": "Arrow",
      "position": {"x": 650, "y": 420},
      "label": "Front spar",
      "color": "#FF0000"
    },
    {
      "type": "Circle",
      "position": {"x": 1200, "y": 750},
      "radius": 50,
      "label": "Critical attachment point",
      "color": "#FFFF00"
    }
  ],
  
  "assembly_context": {
    "assembly_name": "Wing Box",
    "part_number": "SA-AAA-WINGBOX-001",
    "zone": "Wing",
    "module": "Primary Structure"
  },
  
  "usage": {
    "intended_for": ["Documentation", "Design Review", "Training"],
    "classification": "INTERNAL-EVIDENCE-REQUIRED",
    "distribution": "Project Team Only"
  },
  
  "keywords": [
    "wing box",
    "primary structure",
    "spars",
    "ribs",
    "isometric view"
  ],
  
  "related_images": [
    "WINGBOX-001_view-FRONT.png",
    "WINGBOX-001_view-TOP.png",
    "WINGBOX-001_view-EXPL.png"
  ],
  
  "version_history": [
    {
      "revision": "rev3",
      "date": "2025-01-26",
      "changes": "Updated to reflect ECR-042 spar hole pattern change"
    },
    {
      "revision": "rev2",
      "date": "2025-01-15",
      "changes": "Initial thumbnail generation"
    }
  ]
}
```

## Generation Process

### Automated Generation
1. **CAD Export** — Export view from CAD system
2. **Rendering** — Apply lighting and materials
3. **Annotation** — Add callouts and labels (if required)
4. **Metadata Creation** — Auto-generate JSON metadata
5. **Quality Check** — Verify resolution and clarity
6. **UTCS Linking** — Update UTCS records with thumbnail reference

### Manual Generation
1. **View Setup** — Position camera and adjust zoom
2. **Rendering Settings** — Configure lighting, shadows, quality
3. **Capture** — Export image at required resolution
4. **Post-Processing** — Adjust brightness, contrast if needed
5. **Annotation** — Add labels in image editing software
6. **Metadata** — Manually create JSON file
7. **Review** — Verify image meets standards

## Quality Criteria

All thumbnails must meet these criteria:

* **Clarity** — All features clearly visible, no blur or artifacts
* **Lighting** — Proper exposure, no harsh shadows or overexposure
* **Framing** — Subject fills frame appropriately, not too small or cropped
* **Resolution** — Meets minimum resolution requirements
* **Consistency** — Similar viewing angles and lighting across related images
* **Accuracy** — Matches current revision of CAD model

## Usage Guidelines

### In Documentation
* Embed in markdown documentation for quick reference
* Link to full CAD models via UTCS anchors
* Include in design review presentations
* Use in technical reports and proposals

### In Web Interfaces
* Thumbnail galleries for artifact browsing
* Hover previews in file listings
* Comparison tools for version differences
* Search result previews

### In Training
* Assembly sequence visualization
* Component identification exercises
* Exploded view study materials
* Quality standards examples

## File Organization

```
thumbnails/
├── README.md (this file)
├── WINGBOX-001_view-ISO.png
├── WINGBOX-001_view-ISO.json
├── WINGBOX-001_view-FRONT.png
├── WINGBOX-001_view-FRONT.json
├── WINGBOX-001_view-EXPL.png
├── WINGBOX-001_view-EXPL.json
├── FUSE-002_view-ISO.png
├── FUSE-002_view-ISO.json
├── STAB-001_view-SIDE.png
├── STAB-001_view-SIDE.json
└── ...
```

## Related Directories

* `../` — Parent sub-assemblies directory
* `../wing-structure/` — Wing box source models
* `../stabilizer-units/` — Stabilizer source models
* `../fuselage-sections/` — Fuselage source models
* `../utcs/` — UTCS records referencing thumbnails

## Tools

* **CAD Software** — CATIA, NX, SOLIDWORKS (rendering modules)
* **Image Editors** — GIMP, Photoshop (annotation and adjustments)
* **Automation Scripts** — Python scripts for batch thumbnail generation
* **Metadata Tools** — JSON validators and editors

## Status

🔄 In Progress — Thumbnail generation and metadata creation underway

---

**Maintainer:** AAA Integration Team & Technical Publications  
**Quality Standard:** Corporate Image Guidelines v2.3  
**Last Updated:** 2025-01-26
