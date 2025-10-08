# AMPEL360-SPACE-T Validation Checklist

This checklist validates compliance with the AMPEL360-SPACE-T structural rules and conventions.

## Overview

The AMPEL360-SPACE-T framework enforces specific rules to maintain consistency and clarity:
- **All domains use SYSTEMS/** (no ZONES/)
- **System level is clean** (descriptors only)
- **Subsystem level is clean** (descriptors only)
- **BEZ at sub-subsystem level only**
- **UTCS format**: `SPACE.SCI.NN-LABEL.SUBSYS[.SUB-SUBSYS]:REV`

## Domain-Level Validation

### Domain Structure
- [ ] Domain has BEZ folders at root level (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, policy/, tests/)
- [ ] Domain BEZ folders contain TEMPLATES/ or STANDARDS/ subdirectories
- [ ] Domain BEZ folders do NOT contain actual artifacts (only templates/schemas/policies)
- [ ] Domain has META.json with `"scope": "domain"`
- [ ] Domain has README.md clearly stating "Domain-level templates"
- [ ] Domain has domain-config.yaml
- [ ] Domain has SYSTEMS/ directory

### Domain BEZ Templates
- [ ] DELs/ contains TEMPLATES/, SCHEMAS/, POLICIES/
- [ ] PLM/ contains STANDARDS/ subdirectory
- [ ] QUANTUM_OA/ contains PATTERNS/ subdirectory
- [ ] No binary artifacts (.pdf, .step, .igs, .docx completed) in domain BEZ
- [ ] All template files clearly marked as templates
- [ ] Schema files (.json, .xsd) present for validation

## System-Level Validation (CLEAN)

### System Directory Structure
- [ ] System directory exists under SYSTEMS/ (e.g., `SYSTEMS/53-PRIMARY-STRUCTURE/`)
- [ ] System directory naming follows `NN-SPACE-LABEL/` format
- [ ] System level contains ONLY:
  - [ ] README.md
  - [ ] system.meta.yml
  - [ ] interfaces.yml
- [ ] System level does NOT contain:
  - [ ] BEZ folders (DELs/, PAx/, PLM/, etc.)
  - [ ] Artifact files
  - [ ] Any other directories except subsystems

### System Metadata (system.meta.yml)
- [ ] Contains `utcs_anchor` in format `SPACE.SCI.NN-LABEL:rev[X]`
- [ ] Contains `system_name`
- [ ] Contains `domain` (3-letter code)
- [ ] Contains `sci_chapter` (numeric)
- [ ] Contains `description`
- [ ] Lists all `subsystems`
- [ ] Lists all `interfaces` with other domains/systems
- [ ] Contains compliance references (ECSS/CCSDS/NASA)

### System Interfaces (interfaces.yml)
- [ ] Contains `system` name
- [ ] Contains `utcs_anchor`
- [ ] Lists `external_interfaces` with interface_id, name, type, mating systems
- [ ] Lists `internal_interfaces` between subsystems
- [ ] Defines coordinate system and units
- [ ] Documents environmental conditions

### System README.md
- [ ] Contains system overview
- [ ] Lists all subsystems
- [ ] Documents interfaces to other domains
- [ ] Includes UTCS anchor
- [ ] States status (e.g., "In Development")
- [ ] References SCI chapter number

## Subsystem-Level Validation (CLEAN)

### Subsystem Directory Structure
- [ ] Subsystem directory exists under system (e.g., `53-10-MAIN-BODY/`)
- [ ] Subsystem naming follows `NN-NN-NAME/` format
- [ ] Subsystem level contains ONLY:
  - [ ] README.md
  - [ ] subsystem.meta.yml
- [ ] Subsystem level does NOT contain:
  - [ ] BEZ folders (DELs/, PAx/, PLM/, etc.)
  - [ ] Artifact files
  - [ ] domain-config.yaml
  - [ ] Any other files except sub-subsystem directories

### Subsystem Metadata (subsystem.meta.yml)
- [ ] Contains `utcs_anchor` in format `SPACE.SCI.NN-LABEL.NN-NN-NAME:rev[X]`
- [ ] Contains `subsystem_name`
- [ ] Contains `parent_system`
- [ ] Contains `description`
- [ ] Lists all `sub_subsystems`
- [ ] Contains technical specifications (mass, dimensions, materials, etc.)
- [ ] References compliance standards

### Subsystem README.md
- [ ] Contains subsystem overview
- [ ] Lists all sub-subsystems
- [ ] Documents key interfaces
- [ ] Includes UTCS anchor
- [ ] States status
- [ ] References technical specifications

## Sub-Subsystem-Level Validation (BEZ HERE)

### Sub-Subsystem Directory Structure
- [ ] Sub-subsystem directory exists (e.g., `53-10-01-FORWARD-SECT/`)
- [ ] Sub-subsystem naming follows `NN-NN-NN-NAME/` format
- [ ] Complete BEZ structure present:
  - [ ] DELs/
  - [ ] PAx/
  - [ ] PLM/
  - [ ] QUANTUM_OA/
  - [ ] SUPPLIERS/
  - [ ] policy/
  - [ ] tests/
- [ ] Required metadata files present:
  - [ ] META.json
  - [ ] inherit.json
  - [ ] README.md
  - [ ] domain-config.yaml

### BEZ Subdirectories
- [ ] DELs/ has subdirectories: ECSS-submissions/, CCSDS-compliance/, NASA-standards/, data-packages/, final-design-reports/
- [ ] PAx/ has subdirectories: ONB/, OUT/
- [ ] PLM/ has subdirectories: CAD/, CAE/, CAI/, CAM/, CAO/, CAP/, CAS/, CAV/, CMP/
- [ ] QUANTUM_OA/ has subdirectories: GA/, LP/, MILP/, QAOA/, QOX/, QP/, QUBO/, SA/
- [ ] SUPPLIERS/ has subdirectories: BIDS/, SERVICES/
- [ ] All empty directories have .gitkeep files

### META.json
- [ ] Contains `utcs_anchor` in full format `SPACE.SCI.NN-LABEL.SUBSYS.SUB-SUBSYS:rev[X]`
- [ ] Contains `utcs_scope: "instance"`
- [ ] Contains `scope: "instance"`
- [ ] Contains `component_name`
- [ ] Contains `domain` (3-letter code)
- [ ] Contains `sci_chapter` (numeric)
- [ ] Contains `parent_subsystem`
- [ ] Contains technical specifications (geometry, mass, materials, etc.)
- [ ] Lists compliance frameworks (ECSS, CCSDS, NASA)
- [ ] Contains `criticality` level
- [ ] Contains `phase` and `maturity` (TRL level)

### inherit.json
- [ ] Contains `inherits_from` pointing to domain-level templates
- [ ] Contains `utcs_scope: "instance"`
- [ ] Lists `applies_templates` with specific template files
- [ ] Lists `compliance_frameworks` with status
- [ ] Lists `inherited_policies`
- [ ] Documents `cross_domain_dependencies` with UTCS anchors
- [ ] Defines `plm_workflows` for CAD, CAE, CAS tools
- [ ] Defines `quality_requirements`
- [ ] Includes implementation notes

### domain-config.yaml
- [ ] Contains `component` section with utcs_anchor, name, type, criticality
- [ ] Contains `compliance` section with frameworks and deliverables
- [ ] Contains `technical` section with detailed specifications
- [ ] Contains `interfaces` section (external and internal)
- [ ] Contains `lifecycle` section with phase, maturity, next_review
- [ ] Contains `procurement` section with manufacturing details
- [ ] Contains `quality` section with inspection and acceptance criteria
- [ ] Contains `verification_plan` with analysis and testing
- [ ] Contains `risks` with mitigation strategies

### README.md (Sub-Subsystem)
- [ ] Contains component overview with technical specifications
- [ ] Describes functions and key features
- [ ] Lists interfaces (external and internal)
- [ ] Documents key requirements
- [ ] Describes artifacts in each BEZ folder
- [ ] Includes UTCS anchor
- [ ] States status and compliance standards

## UTCS Anchor Validation

### Format Compliance
- [ ] Domain level: `SPACE.SCI.NN-LABEL:rev[X]` ❌ (Domain should not have SCI)
- [ ] System level: `SPACE.SCI.NN-LABEL:rev[X]` ✅
- [ ] Subsystem level: `SPACE.SCI.NN-LABEL.NN-NN-NAME:rev[X]` ✅
- [ ] Sub-subsystem level: `SPACE.SCI.NN-LABEL.NN-NN-NAME.NN-NN-NN-NAME:rev[X]` ✅

### Content Validation
- [ ] Prefix is exactly "SPACE.SCI."
- [ ] Chapter number matches directory (01-100)
- [ ] Label matches SCI chapter name
- [ ] Hierarchy matches directory structure
- [ ] Revision format is `:rev[A]` or `:rev[1]`
- [ ] No spaces in UTCS anchor
- [ ] All components separated by periods
- [ ] Names use hyphens, not underscores

### Consistency
- [ ] UTCS anchor in README.md matches metadata files
- [ ] UTCS anchor in META.json matches inherit.json
- [ ] UTCS anchor in system.meta.yml matches interfaces.yml
- [ ] Cross-references in inherit.json use correct UTCS format

## SCI Chapter Validation

### Chapter Assignment
- [ ] SCI chapter number is between 01 and 100
- [ ] SCI chapter assigned to correct primary domain per sci-chapters.csv
- [ ] Chapter directory naming matches sci-chapters.csv: `NN-SPACE-LABEL/`
- [ ] Chapter label uses spacecraft semantics (not aircraft ATA terms)

### Space-Specific Chapters
If using new space-only chapters (48, 58, 59, 82, 86-92, 95-96, 99):
- [ ] Semantics appropriate for spacecraft (not aircraft)
- [ ] Cross-references updated for space domain
- [ ] Compliance references ECSS/CCSDS/NASA (not EASA/FAA)

## Compliance Framework Validation

### ECSS (European Cooperation for Space Standardization)
- [ ] ECSS submissions in `DELs/ECSS-submissions/`
- [ ] References to ECSS-E (Engineering), ECSS-M (Management), ECSS-Q (Quality)
- [ ] Compliance matrices present
- [ ] Review packages documented

### CCSDS (Consultative Committee for Space Data Systems)
- [ ] CCSDS compliance in `DELs/CCSDS-compliance/`
- [ ] Relevant for data systems (TT&C, telemetry, data formats)
- [ ] Protocol compliance documented

### NASA Standards
- [ ] NASA standards in `DELs/NASA-standards/`
- [ ] Appropriate standards referenced (NPR 7150.2, NASA-STD series)
- [ ] Compliance checklists present

### NO Aircraft Standards
- [ ] NO references to EASA (European Aviation Safety Agency)
- [ ] NO references to FAA (Federal Aviation Administration)
- [ ] NO references to CS-XX (Certification Specifications for aircraft)

## Cross-Domain Integration

### Interfaces
- [ ] Cross-domain interfaces documented in interfaces.yml
- [ ] Interface control documents (ICDs) present in DELs/data-packages/
- [ ] Secondary domain dependencies in inherit.json
- [ ] UTCS anchors for related systems from other domains

### Shared Chapters
For chapters shared between domains (e.g., SCI 54 AAA+PPP):
- [ ] Both domains reference the chapter
- [ ] Primary domain clearly identified
- [ ] Interface agreements documented
- [ ] Cross-references maintained

## Directory Naming Validation

### Format
- [ ] System directories: `NN-SPACE-LABEL/` (uppercase with hyphens)
- [ ] Subsystem directories: `NN-NN-NAME/` (numeric-numeric-name)
- [ ] Sub-subsystem directories: `NN-NN-NN-NAME/` (three-level numeric)
- [ ] No spaces in directory names
- [ ] No underscores (use hyphens)
- [ ] Consistent capitalization (uppercase)

### Examples of Correct Naming
- [ ] `53-PRIMARY-STRUCTURE/` ✅
- [ ] `53-10-MAIN-BODY/` ✅
- [ ] `53-10-01-FORWARD-SECT/` ✅
- [ ] `24-EPS-POWER/` ✅
- [ ] `22-GNC-AOCS/` ✅

### Examples of Incorrect Naming
- [ ] `53_primary_structure/` ❌ (underscores, lowercase)
- [ ] `53 Primary Structure/` ❌ (spaces)
- [ ] `53-fuselage/` ❌ (not space terminology)

## Validation Summary

### Critical Requirements (Must Pass)
1. ✅ All domains use SYSTEMS/ only (no ZONES/)
2. ✅ System level clean (only README.md, system.meta.yml, interfaces.yml)
3. ✅ Subsystem level clean (only README.md, subsystem.meta.yml)
4. ✅ BEZ exclusively at sub-subsystem level
5. ✅ UTCS format: SPACE.SCI.NN-LABEL...
6. ✅ SCI chapter semantics (not ATA aircraft)
7. ✅ ECSS/CCSDS/NASA compliance (not EASA/FAA)

### Quality Requirements (Should Pass)
1. ⚠️ Complete metadata files (META.json, inherit.json, domain-config.yaml)
2. ⚠️ All interfaces documented
3. ⚠️ Cross-domain dependencies mapped
4. ⚠️ Compliance artifacts referenced
5. ⚠️ Quality requirements defined
6. ⚠️ Verification plans present

### Documentation Requirements (Nice to Have)
1. ℹ️ Detailed README files at all levels
2. ℹ️ Technical specifications complete
3. ℹ️ Risk analysis documented
4. ℹ️ Procurement information present
5. ℹ️ Test plans defined

## Automated Validation

### Scripts
The following scripts can automate validation:

```bash
# Check for ZONES/ directories (should not exist)
find . -type d -name "ZONES" | grep AMPEL360-SPACE-T

# Check system level is clean
find . -path "*/SYSTEMS/*" -maxdepth 3 -name "DELs" -o -name "PLM"

# Validate UTCS format
grep -r "SPACE.SCI" . --include="*.yml" --include="*.json" --include="*.md"

# Check for EASA/FAA references (should not exist)
grep -r "EASA\|FAA\|CS-[0-9]" . --include="*.yml" --include="*.json" --include="*.md"

# Validate sub-subsystem BEZ presence
find . -path "*/SYSTEMS/*/*/*/*/META.json" -exec dirname {} \; | while read d; do
    [[ -d "$d/DELs" && -d "$d/PLM" && -d "$d/PAx" ]] || echo "Missing BEZ: $d"
done
```

## Validation Process

### Step 1: Domain Level
1. Check domain root has BEZ with templates only
2. Verify SYSTEMS/ directory exists
3. Validate META.json scope is "domain"

### Step 2: System Level
1. Navigate to each system under SYSTEMS/
2. Verify only README.md, system.meta.yml, interfaces.yml present
3. Check UTCS anchor format
4. Validate no BEZ folders at system level

### Step 3: Subsystem Level
1. Navigate to each subsystem under system
2. Verify only README.md, subsystem.meta.yml present
3. Check UTCS anchor includes subsystem
4. Validate no BEZ folders at subsystem level

### Step 4: Sub-Subsystem Level
1. Navigate to each sub-subsystem
2. Verify complete BEZ structure present
3. Check all metadata files (META.json, inherit.json, domain-config.yaml)
4. Validate UTCS anchor includes full hierarchy
5. Verify compliance references are ECSS/CCSDS/NASA (not EASA/FAA)

### Step 5: Cross-Validation
1. Check UTCS anchors are consistent across files
2. Verify cross-domain references exist
3. Validate interface definitions match across domains
4. Check SCI chapter assignments match sci-chapters.csv

## Common Issues and Fixes

### Issue: BEZ at Wrong Level
**Symptom**: DELs/, PLM/ folders at system or subsystem level  
**Fix**: Move BEZ folders down to sub-subsystem level

### Issue: Incorrect UTCS Format
**Symptom**: UTCS doesn't start with "SPACE.SCI."  
**Fix**: Update all UTCS anchors to SPACE.SCI.NN-LABEL format

### Issue: Aircraft Terminology
**Symptom**: References to "fuselage", "wing", "ATA"  
**Fix**: Replace with spacecraft terms ("primary structure", "solar array", "SCI")

### Issue: EASA/FAA Compliance
**Symptom**: References to EASA, FAA, CS-XX standards  
**Fix**: Replace with ECSS, CCSDS, NASA standards

### Issue: ZONES/ Directory
**Symptom**: Domain has ZONES/ instead of SYSTEMS/  
**Fix**: Rename or restructure to use SYSTEMS/ only

### Issue: System/Subsystem Not Clean
**Symptom**: BEZ folders or artifacts at system/subsystem level  
**Fix**: Remove all BEZ content, keep only descriptors

---

**Last Updated**: 2025-01-27  
**Version**: SPACE-T 1.0  
**Maintained by**: IDEALE.eu Architecture Team
