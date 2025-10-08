# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Threat Model

This directory contains threat modeling documentation using STRIDE methodology for the INFRANET-RETAIL-LOGISTICS platform.

## Purpose

Threat modeling identifies:
- **Security threats**: Potential attacks and vulnerabilities
- **Risk assessment**: Likelihood and impact of threats
- **Mitigations**: Security controls to address threats
- **Trust boundaries**: Security perimeter definition

## Files

- **STRIDE-analysis.md** - Complete STRIDE threat analysis

## STRIDE Methodology

STRIDE analyzes six threat categories:

1. **S**poofing - Identity threats
2. **T**ampering - Data integrity threats
3. **R**epudiation - Non-repudiation threats
4. **I**nformation Disclosure - Confidentiality threats
5. **D**enial of Service - Availability threats
6. **E**levation of Privilege - Authorization threats

## Threat Overview

### Spoofing (Identity)

**Threats:**
- Unauthenticated API access
- Service impersonation
- Fake EPCIS event injection

**Mitigations:**
- OIDC + JWT for users
- SPIFFE/SPIRE + mTLS for workloads
- Cryptographic signatures on events
- OPA validation

### Tampering (Integrity)

**Threats:**
- EPCIS event modification
- OSLC metadata tampering
- BPMN workflow manipulation

**Mitigations:**
- SHA-256 content hashing
- DLT anchoring for critical evidence
- SHACL validation
- Signed container images
- Immutable audit logs

### Repudiation (Non-repudiation)

**Threats:**
- Denial of event creation
- Order denial
- Policy decision denial

**Mitigations:**
- Digital signatures (W3C VC or JWS)
- DLT anchoring
- Immutable audit trail
- Timestamping service (RFC 3161)

### Information Disclosure (Confidentiality)

**Threats:**
- Unauthorized PII access
- Commercial data leakage
- Location tracking leak

**Mitigations:**
- Encryption (AES-256 at rest, TLS 1.3 in transit)
- Data classification labels
- OPA need-to-know enforcement
- No secrets in code
- PII minimization

### Denial of Service (Availability)

**Threats:**
- DDoS attack on API
- SPARQL query exhaustion
- BPMN workflow flooding

**Mitigations:**
- Rate limiting
- WAF with OWASP rules
- Auto-scaling (HPA)
- Circuit breakers
- Query timeouts

### Elevation of Privilege (Authorization)

**Threats:**
- OPA policy bypass
- Role escalation
- Unauthorized task execution

**Mitigations:**
- Default deny (OPA)
- Least privilege
- ABAC with OPA
- Admin MFA
- Regular access reviews

## Trust Boundaries

```
┌─────────────────────────────────────────────┐
│         External Users/Partners             │
│         (OIDC authenticated)                │
└──────────────────┬──────────────────────────┘
                   │ (TLS 1.3)
                   ▼
┌─────────────────────────────────────────────┐
│           API Gateway (CAHA)                │
│      (OPA authorization, WAF)               │
└──────────────────┬──────────────────────────┘
                   │ (mTLS)
      ┌────────────┼────────────┐
      ▼            ▼            ▼
┌──────────┐ ┌──────────┐ ┌──────────┐
│  NDFA    │ │   MOPC   │ │  Connectors│
│ (Fuseki) │ │ (Zeebe)  │ │ (WMS/TMS)│
└──────────┘ └──────────┘ └──────────┘
      │            │            │
      └────────────┼────────────┘
                   │ (encrypted)
                   ▼
            ┌──────────────┐
            │ Data Stores  │
            │ (encrypted)  │
            └──────────────┘
```

## Risk Assessment

### High-Risk Threats

1. **Unauthorized data access** (Confidential/ITAR)
   - Impact: High (compliance violation, data leak)
   - Likelihood: Medium
   - Priority: **Critical**

2. **Service impersonation**
   - Impact: High (data tampering, unauthorized actions)
   - Likelihood: Low
   - Priority: **High**

3. **DDoS attack**
   - Impact: High (service unavailable)
   - Likelihood: Medium
   - Priority: **High**

### Medium-Risk Threats

4. **Credential theft**
5. **Query resource exhaustion**
6. **Workflow manipulation**

### Low-Risk Threats

7. **DLT transaction spam**
8. **Audit log tampering** (mitigated by immutability)

## Security Controls

### Preventive Controls

- Authentication (OIDC, SPIFFE/SPIRE)
- Authorization (OPA default-deny)
- Encryption (TLS, AES-256)
- Input validation (SHACL, OpenAPI)

### Detective Controls

- Audit logging
- SIEM integration
- Anomaly detection
- OPA decision logs

### Corrective Controls

- Incident response procedures
- Automated containment (revoke credentials)
- Backup & restore
- Rollback capability

## Compliance Mapping

### GDPR

- **Article 32** (Security): Encryption, access control
- **Article 33** (Breach notification): Incident response
- **Article 25** (Privacy by design): Default deny, PII minimization

### ITAR

- **§120.17** (Export): Export control policies
- **§120.50** (Audit): Quarterly access audits
- **§123.1** (Registration): Authorized user tracking

### ISO 27001

- **A.9** (Access control): OIDC, OPA, MFA
- **A.10** (Cryptography): TLS, AES-256, key management
- **A.12** (Operations security): Audit logs, monitoring
- **A.16** (Incident management): Incident response

## Review Schedule

- **Quarterly**: Review threat model for new features
- **Annual**: Complete threat model refresh
- **Post-incident**: Update threat model with lessons learned

---

**Document Version**: 1.0  
**Last Updated**: 2025-02-01  
**Next Review**: 2025-05-01  
**Owner**: Security Team
