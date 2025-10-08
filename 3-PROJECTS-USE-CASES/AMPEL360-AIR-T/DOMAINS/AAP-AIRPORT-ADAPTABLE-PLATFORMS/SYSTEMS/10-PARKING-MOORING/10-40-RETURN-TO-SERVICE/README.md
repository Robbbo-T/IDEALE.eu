# 10-40-RETURN-TO-SERVICE — Reactivation Protocol
**Part of:** AMPEL360-AIR-T · **System:** 10-PARKING-MOORING  
**Scope:** Inspecciones y pruebas para reactivar aeronaves tras storage/mooring.

## Overview
Este subsistema gestiona la reactivación de aeronaves tras almacenamiento prolongado:
- Checklist de inspección pre-reactivación
- Pruebas funcionales de sistemas
- Restauración de configuración operacional
- Liberación de aeronavegabilidad (airworthiness release)
- Documentación y trazabilidad completa

## Return-to-Service Process
### Phase 1: Pre-Activation Assessment (Day 1-3)
- Revisión de registros de storage
- Inspección visual completa
- Evaluación de condiciones ambientales durante storage
- Identificación de non-conformities

### Phase 2: Systems Restoration (Day 4-7)
- Remoción de preservación (cubiertas, sellados)
- Restauración de fluidos (hidráulico, combustible, aceites)
- Reactivación de sistemas eléctricos
- Verificación de actuadores y controles

### Phase 3: Functional Testing (Day 8-10)
- Built-In Test (BIT) de aviónica
- Pruebas hidráulicas (leak checks, pressure tests)
- Ground run de motores
- Verificación de sistemas de comunicación/navegación

### Phase 4: Final Verification & Release (Day 11-14)
- Test flights (si aplicable)
- Firma de conformidad (e-sign en CAP)
- Generación de CAV packs
- Release de aeronavegabilidad

## Key Artifacts
### Procedures (CAM)
- **RTS Checklist** — MSG-3 aligned checklist
- **Work Packages** — Detailed work instructions por sistema
- **Quality Plans** — QA/QC procedures

### Verification (CAV)
- **Test Results** — Functional test records
- **Inspection Reports** — Detailed findings
- **Airworthiness Release** — Final conformity statement
- **CAV Packs** — Evidence packages para autoridades

### Process Automation (CAP)
- **Workflows** — BPMN de proceso RTS
- **e-Sign Records** — Firmas electrónicas de conformidad
- **Travelers** — Seguimiento de trabajo por sistema
- **Checklists Digitales** — Con captura de evidencia fotográfica

## CAx Integration
| PLM/CAx | Application |
|---|---|
| **CAM** | Checklist RTS, work packages, procedimientos |
| **CAV** | Test results, airworthiness packs, verificación |
| **CAP** | Workflows BPMN, e-sign, travelers, checklists digitales |
| **CAE** | Análisis de test data, validación de performance |
| **CAI** | Coordinación inter-sistemas, ICDs |

## UTCS Examples
- `UTCS-MI:PMO:CAM:RTS-CHECKLIST-A320:rev[A]` — Checklist RTS A320
- `UTCS-MI:PMO:CAV:RTS-AIRWORTHINESS-PACK:MSN12345:rev[A]` — Pack aeronavegabilidad
- `UTCS-MI:PMO:CAP:RTS-WORKFLOW-BPMN:rev[A]` — Workflow RTS en BPMN

## Compliance
- 14 CFR §43.13 — Performance Rules (FAA)
- EASA Part-M — Continuing Airworthiness Management
- AMC 20-17 — Software Considerations
- AS9100 8.5.1 — Control of Production and Service Provision

## Critical Inspections
### Structural
- [ ] Corrosión en zonas críticas
- [ ] Integridad de fuselaje y alas
- [ ] Estado de fasteners y juntas
- [ ] Funcionamiento de puertas y panels

### Propulsion
- [ ] Borescope inspection motores
- [ ] Oil analysis
- [ ] Thrust reverser operation
- [ ] Leak checks fuel system

### Systems
- [ ] Hydraulic system (pressure, leaks)
- [ ] Electrical continuity
- [ ] Avionics BIT (Built-In Test)
- [ ] Flight controls rigging
- [ ] Landing gear extension/retraction

### Safety Systems
- [ ] Fire detection/suppression
- [ ] Emergency equipment (slides, rafts)
- [ ] Oxygen system
- [ ] Warning systems

## Test Matrix
| System | Test Type | Acceptance Criteria | Evidence |
|---|---|---|---|
| Hydraulics | Pressure test | 3000 psi ±50, no leaks | CAV report |
| Avionics | BIT | All systems PASS | e-Signed log |
| Engines | Ground run | EGT/N1 within limits | CAV test data |
| Flight Controls | Rigging check | ±0.5° tolerance | Signed traveler |

## KPIs
- **Tiempo medio RTS:** Target <14 días calendario
- **% findings críticos:** Target <5% de sistemas
- **Tasa de re-trabajo:** Target <10% dentro de 30 días post-RTS
- **First-flight success rate:** Target >95%

## Documentation Requirements
✅ **Mandatory Records:**
1. Storage history log (from 10-30)
2. Pre-activation assessment report
3. Work package completion records (signed)
4. Functional test results
5. Airworthiness release certificate
6. UTCS-anchored evidence packages

## e-Signature Workflow (CAP)
```
Technician → Inspector → Quality → Chief Engineer → Airworthiness
   (Task)      (Review)    (Verify)    (Approve)        (Release)
```

All signatures captured digitally with timestamp and UTCS anchor.

## Interfaces
- **10-30 (STORAGE):** Input de condiciones y historial
- **MEC:** Sistemas mecánicos y estructurales
- **EEE:** Sistemas eléctricos y aviónica
- **PPP:** Propulsión y motores
- **LIB:** Logística de partes y consumibles

---
**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-01-27
