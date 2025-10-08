# 10-30-STORAGE — Aircraft Preservation & Layup
**Part of:** AMPEL360-AIR-T · **System:** 10-PARKING-MOORING  
**Scope:** Protocolos de corta/larga duración: kits de preservación, control de humedad, ciclos de mantenimiento, anticorrosión.

## Overview
Este subsistema gestiona el almacenamiento prolongado de aeronaves:
- Protocolos de preservación (corta duración: <6 meses, larga duración: >6 meses)
- Kits de preservación (cubiertas, desecantes, sellados)
- Control ambiental (humedad, temperatura, corrosión)
- Programas de mantenimiento durante storage
- Prevención de degradación de materiales

## Storage Categories
### Short-Term Storage (< 6 months)
- Cobertura básica (pitot, motores, ventanas)
- Inspecciones mensuales
- Mantenimiento reducido de sistemas
- Control de humedad básico

### Long-Term Storage (> 6 months)
- Preservación completa (fluidos, sellados, cubiertas)
- Inspecciones trimestrales
- Mantenimiento de preservación
- Control ambiental estricto
- Protección anticorrosión

## CAx Integration
| PLM/CAx | Application |
|---|---|
| **CAM** | Procedimientos de preservación, work packages |
| **CAE** | Modelos de degradación, análisis de humedad |
| **CAP** | Checklists de storage, workflows de inspección |
| **CAV** | Registros de inspección, evidencia de condiciones |
| **CAS** | Planificación MRO, forecast de reactivación |

## UTCS Examples
- `UTCS-MI:PMO:CAM:STORAGE-PROC-LONG-TERM:rev[A]` — Procedimiento storage largo plazo
- `UTCS-MI:PMO:CAE:HUMIDITY-MODEL-HANGAR-7:rev[B]` — Modelo humedad hangar
- `UTCS-MI:PMO:CAP:STORAGE-CHECKLIST:rev[A]` — Checklist almacenamiento

## Standards & References
- SAE ARP5762 — Aircraft Preservation
- ISO 9223 — Corrosivity of Atmospheres
- MIL-HDBK-338B — Electronic Equipment Reliability
- IATA SGHA — Standard Ground Handling Agreement

## Preservation Items
### Engine Preservation
- Taponado de entradas/salidas
- Preservación de combustible
- Rotación periódica (si aplicable)
- Control de corrosión interna

### Airframe Preservation
- Cubiertas de ventanas/sensores
- Sellado de entradas de aire
- Protección de superficies de control
- Desecantes en compartimentos críticos

### Systems Preservation
- Drenaje/llenado de fluidos según necesidad
- Desconexión de baterías
- Protección de conectores eléctricos
- Preservación de actuadores hidráulicos

## Environmental Monitoring
| Parameter | Target Range | Monitoring Frequency | Action Threshold |
|---|---|---|---|
| Humidity | 40-60% RH | Daily | >70% or <30% |
| Temperature | 15-25°C | Daily | >30°C or <5°C |
| Corrosion Index | < ISO 9223 C3 | Monthly | ≥ C3 |

## Inspection Schedule
- **Weekly:** Visual inspection externa, security checks
- **Monthly:** Inspección de cubiertas, verificación de desecantes
- **Quarterly:** Inspección interna, test de sistemas críticos
- **Annual:** Inspección comprensiva, actualización de preservación

## KPIs
- Tiempo medio a preservación (target: <48h post-grounding)
- % humedad objetivo alcanzado (target: >95% uptime)
- Incidencias post-almacenaje (target: <2% de sistemas afectados)
- Tiempo de reactivación (ver 10-40)

## Federation
- **EER:** Análisis de degradación de materiales
- **CAS:** Forecast MRO, planificación de reactivación
- **LIB:** Logística de kits de preservación
- **MEC:** Estado estructural y mecánico
- **EEE:** Estado de sistemas eléctricos

---
**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-01-27
