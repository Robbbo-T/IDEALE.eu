# 10-10-PARKING — Aircraft Stand Configuration
**Part of:** AMPEL360-AIR-T · **System:** 10-PARKING-MOORING  
**Scope:** Geometría de stand, líneas de guiado, ayudas de parking, envolventes de clearance, timeline de turnaround.

## Overview
Este subsistema gestiona toda la configuración física y operacional de los stands de aparcamiento de aeronaves:
- Diseño geométrico de stands conforme a ICAO Annex 14
- Líneas de guiado (lead-in lines, stop marks)
- Arcos de protección de wingtips
- Envolventes de clearance para diferentes tipos de aeronaves
- Workflows y timelines de turnaround

## CAx Integration
| PLM/CAx | Application |
|---|---|
| **CAD** | Layouts (ICAO Annex 14), lead-in/stop, arcos wingtip |
| **CAI** | ICD de clearances → AAP (`aap.stand_clearance.v1`) |
| **CAV** | Survey láser vs as-built; verificación de marcas |
| **CAP** | TTL/Workflows de turnaround (BPMN), checklists de rampa |
| **CAE** | Simulaciones de movimiento, análisis de interferencias |
| **CAS** | Planificación de capacidad y optimización de stands |

## UTCS Examples
- `UTCS-MI:PMO:CAD:STAND-TYPE-D:rev[A]` — Diseño de stand tipo D
- `UTCS-MI:PMO:CAI:CLEARANCE-ENVELOPE:A320:rev[B]` — Envolvente de clearance A320
- `UTCS-MI:PMO:CAP:TURNAROUND-WORKFLOW-BPMN:rev[A]` — Workflow de turnaround en BPMN

## Evidence
- Fotos geo-referenciadas de stands
- Nubes de puntos láser (as-built surveys)
- Informes de tolerancias dimensionales
- Registros de validación de marcas

## Key Deliverables
1. **Stand Layout Drawings** — Planos detallados con dimensiones y tolerancias
2. **Clearance Envelopes** — Por tipo de aeronave (A320, B737, etc.)
3. **Turnaround Procedures** — SOPs digitales con BPMN workflows
4. **Verification Reports** — Evidencia de conformidad con ICAO/EASA

## Standards & References
- ICAO Annex 14 (Aerodromes)
- EASA CS-ADR-DSN (Aerodrome Design)
- ACI Airport Design Guidelines
- ISO 3864 (Safety Signs)

## Interfaces
- **AAP** (Airport Adaptable Platforms) — Rampa operations
- **MEC** (Mechanical Systems) — Ground support equipment
- **EEE** (Electrical) — Ground power units
- **OOO** (Ontologies) — Digital twin integration

---
**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-01-27
