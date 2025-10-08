# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Security Policies

This directory contains security and compliance policies for the INFRANET-RETAIL-LOGISTICS platform.

## Purpose

Security policies define:
- **Access control**: Authentication, authorization, role-based access
- **Data protection**: Encryption, classification, PII handling
- **Compliance**: GDPR, ITAR, ISO 27001 requirements
- **Incident response**: Detection, containment, recovery procedures
- **Audit & monitoring**: Logging, alerting, compliance reporting

## Files

- **security-policy.md** - Comprehensive security policy document

## Policy Overview

### Access Control

- **Authentication**: OIDC for users, SPIFFE/SPIRE for workloads
- **Authorization**: OPA/Rego ABAC with default deny
- **MFA**: Required for CONFIDENTIAL and RESTRICTED resources
- **Token lifetime**: 1 hour (access), 24 hours (refresh)

### Data Classification

| Level | Access | Examples |
|-------|--------|----------|
| PUBLIC | All authenticated | Product catalog |
| INTERNAL | Employees only | Internal procedures |
| CONFIDENTIAL | Need-to-know + clearance | Customer orders, PII |
| RESTRICTED | Explicit authorization | ITAR-controlled items |

### Encryption

- **In transit**: TLS 1.3, mTLS for service-to-service
- **At rest**: AES-256-GCM
- **Key management**: AWS KMS, Azure Key Vault, HashiCorp Vault
- **PII**: JWE encryption in CloudEvents

### Export Control

#### ITAR Compliance
- All ITAR items tagged with `itar: true`
- Access restricted to US persons or authorized foreign nationals
- OPA blocks exports to restricted countries
- Quarterly audit reports

#### GDPR Compliance
- EU citizen data stays in EU
- Data subject rights: access, rectification, erasure
- Consent tracking
- DPO designation

## Roles & Responsibilities

| Role | Permissions | Responsibilities |
|------|------------|-----------------|
| **Operator** | Read: Orders, Shipments, EPCIS<br>Execute: WMS/TMS tasks | Daily operations |
| **Auditor** | Read: All (including logs)<br>Query: DLT evidence | Compliance audits |
| **Manager** | Read: All<br>Approve: Access requests | Oversight & approval |
| **Partner** | Read: Authorized resources only | Inter-org collaboration |
| **System** | Execute: BPMN tasks, DLT anchoring | Automation |

## Incident Response

### Severity Levels

| Level | Response Time | Escalation |
|-------|--------------|------------|
| **Critical** | Immediate | CISO, CEO |
| **High** | 1 hour | Security team, VP Eng |
| **Medium** | 4 hours | On-call engineer |
| **Low** | 24 hours | Security team |

### Response Process

1. **Detect**: SIEM alerts, user reports
2. **Contain**: Isolate affected systems, revoke credentials
3. **Eradicate**: Remove threat, patch vulnerabilities
4. **Recover**: Restore services, verify integrity
5. **Post-mortem**: Document lessons learned

## Monitoring & Alerting

### Critical Alerts

- API downtime
- OPA unavailable
- DLT consensus failure
- Failed authentication spike
- Unauthorized access attempts

### Warning Alerts

- High error rate (>5%)
- Slow queries (>5s)
- Certificate expiration (< 30 days)
- Disk space low (<20%)

### Metrics

- API latency (p50, p95, p99)
- OPA decision rate (allow/deny ratio)
- EPCIS event throughput
- DLT transaction success rate

## Audit & Compliance

### Audit Logs

All security events logged:
- Authentication attempts
- Authorization decisions (allow/deny)
- Data access (read/write)
- Configuration changes
- Privilege escalations

### Retention

- **Security logs**: 7 years (compliance requirement)
- **Decision logs**: 1 year
- **Access logs**: 90 days

### Compliance Reports

- **ISO 27001**: Annual certification audit
- **GDPR**: Quarterly data subject request reports
- **ITAR**: Quarterly access audit reports

## Security Testing

### Penetration Testing

- Annual external penetration test
- Quarterly internal security assessment
- Automated vulnerability scanning (weekly)

### Security Reviews

- Code review for security (all PRs)
- Architecture review (quarterly)
- Policy review (annual)

## Training

- Security awareness training (all staff, annual)
- ITAR compliance training (authorized personnel, annual)
- GDPR compliance training (data processors, annual)

## Related Documentation

- **Threat Model**: See `../threat-model/STRIDE-analysis.md`
- **OPA Policies**: See `../../QS-FWD/opa-policies/authz.rego`
- **API Security**: See `../../QS-FWD/openapi/caha-api.yaml`

---

**Policy Version**: 1.0  
**Last Updated**: 2025-02-01  
**Next Review**: 2025-05-01  
**Owner**: Security Team
