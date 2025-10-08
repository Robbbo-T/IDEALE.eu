# Quick Start Guide: SCI Implementation for AMPEL360-SPACE-T

This guide provides step-by-step instructions for implementing Spacecraft Chapter Index (SCI) chapters in the AMPEL360-SPACE-T domain structure.

## Overview

The AMPEL360-SPACE-T structure follows these principles:
1. **All domains use SYSTEMS/** (no ZONES/)
2. **BEZ only at sub-subsystem level** (3 levels deep)
3. **System and subsystem levels are clean** (descriptors only)
4. **UTCS format**: `SPACE.SCI.NN-LABEL.SUBSYSTEM[.SUB-SUBSYSTEM]:REV`

## Prerequisites

- Familiarity with the 15 canonical domains (AAA, PPP, MEC, LCC, EDI, EEE, EER, DDD, CCC, IIS, LIB, AAP, CQH, IIF, OOO)
- Understanding of BEZ structure (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, policy/, tests/)
- Knowledge of SCI chapter assignments (see `sci-chapters.csv`)

## Step 1: Identify the SCI Chapter

Check the SCI chapter assignment:
```bash
# View SCI chapter assignments
cat 1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.csv | grep "^SCI Chapter,24"
```

Example output:
```
SCI Chapter,24,EPS Power,EEE,,Electrical power system
```

This tells you:
- **Chapter**: 24
- **Name**: EPS Power
- **Primary Domain**: EEE (Electrical, Endotransponders, Circulation)
- **Secondary Domains**: None

## Step 2: Navigate to Domain

```bash
cd 3-PROJECTS-USE-CASES/AMPEL360-SPACE-T/DOMAINS/EEE-ELECTRICAL-ENDOTRANSPONDERS-CIRCULATION/
```

## Step 3: Create System Level (CLEAN)

Create the system directory structure:

```bash
# Create system directory
mkdir -p SYSTEMS/24-EPS-POWER

# Create system-level descriptor files
cat > SYSTEMS/24-EPS-POWER/README.md <<'EOF'
# 24-EPS-POWER — Electrical Power System

## Overview

The Electrical Power System (EPS) provides generation, storage, regulation, and distribution of electrical power for all spacecraft systems.

## Subsystems

- **24-10-SOLAR-ARRAYS** — Photovoltaic power generation
- **24-20-BATTERIES** — Energy storage
- **24-30-PCDU** — Power control and distribution unit
- **24-40-REGULATORS** — Voltage regulation
- **24-50-HARNESS** — Power distribution harness

## Interfaces

- **LCC**: Command and telemetry
- **EDI**: Monitoring and control
- **All Domains**: Power distribution

## UTCS Anchor

```
SPACE.SCI.24-EPS-POWER:rev[A]
```
EOF

# Create system metadata
cat > SYSTEMS/24-EPS-POWER/system.meta.yml <<'EOF'
utcs_anchor: "SPACE.SCI.24-EPS-POWER:rev[A]"
system_name: "Electrical Power System"
domain: "EEE"
sci_chapter: 24
description: "Primary electrical power generation, storage, and distribution"
subsystems:
  - "24-10-SOLAR-ARRAYS"
  - "24-20-BATTERIES"
  - "24-30-PCDU"
  - "24-40-REGULATORS"
  - "24-50-HARNESS"
interfaces:
  - domain: "LCC"
    system: "23-TT-C"
    type: "command-telemetry"
  - domain: "EDI"
    system: "42-DATABUS-IMA"
    type: "monitoring"
power_budget_w: 2500
voltage_bus_v: 28
redundancy: "dual-string"
EOF

# Create interface definitions
cat > SYSTEMS/24-EPS-POWER/interfaces.yml <<'EOF'
system: "24-EPS-POWER"
utcs_anchor: "SPACE.SCI.24-EPS-POWER:rev[A]"

external_interfaces:
  - interface_id: "EPS-001"
    name: "Primary Power Bus"
    type: "electrical"
    voltage_v: 28
    current_max_a: 90
    consumers: "all-domains"
  
  - interface_id: "EPS-002"
    name: "TT&C Command"
    type: "data"
    domain: "LCC"
    system: "23-TT-C"
    protocol: "MIL-STD-1553B"
  
  - interface_id: "EPS-003"
    name: "Telemetry Data"
    type: "data"
    domain: "EDI"
    system: "31-TELEMETRY-DATA-RECORDING"
    rate_hz: 10

internal_interfaces:
  - interface_id: "EPS-INT-001"
    name: "Solar Array to PCDU"
    type: "electrical"
    voltage_v: 32
    current_max_a: 50
EOF
```

**Key points:**
- System level contains **only descriptors**
- No BEZ folders at this level
- Files: README.md, system.meta.yml, interfaces.yml

## Step 4: Create Subsystem Level (CLEAN)

Create a subsystem:

```bash
# Create subsystem directory
mkdir -p SYSTEMS/24-EPS-POWER/24-30-PCDU

# Create subsystem README
cat > SYSTEMS/24-EPS-POWER/24-30-PCDU/README.md <<'EOF'
# 24-30-PCDU — Power Control and Distribution Unit

## Overview

The PCDU manages power flow from solar arrays and batteries to all spacecraft loads. It provides switching, regulation, and fault protection.

## Sub-Subsystems

- **24-30-01-PDU-PRIMARY** — Primary power distribution unit
- **24-30-02-PDU-REDUNDANT** — Redundant power distribution unit
- **24-30-03-BATTERY-CHARGE** — Battery charge controller
- **24-30-04-SHUNT-REG** — Shunt regulator

## UTCS Anchor

```
SPACE.SCI.24-EPS-POWER.24-30-PCDU:rev[A]
```
EOF

# Create subsystem metadata
cat > SYSTEMS/24-EPS-POWER/24-30-PCDU/subsystem.meta.yml <<'EOF'
utcs_anchor: "SPACE.SCI.24-EPS-POWER.24-30-PCDU:rev[A]"
subsystem_name: "Power Control and Distribution Unit"
parent_system: "24-EPS-POWER"
description: "Central power management and distribution"
sub_subsystems:
  - "24-30-01-PDU-PRIMARY"
  - "24-30-02-PDU-REDUNDANT"
  - "24-30-03-BATTERY-CHARGE"
  - "24-30-04-SHUNT-REG"
mass_kg: 15.2
power_consumption_w: 8
dimensions_mm: [400, 300, 150]
temperature_range_c: [-40, 85]
radiation_tolerance_krad: 50
EOF
```

**Key points:**
- Subsystem level contains **only descriptors**
- No BEZ folders at this level
- Files: README.md, subsystem.meta.yml

## Step 5: Create Sub-Subsystem Level (BEZ HERE)

Create the sub-subsystem with full BEZ structure:

```bash
# Create sub-subsystem base
mkdir -p SYSTEMS/24-EPS-POWER/24-30-PCDU/24-30-01-PDU-PRIMARY

# Create BEZ structure
cd SYSTEMS/24-EPS-POWER/24-30-PCDU/24-30-01-PDU-PRIMARY

# DELs structure
mkdir -p DELs/{ECSS-submissions,CCSDS-compliance,NASA-standards,data-packages,final-design-reports}

# PAx structure
mkdir -p PAx/{ONB,OUT}

# PLM structure
mkdir -p PLM/{CAD,CAE,CAI,CAM,CAO,CAP,CAS,CAV,CMP}

# QUANTUM_OA structure
mkdir -p QUANTUM_OA/{GA,LP,MILP,QAOA,QOX,QP,QUBO,SA}

# SUPPLIERS structure
mkdir -p SUPPLIERS/{BIDS,SERVICES}

# Other directories
mkdir -p policy tests

# Create META.json
cat > META.json <<'EOF'
{
  "utcs_anchor": "SPACE.SCI.24-EPS-POWER.24-30-PCDU.24-30-01-PDU-PRIMARY:rev[A]",
  "utcs_scope": "instance",
  "component_name": "Primary Power Distribution Unit",
  "domain": "EEE",
  "sci_chapter": 24,
  "parent_subsystem": "24-30-PCDU",
  "scope": "instance",
  "mass_kg": 7.5,
  "power_consumption_w": 4,
  "compliance": [
    "ECSS-E-ST-20C",
    "ECSS-E-ST-50C",
    "NASA-STD-4005"
  ],
  "criticality": "1A",
  "redundancy": "cold-redundant"
}
EOF

# Create inherit.json
cat > inherit.json <<'EOF'
{
  "inherits_from": "../../../../../../../DELs",
  "utcs_scope": "instance",
  "applies_templates": [
    "ECSS-FDR-template.docx",
    "CCSDS-compliance-checklist.xlsx",
    "NASA-review-package-template.pptx"
  ],
  "compliance_frameworks": [
    "ECSS-E-ST-20C",
    "ECSS-E-ST-50C",
    "NASA-STD-4005"
  ],
  "inherited_policies": [
    "power-system-safety-policy.md",
    "emc-requirements.md",
    "radiation-tolerance-requirements.md"
  ]
}
EOF

# Create README.md
cat > README.md <<'EOF'
# 24-30-01-PDU-PRIMARY — Primary Power Distribution Unit

## Overview

The Primary PDU distributes regulated 28V power to all spacecraft loads with individual channel switching and protection.

## Technical Specifications

- **Voltage**: 28V DC ±0.5V
- **Current**: 90A maximum
- **Channels**: 16 switched outputs
- **Protection**: Overcurrent, overvoltage, reverse polarity
- **Mass**: 7.5 kg
- **Dimensions**: 200 x 200 x 100 mm

## Artifacts

### DELs/
Certification and compliance artifacts:
- ECSS submissions for design reviews
- CCSDS compliance documentation
- NASA standards compliance
- Final design reports

### PLM/
Product lifecycle management:
- CAD: 3D models (STEP, IGES)
- CAE: Thermal and structural analysis
- CAV: Verification test results
- CAS: Technical publications (S1000D)

### SUPPLIERS/
Procurement:
- BIDS: Vendor quotations
- SERVICES: Service contracts

### tests/
Qualification and acceptance test data

## UTCS Anchor

```
SPACE.SCI.24-EPS-POWER.24-30-PCDU.24-30-01-PDU-PRIMARY:rev[A]
```

## Status

🚧 **In Development**
EOF

# Create domain-config.yaml
cat > domain-config.yaml <<'EOF'
component:
  utcs_anchor: "SPACE.SCI.24-EPS-POWER.24-30-PCDU.24-30-01-PDU-PRIMARY:rev[A]"
  name: "Primary Power Distribution Unit"
  type: "electronic-unit"
  criticality: "1A"

compliance:
  frameworks:
    - name: "ECSS-E-ST-20C"
      status: "in-progress"
    - name: "ECSS-E-ST-50C"
      status: "in-progress"
    - name: "NASA-STD-4005"
      status: "planned"

technical:
  mass_kg: 7.5
  power_w: 4
  voltage_v: 28
  current_a: 90
  channels: 16
  dimensions_mm: [200, 200, 100]
  temperature_range_c: [-40, 85]
  radiation_krad: 50

lifecycle:
  phase: "design"
  next_review: "PDR"
  responsible_engineer: "TBD"
EOF
```

**Key points:**
- Sub-subsystem level has **complete BEZ structure**
- All artifact folders present
- META.json with scope: "instance"
- inherit.json references domain templates
- domain-config.yaml for configuration

## Step 6: Add .gitkeep Files

Ensure empty directories are tracked:

```bash
# From sub-subsystem directory
find . -type d -empty -exec touch {}/.gitkeep \;
```

## Step 7: Validate Structure

Check your structure matches the pattern:

```bash
# From domain root
tree -L 5 SYSTEMS/24-EPS-POWER/24-30-PCDU/24-30-01-PDU-PRIMARY/
```

Expected output:
```
24-30-01-PDU-PRIMARY/
├── DELs/
│   ├── ECSS-submissions/
│   ├── CCSDS-compliance/
│   ├── NASA-standards/
│   ├── data-packages/
│   └── final-design-reports/
├── PAx/
│   ├── ONB/
│   └── OUT/
├── PLM/
│   ├── CAD/
│   ├── CAE/
│   ├── CAI/
│   ├── CAM/
│   ├── CAO/
│   ├── CAP/
│   ├── CAS/
│   ├── CAV/
│   └── CMP/
├── QUANTUM_OA/
│   ├── GA/
│   ├── LP/
│   ├── MILP/
│   ├── QAOA/
│   ├── QOX/
│   ├── QP/
│   ├── QUBO/
│   └── SA/
├── SUPPLIERS/
│   ├── BIDS/
│   └── SERVICES/
├── policy/
├── tests/
├── META.json
├── inherit.json
├── README.md
└── domain-config.yaml
```

## Validation Checklist

Before committing, verify:

- [ ] System level is **clean** (only README.md, system.meta.yml, interfaces.yml)
- [ ] Subsystem level is **clean** (only README.md, subsystem.meta.yml)
- [ ] Sub-subsystem has **complete BEZ structure**
- [ ] UTCS anchors follow `SPACE.SCI.NN-LABEL.SUBSYS.SUB-SUBSYS:REV` format
- [ ] META.json has `"scope": "instance"`
- [ ] inherit.json references domain templates
- [ ] Naming convention followed: `NN-NN-NN-NAME/`
- [ ] All empty directories have .gitkeep files
- [ ] README files present at all levels

## Common Patterns

### For Structures (AAA Domain)

```
SYSTEMS/
└─ 53-PRIMARY-STRUCTURE/              ← System (clean)
   ├─ system.meta.yml
   └─ 53-10-MAIN-BODY/                 ← Subsystem (clean)
      ├─ subsystem.meta.yml
      ├─ 53-10-01-FORWARD-SECT/        ← Sub-subsystem (BEZ)
      ├─ 53-10-02-CENTER-SECT/         ← Sub-subsystem (BEZ)
      └─ 53-10-03-AFT-SECT/            ← Sub-subsystem (BEZ)
```

### For Propulsion (PPP Domain)

```
SYSTEMS/
└─ 71-MAIN-PROPULSION/                ← System (clean)
   ├─ system.meta.yml
   └─ 71-10-MAIN-ENGINE/               ← Subsystem (clean)
      ├─ subsystem.meta.yml
      ├─ 71-10-01-THRUST-CHAMBER/     ← Sub-subsystem (BEZ)
      ├─ 71-10-02-TURBOPUMP/          ← Sub-subsystem (BEZ)
      └─ 71-10-03-VALVES/             ← Sub-subsystem (BEZ)
```

### For Avionics (EDI Domain)

```
SYSTEMS/
└─ 40-FLIGHT-SOFTWARE/                ← System (clean)
   ├─ system.meta.yml
   └─ 40-10-CORE-FSW/                  ← Subsystem (clean)
      ├─ subsystem.meta.yml
      ├─ 40-10-01-KERNEL/             ← Sub-subsystem (BEZ)
      ├─ 40-10-02-DRIVERS/            ← Sub-subsystem (BEZ)
      └─ 40-10-03-MIDDLEWARE/         ← Sub-subsystem (BEZ)
```

## Tips

1. **Use templates**: Copy domain-level templates when creating new sub-subsystems
2. **UTCS anchors**: Always use hierarchical format with all levels
3. **Metadata consistency**: Ensure META.json, inherit.json, and YAML files agree
4. **Cross-references**: Link related sub-subsystems in README files
5. **Compliance early**: Identify ECSS/CCSDS/NASA requirements from the start
6. **Clean levels**: Never add BEZ folders to system or subsystem levels

## Troubleshooting

### Problem: BEZ at wrong level
**Symptom**: BEZ folders at system or subsystem level  
**Solution**: Move BEZ down to sub-subsystem level

### Problem: Missing descriptor files
**Symptom**: System/subsystem level has no meta files  
**Solution**: Add system.meta.yml or subsystem.meta.yml

### Problem: UTCS format incorrect
**Symptom**: UTCS doesn't follow SPACE.SCI pattern  
**Solution**: Update to `SPACE.SCI.NN-LABEL.SUBSYS[.SUB-SUBSYS]:REV`

## Next Steps

After implementing your SCI chapter:
1. Populate DELs/ with compliance artifacts
2. Add CAD models to PLM/CAD/
3. Document interfaces in interfaces.yml
4. Create cross-domain links in inherit.json
5. Update domain README with new system

## References

- [SCI Chapters CSV](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.csv)
- [SCI Chapters README](../../../1-DIMENSIONS/CANONICAL-TAXONOMY/sci-chapters.README.md)
- [SPACE Structure Example](./SPACE-STRUCTURE-EXAMPLE.md)
- [Implementation Summary](./IMPLEMENTATION-SUMMARY.md)
