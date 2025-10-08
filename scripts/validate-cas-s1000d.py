#!/usr/bin/env python3
"""
CAS S1000D Validation Script
Validates CAS directory structure and S1000D compliance
"""

import os
import sys
import json
import yaml
import re
from pathlib import Path
from typing import List, Dict, Tuple

# ANSI color codes
GREEN = '\033[92m'
RED = '\033[91m'
YELLOW = '\033[93m'
BLUE = '\033[94m'
RESET = '\033[0m'

class CASValidator:
    def __init__(self, zones_base: str):
        self.zones_base = Path(zones_base)
        self.errors = []
        self.warnings = []
        self.checks_passed = 0
        self.checks_failed = 0

    def log_error(self, message: str):
        """Log an error"""
        self.errors.append(message)
        self.checks_failed += 1
        print(f"{RED}✗{RESET} {message}")

    def log_warning(self, message: str):
        """Log a warning"""
        self.warnings.append(message)
        print(f"{YELLOW}⚠{RESET} {message}")

    def log_success(self, message: str):
        """Log a success"""
        self.checks_passed += 1
        print(f"{GREEN}✓{RESET} {message}")

    def log_info(self, message: str):
        """Log info"""
        print(f"{BLUE}ℹ{RESET} {message}")

    def validate_directory_structure(self, cas_dir: Path) -> bool:
        """Validate that all required directories exist"""
        required_dirs = [
            'processes',
            'inputs',
            'CSDB/DataModules/COMMON-INFO',
            'CSDB/DataModules/APPLICABILITY/ACT',
            'CSDB/DataModules/MAINTENANCE',
            'CSDB/DataModules/REPAIR',
            'CSDB/DataModules/IPD',
            'CSDB/Illustrations/ICN/master',
            'CSDB/Illustrations/ICN/renditions',
            'CSDB/Illustrations/ICN/hotspots',
            'CSDB/PublicationModules',
            'CSDB/DMRL',
            'CSDB/BREX',
            'WorkPackages/task-cards',
            'WorkPackages/checklists',
            'WorkPackages/schedules',
            'Data/FLEET_IN_SERVICE',
            'ExchangePackages/incoming',
            'ExchangePackages/outgoing/transmittals',
            'ExchangePackages/outgoing/manifests',
            'ExchangePackages/outgoing/checksums',
            'Outputs/PUBLISH/AMM-Published',
            'Outputs/PUBLISH/SRM-Published',
            'Outputs/PUBLISH/IPD-Published',
            'Outputs/Baselines',
            'schemas/s1000d/xsd',
            'schemas/s1000d/schematron',
            'schemas/s1000d/brex-tests',
            'schemas/s1000d/codelists',
            'schemas/utcs',
            'Governance/policies',
            'utcs',
        ]
        
        all_exist = True
        for dir_path in required_dirs:
            full_path = cas_dir / dir_path
            if not full_path.exists():
                self.log_error(f"Missing directory: {cas_dir.name}/{dir_path}")
                all_exist = False
        
        if all_exist:
            self.log_success(f"All required directories exist in {cas_dir.name}")
        
        return all_exist

    def validate_required_files(self, cas_dir: Path) -> bool:
        """Validate that all required files exist"""
        required_files = [
            'README.md',
            'META.json',
            'CSDB/README.md',
            'WorkPackages/mapping.json',
            'Governance/policies/metadata.yaml',
            'Governance/policies/acceptance.yaml',
            'Governance/policies/publishing.yaml',
            'Governance/policies/security.yaml',
            'Governance/policies/controlled-language.yaml',
            'Governance/KPIs.md',
            'utcs/index.json',
            'schemas/utcs/utcs.schema.json',
        ]
        
        all_exist = True
        for file_path in required_files:
            full_path = cas_dir / file_path
            if not full_path.exists():
                self.log_error(f"Missing file: {cas_dir.name}/{file_path}")
                all_exist = False
        
        if all_exist:
            self.log_success(f"All required files exist in {cas_dir.name}")
        
        return all_exist

    def validate_meta_json(self, cas_dir: Path) -> bool:
        """Validate META.json content"""
        meta_path = cas_dir / 'META.json'
        if not meta_path.exists():
            return False
        
        try:
            with open(meta_path, 'r') as f:
                meta = json.load(f)
            
            required_fields = ['scope', 'ata_chapter', 'ata_section', 'zone_name', 
                             'standard', 'utcs_anchor', 'last_updated', 'maintained_by']
            
            missing = [field for field in required_fields if field not in meta]
            if missing:
                self.log_error(f"META.json missing fields: {missing} in {cas_dir.name}")
                return False
            
            # Validate scope
            if meta.get('scope') != 'cas':
                self.log_error(f"META.json scope must be 'cas' in {cas_dir.name}")
                return False
            
            # Validate standard
            if 'S1000D' not in meta.get('standard', ''):
                self.log_warning(f"META.json should reference S1000D standard in {cas_dir.name}")
            
            self.log_success(f"META.json valid in {cas_dir.name}")
            return True
            
        except json.JSONDecodeError as e:
            self.log_error(f"META.json is not valid JSON in {cas_dir.name}: {e}")
            return False
        except Exception as e:
            self.log_error(f"Error validating META.json in {cas_dir.name}: {e}")
            return False

    def validate_mapping_json(self, cas_dir: Path) -> bool:
        """Validate WorkPackages/mapping.json"""
        mapping_path = cas_dir / 'WorkPackages' / 'mapping.json'
        if not mapping_path.exists():
            return False
        
        try:
            with open(mapping_path, 'r') as f:
                mapping = json.load(f)
            
            required_fields = ['wpId', 'dmcRefs', 'actRef', 'effectivity']
            missing = [field for field in required_fields if field not in mapping]
            if missing:
                self.log_error(f"mapping.json missing fields: {missing} in {cas_dir.name}")
                return False
            
            # Validate DMC references format
            if 'dmcRefs' in mapping and isinstance(mapping['dmcRefs'], list):
                for dmc in mapping['dmcRefs']:
                    if not dmc.startswith('DMC-'):
                        self.log_warning(f"DMC reference should start with 'DMC-': {dmc} in {cas_dir.name}")
            
            self.log_success(f"mapping.json valid in {cas_dir.name}")
            return True
            
        except json.JSONDecodeError as e:
            self.log_error(f"mapping.json is not valid JSON in {cas_dir.name}: {e}")
            return False
        except Exception as e:
            self.log_error(f"Error validating mapping.json in {cas_dir.name}: {e}")
            return False

    def validate_metadata_policy(self, cas_dir: Path) -> bool:
        """Validate Governance/policies/metadata.yaml"""
        policy_path = cas_dir / 'Governance' / 'policies' / 'metadata.yaml'
        if not policy_path.exists():
            return False
        
        try:
            with open(policy_path, 'r') as f:
                policy = yaml.safe_load(f)
            
            required_fields = ['require_ids_fields', 'enforce_language', 'export_control']
            missing = [field for field in required_fields if field not in policy]
            if missing:
                self.log_error(f"metadata.yaml missing fields: {missing} in {cas_dir.name}")
                return False
            
            # Validate export control
            if 'export_control' in policy:
                if not policy['export_control'].get('required'):
                    self.log_warning(f"Export control should be required in {cas_dir.name}")
            
            self.log_success(f"metadata.yaml valid in {cas_dir.name}")
            return True
            
        except yaml.YAMLError as e:
            self.log_error(f"metadata.yaml is not valid YAML in {cas_dir.name}: {e}")
            return False
        except Exception as e:
            self.log_error(f"Error validating metadata.yaml in {cas_dir.name}: {e}")
            return False

    def validate_utcs_index(self, cas_dir: Path) -> bool:
        """Validate utcs/index.json"""
        utcs_path = cas_dir / 'utcs' / 'index.json'
        if not utcs_path.exists():
            return False
        
        try:
            with open(utcs_path, 'r') as f:
                utcs = json.load(f)
            
            if 'mappings' not in utcs:
                self.log_error(f"utcs/index.json missing 'mappings' field in {cas_dir.name}")
                return False
            
            # Validate UTCS ID format
            if isinstance(utcs['mappings'], list):
                for mapping in utcs['mappings']:
                    if 'utcs' in mapping:
                        utcs_id = mapping['utcs']
                        if not re.match(r'^UTCS-MI:[A-Z]{3}:CAS:[0-9]{2}-[0-9]{2}:.+:rev\[[0-9]+\]$', utcs_id):
                            self.log_warning(f"UTCS ID format incorrect: {utcs_id} in {cas_dir.name}")
            
            self.log_success(f"utcs/index.json valid in {cas_dir.name}")
            return True
            
        except json.JSONDecodeError as e:
            self.log_error(f"utcs/index.json is not valid JSON in {cas_dir.name}: {e}")
            return False
        except Exception as e:
            self.log_error(f"Error validating utcs/index.json in {cas_dir.name}: {e}")
            return False

    def validate_zone(self, zone_dir: Path) -> bool:
        """Validate a single zone's CAS directory"""
        cas_dir = zone_dir / 'CAS'
        
        if not cas_dir.exists():
            self.log_warning(f"No CAS directory in {zone_dir.name}")
            return False
        
        print(f"\n{BLUE}Validating{RESET} {zone_dir.name}/CAS")
        print("=" * 60)
        
        results = []
        results.append(self.validate_directory_structure(cas_dir))
        results.append(self.validate_required_files(cas_dir))
        results.append(self.validate_meta_json(cas_dir))
        results.append(self.validate_mapping_json(cas_dir))
        results.append(self.validate_metadata_policy(cas_dir))
        results.append(self.validate_utcs_index(cas_dir))
        
        return all(results)

    def find_all_zones(self) -> List[Path]:
        """Find all zone directories with PLM subdirectories"""
        zones = []
        
        # Find all PLM directories
        for plm_dir in self.zones_base.rglob('PLM'):
            # Get parent directory (the zone)
            zone_dir = plm_dir.parent
            zone_name = zone_dir.name
            
            # Check if it matches ATA pattern (XX-YY-NAME)
            if re.match(r'^[0-9]{2}-[0-9]{2}-.+$', zone_name):
                zones.append(zone_dir)
        
        return sorted(zones, key=lambda x: x.name)

    def validate_all(self) -> bool:
        """Validate all zones"""
        zones = self.find_all_zones()
        
        print(f"\n{BLUE}{'='*60}{RESET}")
        print(f"{BLUE}CAS S1000D Validation{RESET}")
        print(f"{BLUE}{'='*60}{RESET}")
        print(f"Found {len(zones)} zones to validate\n")
        
        all_valid = True
        for zone_dir in zones:
            if not self.validate_zone(zone_dir):
                all_valid = False
        
        # Print summary
        print(f"\n{BLUE}{'='*60}{RESET}")
        print(f"{BLUE}Validation Summary{RESET}")
        print(f"{BLUE}{'='*60}{RESET}")
        print(f"{GREEN}Passed:{RESET} {self.checks_passed}")
        print(f"{RED}Failed:{RESET} {self.checks_failed}")
        print(f"{YELLOW}Warnings:{RESET} {len(self.warnings)}")
        
        if self.errors:
            print(f"\n{RED}Errors:{RESET}")
            for error in self.errors[:10]:  # Show first 10 errors
                print(f"  • {error}")
            if len(self.errors) > 10:
                print(f"  ... and {len(self.errors) - 10} more")
        
        if self.warnings:
            print(f"\n{YELLOW}Warnings:{RESET}")
            for warning in self.warnings[:10]:  # Show first 10 warnings
                print(f"  • {warning}")
            if len(self.warnings) > 10:
                print(f"  ... and {len(self.warnings) - 10} more")
        
        return all_valid

def main():
    """Main entry point"""
    zones_base = "/home/runner/work/IDEALE.eu/IDEALE.eu/3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES"
    
    if len(sys.argv) > 1:
        zones_base = sys.argv[1]
    
    if not os.path.exists(zones_base):
        print(f"{RED}Error:{RESET} Zones directory not found: {zones_base}")
        sys.exit(1)
    
    validator = CASValidator(zones_base)
    success = validator.validate_all()
    
    sys.exit(0 if success else 1)

if __name__ == '__main__':
    main()
