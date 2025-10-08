# 10-20-MOORING — Aircraft Securing Systems
**Part of:** AMPEL360-AIR-T · **System:** 10-PARKING-MOORING  
**Scope:** Puntos de amarre (hardpoints), kits de amarre, análisis de viento, ensayos de tracción.

## Overview
Este subsistema gestiona los sistemas de aseguramiento de aeronaves para condiciones de viento:
- Identificación y validación de hardpoints (puntos de amarre)
- Diseño y especificación de kits de amarre (correas, grilletes, tensores)
- Análisis de cargas por viento (wind loading analysis)
- Procedimientos de instalación y tensado
- Ensayos de tracción y verificación

## Key Artifacts
### Engineering
- **Hardpoint Maps** — Mapas de puntos de amarre por tipo de aeronave (de MEC)
- **Wind-Load Tables** — Tablas viento-carga por tipo/ángulo de ataque
- **Mooring Kits BOM** — Bill of Materials (correas, grilletes, tensores) → PROCUREMENT/

### Verification
- **Tensile Tests** (CAV): Ensayos estáticos a 1.5× carga esperada
- **Installation Procedures** (CAP): SOPs con checklists de instalación
- **Inspection Records** (CAV): Registros de inspección pre/post uso

## CAx Integration
| PLM/CAx | Application |
|---|---|
| **CAE** | Análisis de cargas por viento (CFD, cargas dinámicas) |
| **CAV** | Ensayos de tracción, verificación de resistencia |
| **CAP** | Checklists de instalación, procedimientos de mooring |
| **CAD** | Diseño de kits, layouts de puntos de amarre |
| **CAI** | ICDs con MEC (hardpoints), EEE (grounding) |

## UTCS Examples
- `UTCS-MI:PMO:CAE:WIND-LOAD-A320-50KT:rev[A]` — Análisis viento 50kt A320
- `UTCS-MI:PMO:CAV:TENSILE-TEST-MOORING-KIT-2025:rev[A]` — Ensayo tracción kit
- `UTCS-MI:PMO:CAP:MOORING-CHECKLIST:rev[A]` — Checklist instalación

## Compliance
- EASA AMC 25.143 — Aircraft tie-down provisions
- SAE AS5642 — Aircraft Ground Support Equipment
- MIL-STD-810H — Environmental exposure testing
- ISO 6892-1 — Tensile testing methods

## Wind Loading Scenarios
| Wind Speed | Aircraft Type | Load Factor | Mooring Points |
|---|---|---|---|
| 30-50 kt | A320/B737 | 1.0× | 4 points (wings + tail) |
| 50-70 kt | A320/B737 | 1.5× | 6 points (wings + nose + tail) |
| 70+ kt | All types | 2.0× | Maximum available |

## Interfaces
- **MEC** (Mechanical) — Geometría de hardpoints, resistencia estructural
- **EEE** (Electrical) — Puesta a tierra durante mooring
- **AAP** (Airport Platforms) — Operación en rampa, espacios disponibles
- **EER** (Environmental) — Condiciones meteorológicas, alertas de viento

## Safety Considerations
⚠️ **Critical Safety Items:**
- Verificar resistencia de hardpoints antes de usar
- Inspeccionar correas/grilletes por desgaste
- No exceder límites de carga especificados
- Mantener tensión uniforme en todos los puntos
- Personal certificado para instalación

---
**Maintained by**: AMPEL360-AIR-T Team  
**Last Updated**: 2025-01-27
