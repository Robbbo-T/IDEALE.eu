# TFA/STATIONS — Physical Station Locations

> **Part of**: ASI-T2-INTELLIGENCE TFA Layer  
> **Category**: Knowledge Object · **Granularity**: Station  
> **Status**: Template · **UTCS-anchored**

---

## Overview

**STATIONS** represent **physical locations** in the TFA architecture where COMPONENTS and ELEMENTS are positioned, installed, or operated.

### Purpose

- **Spatial Anchoring**: Define physical locations in 3D space
- **Installation Planning**: Specify where components are mounted
- **Access Planning**: Define maintenance access points
- **Station Diagram**: Fuselage stations, wing stations, etc.

---

## TFA Hierarchy

```
BITS/QUBITS
  │
  └─→ COMPONENTS
        └─→ ELEMENTS
              └─→ STATIONS  ←  You are here (Station level)
                    └─→ SYSTEMS
```

---

## Station Types

| Type | Description | Coordinate System |
| :--- | :--- | :--- |
| **Fuselage Stations (FS)** | Longitudinal positions | From nose (FS 0) to tail |
| **Wing Stations (WS)** | Spanwise positions | From centerline to tip |
| **Buttock Lines (BL)** | Lateral positions | From centerline outward |
| **Water Lines (WL)** | Vertical positions | From reference datum |

---

## Station Coordinate Systems

### Aircraft Body Axes
- **X-axis**: Longitudinal (nose → tail)
- **Y-axis**: Lateral (left → right)
- **Z-axis**: Vertical (down → up)

### ATA Chapter 06 Reference
Stations align with ATA Chapter 06 (Dimensions and Stations):
- **Fuselage Stations**: FS 0 (nose) to FS MAX (tail)
- **Wing Stations**: WS 0 (centerline) to WS MAX (tip)
- **Buttock Lines**: BL 0 (centerline) to BL MAX (fuselage side)
- **Water Lines**: WL 0 (reference datum) to WL MAX (top)

---

## Use in ASI-T2-INTELLIGENCE

STATIONS enable spatial intelligence:

- **Design Coordination**: Ensure components fit in allocated space
- **Interference Checking**: Detect spatial conflicts (CAD clash detection)
- **Access Planning**: Define maintenance access routes
- **Load Path Analysis**: Structural load transfer paths
- **Weight Distribution**: CG calculation and management

---

## UTCS Anchors

```
UTCS-MI:TFA:STATIONS:{domain}:{station_type}:{identifier}:rev[X]
```

**Example**:
```
UTCS-MI:TFA:STATIONS:AAA:FS:FS-1234:rev[A]
```

---

## Station Definitions

### Fuselage Station Example
```yaml
station:
  type: "FS"
  value: 1234.5
  units: "inches"
  reference: "nose"
  description: "Main landing gear attachment point"
  components:
    - "MLG-TRUNNION-LEFT"
    - "MLG-TRUNNION-RIGHT"
```

### Wing Station Example
```yaml
station:
  type: "WS"
  value: 456.2
  units: "inches"
  reference: "centerline"
  description: "Outboard engine pylon mount"
  components:
    - "ENGINE-PYLON-02"
    - "PYLON-SUPPORT-STRUCTURE"
```

---

## Related TFA Objects

- **[COMPONENTS](../COMPONENTS/README.md)** — Items located at STATIONS
- **[ELEMENTS](../ELEMENTS/README.md)** — Subsystems spanning multiple STATIONS
- **[SYSTEMS](../SYSTEMS/README.md)** — Distributed across STATIONS

---

## Integration with Domains

STATIONS are managed by domains:

- **[AAA](../../DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/)**: Airframe stations
- **[PPP](../../DOMAINS/PPP-PROPULSION-FUEL-SYSTEMS/)**: Engine and fuel system stations
- **[CCC](../../DOMAINS/CCC-COCKPIT-CABIN-CARGO/)**: Interior stations

---

## Integration with PLM

- **[PLM/CAD](../../DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/PLM/CAD/)** — Station geometry definition
- **[PLM/CAI](../../DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/PLM/CAI/)** — Station interface coordination
- **[PLM/CAM](../../DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/PLM/CAM/)** — Station tooling and fixtures

---

**Maintained by**: ASI-T2 Intelligence Team  
**Last Updated**: 2025-01-27  
**Version**: v0.2 (TFA-V2 Canon Aligned)
