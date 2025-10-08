# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# OPA Policies (Authorization)

This directory contains Open Policy Agent (OPA) policies written in Rego for Zero-Trust authorization.

## Purpose

OPA policies enforce:
- **Default deny**: All actions denied unless explicitly allowed
- **Role-based access**: Operators, Auditors, Managers, Partners
- **Attribute-based control**: Clearance levels, data classification
- **Context-aware decisions**: Project membership, time, location
- **SPIFFE authorization**: Workload identity verification

## Files

- **authz.rego** - Main authorization policy

## Policy Structure

```rego
package pcs_a.authz

import future.keywords.if

# Default deny
default allow := false

# Allow rules (explicit permissions)
allow if { ... }

# Helper rules
has_project_access if { ... }
check_classification_clearance if { ... }
```

## Authorization Model

### Input Schema

```json
{
  "input": {
    "action": "read | write | execute_task | export | dlt:anchor",
    "resource": {
      "class": "epcis:event | oslc:Shipment | oslc:Order",
      "id": "resource-id",
      "classification": "PUBLIC | INTERNAL | CONFIDENTIAL | RESTRICTED",
      "tags": {
        "region": "EU | US",
        "itar": true,
        "pii": false
      }
    },
    "subject": {
      "id": "user-id",
      "role": "Operator | Auditor | Manager | Partner | System",
      "clearance": "PUBLIC | INTERNAL | CONFIDENTIAL | RESTRICTED",
      "clearance_itar": true,
      "projects": ["project1", "project2"],
      "organizations": ["org1"],
      "vc": {
        "claims": {
          "role": "Engineer",
          "projects": ["infranet-rlg"]
        }
      },
      "workload": {
        "spiffe_id": "spiffe://orgA/connector/wms"
      }
    },
    "context": {
      "project": "infranet-rlg",
      "organization": "orgA",
      "time": "2025-02-01T12:00:00Z"
    }
  }
}
```

### Output Schema

```json
{
  "result": true | false
}
```

## Authorization Rules

### Read Access to EPCIS Events

```rego
allow if {
    input.action == "read"
    input.resource.class == "epcis:event"
    input.subject.role in {"Operator", "Auditor", "Manager"}
    has_project_access
}
```

### BPMN Task Execution

```rego
allow if {
    input.action == "execute_task"
    input.task == "check-inventory"
    input.subject.workload.spiffe_id == "spiffe://orgA/connector/wms"
}
```

### Data Classification

```rego
check_classification_clearance if {
    input.resource.classification == "CONFIDENTIAL"
    input.subject.clearance in {"CONFIDENTIAL", "RESTRICTED"}
}
```

### Export Control (ITAR)

```rego
allow if {
    input.action == "export"
    input.resource.tags.itar == true
    input.subject.clearance_itar == true
    input.destination.itar_approved == true
}
```

## Testing Policies

### Local Testing

```bash
# Install OPA
brew install opa  # or download from openpolicyagent.org

# Test policy
opa test authz.rego

# Evaluate decision
opa eval -d authz.rego -i test-input.json 'data.pcs_a.authz.allow'
```

### Unit Tests (Rego)

Create `authz_test.rego`:

```rego
package pcs_a.authz

test_read_epcis_allowed {
    allow with input as {
        "action": "read",
        "resource": {"class": "epcis:event"},
        "subject": {
            "role": "Operator",
            "projects": ["infranet-rlg"]
        },
        "context": {"project": "infranet-rlg"}
    }
}

test_read_confidential_denied {
    not allow with input as {
        "action": "read",
        "resource": {
            "class": "oslc:Order",
            "classification": "CONFIDENTIAL"
        },
        "subject": {
            "role": "Partner",
            "clearance": "INTERNAL"
        }
    }
}
```

Run tests:
```bash
opa test . -v
```

### Integration Tests

See `CB-QB/conformance-kit/test_conformance.py::TestOpaRegoConformance`

## Policy Examples

### Example 1: Operator Reading EPCIS Events

**Request:**
```json
{
  "input": {
    "action": "read",
    "resource": {"class": "epcis:event"},
    "subject": {
      "role": "Operator",
      "projects": ["infranet-rlg"]
    },
    "context": {"project": "infranet-rlg"}
  }
}
```

**Decision:** `allow = true`

### Example 2: Partner Reading Confidential Order

**Request:**
```json
{
  "input": {
    "action": "read",
    "resource": {
      "class": "oslc:Order",
      "classification": "CONFIDENTIAL"
    },
    "subject": {
      "role": "Partner",
      "clearance": "INTERNAL"
    }
  }
}
```

**Decision:** `allow = false` (insufficient clearance)

### Example 3: SPIFFE Workload Executing Task

**Request:**
```json
{
  "input": {
    "action": "execute_task",
    "task": "check-inventory",
    "subject": {
      "workload": {
        "spiffe_id": "spiffe://orgA/connector/wms"
      }
    }
  }
}
```

**Decision:** `allow = true`

## Policy Deployment

### Via ConfigMap (Kubernetes)

```bash
# Create ConfigMap
kubectl create configmap opa-policies -n pcs-a \
  --from-file=authz.rego=authz.rego

# Update ConfigMap
kubectl create configmap opa-policies -n pcs-a \
  --from-file=authz.rego=authz.rego \
  --dry-run=client -o yaml | kubectl apply -f -

# Restart OPA to reload
kubectl rollout restart deployment/opa -n pcs-a
```

### Via OPA Bundles (Production)

```bash
# Create bundle
tar czf policies.tar.gz authz.rego

# Upload to S3
aws s3 cp policies.tar.gz s3://pcs-a-policies/policies.tar.gz

# OPA pulls bundle automatically
```

## Decision Logging

Enable decision logging for audit:

```bash
kubectl set env deployment/opa -n pcs-a \
  OPA_LOG_LEVEL=debug \
  OPA_LOG_FORMAT=json
```

View logs:
```bash
kubectl logs -n pcs-a deployment/opa -f | jq 'select(.decision_id)'
```

## Performance

### Optimization Tips

- **Avoid expensive operations**: No HTTP calls, file I/O
- **Index lookups**: Use sets and objects for fast lookup
- **Partial evaluation**: Pre-compile policies for common patterns
- **Caching**: Use OPA's built-in caching

### Benchmarking

```bash
# Benchmark policy
opa bench authz.rego test-input.json

# Profile policy
opa eval -d authz.rego -i test-input.json \
  --profile 'data.pcs_a.authz.allow'
```

## Audit & Compliance

### Audit Logs

All denials are logged:
```rego
deny_reason contains msg if {
    not allow
    msg := sprintf("Access denied: action=%v, resource=%v, subject=%v", 
        [input.action, input.resource.class, input.subject.id])
}
```

### Compliance Reports

Generate compliance reports:
```bash
# Export decision logs
kubectl logs -n pcs-a deployment/opa --since=24h > decisions.log

# Analyze denials
cat decisions.log | jq 'select(.decision_id and .result == false)' | jq -s 'length'
```

## Integration with CAHA

API Gateway checks OPA before serving requests:

```python
import requests

def check_authorization(action, resource, subject, context):
    response = requests.post(
        "http://opa.pcs-a.svc.cluster.local:8181/v1/data/pcs_a/authz/allow",
        json={"input": {
            "action": action,
            "resource": resource,
            "subject": subject,
            "context": context
        }}
    )
    return response.json().get("result", False)

# In API handler
if not check_authorization("read", resource, get_subject(), context):
    return {"error": "Forbidden"}, 403
```

## Troubleshooting

### Policy Evaluation Errors

```bash
# Check syntax
opa check authz.rego

# Debug evaluation
opa eval -d authz.rego -i test-input.json \
  --explain=full 'data.pcs_a.authz.allow'
```

### All Requests Denied

1. Check default deny rule exists
2. Verify allow rules match input format
3. Test with known-good input
4. Check OPA logs for errors

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
