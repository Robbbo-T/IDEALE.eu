# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Kubernetes Overlays - Development Environment

This directory contains Kustomize overlays for customizing the base Kubernetes manifests for the **development environment**.

## Purpose

Overlays enable:
- **Environment-specific configuration**: Dev, stage, prod differences
- **Resource scaling**: Adjust replicas and limits per environment
- **Feature toggling**: Enable/disable components
- **Configuration management**: Environment variables, ConfigMaps

## Structure

```
overlays/dev/
├── kustomization.yaml    # Kustomize manifest
└── README.md             # This file
```

## Customizations

### Replica Adjustments

Development uses minimal replicas to reduce resource usage:
- **Fuseki**: 1 replica (base: 2)
- **OPA**: 1 replica (base: 3)

### Environment Variables

```yaml
configMapGenerator:
  - name: env-config
    literals:
      - ENVIRONMENT=dev
      - LOG_LEVEL=debug
```

### Common Labels

All resources tagged with:
```yaml
commonLabels:
  environment: dev
```

## Deployment

### Via Kubectl

```bash
# Apply dev overlay
kubectl apply -k .

# View generated manifests (dry-run)
kubectl kustomize .

# Verify deployment
kubectl get all -n pcs-a -l environment=dev
```

### Via Argo CD

See `../../gitops/argo/app-dev.yaml`:
```yaml
source:
  path: .../kubernetes/overlays/dev
```

Argo CD will automatically sync changes from Git.

## Differences from Base

| Component | Base | Dev Overlay |
|-----------|------|-------------|
| Fuseki replicas | 2 | 1 |
| OPA replicas | 3 | 1 |
| Environment label | - | `environment: dev` |
| Log level | info | debug |
| Resource limits | Production | Reduced |

## Testing Changes

### Preview Generated Manifests

```bash
# Show all resources that would be created
kubectl kustomize . | less

# Show specific resource
kubectl kustomize . | grep -A 20 "kind: Deployment"
```

### Validate Manifests

```bash
# Dry-run apply
kubectl apply -k . --dry-run=client

# Server-side validation
kubectl apply -k . --dry-run=server
```

## Customization Examples

### Add New Component

Create patch file:
```yaml
# monitoring-patch.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
  namespace: pcs-a
spec:
  replicas: 1
```

Update kustomization.yaml:
```yaml
resources:
  - ../../base/ndfa
  - ../../base/ztrust
  - monitoring-patch.yaml
```

### Override Resource Limits

```yaml
patches:
  - target:
      kind: Deployment
      name: fuseki
    patch: |-
      - op: replace
        path: /spec/template/spec/containers/0/resources/limits/memory
        value: "2Gi"
```

### Add Environment Variable

```yaml
patches:
  - target:
      kind: Deployment
      name: opa
    patch: |-
      - op: add
        path: /spec/template/spec/containers/0/env/-
        value:
          name: OPA_LOG_LEVEL
          value: debug
```

## Rollout Strategy

Development environment uses:
- **Auto-sync**: Changes in Git trigger deployment
- **Prune**: Deleted resources removed from cluster
- **Self-heal**: Drift from Git is auto-corrected

## Monitoring

```bash
# Watch deployments
kubectl get deployments -n pcs-a -l environment=dev -w

# Check pod status
kubectl get pods -n pcs-a -l environment=dev

# View logs
kubectl logs -n pcs-a -l environment=dev --tail=100
```

## Cleanup

```bash
# Delete all dev resources
kubectl delete -k .

# Or via Argo CD
argocd app delete pcs-a-infranet-rlg-dev
```

## Creating Stage/Prod Overlays

```bash
# Copy dev overlay as template
cp -r ../dev ../stage

# Edit stage/kustomization.yaml
# - Update replica counts
# - Change environment label
# - Adjust resource limits

# Stage typically has:
# - 2-3 replicas per service
# - Production-like resource limits
# - Manual sync policy (no auto-sync)
```

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
