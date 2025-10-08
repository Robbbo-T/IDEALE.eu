# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0
# Notes: Threat Model for INFRANET-RETAIL-LOGISTICS (STRIDE analysis)

# Threat Model — INFRANET-RETAIL-LOGISTICS

## Executive Summary

This document outlines the threat model for the PCS-A compliant INFRANET-RETAIL-LOGISTICS platform using STRIDE methodology. The platform enables sovereign, multi-party retail logistics collaboration with Zero-Trust security.

## System Overview

**Components:**
- NDFA (RDF/OSLC triplestore) - Metadata federation
- CAHA (API Gateway) - EPCIS/OSLC facades
- MOPC (BPMN orchestration) - Workflow engine
- Zero-Trust (OIDC, SPIFFE/SPIRE, OPA) - Identity & authorization
- Connectors (EPCIS, WMS, TMS, IoT) - System integrations

**Trust Boundaries:**
1. External users/partners → API Gateway
2. API Gateway → Internal services
3. Internal services → Data stores
4. Cross-organization federation

## STRIDE Analysis

### 1. Spoofing (Identity Threats)

| Asset | Threat | Mitigation | Priority |
|-------|--------|------------|----------|
| API Endpoints | Unauthenticated access | OIDC + JWT tokens; SPIFFE/SPIRE for workloads | HIGH |
| Service-to-Service | Service impersonation | mTLS with SPIFFE SVIDs; certificate rotation | HIGH |
| EPCIS Events | Fake event injection | Cryptographic signatures; OPA validation | HIGH |
| Users | Credential theft | MFA required; short-lived tokens; audit logs | MEDIUM |

**Controls:**
- OIDC provider with MFA enforcement
- SPIFFE/SPIRE for workload identity (SVIDs)
- mTLS for all service communication
- JWT validation at API Gateway
- Certificate rotation every 24 hours

### 2. Tampering (Data Integrity)

| Asset | Threat | Mitigation | Priority |
|-------|--------|------------|----------|
| EPCIS Events | Event modification | Immutable events; SHA-256 hashes; DLT anchoring | HIGH |
| OSLC Metadata | Metadata tampering | SHACL validation; content hashes; audit trail | HIGH |
| BPMN Workflows | Workflow manipulation | OPA policy enforcement; signed deployments | MEDIUM |
| Shipment Data | Transit manipulation | Cryptographic seals; IoT sensors; blockchain | HIGH |

**Controls:**
- Content hashing (SHA-256) for all artifacts
- DLT anchoring for critical evidence
- SHACL shape validation at ingress
- Signed container images
- Immutable audit logs

### 3. Repudiation (Non-repudiation)

| Asset | Threat | Mitigation | Priority |
|-------|--------|------------|----------|
| EPCIS Events | Denial of event creation | Digital signatures; DLT anchoring; timestamps | HIGH |
| Orders | Order denial | Signed orders; DLT records; audit logs | HIGH |
| Policy Decisions | OPA decision denial | Decision logging; immutable audit trail | MEDIUM |

**Controls:**
- DLT-anchored evidence for critical events
- Signed EPCIS events (W3C VC or JWS)
- Immutable audit logs (write-once storage)
- Timestamping service (RFC 3161)
- Centralized SIEM integration

### 4. Information Disclosure (Confidentiality)

| Asset | Threat | Mitigation | Priority |
|-------|--------|------------|----------|
| PII in Orders | Unauthorized PII access | Encryption at rest/transit; RBAC; data masking | HIGH |
| Commercial Data | Competitor access | Classification labels; OPA policies; encryption | HIGH |
| Location Data | Real-time tracking leak | Need-to-know; time-delayed disclosure; geo-fencing | MEDIUM |
| API Keys | Secret exposure | External Secrets Operator; Vault; rotation | HIGH |

**Controls:**
- Encryption at rest (AES-256)
- TLS 1.3 for all transport
- Data classification labels (PUBLIC/INTERNAL/CONFIDENTIAL/RESTRICTED)
- OPA policies enforce need-to-know
- No secrets in code (External Secrets / Vault)
- PII minimization

### 5. Denial of Service (Availability)

| Asset | Threat | Mitigation | Priority |
|-------|--------|------------|----------|
| API Gateway | DDoS attack | Rate limiting; WAF; CDN; auto-scaling | HIGH |
| SPARQL Endpoint | Query resource exhaustion | Query timeout; result size limits; caching | MEDIUM |
| BPMN Engine | Workflow flooding | Queue limits; backpressure; circuit breakers | MEDIUM |
| DLT Network | Transaction spam | Gas fees; permissioned network; quotas | LOW |

**Controls:**
- Rate limiting (per user/org)
- API Gateway with WAF (OWASP rules)
- Horizontal auto-scaling (HPA)
- Circuit breakers for downstream services
- SPARQL query timeout (5s)
- Caching layer (Redis)

### 6. Elevation of Privilege (Authorization)

| Asset | Threat | Mitigation | Priority |
|-------|--------|------------|----------|
| OPA Policies | Policy bypass | Policy testing; deny-by-default; audit | HIGH |
| RBAC | Role escalation | Least privilege; separation of duties; review | HIGH |
| BPMN Tasks | Unauthorized execution | SPIFFE ID checks; OPA gate; task signing | HIGH |
| Admin APIs | Privilege escalation | Admin MFA; IP allowlisting; just-in-time access | HIGH |

**Controls:**
- Default deny (OPA)
- Least privilege principle
- ABAC with OPA (role + context + classification)
- Admin access requires MFA + approval
- Regular access reviews
- Separation of duties

## Export Control & Regulatory Compliance

### ITAR / Export Control

**Threat:** Unauthorized international data transfer of controlled items.

**Controls:**
- Classification tags on all resources (ITAR: true/false)
- OPA policies block exports to non-authorized jurisdictions
- Audit all export attempts
- Clearance checks for users accessing ITAR data

### GDPR / Privacy

**Threat:** Unauthorized processing of EU citizen PII.

**Controls:**
- Data residency enforcement (EU data stays in EU)
- PII minimization
- Consent tracking
- Right to erasure (data lifecycle management)
- Privacy-by-design

## Security Monitoring

**Detection:**
- CloudWatch / Azure Monitor / Stackdriver logs
- OpenTelemetry traces
- OPA decision logs
- SIEM integration (Splunk / ELK)
- Anomaly detection (ML-based)

**Response:**
- Automated incident response playbooks
- Security runbooks
- On-call rotation
- Post-incident reviews

## Assumptions & Limitations

1. **Trusted PKI:** SPIFFE/SPIRE CA is secure
2. **Secure Boot:** Kubernetes nodes are not compromised
3. **Physical Security:** Data centers have physical access controls
4. **Supply Chain:** Container images are from trusted registries

## Review & Update

This threat model must be reviewed:
- Quarterly
- After major architecture changes
- After security incidents
- As part of compliance audits

---

**Document Version:** 1.0  
**Last Updated:** 2025-02-01  
**Next Review:** 2025-05-01  
**Owner:** Security Team
