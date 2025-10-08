#!/usr/bin/env bash
set -euo pipefail

ROOT="3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES/56-WINDOWS"
SUBS=("56-00-GENERAL" "56-10-FLIGHT-DECK-WINDOWS" "56-20-CABIN-WINDOWS" "56-30-EMERGENCY-EXIT-WINDOWS" "56-40-FRAMES-SEALS-BONDING")
PLM=(CAD CAE CAO CAM CAI CAV CAS CMP CAP)
CAPSUB=(BPMN SOPs Travelers Checklists eSign Process-Mining Integrations)
QOA=(GA LP MILP QAOA QOX QP QUBO SA)

for S in "${SUBS[@]}"; do
  base="${ROOT}/${S}"
  mkdir -p "${base}/DELs"/{EASA-submissions,MoC-records,airworthiness-evidence,data-packages,final-design-releases} \
           "${base}/ONB" "${base}/OUT" "${base}/PAx" \
           "${base}/PROCUREMENT/VENDORSCOMPONENTS" \
           "${base}/SUPPLIERS/BIDS" "${base}/SUPPLIERS/SERVICES" \
           "${base}/policy" "${base}/tests"
  for p in "${PLM[@]}"; do mkdir -p "${base}/PLM/${p}"; done
  for c in "${CAPSUB[@]}"; do mkdir -p "${base}/PLM/CAP/${c}"; done
  for q in "${QOA[@]}"; do mkdir -p "${base}/QUANTUM_OA/${q}"; done
  # README base
  readme="${base}/README.md"
  if [[ ! -f "$readme" ]]; then
cat > "$readme" <<'MD'
# 56-XX — Windows (subsystem)

**Path:** AAA/ZONES/56-WINDOWS/56-XX  
**UTCS:** `UTCS-MI:AAA:Z56:{plm_type}:{artifact}:rev[X]`  
**Scope:** ver README específico del sub-sistema.  
**CAx:** CAD/CAE/CAI/CAV + **CAP** (BPMN, SOPs, Travelers, eSign).  
**QUANTUM_OA:** GA/LP/MILP/QAOA/QOX/QP/QUBO/SA (según problema).
MD
  fi
done

echo "ATA 56 scaffolding creado/actualizado en ${ROOT}"
