#!/usr/bin/env bash
set -euo pipefail

ROOT="3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES/54-NACELLES-PYLONS"
SUBS=("54-00-GENERAL" "54-10-NACELLE-STRUCTURE" "54-20-PYLON-STRUT" "54-30-THRUST-REVERSER-STRUCTURE" "54-40-FIRE-THERMAL-ACOUSTICS")
PLM=(CAD CAE CAO CAM CAI CAV CAS CMP CAP)
CAPSUB=(BPMN SOPs Travelers Checklists eSign Process-Mining Integrations)
QOA=(GA LP MILP QAOA QOX QP QUBO SA)

for S in "${SUBS[@]}"; do
  base="${ROOT}/${S}"
  mkdir -p "${base}/DELs"/{EASA-submissions,MoC-records,airworthiness-statements,data-packages,final-design-reports} \
           "${base}/PAx"/{ONB,OUT} \
           "${base}/PROCUREMENT/VENDORSCOMPONENTS" \
           "${base}/SUPPLIERS"/{BIDS,SERVICES} \
           "${base}/policy" "${base}/tests"
  for p in "${PLM[@]}"; do mkdir -p "${base}/PLM/${p}"; done
  for c in "${CAPSUB[@]}"; do mkdir -p "${base}/PLM/CAP/${c}"; done
  for q in "${QOA[@]}"; do mkdir -p "${base}/QUANTUM_OA/${q}"; done
  # README base si no existe
  readme="${base}/README.md"
  if [[ ! -f "$readme" ]]; then
    cat > "$readme" <<'MD'
# 54-XX — Nacelles & Pylons (subsystem)

**Path:** AAA/ZONES/54-NACELLES-PYLONS/54-XX • **UTCS:** `UTCS-MI:AAA:Z54:{plm_type}:{artifact}:rev[X]`  
**Scope:** ver README de la subcarpeta para detalle.  
**CAx:** CAD/CAE/CAI/CAV + **CAP** (BPMN, SOPs, Travelers, eSign).  
**QUANTUM_OA:** GA/LP/MILP/QAOA/QOX/QP/QUBO/SA (según problema).  
MD
  fi
done

echo "ATA 54 (AAA/ZONES) scaffolding creado/actualizado en ${ROOT}"
