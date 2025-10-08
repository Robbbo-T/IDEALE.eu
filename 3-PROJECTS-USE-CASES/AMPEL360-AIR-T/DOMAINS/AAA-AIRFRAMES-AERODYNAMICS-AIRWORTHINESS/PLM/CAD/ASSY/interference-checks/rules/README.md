# Clearance Rules — Interference Checks

This folder contains minimum clearance rule sets and thresholds that govern spatial constraints for the **AMPEL360‑AIR‑T** BWB design.

---

## Purpose

Clearance rules define the minimum required spacing between components based on safety, thermal, electromagnetic, kinematic, and maintenance considerations. These rules are enforced during CAD/DMU validation and drive interference resolution.

---

## Contents

* **Master minimum clearance ruleset** (all categories)
* **Category-specific rule sheets**:
  * Kinematic clearances (moving parts)
  * Thermal clearances (hot surfaces, engines)
  * Electrical/EMI clearances (high voltage, sensitive systems)
  * Maintenance clearances (tool access, hand access)
  * Structural clearances (load paths, deflection zones)
* **Rule validation test cases**
* **Rule change history** and justification

---

## Naming Convention

Files follow the template: `INT-AAA-RULES-{CATEGORY}-{VERSION}.{ext}`

* `{CATEGORY}` ∈ `{MINCLR|KIN|THERMAL|EMI|MAINT|STRUCT|MASTER}`
* `{VERSION}` = semantic version (e.g., `v1.0`, `v2.1`)
* `{ext}` ∈ `{yaml|json|md|pdf}`

**Examples:**
* `INT-AAA-RULES-MINCLR-v1.0.yaml` — Master clearance ruleset
* `INT-AAA-RULES-THERMAL-v2.0.json` — Thermal spacing requirements
* `INT-AAA-RULES-EMI-v1.2.md` — Electromagnetic interference rules

---

## Rule Categories

### 1. Kinematic Clearances
Minimum spacing for moving components throughout motion envelope:
* Control surfaces: 10–25 mm depending on velocity
* Landing gear: 50 mm extended, 25 mm retracted
* Doors/hatches: 15–30 mm swing clearance

### 2. Thermal Clearances
Spacing from hot surfaces to prevent heat damage:
* Engine surfaces (>300°C): 150+ mm to composites
* Exhaust paths: 200+ mm with thermal barriers
* APU bay: 100 mm general clearance

### 3. Electrical/EMI Clearances
Separation to prevent electromagnetic interference:
* High voltage (>270V): 50+ mm from signal cables
* Lightning protection zones: 100+ mm for avionics
* Antenna keep-out zones: per antenna radiation pattern

### 4. Maintenance Clearances
Access requirements for service and inspection:
* Hand access: 75 mm minimum opening
* Tool access: 100–150 mm depending on tool type
* Visual inspection: 50 mm + 30° viewing angle

### 5. Structural Clearances
Deflection and load path considerations:
* Wing deflection envelope: +/- 2% span
* Fuselage pressure bulkhead: 25 mm installation gap
* Fastener clearances: 2× fastener diameter minimum

---

## Rule Format (YAML Example)

```yaml
rule_id: "INT-AAA-MINCLR-KIN-001"
category: "kinematic"
description: "Minimum clearance for aileron deflection"
applicable_zones: ["OUT"]
threshold:
  value: 15
  unit: "mm"
  tolerance: "+5/-0"
verification_method: "DMU_sweep"
compliance_stage: "CB"
authority: "AAA Integration Lead"
references:
  - "EASA CS-25.629"
  - "ATA 27-30-00"
status: "active"
last_updated: "2025-01-15"
```

---

## TFA Stage

**QS** (context definition) → **CB** (enforcement)

Rules are defined at **QS** level and enforced through **CB** constraint checks during design iterations.

---

## Rule Governance

* **Approval Authority**: AAA Integration Lead, Safety, Certification
* **Change Control**: Rules updated via PR with technical justification
* **Validation**: Test cases must pass before rule activation
* **Traceability**: All rules link to regulatory requirements and design rationale

---

## Status

🔄 **In Progress** — Thermal rules under review

---

## References

* Parent: [../README.md](../README.md)
* Related: [../clearance-violations/](../clearance-violations/)
* Standards: EASA CS‑25, MIL-STD-464 (EMI), MIL-STD-1472 (Human Factors)
