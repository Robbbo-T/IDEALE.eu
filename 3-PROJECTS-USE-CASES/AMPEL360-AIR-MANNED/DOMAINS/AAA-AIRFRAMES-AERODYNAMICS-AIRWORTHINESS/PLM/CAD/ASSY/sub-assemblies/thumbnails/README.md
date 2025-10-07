# Visual Thumbnails — AAA Domain Sub-Assemblies

This directory contains **visual previews of sub-assemblies** for quick identification and review.

## Overview

Thumbnail images provide rapid visual reference for sub-assembly modules, enabling quick identification, review, and communication without opening full CAD models.

## Purpose

- **Quick identification** - Visual reference for module selection and review
- **Documentation** - Visual aids for reports, presentations, and technical documentation
- **Collaboration** - Easy sharing of design concepts and module configurations
- **Change review** - Before/after visual comparisons for design changes
- **Archive** - Historical record of module appearances at different revisions

## Naming Convention

Thumbnail files follow the pattern: `SA-AAA-{MODULE}-{IDX}-{VIEW}.{ext}` where:
- `{MODULE}` ∈ `{WINGBOX|STAB|FUSE|LGBAY|PYLON|RIB|SPAR|PANEL|DOOR}`
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)
- `{VIEW}` = viewpoint (e.g., `ISO`, `FRONT`, `TOP`, `SIDE`, `EXPLODED`)
- `{ext}` = image format (typically `png`, `jpg`)

Example: `SA-AAA-WINGBOX-001-ISO.png`, `SA-AAA-LGBAY-002-EXPLODED.jpg`

## Image Specifications

Standard thumbnails should follow these guidelines:
- **Resolution**: 1920x1080 pixels (Full HD) for detailed views
- **Preview resolution**: 640x480 pixels for quick reference
- **Format**: PNG with transparency for technical illustrations, JPEG for renders
- **Color space**: sRGB for consistent display
- **Background**: Neutral gray or transparent for technical views
- **Annotations**: Minimal, use separate annotated versions if needed

## Standard Views

Each major sub-assembly should include:
1. **ISO view** - Isometric perspective showing overall configuration
2. **FRONT view** - Front elevation view
3. **TOP view** - Plan view from above
4. **SIDE view** - Profile view from the side
5. **EXPLODED view** - Exploded assembly showing component relationships (when applicable)

## Revision Tracking

Include revision suffix for historical tracking:
- `SA-AAA-WINGBOX-001-ISO-revA.png`
- `SA-AAA-WINGBOX-001-ISO-revB.png`

Current revision thumbnails omit the revision suffix for easy reference.

## TFA Context

Thumbnails support **QS** (provenance) and **UE** (deterministic snapshots) by providing visual evidence of module configurations at specific revisions.

## Related Directories

- [`../wing-structure/`](../wing-structure/) - Wing structure modules
- [`../stabilizer-units/`](../stabilizer-units/) - Stabilizer modules
- [`../fuselage-sections/`](../fuselage-sections/) - Fuselage modules
- [`../landing-gear-bays/`](../landing-gear-bays/) - Landing gear bay modules
- [`../pylon-interfaces/`](../pylon-interfaces/) - Pylon interface modules
- [`../utcs/`](../utcs/) - UTCS records referencing thumbnails in Cache section

## Generation

Thumbnails should be generated from:
- CAD systems (CATIA, NX, SolidWorks) using automated screenshot tools
- DMU (Digital Mock-Up) environments
- Rendering software for high-quality presentations
- Automated CI/CD pipelines for consistency

## References

See parent [Sub-Assemblies README](../README.md) for complete conventions and governance procedures.
