# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Zero-Trust (OPA Policy Engine) - Base Manifests

This directory contains Kubernetes base manifests for the Zero-Trust component, which provides policy-based authorization via Open Policy Agent (OPA).

## Purpose

Zero-Trust enables:
- **Default deny**: All actions denied unless explicitly allowed
- **Policy as code**: Authorization logic in Rego (testable, version-controlled)
- **Attribute-based access**: Role, clearance, classification, context
- **Centralized decisions**: Single source of truth for authorization

## Components

### Open Policy Agent (OPA)
- **Image**: `openpolicyagent/opa:latest`
- **Protocol**: HTTP REST API (port 8181)
- **Policies**: Loaded from ConfigMap (see `QS-FWD/opa-policies/authz.rego`)
- **High availability**: 3 replicas

## Files

- **opa.yaml** - Complete OPA deployment (ConfigMap, Deployment, Service)

## Architecture

```
┌─────────────────────────────────────────────┐
│          CAHA API Gateway                   │
│   (checks OPA before serving requests)      │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│        OPA Service (ClusterIP)              │
│            opa:8181                         │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│       OPA Deployment (3 replicas)           │
│  - Policies: /policies (ConfigMap)          │
│  - Decision endpoint: /v1/data/...          │
└─────────────────────────────────────────────┘
```

## Configuration

### Policy Loading

Policies are loaded from ConfigMap at startup:
```yaml
volumeMounts:
- name: policies
  mountPath: /policies
  readOnly: true
volumes:
- name: policies
  configMap:
    name: opa-policies
```

### Resource Limits

- **Requests**: 128MB RAM, 100m CPU
- **Limits**: 512MB RAM, 500m CPU

## Deployment

### Via Kubectl

```bash
# Deploy OPA
kubectl apply -f opa.yaml

# Verify deployment
kubectl get all -n pcs-a -l app=opa
```

## Access Patterns

### Internal (from cluster)

```bash
# Authorization decision
curl -X POST http://opa.pcs-a.svc.cluster.local:8181/v1/data/pcs_a/authz/allow \
  -H "Content-Type: application/json" \
  -d '{"input": {...}}'

# Health check
curl http://opa.pcs-a.svc.cluster.local:8181/health
```

### External (via port-forward)

```bash
# Forward OPA port
kubectl port-forward -n pcs-a svc/opa 8181:8181

# Test policy decision
curl -X POST http://localhost:8181/v1/data/pcs_a/authz/allow \
  -H "Content-Type: application/json" \
  -d '{
    "input": {
      "action": "read",
      "resource": {"class": "epcis:event"},
      "subject": {"role": "Operator"},
      "context": {"project": "infranet-rlg"}
    }
  }'
```

## Policy Examples

### Check Authorization

```bash
# Allow: Operator reading EPCIS events
INPUT='{
  "input": {
    "action": "read",
    "resource": {"class": "epcis:event"},
    "subject": {"role": "Operator", "projects": ["infranet-rlg"]},
    "context": {"project": "infranet-rlg"}
  }
}'
curl -X POST http://localhost:8181/v1/data/pcs_a/authz/allow -d "$INPUT"
# Response: {"result": true}

# Deny: Partner without authorization
INPUT='{
  "input": {
    "action": "read",
    "resource": {"class": "oslc:Order", "classification": "CONFIDENTIAL"},
    "subject": {"role": "Partner", "clearance": "INTERNAL"},
    "context": {"project": "infranet-rlg"}
  }
}'
curl -X POST http://localhost:8181/v1/data/pcs_a/authz/allow -d "$INPUT"
# Response: {"result": false}
```

### SPIFFE-based Authorization

```bash
# Execute BPMN task with SPIFFE ID
INPUT='{
  "input": {
    "action": "execute_task",
    "task": "check-inventory",
    "subject": {
      "workload": {"spiffe_id": "spiffe://orgA/connector/wms"}
    }
  }
}'
curl -X POST http://localhost:8181/v1/data/pcs_a/authz/allow -d "$INPUT"
# Response: {"result": true}
```

## Testing Policies

### Unit Tests (Rego)

See `QS-FWD/opa-policies/authz_test.rego`:

```rego
test_read_epcis_allowed {
    allow with input as {
        "action": "read",
        "resource": {"class": "epcis:event"},
        "subject": {"role": "Operator", "projects": ["infranet-rlg"]},
        "context": {"project": "infranet-rlg"}
    }
}
```

Run tests:
```bash
opa test QS-FWD/opa-policies/
```

### Integration Tests

See `CB-QB/conformance-kit/test_conformance.py::TestOpaRegoConformance`

## Monitoring

### Health Checks

```bash
# Liveness probe
curl http://opa:8181/health

# Readiness probe (with bundle check)
curl http://opa:8181/health?bundle=true

# Pod status
kubectl get pods -n pcs-a -l app=opa
```

### Decision Logs

```bash
# View OPA decision logs
kubectl logs -n pcs-a deployment/opa -f

# Enable decision logging (to external system)
kubectl set env deployment/opa -n pcs-a \
  OPA_LOG_LEVEL=debug \
  OPA_LOG_FORMAT=json
```

## Updating Policies

### Via ConfigMap

```bash
# Edit policies locally
vim QS-FWD/opa-policies/authz.rego

# Update ConfigMap
kubectl create configmap opa-policies -n pcs-a \
  --from-file=authz.rego=QS-FWD/opa-policies/authz.rego \
  --dry-run=client -o yaml | kubectl apply -f -

# Restart OPA to reload policies
kubectl rollout restart deployment/opa -n pcs-a
```

### Via OPA Bundles (Production)

For production, use OPA bundles served from S3/HTTP:

```yaml
args:
- "run"
- "--server"
- "--addr=0.0.0.0:8181"
- "--set=bundles.pcs-a.resource=https://s3.../policies.tar.gz"
- "--set=bundles.pcs-a.polling.min_delay_seconds=60"
```

## Troubleshooting

### Policy Evaluation Errors

```bash
# Check policy syntax
opa check QS-FWD/opa-policies/authz.rego

# Test policy locally
opa eval -d QS-FWD/opa-policies/authz.rego \
  -i test-input.json \
  'data.pcs_a.authz.allow'
```

### All Requests Denied

```bash
# Verify policies loaded
curl http://localhost:8181/v1/policies

# Check for policy compilation errors
kubectl logs -n pcs-a deployment/opa | grep -i error
```

### Performance Issues

```bash
# Enable profiling
curl -X POST http://localhost:8181/v1/data/pcs_a/authz/allow?instrument=true

# Review policy complexity (avoid expensive operations)
```

## Security

- **No external access**: OPA is ClusterIP only (accessed via API Gateway)
- **Read-only policies**: ConfigMap is mounted read-only
- **Audit logging**: All decisions logged for compliance

## Integration with CAHA

API Gateway integration pattern:

```python
import requests

def check_authorization(action, resource, subject, context):
    response = requests.post(
        "http://opa.pcs-a.svc.cluster.local:8181/v1/data/pcs_a/authz/allow",
        json={
            "input": {
                "action": action,
                "resource": resource,
                "subject": subject,
                "context": context
            }
        }
    )
    return response.json().get("result", False)

# Before serving request
if not check_authorization("read", resource, subject, context):
    return {"error": "Forbidden"}, 403
```

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
