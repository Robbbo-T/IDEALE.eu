# Naming & Paths (Normativo)

## UTCS IDs
UTCS-MI:{SCOPE}:{CLASS}:{ZONE}:{INDEX}:v{N}
- SCOPE  = CAD|CAE|ASM|DMU|JOIN|ICD|BOM|POLICY|TEST|...
- CLASS  = AAA|PPP|MEC|... (dominio) o subclase técnica
- ZONE   = ONB|OUT|57-10|53-10|...
- INDEX  = 4 dígitos (e.g., 0012)
- vN     = versión entera

## Archivos DMU
ASM-AAA-{ZONE}-DMU-{IDX}.{ext}
UTCS YAML asociado: `utcs/ASM-AAA-{ZONE}-DMU-{IDX}.yaml`

## Reglas de ruta
`.../DOMAINS/{DOMAIN}/ZONES|SYSTEMS/{ATA-CHAPTER}/{SUBZONE}/.../utcs/*.yaml`
