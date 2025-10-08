# Governance Policies

This directory contains governance policy files that define quality, compliance, and process requirements for CAS operations.

## Purpose

Policies ensure:
- **Consistency** — Uniform practices across all content
- **Quality** — Content meets defined standards
- **Compliance** — Regulatory and industry requirements satisfied
- **Traceability** — Documented decision trail
- **Auditability** — Verifiable process adherence

## Policy Files

### controlled-language.yaml
**ASD-STE100 Simplified Technical English Policy**

Defines requirements for controlled language usage:
- Language standard: ASD-STE100
- Compliance level: Mandatory
- Approved vocabulary enforcement
- Sentence structure rules
- Verification requirements
- Author training and certification
- Quality gates

Key rules:
- Max 20 words per sentence (procedural)
- Max 25 words per sentence (descriptive)
- Simple present tense or imperative voice
- Active voice preferred
- No noun clusters >3 words

### security.yaml
**Security Classification and Export Control Policy**

Defines security requirements:
- Classification levels (01-05)
- Export control compliance (ITAR/EAR)
- Distribution restrictions
- Access control requirements
- Marking requirements
- Security review process

Classification codes:
- 01 — Unclassified/Public
- 02 — Unclassified/Internal
- 03 — Confidential
- 04 — Restricted
- 05 — Secret

### metadata.yaml
**Metadata Completeness Policy**

Defines required IDS fields in S1000D content:
- `dmAddress` structure requirements
- `dmStatus` mandatory fields
- `responsiblePartnerCompany` requirements
- `security` classification
- `qualityAssurance` verification
- `applic` statements
- `brexDmRef` references

Enforcement:
- CI/CD automated validation
- Pre-commit hooks
- Pull request gates
- Baseline verification

### acceptance.yaml
**Content Acceptance Criteria**

Defines gates for content acceptance:
- Technical accuracy verification
- STE compliance check
- Metadata completeness
- Reference validation
- Illustration quality
- Approval workflow

### publishing.yaml
**Publication Approval Workflow**

Defines publication release process:
- Review requirements
- Approval authorities
- Sign-off procedures
- Baseline creation
- Distribution control
- Version management

## Policy Enforcement

### Automated Enforcement
Policies enforced through CI/CD:
```yaml
validation_pipeline:
  - XSD validation
  - Schematron validation
  - BREX validation
  - Metadata policy check
  - STE compliance check
  - Security classification check
```

### Manual Enforcement
Policies requiring human review:
- Technical accuracy
- Illustration quality
- Context appropriateness
- Final approval signature

## Compliance Verification

### Pre-Commit
Local validation before commit:
```bash
# Validate metadata
python3 scripts/validate-metadata.py

# Check STE compliance
ste-checker content.xml

# Verify security classification
python3 scripts/check-security.py
```

### CI/CD Pipeline
Automated gates in pipeline:
1. **XSD Gate** — Structural correctness
2. **Metadata Gate** — Required fields present
3. **STE Gate** — Controlled language compliance
4. **Security Gate** — Classification appropriate
5. **BREX Gate** — Business rules satisfied

### Audit
Periodic compliance audits:
- Review adherence to policies
- Check enforcement effectiveness
- Identify process gaps
- Update policies as needed

## Policy Updates

To update a policy:
1. Identify policy gap or improvement
2. Draft policy change
3. Review with stakeholders
4. Update policy YAML file
5. Update enforcement scripts if needed
6. Communicate changes to team
7. Provide training if required
8. Update affected content

## Exceptions

Policy exceptions must be:
1. **Documented** — Record reason and approval
2. **Approved** — By appropriate authority
3. **Tracked** — In exception log
4. **Time-bound** — Temporary if possible
5. **Reviewed** — Periodically reassessed

Exception approval authority defined in each policy.

## Training

Policy compliance requires:
- **Initial Training** — For all authors
- **Policy Updates** — When policies change
- **STE Certification** — For technical writers
- **Tool Training** — For validation tools
- **Refresher Training** — Annually

Training records maintained in team management system.

## Related

- [../kpi/](../kpi/) — KPIs measuring policy compliance
- [../../CSDB/BREX/](../../CSDB/BREX/) — BREX DM enforcing policies
- [../../schemas/](../../schemas/) — Validation schemas
- Parent: [../README.md](../README.md)

## Governance Structure

```
Governance/
├── policies/              ← Policy definitions (this directory)
│   ├── controlled-language.yaml
│   ├── security.yaml
│   ├── metadata.yaml
│   ├── acceptance.yaml
│   └── publishing.yaml
└── kpi/                   ← Performance monitoring
    └── README.md
```

## Contact

For policy questions or exception requests:
- **Technical Publications Manager** — STE and metadata policies
- **Security Officer** — Security and export control
- **Quality Manager** — Acceptance and publishing policies

## Version History

Policies are version controlled:
- Track changes in git
- Document rationale for changes
- Maintain history for audit
- Reference in DM status sections
