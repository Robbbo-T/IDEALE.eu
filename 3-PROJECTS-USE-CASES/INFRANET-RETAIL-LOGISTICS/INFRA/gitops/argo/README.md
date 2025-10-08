# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Argo CD GitOps Applications

This directory contains Argo CD Application manifests for GitOps-based deployment of the INFRANET-RETAIL-LOGISTICS platform.

## Purpose

Argo CD Applications enable:
- **Declarative deployments**: All infrastructure defined in Git
- **Automated synchronization**: Changes in Git trigger deployments
- **Environment management**: Dev, stage, prod configurations
- **Rollback capability**: Git history enables instant rollbacks

## Files

- **app-dev.yaml** - Development environment application

## Application Structure

Each Argo CD Application defines:
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: pcs-a-infranet-rlg-{env}
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/Robbbo-T/IDEALE.eu.git
    targetRevision: main
    path: .../kubernetes/overlays/{env}
  destination:
    server: https://kubernetes.default.svc
    namespace: pcs-a
  syncPolicy:
    automated:
      prune: true      # Remove resources deleted from Git
      selfHeal: true   # Auto-sync if cluster state drifts
```

## Deployment

### Prerequisites

1. **Argo CD installed** in cluster:
   ```bash
   kubectl create namespace argocd
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
   ```

2. **Access Argo CD UI**:
   ```bash
   kubectl port-forward svc/argocd-server -n argocd 8080:443
   # Username: admin
   # Password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
   ```

### Deploy Application

```bash
# Deploy dev environment
kubectl apply -f app-dev.yaml

# Verify application created
kubectl get application -n argocd

# Watch sync status
kubectl get application pcs-a-infranet-rlg-dev -n argocd -w
```

### Sync Manually (if not auto-sync)

```bash
# Via kubectl
kubectl patch application pcs-a-infranet-rlg-dev -n argocd --type merge -p '{"operation":{"initiatedBy":{"username":"admin"},"sync":{}}}'

# Via Argo CD CLI
argocd app sync pcs-a-infranet-rlg-dev
```

## Environments

### Development (app-dev.yaml)
- **Namespace**: pcs-a
- **Replicas**: Reduced (1 pod per deployment)
- **Resources**: Small limits
- **Sync**: Automated (prune + selfHeal)

### Stage (future: app-stage.yaml)
- **Namespace**: pcs-a-stage
- **Replicas**: Medium (2-3 pods)
- **Resources**: Production-like
- **Sync**: Manual approval

### Production (future: app-prod.yaml)
- **Namespace**: pcs-a-prod
- **Replicas**: Full HA (3+ pods)
- **Resources**: Production limits
- **Sync**: Manual with approval workflow

## Monitoring

### Application Health

```bash
# Check health status
argocd app get pcs-a-infranet-rlg-dev

# View sync history
argocd app history pcs-a-infranet-rlg-dev

# View application logs
argocd app logs pcs-a-infranet-rlg-dev
```

### Sync Waves

Resources deploy in order:
1. **Wave 0**: Namespaces, ConfigMaps, Secrets
2. **Wave 1**: PVCs, Services
3. **Wave 2**: Deployments
4. **Wave 3**: Ingress, NetworkPolicies

## Troubleshooting

### Application Stuck in Progressing

```bash
# Check sync status
argocd app get pcs-a-infranet-rlg-dev

# Force sync
argocd app sync pcs-a-infranet-rlg-dev --force

# Check pod status
kubectl get pods -n pcs-a
```

### Out of Sync

```bash
# Compare desired vs live state
argocd app diff pcs-a-infranet-rlg-dev

# Sync to desired state
argocd app sync pcs-a-infranet-rlg-dev
```

### Rollback

```bash
# View history
argocd app history pcs-a-infranet-rlg-dev

# Rollback to revision
argocd app rollback pcs-a-infranet-rlg-dev <revision>
```

## Security

- **RBAC**: Argo CD projects limit access by team
- **Git credentials**: Use deploy keys (read-only)
- **Secrets**: Never in Git; use External Secrets Operator
- **Sync policies**: Production requires manual approval

## CI/CD Integration

```yaml
# .github/workflows/deploy.yml
- name: Update manifests
  run: |
    kustomize edit set image fuseki=fuseki:${{ github.sha }}
    git commit -am "deploy: Update image to ${{ github.sha }}"
    git push
    
# Argo CD auto-syncs within 3 minutes
```

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
