# Illustrations / Information Control Numbers (ICN)

This directory contains all illustrations for Data Modules.

## Structure

### master/
Source illustration files in CGM or SVG format:
- Editable vector graphics
- Master artwork maintained by technical illustrators
- Version controlled source files

### renditions/
Published versions optimized for different media:
- **PDF** — High-resolution for print
- **PNG** — Raster for web/screen display
- **SVG** — Scalable web graphics
- Different resolutions (72dpi, 150dpi, 300dpi)

### hotspots/
Interactive overlay files:
- Clickable areas linking to related content
- Part number callouts
- Zoom/pan regions
- SVG or XML format with coordinate data

## Naming Convention

```
ICN-AMP360-AAA-06-10-{DESCRIPTION}-{SEQ}.svg
```

Examples:
- `ICN-AMP360-AAA-06-10-DATUM-GRID-001.svg`
- `ICN-AMP360-AAA-06-10-STATION-LAYOUT-002.svg`
- `ICN-AMP360-AAA-06-10-WATERLINE-MAP-003.svg`

Hotspot overlays add `-hotspots` suffix:
- `ICN-AMP360-AAA-06-10-DATUM-GRID-001-hotspots.svg`

## Reference in Data Modules

Use `graphicRef` element to reference ICN:

```xml
<figure>
  <title>Reference Frame Datum Grid</title>
  <graphic infoEntityIdent="ICN-AMP360-AAA-06-10-DATUM-GRID-001"/>
</figure>
```

## Illustration Standards

- **Format**: SVG (preferred) or CGM
- **Color**: Use approved technical publication color palette
- **Line weight**: Follow S1000D illustration guidelines
- **Callouts**: Use approved callout style
- **Text**: Minimize text in graphics (use captions instead)

## CI/CD Validation

Automated checks verify:
- Every `graphicRef` in DMs has corresponding ICN file
- Master file exists for each rendition
- Hotspot overlay coordinates are valid
- File naming follows ICN pattern

## For 06-10 Reference Frame

Typical illustrations include:
- Datum point locations
- Station/waterline/buttock line grid
- Reference frame assembly
- Measuring point diagrams
- Inspection access areas
- Clearance maps

## Related

- [../../DataModules/](../../DataModules/) — DMs referencing these ICNs
- S1000D Issue 6.0, Chapter 3.9.6 (Multimedia Objects)
