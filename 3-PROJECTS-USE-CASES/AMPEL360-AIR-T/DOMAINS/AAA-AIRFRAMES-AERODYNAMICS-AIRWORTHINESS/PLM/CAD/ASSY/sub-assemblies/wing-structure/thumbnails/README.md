# Visual Thumbnails — Wing Structure

This directory contains visual previews and thumbnail images of wing structure sub-assemblies.

## Overview

Thumbnail images provide rapid visual reference for wing-box modules, enabling quick identification, design review, and communication without opening full CAD models. Includes isometric views, section cuts, and exploded assembly views.

## Purpose

- **Quick identification** - Visual reference for module selection and review
- **Design reviews** - Visual aids for technical discussions and presentations
- **Manufacturing support** - Assembly sequence visualization
- **Change management** - Before/after comparisons for design modifications
- **Documentation** - Visual content for reports and procedures
- **Archive** - Historical record of module configurations at each revision

## Naming Convention

Thumbnail files follow the pattern: `SA-AAA-WINGBOX-{IDX}-{VIEW}.{ext}` where:
- `{IDX}` = 3-digit serial number (e.g., 001, 002, 003)
- `{VIEW}` = viewpoint (ISO, FRONT, TOP, SIDE, EXPLODED, SECTION)
- `{ext}` = image format (png, jpg)

Examples:
- `SA-AAA-WINGBOX-001-ISO.png` - Isometric view
- `SA-AAA-WINGBOX-001-EXPLODED.png` - Exploded assembly view
- `SA-AAA-WINGBOX-001-SECTION.png` - Section cut view

## Standard Views for Wing Structure

Recommended views for each wing-box module:
1. **ISO** - Isometric view showing overall configuration
2. **FRONT** - Front view (looking aft along wing)
3. **TOP** - Plan view from above
4. **SIDE** - Profile view showing span direction
5. **EXPLODED** - Exploded view showing spar, ribs, skins separated
6. **SECTION** - Cross-section view at key rib stations

## Image Specifications

Standard thumbnail guidelines:
- **Resolution**: 1920x1080 pixels (Full HD) for detailed views
- **Preview resolution**: 640x480 pixels for quick reference
- **Format**: PNG with transparency for technical illustrations
- **Color space**: sRGB for consistent display
- **Background**: Neutral gray (#808080) or transparent
- **Annotations**: Use separate annotated versions if needed

## Wing Structure Specific Views

Additional views for wing structure:
- **Spar detail** - Close-up of spar-to-rib connections
- **Skin attachment** - Fastener patterns on upper/lower skins
- **Pylon interface** - Engine pylon mounting locations
- **Access panels** - Service access locations
- **Internal systems** - Fuel tank, hydraulic routing (if visible)

## Revision Tracking

Include revision suffix for historical tracking:
- Current: `SA-AAA-WINGBOX-001-ISO.png`
- Historical: `SA-AAA-WINGBOX-001-ISO-revA.png`, `SA-AAA-WINGBOX-001-ISO-revB.png`

## TFA Context

Thumbnails support **QS** (provenance) and **UE** (deterministic snapshots) by providing visual evidence of wing structure configurations at specific revisions.

## UTCS Anchors

Thumbnails referenced in UTCS records:
- Main UTCS record: `../utcs/SA-AAA-WINGBOX-{IDX}.yaml` (Cache section)
- Visual reference: `UTCS-MI:CACHE:THUMBNAIL:WINGBOX-{IDX}:{VIEW}:v{X}`

## Generation Methods

Thumbnails should be generated from:
- **CAD systems** - CATIA V5/3DEXPERIENCE, NX, SolidWorks screenshot tools
- **DMU environments** - Digital mock-up visualization tools
- **Rendering software** - KeyShot, VRED for high-quality presentations
- **Automated CI/CD** - Scripted generation for consistency

**Note**: A `.gitkeep` file is present to maintain this directory in version control when no thumbnail files are present.

## Related Files

- CAD Models - `../models/SA-AAA-WINGBOX-{IDX}.stp`
- UTCS Record - `../utcs/SA-AAA-WINGBOX-{IDX}.yaml`

## References

See parent [Wing Structure README](../README.md) for complete conventions and specifications.
