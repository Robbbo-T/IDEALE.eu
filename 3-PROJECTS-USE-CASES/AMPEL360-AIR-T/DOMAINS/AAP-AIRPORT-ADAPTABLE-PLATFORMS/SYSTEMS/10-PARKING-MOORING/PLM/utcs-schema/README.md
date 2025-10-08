# PMO UTCS Schemas

This directory contains JSON Schema definitions for Parking & Mooring Operations (PMO) artifacts.

## Schemas

### wind-load-case.schema.json
**Purpose:** Schema for documenting wind loading analysis cases for aircraft mooring

**Key Sections:**
- Aircraft specifications (type, weight, dimensions)
- Wind conditions (speed, direction, gusts)
- Load analysis results (forces, moments, safety factors)
- Mooring configuration (points, loads, equipment)
- Analysis metadata (analyst, date, revision)
- Compliance tracking

**UTCS Pattern:** `UTCS-MI:PMO:CAE:WIND-LOAD-{AIRCRAFT}-{WIND_SPEED}KT:rev[X]`

**Example Use Cases:**
- A320 mooring under 50kt winds
- B737 extreme wind scenario (70kt+)
- Wide-body aircraft wind load assessment

### rts-checklist.schema.json
**Purpose:** Schema for Return-to-Service inspection checklists after aircraft storage

**Key Sections:**
- Aircraft information (MSN, registration, type)
- Storage history (duration, conditions, location)
- Inspection sections (structural, propulsion, systems)
- Test results (hydraulics, avionics, engines)
- Approval workflow (inspector → quality → chief → airworthiness)
- Airworthiness release certificate

**UTCS Pattern:** `UTCS-MI:PMO:CAM:RTS-CHECKLIST-{AIRCRAFT}:rev[X]`

**Example Use Cases:**
- Short-term storage reactivation (<6 months)
- Long-term preservation exit (>6 months)
- Post-mooring inspection checklist

## Usage

### Validation with Python

```python
import json
import jsonschema

# Load schema
with open('wind-load-case.schema.json') as f:
    schema = json.load(f)

# Load your data
with open('my-wind-analysis.json') as f:
    data = json.load(f)

# Validate
jsonschema.validate(instance=data, schema=schema)
print("✅ Valid wind load case")
```

### Integration with UTCS

All artifacts validated against these schemas should:
1. Include proper UTCS ID in the document
2. Reference the schema in metadata
3. Link to related evidence in UTCS graph
4. Be stored in appropriate PLM directories

### Example Wind Load Case

```json
{
  "case_id": "UTCS-MI:PMO:CAE:WIND-LOAD-A320-50KT:rev[A]",
  "aircraft_type": {
    "model": "A320-200",
    "variant": "CEO",
    "mtow": 78000,
    "wingspan": 35.8,
    "length": 37.57
  },
  "wind_conditions": {
    "speed_kt": 50,
    "direction_deg": 45,
    "gust_factor": 1.3,
    "duration": "sustained"
  },
  "load_analysis": {
    "method": "CFD",
    "software": "ANSYS Fluent",
    "results": {
      "total_force_N": 125000,
      "safety_factor": 1.5
    }
  },
  "mooring_configuration": {
    "points_required": 6,
    "restraint_loads": [
      {
        "point_id": "WING_LEFT_1",
        "location": "wing_left",
        "load_N": 25000,
        "angle_deg": 45
      }
    ]
  }
}
```

### Example RTS Checklist

```json
{
  "checklist_id": "UTCS-MI:PMO:CAM:RTS-CHECKLIST-A320:rev[A]",
  "aircraft_info": {
    "msn": "12345",
    "registration": "N-ABC123",
    "type": "A320-200"
  },
  "storage_info": {
    "entry_date": "2024-01-01",
    "exit_date": "2024-07-01",
    "duration_days": 182,
    "storage_type": "long_term"
  },
  "inspection_sections": [
    {
      "section_id": "STR-01",
      "title": "Structural Inspection",
      "items": [
        {
          "item_id": "STR-01-001",
          "description": "Inspect for corrosion in critical zones",
          "status": "completed",
          "result": "satisfactory"
        }
      ]
    }
  ]
}
```

## Schema Validation in CI/CD

The GitHub Action workflow `.github/workflows/pmo-cav-validation.yml` automatically validates UTCS files in the CAV directory against these schemas where applicable.

## Standards References

- **Wind Loading:** EASA AMC 25.143, SAE AS5642, MIL-STD-810H
- **RTS Procedures:** 14 CFR §43.13, EASA Part-M, AMC 20-17, AS9100
- **MSG-3:** Maintenance Steering Group logic for inspection tasks

## Related Documentation

- [10-20-MOORING README](../../10-20-MOORING/README.md) — Mooring procedures
- [10-40-RETURN-TO-SERVICE README](../../10-40-RETURN-TO-SERVICE/README.md) — RTS procedures
- [standards/schemas/](../../../../../standards/schemas/) — Core UTCS schemas

---
**Maintained by**: AMPEL360-AIR-T PMO Team  
**Last Updated**: 2025-01-27
