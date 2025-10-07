# UTCS Conformance Checklist

- [ ] 1. Estructura YAML valida contra `utcs-core.schema.json`
- [ ] 2. `utcs_id` y ruta en el repo coherentes con dominio/ATA
- [ ] 3. `bridge` = QS→FWD→UE→FE→CB→QB
- [ ] 4. `primary_path` (CB→UE | FE→CB→UE | FE→CB→QB→UE)
- [ ] 5. `sheet.files[]` existen y son relativos
- [ ] 6. `evidence.links[]` resolubles (UTCS ID o path)
- [ ] 7. `content_hash` corresponde al binario asociado
- [ ] 8. Clasificación de seguridad aplicada
- [ ] 9. Trazabilidad a requisitos (CS-25/CS-xx) presente
