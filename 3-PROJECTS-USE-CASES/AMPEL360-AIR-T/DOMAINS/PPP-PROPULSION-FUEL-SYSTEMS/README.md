# PPP-PROPULSION-FUEL-SYSTEMS

This domain folder contains all technical documentation, models, and compliance evidence related to propulsion systems, engines, fuel systems, and power plant installations for the **AMPEL360-AIR-T** platform.

---

## 1. Domain Data Layers (PLM Focus)

This domain manages propulsion system design, integration, and certification.

| Layer | Sub-Category | Key Function |
| :--- | :--- | :--- |
| **CAE** | Thermal, Vibration, CFD | Engine thermal analysis, vibration studies, and inlet/exhaust flow simulations. |
| **CAD** | ASSY, PRT, DRW | Geometric definition of engine installations, nacelles, and fuel system routing. |
| **CAV** | CERT, QIP | EASA CS-25 and CS-E compliance for propulsion systems. |
| **CAO** | REQ, CON, SYS | Performance requirements, thrust sizing, and fuel efficiency optimization. |
| **CAS** | SRM, AMM | Engine maintenance manuals and overhaul procedures. |

## 2. TFA Integration

The PPP domain uses TFA flow for propulsion system optimization and performance prediction.

| TFA Component | Role in PPP Domain |
| :--- | :--- |
| **QS** (Input) | Probabilistic space for engine selection, thrust requirements, and fuel configurations. |
| **FWD** (Output) | Forward-looking performance predictions across mission profiles. |
| **UE** (Data Bridge) | Specific engine state (thrust setting, fuel flow, temperature). |
| **CB/QB** (Solver) | **QB** for installation optimization, **CB** for deterministic performance validation. |
| **Traceability** | All engine data indexed via **UTCS** for certification and maintenance tracking. |

---

## 3. Directory Index

### New ATA Chapter-Based Structure

| Folder | Content Description |
| :--- | :--- |
| [`SYSTEMS/`](./SYSTEMS/) | **Primary structure** — Organizes propulsion systems by ATA chapter (71-Power Plant, 28-Fuel, etc.). Each system contains complete BEZ (DELs, PAx, PLM, QUANTUM_OA, etc.). See [ATA-STRUCTURE-EXAMPLE.md](../ATA-STRUCTURE-EXAMPLE.md) for details. |
| `domain-config.yaml` | Domain-level configuration file (to be created). |
| `README.md` | This file — domain overview and guidance. |

### ATA Chapter Assignments for PPP Domain

According to [ata-chapters.csv](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv), the PPP domain owns:

- **28** - Fuel Systems
- **49** - Airborne Auxiliary Power (APU)
- **54** - Nacelles/Pylons (shared with AAA)
- **60** - Standard Practices - Propeller/Rotor
- **61** - Propellers/Propulsors
- **70** - Standard Practices - Engine
- **71** - Power Plant ✓ (example implemented)
- **72** - Engine (Turbine/Piston)
- **73** - Engine Fuel and Control
- **75** - Air (Engine Bleed)
- **78** - Exhaust
- **81** - Turbines
- **82** - Water Injection

---

## 4. Compliance Requirements

### Certification Standards
- EASA CS-25 (Large Aeroplanes) — Propulsion installation requirements
- EASA CS-E (Engines) — Engine type certification
- CS 25.901 — Installation
- CS 25.903 — Engines
- CS 25.939 — Operating characteristics

### Documentation Requirements
- Type Certificate Data Sheets (TCDS)
- Engine Installation Manuals
- Fuel System Safety Assessments
- Fire Zone Analysis Reports

---

## 5. Cross-Domain Interfaces

The PPP domain interfaces extensively with:

- **AAA** (Airframes) — Engine mounting structures (nacelles/pylons)
- **EEE** (Electrical) — Engine-driven generators and electrical interfaces
- **LCC** (Controls) — Engine control systems (FADEC)
- **EDI** (Electronics) — Engine indication and crew alerting systems
- **DDD** (Drainage) — Bleed air for air conditioning
- **EER** (Environmental) — Emissions monitoring and control

---

## 6. Related Documentation

- [ATA Chapter Assignments](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md)
- [SYSTEMS README](./SYSTEMS/README.md)
- [ATA Structure Example](../ATA-STRUCTURE-EXAMPLE.md)
- [AMPEL360-AIR-T Overview](../../README.md)

---

**Maintained by**: PPP Integration Team  
**Last Updated**: 2025-01-27  
**Status**: 🚧 In Development
