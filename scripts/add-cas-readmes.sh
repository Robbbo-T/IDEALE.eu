#!/usr/bin/env bash
set -Eeuo pipefail

# ===================================================================
# Add README files to CAS subdirectories
# Addresses comment feedback on missing README files
# ===================================================================

ZONES_BASE="/home/runner/work/IDEALE.eu/IDEALE.eu/3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES"

# Function to add README to a directory if it doesn't exist
add_readme_if_missing() {
    local dir="$1"
    local content="$2"
    local readme="${dir}/README.md"
    
    if [ ! -f "$readme" ]; then
        echo "$content" > "$readme"
        echo "Created: $readme"
    fi
}

# Find all CAS directories
find "$ZONES_BASE" -type d -name "CAS" | while read cas_dir; do
    zone_path=$(dirname "$cas_dir")
    zone_name=$(basename "$zone_path")
    
    echo "Processing $zone_name/CAS..."
    
    # Add README to Governance directory
    if [ -d "${cas_dir}/Governance" ]; then
        add_readme_if_missing "${cas_dir}/Governance" "# Governance

This directory contains governance policies and Key Performance Indicators (KPIs) for the CAS system.

## Contents

- **KPIs.md** - Key Performance Indicators for content quality, process efficiency, and compliance
- **policies/** - Governance policies for metadata, acceptance, publishing, security, and controlled language

## Purpose

The governance framework ensures:
- Quality and compliance of all Data Modules
- Proper metadata and security classification
- Adherence to S1000D standards and ASD-STE100 controlled language
- Export control and intellectual property protection

## Policy Files

Each policy file in the \`policies/\` directory defines specific rules and requirements:
- **metadata.yaml** - Required IDS fields and validation rules
- **acceptance.yaml** - Acceptance criteria for Data Modules
- **publishing.yaml** - Publication and baseline policies
- **security.yaml** - Security classification and export control
- **controlled-language.yaml** - ASD-STE100 compliance requirements

## Related Documentation

- [CAS README](../README.md)
- [S1000D Business Rules](https://www.s1000d.org/)
"
    fi
    
    # Add README to policies directory
    if [ -d "${cas_dir}/Governance/policies" ]; then
        add_readme_if_missing "${cas_dir}/Governance/policies" "# Governance Policies

This directory contains YAML policy files that define rules and requirements for the CAS system.

## Policy Files

### metadata.yaml
Defines required IDS (Identification and Status) fields for all Data Modules:
- Responsible partner company information
- Security classification requirements
- Issue and in-work numbering
- Quality assurance verification steps
- Export control markings
- Controlled language (ASD-STE100) enforcement

### acceptance.yaml
Specifies acceptance criteria for Data Modules before publication:
- XSD, Schematron, and BREX validation requirements
- Technical review and QA approval workflow
- Content completeness checks (STE, illustrations, references)
- Traceability requirements (UTCS anchors, requirement links)

### publishing.yaml
Defines publishing policies and baseline management:
- Baseline frequency and approval requirements
- Immutability and checksum policies
- Publication types (AMM, SRM, IPD) and distribution rules
- DMRL and UTCS snapshot requirements

### security.yaml
Establishes security classification and handling procedures:
- Classification levels (UNCLASSIFIED, INTERNAL, CONFIDENTIAL, PROPRIETARY)
- Export control markings (EAR99, EU-AL, ITAR-Exempt)
- Distribution and access control rules
- Encryption and watermarking requirements

### controlled-language.yaml
Enforces ASD Simplified Technical English (STE) compliance:
- STE standard version (Issue 8)
- Compliance target (95%)
- Allowed exceptions (technical terms, part numbers, proper nouns)
- Automated checker requirements
- Training and approval workflow

## Usage

These policy files are read by validation scripts and CI/CD workflows to enforce standards across all Data Modules in the CSDB.

## Related Documentation

- [Governance README](../README.md)
- [ASD-STE100 Specification](http://www.asd-ste100.org/)
"
    fi
    
    # Add README to WorkPackages directory
    if [ -d "${cas_dir}/WorkPackages" ]; then
        add_readme_if_missing "${cas_dir}/WorkPackages" "# WorkPackages

This directory contains executable work packages that reference S1000D Data Modules.

## Purpose

Work packages are non-S1000D objects that provide practical, executable task instructions for maintenance personnel. They bridge the gap between structured S1000D content and shop-floor execution.

## Contents

- **task-cards/** - Individual maintenance task cards
- **checklists/** - Inspection and verification checklists
- **schedules/** - Maintenance interval schedules
- **mapping.json** - Machine-readable mapping of work packages to Data Module Codes (DMCs)

## Mapping Structure

The \`mapping.json\` file links work packages to their corresponding Data Modules:

\`\`\`json
{
  \"wpId\": \"WP-AMM-XX-YY-001\",
  \"dmcRefs\": [\"DMC-AMP360-XX-YY-00-00A-040A-A_en-US_010-00\"],
  \"actRef\": \"DMC-AMP360-AAA-00-00-00-00A-00AA-A_en-US_001-00\",
  \"effectivity\": \"MSN[0001..0048]; Engine=CFM56-7B\"
}
\`\`\`

## Key Fields

- **wpId** - Unique work package identifier
- **dmcRefs** - List of Data Module Codes referenced by this work package
- **actRef** - Applicability Cross-reference Table DMC
- **effectivity** - Product applicability (MSN ranges, configuration)

## Integration

Work packages are used by:
- Maintenance planning systems (MRP, ERP)
- Electronic logbook systems
- Maintenance execution tracking
- Man-hour estimation and scheduling

They provide a practical interface to S1000D content while maintaining full traceability through DMC references.

## Related Documentation

- [CSDB Data Modules](../CSDB/DataModules/)
- [CAS README](../README.md)
"
    fi
    
    # Add README to ExchangePackages/outgoing/manifests directory
    if [ -d "${cas_dir}/ExchangePackages/outgoing/manifests" ]; then
        add_readme_if_missing "${cas_dir}/ExchangePackages/outgoing/manifests" "# Exchange Package Manifests

This directory contains manifest files for outgoing S1000D data exchange packages.

## Purpose

Manifests provide a complete inventory of Data Modules, Publication Modules, and Illustrations included in an exchange package, along with checksums for integrity verification.

## Manifest Structure

Each manifest is a JSON file that includes:

\`\`\`json
{
  \"packageId\": \"XCHG-AMM-XX-YY-2025-10-08\",
  \"createdBy\": \"CAS-System\",
  \"createdDate\": \"2025-01-27T12:00:00Z\",
  \"packageType\": \"INCREMENTAL\" | \"FULL\",
  \"dms\": [{
    \"dmc\": \"DMC-...\",
    \"issue\": \"010\",
    \"inWork\": \"00\",
    \"title\": \"...\"
  }],
  \"pms\": [{
    \"pmCode\": \"PM-...\",
    \"issue\": \"01\",
    \"title\": \"...\"
  }],
  \"icns\": [{
    \"icn\": \"ICN-...\",
    \"format\": \"SVG\"
  }],
  \"hashes\": [{
    \"path\": \"pm/PM-...xml\",
    \"sha256\": \"...\"
  }],
  \"dmrl\": {
    \"included\": true,
    \"path\": \"dmrl.xml\",
    \"sha256\": \"...\"
  }
}
\`\`\`

## Package Types

- **INCREMENTAL** - Contains only changed/new Data Modules since last exchange
- **FULL** - Contains complete set of Data Modules for a publication

## Integrity Verification

All files in the exchange package include SHA-256 checksums in the manifest. Recipients can verify package integrity by:
1. Calculating checksums of received files
2. Comparing against manifest checksums
3. Rejecting packages with mismatched checksums

## Exchange Process

1. **Package Creation** - System generates manifest with all DMs, PMs, ICNs
2. **Checksum Calculation** - SHA-256 hashes computed for all files
3. **Manifest Generation** - JSON manifest file created
4. **Package Assembly** - Files and manifest packaged (ZIP/TAR)
5. **Transmission** - Package sent via agreed exchange protocol
6. **Verification** - Recipient validates checksums against manifest

## Related Documentation

- [Exchange Packages README](../../README.md)
- [CSDB README](../../../CSDB/README.md)
- [S1000D Exchange Specification](http://www.s1000d.org/)
"
    fi
    
done

echo ""
echo "✓ README files added to all CAS subdirectories"
