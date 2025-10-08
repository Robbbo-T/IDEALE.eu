# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Getting Started — INFRANET-RETAIL-LOGISTICS

This guide helps you get started with the PCS-A compliant INFRANET-RETAIL-LOGISTICS platform.

## Prerequisites

- **Kubernetes cluster** (EKS, AKS, GKE, or k3s)
- **Terraform** >= 1.5.0
- **kubectl** >= 1.27
- **Python** >= 3.9 (for SDK and tests)
- **Argo CD** (for GitOps deployment)

## Quick Start (5 minutes)

### 1. Deploy Infrastructure

```bash
# Clone repository
git clone https://github.com/Robbbo-T/IDEALE.eu.git
cd IDEALE.eu/3-PROJECTS-USE-CASES/INFRANET-RETAIL-LOGISTICS

# Initialize Terraform
cd INFRA/terraform/envs/dev
terraform init

# Deploy infrastructure
terraform apply -auto-approve

# Note cluster endpoint
terraform output cluster_endpoint
```

### 2. Deploy Kubernetes Workloads

```bash
# Install Argo CD (if not already installed)
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Deploy PCS-A application
kubectl apply -f ../../gitops/argo/app-dev.yaml

# Wait for deployment
kubectl wait --for=condition=available --timeout=300s deployment/fuseki -n pcs-a
kubectl wait --for=condition=available --timeout=300s deployment/opa -n pcs-a
```

### 3. Verify Deployment

```bash
# Check all pods are running
kubectl get all -n pcs-a

# Port-forward Fuseki
kubectl port-forward -n pcs-a svc/fuseki 3030:3030 &

# Port-forward OPA
kubectl port-forward -n pcs-a svc/opa 8181:8181 &

# Test SPARQL endpoint
curl http://localhost:3030/$/ping

# Test OPA endpoint
curl http://localhost:8181/health
```

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                         Users / Partners                     │
│                    (OIDC authenticated)                      │
└─────────────────────┬───────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                    API Gateway (CAHA)                        │
│              OpenAPI 3.1 + CloudEvents 1.0                   │
│                    /v1/epcis/events                          │
│                    /v1/oslc/shipments                        │
└─────────────┬────────────────────────┬──────────────────────┘
              │                        │
              ▼                        ▼
┌─────────────────────┐    ┌──────────────────────────────────┐
│  OPA (Zero-Trust)   │    │   NDFA (Fuseki)                  │
│  Policy Enforcement │    │   RDF/OSLC + SHACL               │
│  ABAC with Rego     │    │   SPARQL Queries                 │
└─────────────────────┘    └──────────────────────────────────┘
              │                        │
              ▼                        ▼
┌─────────────────────────────────────────────────────────────┐
│                     MOPC (BPMN Engine)                       │
│                   Zeebe / Flowable                           │
│                   order-to-cash workflow                     │
└─────────────┬────────────────────────┬──────────────────────┘
              │                        │
              ▼                        ▼
┌─────────────────────┐    ┌──────────────────────────────────┐
│  Connectors         │    │   DLT (Optional)                 │
│  - EPCIS 2.0        │    │   Fabric / Besu                  │
│  - WMS/TMS          │    │   Evidence Anchoring             │
│  - IoT (MQTT/OPC)   │    │                                  │
└─────────────────────┘    └──────────────────────────────────┘
```

## Core Workflows

### 1. Order-to-Cash (BPMN)

See `QS-FWD/bpmn/order-to-cash.bpmn`

1. **Order Received** → Validate Order
2. **Check Inventory** → Available?
3. **Pick Items** → Pack Items
4. **Create Shipment** → Emit EPCIS events
5. **Anchor Evidence** → DLT (optional)
6. **Complete Order** → Emit CloudEvent

### 2. EPCIS Event Flow

1. **Warehouse System** emits EPCIS ObjectEvent (picking)
2. **Connector** publishes to CAHA API
3. **OPA** validates access (role, clearance)
4. **NDFA** stores metadata + links
5. **CloudEvent** emitted to event bus
6. **Partners** subscribe to relevant events

### 3. SPARQL Query Example

```sparql
PREFIX rlg: <https://infranet.example/retail-logistics#>
PREFIX utcs: <https://utcs.example/ns#>

SELECT ?shipment ?order ?status WHERE {
  ?shipment a rlg:Shipment ;
            rlg:hasOrder ?order ;
            rlg:status ?status .
  FILTER (?status = "IN_TRANSIT")
}
```

## Configuration

### Environment Variables

```bash
# OIDC Provider
OIDC_ISSUER_URL=https://oidc.infranet.example
OIDC_CLIENT_ID=infranet-rlg

# SPIFFE/SPIRE
SPIRE_TRUST_DOMAIN=org-a

# NDFA (Fuseki)
FUSEKI_ADMIN_PASSWORD=<from-vault>

# Event Bus
NATS_URL=nats://nats.pcs-a.svc.cluster.local:4222
```

### Secrets Management

**DO NOT** store secrets in code. Use one of:
- **Kubernetes Secrets** (dev only)
- **External Secrets Operator** + Vault (production)
- **Cloud KMS** (AWS Secrets Manager, Azure Key Vault, GCP Secret Manager)

Example External Secrets:

```yaml
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: fuseki-secrets
  namespace: pcs-a
spec:
  secretStoreRef:
    name: vault-backend
    kind: SecretStore
  target:
    name: fuseki-secrets
  data:
    - secretKey: admin-password
      remoteRef:
        key: pcs-a/fuseki
        property: admin-password
```

## Development

### Run Conformance Tests

```bash
cd CB-QB/conformance-kit
pip install pytest pyyaml jsonschema
pytest test_conformance.py -v
```

### Develop Connector

```python
from UE_FE.caha_sdk.interfaces import EpcisConnector, EpcisEvent

class MyConnector(EpcisConnector):
    def connect(self) -> bool:
        # Implementation
        pass
    
    def query_events(self, ...) -> List[EpcisEvent]:
        # Implementation
        pass
```

### Test OPA Policies

```bash
# Install OPA CLI
brew install opa

# Test policy
opa test QS-FWD/opa-policies/authz.rego
```

## Monitoring & Observability

### Metrics

- Prometheus: `kubectl port-forward -n monitoring svc/prometheus 9090:9090`
- Grafana: `kubectl port-forward -n monitoring svc/grafana 3000:3000`

### Logs

```bash
# View Fuseki logs
kubectl logs -n pcs-a deployment/fuseki -f

# View OPA decision logs
kubectl logs -n pcs-a deployment/opa -f
```

### Traces

OpenTelemetry traces exported to Jaeger:

```bash
kubectl port-forward -n observability svc/jaeger 16686:16686
```

## Troubleshooting

### Fuseki Not Starting

```bash
# Check PVC
kubectl get pvc -n pcs-a

# Check logs
kubectl logs -n pcs-a deployment/fuseki
```

### OPA Denying All Requests

```bash
# Check policy loaded
curl http://localhost:8181/v1/policies

# Test policy decision
curl -X POST http://localhost:8181/v1/data/pcs_a/authz/allow \
  -H "Content-Type: application/json" \
  -d '{"input": {...}}'
```

### EPCIS Events Not Appearing

1. Check connector logs
2. Verify API Gateway reachable
3. Check OPA policy allows action
4. Verify SHACL validation passed

## Next Steps

1. **Onboard first partner**: See `docs/partner-onboarding.md`
2. **Configure DLT**: See `INFRA/terraform/modules/dlt/`
3. **Set up monitoring**: See `docs/monitoring-setup.md`
4. **Implement Silver conformance**: BPMN execution + OPA
5. **Implement Gold conformance**: DLT + VC/TEE

## Resources

- **OpenAPI Spec**: `QS-FWD/openapi/caha-api.yaml`
- **SHACL Shapes**: `QS-FWD/oslc-shapes/core-shapes.ttl`
- **BPMN Workflows**: `QS-FWD/bpmn/`
- **OPA Policies**: `QS-FWD/opa-policies/authz.rego`
- **SDK**: `UE-FE/caha-sdk/interfaces.py`
- **Threat Model**: `SECURITY/threat-model/STRIDE-analysis.md`
- **Security Policies**: `SECURITY/policies/security-policy.md`

## Support

- **Issues**: https://github.com/Robbbo-T/IDEALE.eu/issues
- **Discussions**: https://github.com/Robbbo-T/IDEALE.eu/discussions
- **Slack**: #infranet-rlg

---

**Last Updated**: 2025-02-01  
**Version**: 1.0.0
