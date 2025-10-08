# 10-10-PARKING — Aircraft Stand Configuration

**Scope:** Geometría de stand, líneas de guiado, ayudas de parking, envolventes de clearance, timeline de turnaround.

## CAx Integration

- **CAD:** Layouts (ICAO Annex 14), lead-in/stop, arcos wingtip
- **CAI:** ICD de clearances → AAP (`aap.stand_clearance.v1`)
- **CAV:** Survey láser vs as-built; verificación de marcas
- **CAP:** TTL/Workflows de turnaround (BPMN), checklists de rampa

## UTCS Examples

- `UTCS-MI:PMO:CAD:STAND-TYPE-D:rev[A]`
- `UTCS-MI:PMO:CAI:CLEARANCE-ENVELOPE:A320:rev[B]`
- `UTCS-MI:PMO:CAP:TURNAROUND-WORKFLOW-BPMN:rev[A]`

## Evidence

Fotos geo-referenciadas, nubes de puntos, informes de tolerancias.

## Directory Structure

```
10-10-PARKING/
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
│  ├─ CAD/                        # Design artifacts (layouts, markings)
│  ├─ CAE/                        # Analysis artifacts
│  ├─ CAI/                        # Integration artifacts (ICDs)
│  ├─ CAM/                        # Manufacturing artifacts
│  ├─ CAO/                        # Optimization artifacts
│  ├─ CAP/                        # Process artifacts (workflows, checklists)
│  ├─ CAS/                        # Service artifacts
│  ├─ CAV/                        # Verification artifacts (surveys)
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

🚧 **In Development** — Structure defined, artifacts to be populated

## Related Documentation

- [10-00-GENERAL README](../10-00-GENERAL/README.md)
- [AAP Domain README](../../../README.md)
- [ATA Chapter 10 Assignments](../../../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)

---

**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-01-27
