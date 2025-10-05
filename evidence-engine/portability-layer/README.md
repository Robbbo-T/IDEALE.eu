# IDEALE Evidence Engine - Portability Layer

Enables seamless conversion between vendor-specific formats and vendor-neutral IDEALE artifacts.

## Overview

The portability layer provides bidirectional adapters for major CAD/CAE/CAM/PLM tools, ensuring no information loss during format conversion.

## Supported Tools

### Currently Supported
- **CATIA** (Dassault Systèmes) - V5 R21+
- **Siemens NX** - NX 10+

### Planned
- **SolidWorks** - 2020+
- **Autodesk Inventor** - 2020+
- **PTC Creo** - 7.0+

## Architecture

```
Tool Format (STEP/IGES/JT)
    ↓
Neutral Format (IEF)
    ↓
Any Tool Format
```

## Vendor Adapters

Each adapter implements:
- `import_from_tool()` - Convert tool format to IEF
- `export_to_tool()` - Convert IEF to tool format
- `validate_conversion()` - Ensure no data loss

## Usage

```text
# Pseudocode example – actual module/package names may differ
from portability_layer import catia_adapter, nx_adapter

# Convert CATIA to neutral
ief_artifact = catia_adapter.import_from_tool("model.CATPart")

# Convert to NX
nx_adapter.export_to_tool(ief_artifact, "model.prt")
```

## Roadmap

- [ ] STEP AP242 full support
- [ ] JT 10.5 support
- [ ] PMI (Product Manufacturing Information) preservation
- [ ] Assembly hierarchy maintenance
- [ ] Material properties transfer
