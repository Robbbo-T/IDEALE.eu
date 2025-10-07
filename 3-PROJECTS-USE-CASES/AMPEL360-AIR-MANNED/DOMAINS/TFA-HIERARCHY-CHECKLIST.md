# TFA Domain Hierarchy — Implementation Checklist

This document provides a practical checklist for implementing and validating the domain-level vs. subzone-level BEZ hierarchy.

---

## Quick Reference

| Aspect | Domain Level | Subzone Level |
|--------|--------------|---------------|
| **Purpose** | Templates & Standards | Artifacts & Deliverables |
| **Scope** | `"scope": "domain"` | `"scope": "instance"` |
| **Contains** | `.docx` stubs, schemas, policies | Completed docs, CAD files, data |
| **Binaries** | ❌ Not allowed | ✅ Required |

---

## Domain-Level Checklist

Use this checklist when creating or auditing domain-level BEZ folders:

### Directory Structure
- [ ] Domain folder exists (e.g., `AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/`)
- [ ] BEZ folders present at domain level (DELs/, PAx/, PLM/, QUANTUM_OA/, SUPPLIERS/, policy/, tests/)
- [ ] Each BEZ folder has a README.md
- [ ] README clearly states "Template Repository" or "Domain-level standards"

### Content Validation
- [ ] Contains TEMPLATES/ or STANDARDS/ subdirectories
- [ ] Contains SCHEMAS/ subdirectory with validation schemas
- [ ] Contains POLICIES/ subdirectory with governance documents
- [ ] NO binary artifacts (.pdf, .step, .igs, .docx completed files)
- [ ] Only template files, schemas, and policy documents

### Metadata Files
- [ ] META.json exists (or META.json.example)
- [ ] META.json includes `"utcs_scope": "domain"`
- [ ] META.json includes `"type": "template_repository"`
- [ ] META.json lists applicable subzones in `"applies_to": [...]`
- [ ] META.json includes template version information

### Documentation
- [ ] README explains template vs. instance distinction
- [ ] README references TFA-DOMAIN-HIERARCHY.md
- [ ] README lists where instances should be created
- [ ] README provides usage instructions for templates
- [ ] README includes "Scope: Domain" indicator at top

---

## Subzone-Level Checklist

Use this checklist when creating or auditing subzone-level BEZ folders:

### Directory Structure
- [ ] Subzone folder exists (e.g., `ZONES/53-10-CENTER-BODY/`)
- [ ] BEZ folders present at subzone level (DELs/, PAx/, PLM/, etc.)
- [ ] Each BEZ folder has a README.md
- [ ] README indicates actual artifacts, not templates

### Content Validation
- [ ] Contains actual work products (documents, CAD files, test data)
- [ ] Contains at least one artifact in each used BEZ folder
- [ ] Binary files present where appropriate (.pdf, .step, .docx filled)
- [ ] NO template stubs (unless copied for local use)

### Metadata Files
- [ ] META.json exists (or META.json.example)
- [ ] META.json includes `"utcs_scope": "instance"`
- [ ] META.json includes `"utcs_anchor"` with specific identifier
- [ ] META.json includes `"inherits_from"` pointing to domain level
- [ ] META.json lists applied templates
- [ ] META.json includes artifact counts or status

### Inheritance
- [ ] inherit.json exists (or inherit.json.example)
- [ ] inherit.json points to correct domain-level folder
- [ ] inherit.json lists templates being applied
- [ ] inherit.json includes any overrides or customizations

### Documentation
- [ ] README describes system/component purpose
- [ ] README references applicable templates
- [ ] README includes UTCS anchor
- [ ] README links to domain-level standards
- [ ] README includes "Scope: Instance" indicator at top

---

## Migration Checklist

Use this when migrating legacy domain-level instances to subzone level:

### Phase 1: Assessment
- [ ] Identify which domain-level BEZ folders contain actual artifacts
- [ ] Identify which artifacts are truly templates vs. instances
- [ ] Document current UTCS anchors for all artifacts
- [ ] Create migration plan

### Phase 2: Preparation
- [ ] Create TEMPLATES/ subdirectories in domain-level folders
- [ ] Create SCHEMAS/ subdirectories for validation
- [ ] Create POLICIES/ subdirectories for governance
- [ ] Identify or create appropriate subzone directories

### Phase 3: Template Conversion
- [ ] Move template files to domain-level TEMPLATES/
- [ ] Convert completed documents to template stubs
- [ ] Create validation schemas in SCHEMAS/
- [ ] Document policies in POLICIES/
- [ ] Update domain-level README to explain template role

### Phase 4: Instance Migration
- [ ] Move actual artifacts to appropriate subzone folders
- [ ] Preserve directory structure within subzones
- [ ] Update UTCS anchors to reflect new locations
- [ ] Create inherit.json in each subzone folder
- [ ] Update subzone README files

### Phase 5: Metadata
- [ ] Add META.json to domain-level folders with `"scope": "domain"`
- [ ] Add META.json to subzone-level folders with `"scope": "instance"`
- [ ] Ensure all UTCS anchors are updated
- [ ] Document inheritance relationships

### Phase 6: Validation
- [ ] Run CI validation checks
- [ ] Verify no binaries in domain-level folders
- [ ] Verify artifacts exist in subzone folders
- [ ] Test template application workflow
- [ ] Update documentation

---

## CI/CD Validation Rules

### Domain-Level Rules
```python
def validate_domain_level(path):
    meta = load_json(f"{path}/META.json")
    
    # Rule 1: Must have domain scope
    assert meta["utcs_scope"] == "domain"
    
    # Rule 2: Must be template repository type
    assert meta["type"] == "template_repository"
    
    # Rule 3: Must have TEMPLATES or STANDARDS directory
    assert exists(f"{path}/TEMPLATES") or exists(f"{path}/STANDARDS")
    
    # Rule 4: Must have README
    assert exists(f"{path}/README.md")
    
    # Rule 5: Must not contain binary artifacts
    assert not contains_binaries(path, exclude=["TEMPLATES", "examples"])
    
    return True
```

### Subzone-Level Rules
```python
def validate_subzone_level(path):
    meta = load_json(f"{path}/META.json")
    
    # Rule 1: Must have instance scope
    assert meta["utcs_scope"] == "instance"
    
    # Rule 2: Must have UTCS anchor
    assert "utcs_anchor" in meta
    
    # Rule 3: Must declare inheritance
    assert "inherits_from" in meta
    
    # Rule 4: Must have inherit.json
    assert exists(f"{path}/inherit.json")
    
    # Rule 5: Must contain at least one artifact
    assert has_artifacts(path)
    
    # Rule 6: Inheritance path must exist
    assert exists(resolve_path(meta["inherits_from"]))
    
    return True
```

---

## Common Issues and Fixes

### Issue 1: Binary files in domain-level folder
**Problem**: Completed documents or CAD files in domain-level BEZ folders  
**Fix**: Move to appropriate subzone folder, convert originals to templates

### Issue 2: No templates in domain-level folder
**Problem**: Domain-level folder is empty or only has structure  
**Fix**: Create TEMPLATES/ directory and add template files

### Issue 3: Missing inherit.json
**Problem**: Subzone doesn't declare inheritance  
**Fix**: Create inherit.json pointing to domain-level folder

### Issue 4: Wrong scope in META.json
**Problem**: Domain-level has "instance" or vice versa  
**Fix**: Update scope field to match actual purpose

### Issue 5: No artifacts in subzone folder
**Problem**: Subzone folder structure exists but is empty  
**Fix**: Either populate with artifacts or mark as placeholder in README

### Issue 6: Broken inheritance path
**Problem**: inherit.json points to non-existent folder  
**Fix**: Update path to match actual domain-level location

---

## Testing Workflows

### Template Application Test
1. Navigate to domain-level folder
2. Locate template file
3. Navigate to subzone folder
4. Apply template
5. Fill with instance data
6. Validate against schema
7. Save in subzone folder

### Inheritance Validation Test
1. Load subzone inherit.json
2. Resolve path to domain folder
3. Verify domain folder exists
4. Verify templates listed exist
5. Verify schemas referenced exist

### CI Pipeline Test
1. Run domain-level validation on all domains
2. Run subzone-level validation on all subzones
3. Check no binaries in domain folders
4. Check artifacts in subzone folders
5. Validate inheritance chains
6. Report violations

---

## Status Indicators

Use these in README files to indicate implementation status:

### Domain Level
- 📘 **Template Repository** — Contains templates and standards
- 🏗️ **Under Development** — Templates being created
- ✅ **Complete** — All templates defined
- 🔄 **Migration In Progress** — Converting from instance repository

### Subzone Level
- 📦 **Active Implementation** — Contains work products
- ⏳ **Awaiting Artifacts** — Structure ready, no content yet
- ✅ **Complete** — All required artifacts present
- 🔄 **Inherits from** — Links to domain template

---

## Quick Start Guide

### Creating a New Domain-Level BEZ Folder

1. Create folder structure:
   ```bash
   mkdir -p AAA/.../DELs/{TEMPLATES,SCHEMAS,POLICIES}
   ```

2. Create META.json:
   ```json
   {
     "utcs_scope": "domain",
     "type": "template_repository",
     "templates": [...]
   }
   ```

3. Create README.md with template repository header

4. Add template files to TEMPLATES/

5. Add validation schemas to SCHEMAS/

### Creating a New Subzone-Level BEZ Folder

1. Create folder structure:
   ```bash
   mkdir -p ZONES/53-10-CENTER-BODY/DELs/{EASA-submissions,MoC-records,...}
   ```

2. Create META.json:
   ```json
   {
     "utcs_anchor": "utcs://...",
     "utcs_scope": "instance",
     "inherits_from": "../../../DELs"
   }
   ```

3. Create inherit.json:
   ```json
   {
     "inherits_from": "../../../DELs",
     "applies_templates": [...]
   }
   ```

4. Create README.md with instance repository header

5. Add actual work products

---

## References

- [TFA-DOMAIN-HIERARCHY.md](./TFA-DOMAIN-HIERARCHY.md) — Full explanation
- [TFA-HIERARCHY-DIAGRAMS.md](./TFA-HIERARCHY-DIAGRAMS.md) — Visual diagrams
- [ATA-STRUCTURE-EXAMPLE.md](./ATA-STRUCTURE-EXAMPLE.md) — Implementation guide

---

**Version**: 1.0  
**Last Updated**: 2025-01-27  
**Status**: 📋 Implementation Checklist
