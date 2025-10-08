# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0
# Notes: Security policy documentation

# Security Policies — INFRANET-RETAIL-LOGISTICS

## Access Control Policy

### Principle: Zero-Trust, Need-to-Know

All access decisions are made by OPA using ABAC (Attribute-Based Access Control) with:
- **Subject attributes**: Role, clearance, organization, projects
- **Resource attributes**: Classification, owner, tags (ITAR, EU, PII)
- **Context attributes**: Time, location, network zone

### Roles & Responsibilities

| Role | Access | Responsibilities |
|------|--------|-----------------|
| **Operator** | Read: Orders, Shipments, EPCIS<br>Execute: WMS/TMS tasks | Daily operations |
| **Auditor** | Read: All (including logs)<br>Query: DLT evidence | Compliance audits |
| **Manager** | Read: All<br>Approve: Access requests | Oversight |
| **Partner** | Read: Authorized resources only | Inter-org collaboration |
| **System** | Execute: BPMN tasks, DLT anchoring | Automation |

### Data Classification

| Level | Access | Examples |
|-------|--------|----------|
| **PUBLIC** | All authenticated users | Product catalog |
| **INTERNAL** | Employees only | Internal procedures |
| **CONFIDENTIAL** | Need-to-know + clearance | Customer orders, PII |
| **RESTRICTED** | Explicit authorization | ITAR-controlled items |

## Authentication Policy

### Users (OIDC)

- **Provider**: Keycloak, Auth0, Azure AD, or similar OIDC-compliant IdP
- **MFA**: Required for all users accessing CONFIDENTIAL or RESTRICTED resources
- **Token lifetime**: 1 hour (access token), 24 hours (refresh token)
- **Password policy**: Min 12 chars, complexity requirements, rotation every 90 days

### Workloads (SPIFFE/SPIRE)

- **Identity**: SPIFFE ID (e.g., `spiffe://org-a/connector/wms`)
- **Credential**: X.509 SVID, automatically rotated every 1 hour
- **Attestation**: Node attestation + workload attestation
- **Trust domain**: Separate trust domain per organization

## Authorization Policy

### Default Deny

All actions are denied by default. Explicit allow rules must exist in OPA policies.

### Policy Decision Flow

1. Request arrives at API Gateway
2. Gateway extracts JWT (user) or SVID (workload)
3. Gateway calls OPA with input: `{subject, resource, action, context}`
4. OPA evaluates policies and returns decision
5. If denied, request is rejected with 403; decision is logged
6. If allowed, request proceeds to backend service

### Audit Logging

All policy decisions (allow and deny) are logged with:
- Timestamp
- Subject ID
- Resource ID
- Action
- Decision
- Reason (if denied)

Logs are immutable and retained for 7 years (compliance requirement).

## Encryption Policy

### In Transit

- **TLS 1.3** for all external communication
- **mTLS** for all service-to-service communication
- **Cipher suites**: ECDHE+AESGCM only (no RSA, no CBC)

### At Rest

- **AES-256-GCM** for all stored data
- **Key management**: AWS KMS, Azure Key Vault, or HashiCorp Vault
- **Key rotation**: Every 90 days

### PII & Sensitive Data

- **Encryption**: JWE for CloudEvents containing PII
- **Masking**: PII masked in logs
- **Retention**: PII deleted after business need expires (GDPR compliance)

## Incident Response Policy

### Severity Levels

| Level | Definition | Response Time | Escalation |
|-------|------------|---------------|------------|
| **Critical** | System breach, data leak | Immediate | CISO, CEO |
| **High** | Potential breach, DoS | 1 hour | Security team, VP Eng |
| **Medium** | OPA denials spike, failed auth | 4 hours | On-call engineer |
| **Low** | Informational | 24 hours | Security team |

### Incident Response Process

1. **Detect**: SIEM alerts, user reports
2. **Contain**: Isolate affected systems, revoke credentials
3. **Eradicate**: Remove threat, patch vulnerabilities
4. **Recover**: Restore services, verify integrity
5. **Post-mortem**: Document lessons learned, update policies

## Compliance Policy

### GDPR (EU Data Protection)

- **Lawful basis**: Contract, legitimate interest
- **Data subject rights**: Access, rectification, erasure, portability
- **Data residency**: EU citizen data stays in EU
- **DPO**: Designated Data Protection Officer

### ITAR / Export Control (US)

- **Classification**: All ITAR items tagged with `itar: true`
- **Access control**: Only US persons or authorized foreign nationals
- **Export blocking**: OPA denies exports to restricted countries
- **Audit**: All ITAR access logged and reported quarterly

### ISO 27001 (Information Security)

- **Certification**: Maintain ISO 27001 certification
- **Risk assessment**: Annual risk assessment
- **Policies**: Review and update policies annually
- **Training**: Security awareness training for all staff

## Monitoring & Alerting Policy

### Metrics

- API request latency (p50, p95, p99)
- OPA decision rate (allow/deny ratio)
- Failed authentication attempts
- EPCIS event throughput
- DLT transaction success rate

### Alerts

- **Critical**: API downtime, OPA unavailable, DLT consensus failure
- **Warning**: High error rate, slow queries, certificate expiration soon
- **Info**: New user login, policy updated, DLT transaction confirmed

### On-Call Rotation

- **Primary**: 24/7 on-call engineer
- **Secondary**: Backup engineer
- **Escalation**: Manager, CISO

---

**Policy Version**: 1.0  
**Last Updated**: 2025-02-01  
**Next Review**: 2025-05-01  
**Owner**: Security Team
