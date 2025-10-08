#!/usr/bin/env bash
set -euo pipefail

# Scaffolding script for 10-PARKING-MOORING subsystems
# Creates directory structure for PMO (Parking & Mooring Operations) subsystems

ROOT="3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAP-AIRPORT-ADAPTABLE-PLATFORMS/SYSTEMS/10-PARKING-MOORING"
SUBS=("10-00-GENERAL" "10-10-PARKING" "10-20-MOORING" "10-30-STORAGE" "10-40-RETURN-TO-SERVICE")
PLM_FOLDERS=("CAD" "CAE" "CAO" "CAM" "CAI" "CAV" "CAS" "CMP" "CAP")
QOA=("GA" "LP" "MILP" "QAOA" "QOX" "QP" "QUBO" "SA")

echo "Creating 10-PARKING-MOORING subsystem structure..."

for S in "${SUBS[@]}"; do
  base="${ROOT}/${S}"
  echo "  Processing ${S}..."
  
  # Create main directories
  mkdir -p "${base}/DELs/EASA-submissions" \
           "${base}/DELs/MoC-records" \
           "${base}/DELs/airworthiness-evidence" \
           "${base}/DELs/data-packages" \
           "${base}/DELs/final-design-releases" \
           "${base}/PAx" "${base}/ONB" "${base}/OUT" \
           "${base}/PROCUREMENT/VENDORSCOMPONENTS" \
           "${base}/SUPPLIERS/BIDS" "${base}/SUPPLIERS/SERVICES" \
           "${base}/policy" "${base}/tests"

  # Create PLM directories
  for p in "${PLM_FOLDERS[@]}"; do 
    mkdir -p "${base}/PLM/${p}"
  done
  
  # Create CAP subdirectories for process automation
  for s in BPMN SOPs Travelers Checklists eSign Process-Mining Integrations; do
    mkdir -p "${base}/PLM/CAP/${s}"
  done
  
  # Create QUANTUM_OA directories
  for q in "${QOA[@]}"; do 
    mkdir -p "${base}/QUANTUM_OA/${q}"
  done
  
  # Create placeholder .gitkeep files in empty directories
  touch "${base}/tests/.gitkeep" 2>/dev/null || true
  touch "${base}/PROCUREMENT/VENDORSCOMPONENTS/.gitkeep" 2>/dev/null || true
  touch "${base}/SUPPLIERS/BIDS/.gitkeep" 2>/dev/null || true
  touch "${base}/SUPPLIERS/SERVICES/.gitkeep" 2>/dev/null || true
done

echo "✅ Directory structure created in ${ROOT}"
echo "   Subsystems: ${SUBS[*]}"
