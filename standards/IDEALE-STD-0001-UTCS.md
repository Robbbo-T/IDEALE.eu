# IDEALE-STD-0001 — UTCS Core (v0.1.0)

**Estatus:** Draft • **Ámbito:** IDEALE/AMPEL360 • **Norma vinculante**  
**Palabras clave IETF/RFC:** MUST, SHOULD, MAY

## 1. Objeto y alcance
UTCS define el hilo de trazabilidad canónico para artefactos PLM/CAx/TFA. Esta norma establece: estructura YAML, puente TFA, anclajes, integridad y evidencias.

## 2. Terminología
- **UTCS ID**: Identificador canónico `UTCS-MI:{SCOPE}:{CLASS}:{ZONE}:{INDEX}:v{N}`
- **BEZ**: Bloque de Estructura de Zona (DELs, PAx, PLM, QUANTUM_OA, etc.)
- **TFA bridge**: Secuencia canónica `QS→FWD→UE→FE→CB→QB`

## 3. Estructura UTCS (YAML)
Todo artefacto MUST incluir al menos:
- `schema_version` (string SemVer)
- `utcs_id` (pattern canónico)
- `product`, `domain` (uno de los 15 dominios)
- `bridge` = `"QS→FWD→UE→FE→CB→QB"` (string) **o** lista equivalente
- `primary_path` (uno de: `CB→UE`, `FE→CB→UE`, `FE→CB→QB→UE`)
- `provenance.owner`, `provenance.maintainer`
- `sheet.files[]` con `path` relativo y `role`
- `evidence.links[]` (UTCS IDs y/o rutas relativas)
- `integrity.hash_algorithm` ∈ {`SHA256`} y `content_hash` hex de 64

## 4. Reglas de ruta (binding repo)
La ruta del fichero MUST reflejar su dominio y zona/sistema.
Ej.:  
`.../AAA-.../ZONES/57-WING-STRUCTURES/57-10-BOX-SECTION/PLM/CAD/ASSY/.../utcs/ASM-AAA-ONB-DMU-0012.yaml`

## 5. Puente TFA
- `bridge` MUST registrar `QS→FWD→UE→FE→CB→QB`
- `primary_path` SHOULD reflejar el flujo operativo predominante del artefacto.

## 6. Integridad y evidencias
- `content_hash` MUST ser del binario o fuente principal anclado.
- `evidence.links` MUST incluir como mínimo un anclaje a requisitos o a un resultado de verificación (CAV/MoC).

## 7. Conformidad
El fichero es **conforme** si:
- Valida contra `schemas/utcs-core.schema.json`
- Cumple "Reglas de ruta (binding repo)"
- Pasa el checklist de §9

## 8. Versionado
- SemVer en `schema_version`.
- El campo `utcs_id` versiona con sufijo `:vN`. Cambios incompatibles MUST incrementar `N`.

## 9. Checklist de conformidad (resumen)
- [ ] `utcs_id` válido
- [ ] `bridge` y `primary_path` válidos
- [ ] `domain` ∈ {AAA, AAP, CCC, CQH, DDD, EDI, EEE, EER, IIF, IIS, LCC, LIB, MEC, OOO, PPP}
- [ ] `sheet.files[].path` relativo existente
- [ ] `evidence.links[]` resolubles
- [ ] `content_hash` coincide
- [ ] Ruta del repo ↔ dominio/zona consistentes

## 10. Seguridad y clasificación
`security.classification` SHOULD usar `INTERNAL`, `INTERNAL–EVIDENCE-REQUIRED`, `RESTRICTED`.

## 11. Apéndice A — Regex de UTCS ID
```
^UTCS-MI:[A-Z]{3}:[A-Z]{3,8}:[A-Z]{3}:[0-9]{4}:v[0-9]+$
```
