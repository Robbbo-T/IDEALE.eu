# 10-20-MOORING — Aircraft Securing Systems

**Scope:** Puntos de amarre (hardpoints), kits de amarre, análisis de viento, ensayos de tracción.

## Key Artifacts

- Mapa de **hardpoints** (de MEC)
- Tablas **viento-carga** por tipo de aeronave/ángulo
- **BOM** del kit (correas, grilletes, tensores) → PROCUREMENT/
- **Ensayos** (CAV): estático a 1.5× carga esperada

## Compliance

EASA AMC 25.143 · SAE AS5642 · MIL-STD-810H (exposición)

## UTCS Examples

- `UTCS-MI:PMO:CAE:WIND-LOAD-A320-50KT:rev[A]`
- `UTCS-MI:PMO:CAV:TENSILE-TEST-MOORING-KIT-2025:rev[A]`
- `UTCS-MI:PMO:CAP:MOORING-CHECKLIST:rev[A]`

## Interfaces

**MEC** (geometría de hardpoints), **EEE** (puesta a tierra), **AAP** (operación en rampa).

## Directory Structure

```
10-20-MOORING/
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
│  ├─ CAD/                        # Design artifacts (hardpoint maps)
│  ├─ CAE/                        # Analysis artifacts (wind loads)
│  ├─ CAI/                        # Integration artifacts
│  ├─ CAM/                        # Manufacturing artifacts
│  ├─ CAO/                        # Optimization artifacts
│  ├─ CAP/                        # Process artifacts (checklists)
│  ├─ CAS/                        # Service artifacts
│  ├─ CAV/                        # Verification artifacts (tensile tests)
│  └─ CMP/                        # Compliance management
│
├─ PROCUREMENT/                   # Procurement Management
│  └─ VENDORSCOMPONENTS/          # Vendor components (kits, BOMs)
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

🚧 **In Development** — Structure defined, artifacts to be populated

## Related Documentation

- [10-00-GENERAL README](../10-00-GENERAL/README.md)
- [AAP Domain README](../../../README.md)
- [ATA Chapter 10 Assignments](../../../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)

---

**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-01-27
