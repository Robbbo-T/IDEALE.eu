# 10-00-GENERAL — Parking & Mooring Governance

**Part of:** AMPEL360-AIR-T · **System:** 10-PARKING-MOORING  
**Status:** Production-Ready · **UTCS Domain:** PMO (Parking & Mooring Operations)

## Overview

Gobernanza transversal para parking y mooring:
- SOPs comunes (ground crew), formación/PPE, señalización (ISO 3864)
- HAZOP/FTA (p.ej., aeronave sin asegurar, GPU mal conectada)
- Políticas de viento, FOD, zonas seguras en rampa
- Principios de interfaz con **AAP** (rampa), **MEC** (cargas tren), **EEE** (power), **OOO** (ontologías/SW)

## PLM/CAx Integration (incluye CAP)

| PLM/CAx | Skill | Uso en 10-00 |
|---|---|---|
| CAD | Geometric Interpretation | Plantillas de señalización/layout de seguridad |
| CAE | Predictive Modeling | Modelos de riesgo/impacto (viento/objetos) |
| **CAP** | **Computer-Aided Processes** | BPMN/SOP digitales, travelers, e-sign, process mining |
| CAI | Interface Coordination | ICDs con AAP/MEC/EEE |
| CAV | Verification & Auditing | Evidencia de HAZOP, drills, MoC |
| CAS | Operational Forecasting | Matrices de dotación, ventanas meteo |
| CMP | Strategic Governance | Políticas, prioridades, KPIs |

## Key Artifacts (UTCS)

- `PLM/CAV/hazop-pmo-2025.json` → `UTCS-MI:PMO:HAZOP:PMO-SYSTEM:rev[A]`  
- `PLM/CMP/pmo-policy.yaml` → `UTCS-MI:PMO:POL:GROUND-HANDLING:v1.2:rev[C]`  
- `PLM/CAP/SOPs/sop-ground-crew.pdf` → `UTCS-MI:PMO:SOP:RAMP-CREW:rev[B]`

## Standards

EASA SIB 2020-12 · FAA AC 25.143-1 · SAE ARP *applicable* · ISO 3864 · OSHA 1910.147

> **SSoT** para reglas de seguridad y factores humanos aplicadas en 10-10…10-40.

## Directory Structure

```
10-00-GENERAL/
├─ DELs/                          # Deliveries
│  ├─ EASA-submissions/           # EASA certification submissions
│  ├─ MoC-records/                # Means of Compliance records
│  ├─ airworthiness-statements/   # Airworthiness compliance statements
│  ├─ data-packages/              # Complete data packages
│  └─ final-design-reports/       # Final design reports
│
├─ PAx/                           # Packaging and Integration
│  ├─ ONB/                        # Onboard systems integration
│  └─ OUT/                        # External systems integration
│
├─ PLM/                           # Product Lifecycle Management
│  ├─ CAD/                        # Design artifacts
│  ├─ CAE/                        # Analysis artifacts
│  ├─ CAI/                        # Integration artifacts
│  ├─ CAM/                        # Manufacturing artifacts
│  ├─ CAO/                        # Optimization artifacts
│  ├─ CAP/                        # Process artifacts
│  ├─ CAS/                        # Service artifacts
│  ├─ CAV/                        # Verification artifacts
│  └─ CMP/                        # Compliance management
│
├─ PROCUREMENT/                   # Procurement Management
│  └─ VENDORSCOMPONENTS/          # Vendor components
│
├─ QUANTUM_OA/                    # Quantum Optimization Algorithms
│  ├─ GA/                         # Genetic algorithms
│  ├─ LP/                         # Linear programming
│  ├─ MILP/                       # Mixed-integer linear programming
│  ├─ QAOA/                       # Quantum approximate optimization
│  ├─ QOX/                        # Quantum optimization exchange
│  ├─ QP/                         # Quadratic programming
│  ├─ QUBO/                       # Quadratic unconstrained binary opt
│  └─ SA/                         # Simulated annealing
│
├─ SUPPLIERS/                     # Supplier Management
│  ├─ BIDS/                       # Supplier bids and proposals
│  └─ SERVICES/                   # Supplier services and support
│
├─ policy/                        # Policies and procedures
├─ tests/                         # Test plans and results
├─ META.json                      # Metadata
├─ README.md                      # This file
└─ domain-config.yaml             # Configuration
```

## Status

🚧 **Production-Ready** — Structure defined, ready for artifacts

## Related Documentation

- [10-PARKING-MOORING System README](../README.md)
- [AAP Domain README](../../../README.md)
- [ATA Chapter 10 Assignments](../../../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)

---

**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-01-27
