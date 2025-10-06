# Thumbnails

## Overview

This directory contains visual previews, key frame images, and representative screenshots associated with Digital Mock-Up (DMU) simulations and assembly procedures for the **AMPEL360‑AIR‑T** BWB aircraft. Thumbnails provide quick visual references for assembly sequences, aiding in documentation, training, and review processes.

## Purpose

The thumbnails directory serves as the central repository for:

- **DMU simulation previews** showing key frames from assembly animations
- **Assembly state snapshots** capturing critical stages in sequence execution
- **Reference images** for assembly procedures and work instructions
- **Visual aids** for training materials and technical reviews
- **Quick reference graphics** for documentation and presentations

## Contents Overview

### Image Types

1. **DMU Simulation Thumbnails**
   - Key frames from major section join animations
   - Tool access validation visualizations
   - Interference detection illustrations
   - Component motion path screenshots

2. **Assembly State Snapshots**
   - Pre-assembly configuration
   - In-process assembly stages
   - Post-assembly final state
   - Quality inspection points

3. **Reference Images**
   - Fastener pattern diagrams
   - Torque sequence illustrations
   - Gap measurement locations
   - Critical dimension callouts

4. **Training and Documentation**
   - Procedure step illustrations
   - Safety hazard visualizations
   - Tool usage examples
   - Work instruction graphics

## File Naming Convention

Thumbnails follow a naming pattern linked to their source artifacts:

```
{SOURCE-ID}_{FRAME-TYPE}_{NNNN}.{ext}
```

Where:
- `{SOURCE-ID}` = Parent artifact identifier (e.g., ASM-AAA-ONB-JOIN-0001)
- `{FRAME-TYPE}` = Type of image (KEYFRAME, STATE, DETAIL, OVERVIEW)
- `{NNNN}` = Sequential number for multiple images
- `{ext}` = Image format (`.jpg`, `.png`, `.svg`)

Examples:
- `ASM-AAA-ONB-JOIN-0001_KEYFRAME_0001.jpg` — First key frame from wing join DMU
- `ASM-AAA-ONB-JOIN-0001_STATE_0003.png` — Assembly state snapshot
- `ASM-AAA-ONB-DMU-0012_OVERVIEW_0001.jpg` — DMU simulation overview

## Expected File Types

### Raster Images

- `.jpg` / `.jpeg` — Photographs, rendered DMU frames (compressed, smaller files)
- `.png` — Screenshots, diagrams with transparency (lossless, better quality)
- `.tif` / `.tiff` — High-resolution archival images (uncompressed, large files)

### Vector Graphics

- `.svg` — Diagrams, schematics, line drawings (scalable, ideal for documentation)
- `.pdf` — Multi-page illustrations or annotated images

### Metadata

- `.json` — Image metadata including UTCS references, description, capture date

## Image Specifications

### Resolution and Quality

| Purpose | Resolution | Format | Quality | Max File Size |
| :--- | :--- | :--- | :--- | :--- |
| Web thumbnails | 800×600 px | JPG | 75% | 200 KB |
| Documentation | 1920×1080 px | PNG | Lossless | 2 MB |
| Presentation | 1920×1080 px | JPG/PNG | High | 1 MB |
| Print quality | 300 DPI | PNG/TIFF | Lossless | 10 MB |
| Archive | Original resolution | TIFF | Uncompressed | No limit |

### Color and Rendering

- **DMU Renders**: Use consistent lighting and material properties
- **Color Scheme**: Match AMPEL360 branding (document in project style guide)
- **Annotations**: Use contrasting colors (red for callouts, yellow for highlights)
- **Background**: White or light gray for maximum readability
- **Legends**: Include scale bars and orientation indicators where appropriate

## Image Metadata Template

Each thumbnail should have an accompanying JSON metadata file:

```json
{
  "image_id": "ASM-AAA-ONB-JOIN-0001_KEYFRAME_0001",
  "file_name": "ASM-AAA-ONB-JOIN-0001_KEYFRAME_0001.jpg",
  "title": "Wing-to-Body Join - Initial Positioning",
  "description": "Port outer wing positioned for mating to center body. Crane slings visible, alignment jig engaged.",
  
  "source_artifact": {
    "utcs_id": "UTCS-MI:ASM:DMU:WING-JOIN:0012:v2",
    "file_path": "../digital-mockup-sims/ASM-AAA-ONB-DMU-0012.mp4",
    "timestamp": "00:02:15",
    "description": "Wing-to-body join DMU simulation"
  },
  
  "image_properties": {
    "resolution": "1920x1080",
    "format": "JPEG",
    "color_space": "sRGB",
    "file_size_bytes": 847320,
    "capture_date": "2025-01-26T14:30:00Z",
    "software": "CATIA Live Rendering",
    "rendering_quality": "High"
  },
  
  "annotations": [
    {
      "type": "Arrow",
      "position": {"x": 650, "y": 420},
      "label": "Alignment pin engagement",
      "color": "#FF0000"
    },
    {
      "type": "Circle",
      "position": {"x": 1200, "y": 750},
      "radius": 50,
      "label": "Critical gap measurement point",
      "color": "#FFFF00"
    }
  ],
  
  "assembly_context": {
    "zone": "ONB",
    "operation": "Major Section Join",
    "sequence_step": 3,
    "total_steps": 12
  },
  
  "view_orientation": {
    "camera_position": "Front-Left Isometric",
    "zoom_level": "Medium",
    "focal_point": "Wing-to-body interface"
  },
  
  "usage": {
    "intended_for": ["Documentation", "Training", "Design Review"],
    "classification": "INTERNAL-EVIDENCE-REQUIRED",
    "distribution": "Project Team Only"
  },
  
  "keywords": [
    "wing-to-body",
    "major join",
    "alignment",
    "DMU simulation",
    "assembly sequence"
  ],
  
  "related_images": [
    "ASM-AAA-ONB-JOIN-0001_KEYFRAME_0002.jpg",
    "ASM-AAA-ONB-JOIN-0001_STATE_0001.png"
  ],
  
  "created_by": "J. Smith (DMU Analyst)",
  "created_date": "2025-01-26T14:30:00Z",
  "approved_by": "T. Johnson (Assembly Lead)",
  "approval_date": "2025-01-27T10:00:00Z"
}
```

## Thumbnail Generation Workflow

### 1. Capture from DMU Simulation

- **Software**: CATIA Live Rendering, Siemens NX Visualization, KeyShot
- **Timing**: Capture key frames at critical assembly stages
- **Resolution**: Render at high resolution (1920×1080 minimum)
- **Consistency**: Use project-standard view templates for consistency

### 2. Annotation and Enhancement

- **Add callouts**: Highlight critical features with arrows, circles, text
- **Scale indicators**: Include dimensions, scale bars where relevant
- **Orientation**: Show coordinate system or directional indicators
- **Legends**: Explain colors, symbols, or codes used in image

### 3. Optimization

- **Resize**: Create web thumbnails (800×600) from high-res originals
- **Compress**: Balance quality vs. file size (JPG 75-85% quality typical)
- **Format**: Choose appropriate format (JPG for photos, PNG for diagrams)
- **Archive**: Retain original high-resolution uncompressed version

### 4. Metadata Creation

- **JSON file**: Create accompanying metadata file
- **UTCS linkage**: Reference parent artifact UTCS ID
- **Keywords**: Add searchable keywords
- **Approvals**: Document review and approval

### 5. Integration

- **Link to procedures**: Reference thumbnails in assembly procedures
- **Update documentation**: Insert thumbnails in README files, reports
- **Training materials**: Incorporate in training presentations
- **Evidence package**: Include in certification documentation

## Use Cases

### Assembly Procedure Documentation

Embed thumbnails in procedure markdown files:

```markdown
## Step 3: Position Wing for Mating

![Wing positioning](../../thumbnails/ASM-AAA-ONB-JOIN-0001_KEYFRAME_0001.jpg)

*Figure 3-1: Port outer wing positioned by crane for mating to center body.*

1. Engage crane hook to wing lift points
2. Slowly lift wing to align with center body interface
3. Verify alignment pin engagement (see callout in image)
```

### Training Materials

Create training slide decks with annotated thumbnails:

- **Before**: Show pre-assembly state
- **During**: Illustrate critical steps with callouts
- **After**: Display completed assembly for verification

### Design Reviews

Use thumbnails in review presentations:

- **DMU validation results**: Show successful simulations
- **Interference findings**: Highlight detected conflicts
- **Tool access studies**: Demonstrate fixture reach capability
- **Sequence optimization**: Compare alternative approaches

### Quality Documentation

Include thumbnails in inspection reports:

- **Reference images**: Show what correct assembly looks like
- **Inspection points**: Highlight where measurements are taken
- **Acceptance criteria**: Illustrate acceptable vs. rejected conditions

## Organization Strategy

### Subdirectory Structure (Optional)

For large projects, organize thumbnails by type:

```
thumbnails/
├── dmu-simulations/        # DMU animation key frames
├── assembly-states/        # Stage-by-stage assembly photos/renders
├── reference-diagrams/     # Fastener patterns, dimension callouts
├── training/               # Training material illustrations
└── presentations/          # High-quality renders for presentations
```

### Flat Structure (Current)

For smaller projects or simplicity, keep all thumbnails in single directory with descriptive file names.

## Storage and Backup

### File Size Management

- **Thumbnails**: Store compressed versions for daily use
- **Archives**: Store high-resolution originals on long-term storage
- **Cleanup**: Periodically review and archive unused/obsolete images

### Version Control

- **Git LFS**: Use Git Large File Storage for binary image files
- **Compression**: Optimize images before committing to repository
- **History**: Keep previous versions when images are updated

### Backup Strategy

- **Primary**: Repository (Git with LFS)
- **Secondary**: Project file server with daily backups
- **Tertiary**: Offline archive for regulatory retention

## KPIs for Thumbnail Management

Tracked via CI/CD pipeline:

- **Coverage**: % of DMU simulations with key frame thumbnails (target 100%)
- **Metadata completeness**: % of thumbnails with JSON metadata (target >95%)
- **File size compliance**: % of thumbnails meeting size guidelines (target 100%)
- **Broken links**: Count of procedure references to non-existent thumbnails (target 0)
- **Update lag**: Days between DMU update and thumbnail update (target <3 days)

## Interfaces

### Input Interfaces

- **From DMU Simulations**: Key frames extracted from animation videos
- **From Assembly Operations**: Photographs of actual assembly states
- **From CAD/CAM**: Rendered views of procedures and tooling
- **From Training Team**: Annotated illustrations for training materials

### Output Interfaces

- **To Assembly Procedures**: Embedded in markdown documentation
- **To Training Materials**: Incorporated in presentations and videos
- **To Quality Documentation**: Included in inspection reports
- **To Certification Packages**: Evidence for airworthiness approval

## Related Directories

- [`../digital-mockup-sims/`](../digital-mockup-sims/) — Source DMU simulations for thumbnails
- [`../major-section-joins/`](../major-section-joins/) — Assembly procedures referencing thumbnails
- [`../system-installation-steps/`](../system-installation-steps/) — System procedures with illustrations
- [`../utcs/`](../utcs/) — UTCS records linking thumbnails to artifacts

## Tools and Software

### Image Capture

- **CATIA Live Rendering**: DMU frame capture and rendering
- **Snagit / ShareX**: Screenshot tools with annotation
- **OBS Studio**: Video capture from simulation playback

### Editing and Annotation

- **Adobe Photoshop**: Professional image editing
- **GIMP**: Open-source alternative to Photoshop
- **Inkscape**: Vector graphics editing for diagrams
- **Draw.io**: Flowcharts and annotated diagrams

### Optimization

- **ImageMagick**: Batch image processing and conversion
- **TinyPNG / JPEGmini**: Lossless compression
- **WebP**: Modern image format (better compression than JPG)

### Metadata Management

- **ExifTool**: Read/write image metadata
- **Custom scripts**: Python scripts for JSON metadata generation

## Standards and References

- **ISO 12639**: Graphic technology - Prepress digital data exchange (image formats)
- **SMPTE Standards**: Video and image quality for technical documentation
- **ATA iSpec 2200**: Illustrated parts data (image specifications for technical manuals)
- **S1000D**: Technical publication specification (image sizing and formats)

## Governance and Reviews

### Approval Authority

- **Thumbnail Creator**: DMU Analyst or Technical Illustrator
- **Technical Review**: Assembly Engineering Lead
- **Quality Approval**: Documentation Control
- **Usage Approval**: Classification authority (if images contain sensitive data)

### Review Gates

- **Creation**: Thumbnail captured and optimized
- **Annotation**: Callouts and labels reviewed for accuracy
- **Metadata**: JSON file validated for completeness
- **Integration**: Proper linking in procedures confirmed
- **Archive**: High-resolution originals stored

### Change Control

Thumbnail updates follow simplified process:

1. New version created if source artifact changes significantly
2. Old version retained with "_obsolete" suffix (not deleted)
3. Metadata updated to reference new source artifact version
4. Procedure links updated to new thumbnail
5. No formal approval required for minor cosmetic changes

---

**Last Updated**: 2025-01-27  
**Version**: 1.0  
**Maintained By**: AMPEL360 CAD/DMU Team  
**Contact**: Open issue with labels `domain:AAA` `component:assembly-sequences`
