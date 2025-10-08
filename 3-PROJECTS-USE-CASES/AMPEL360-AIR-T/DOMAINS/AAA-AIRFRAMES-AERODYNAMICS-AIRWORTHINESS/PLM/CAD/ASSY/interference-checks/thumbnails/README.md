# Thumbnails — Interference Checks

This folder contains visual previews and key frame images associated with DMU simulations, clash visualizations, and verification reports.

---

## Purpose

Thumbnails provide quick visual reference for interference check artifacts without requiring full DMU tools or large file downloads. These images support rapid review, documentation, and communication of interference issues and resolutions.

---

## Contents

* **Clash visualization thumbnails** — Screenshots of detected interferences
* **DMU keyframes** — Representative frames from motion simulations
* **Before/after comparisons** — Visual documentation of resolution effectiveness
* **Assembly sequence previews** — Key steps in installation/removal procedures
* **Clearance verification images** — Visual confirmation of minimum spacing compliance

---

## Naming Convention

Files follow the template: `{SOURCE_CODE}-thumb-{IDX}.{ext}`

* `{SOURCE_CODE}` = Original artifact code (e.g., `INT-AAA-ONB-CLASH-0038`)
* `{IDX}` = Sequential number if multiple thumbnails for same artifact
* `{ext}` ∈ `{png|jpg|jpeg}`

**Examples:**
* `INT-AAA-ONB-CLASH-0038-thumb-01.png` — Primary clash visualization
* `INT-AAA-OUT-KIN-0004-thumb-02.jpg` — Second keyframe of kinematic sweep
* `INT-AAA-ONB-DMU-0007-thumb-01.png` — DMU simulation preview

---

## Image Specifications

### Resolution
* **Minimum**: 800×600 pixels
* **Recommended**: 1920×1080 pixels (Full HD)
* **Maximum**: 3840×2160 pixels (4K for critical details)

### Format
* **PNG**: Preferred for technical diagrams and text-heavy images (lossless)
* **JPEG**: Acceptable for photorealistic DMU renders (compressed)

### File Size
* **Target**: <2 MB per thumbnail
* **Maximum**: 5 MB per thumbnail

### Annotations
* Use red for clashes/violations
* Use yellow for warnings/near-misses
* Use green for compliant clearances
* Include scale bars where applicable
* Add callouts for critical dimensions

---

## Content Requirements

Each thumbnail should include:

* **Source artifact reference** — INT code or UTCS ID
* **Date/timestamp** — When visualization was generated
* **View orientation** — Top, side, isometric, section, etc.
* **Annotations** — Highlighting areas of concern
* **Scale reference** — If showing physical measurements

---

## Organization

Thumbnails are organized to mirror the parent artifact structure:

```
thumbnails/
├── clash-exports/          # Thumbnails for ../clash-exports/
├── clearance-violations/   # Thumbnails for ../clearance-violations/
├── kinematic-clash-reports/# Thumbnails for ../kinematic-clash-reports/
├── harness-routing-clashes/# Thumbnails for ../harness-routing-clashes/
├── digital-mockup-sims/    # Thumbnails for ../digital-mockup-sims/
└── resolution-logs/        # Before/after comparison images
```

---

## Use Cases

### Documentation
* Embed in reports and presentations
* Include in ECR/Deviation packages
* Support certification evidence packages

### Communication
* Quick preview in issue trackers
* Visual aids in design reviews
* Stakeholder presentations

### CI/CD
* Automated visual regression testing
* Quick verification in PR reviews
* Dashboard visualizations

---

## Integration with Source Artifacts

Each thumbnail must reference its source artifact:

* **Metadata file** (optional): `{SOURCE_CODE}-thumb-{IDX}.meta.json`
* **Embedded metadata** (preferred): EXIF/PNG metadata fields
* **Naming convention**: Direct link via filename prefix

---

## Status

🔄 **In Progress** — Thumbnail generation pipeline being established

---

## References

* Parent: [../README.md](../README.md)
* Related: [../digital-mockup-sims/](../digital-mockup-sims/), [../clash-exports/](../clash-exports/)
* Standards: ISO 16792 (Technical Product Documentation)
