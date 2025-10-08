# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# NDFA (Neural Data Federation Architecture) - Base Manifests

This directory contains Kubernetes base manifests for the NDFA component, which provides RDF/OSLC metadata federation via Apache Fuseki.

## Purpose

NDFA enables:
- **Federated metadata**: SPARQL queries across organizational boundaries
- **Semantic validation**: SHACL shapes enforce data quality
- **Zero data migration**: Only metadata/links stored, raw data at origin
- **Standard protocols**: OSLC Core 2.0, RDF 1.1, SPARQL 1.1

## Components

### Apache Fuseki Triplestore
- **Image**: `secoresearch/fuseki:latest`
- **Protocol**: SPARQL 1.1 (Query & Update)
- **Storage**: TDB2 (persistent volume)
- **Configuration**: Turtle config file

## Files

- **fuseki.yaml** - Complete Fuseki deployment (Namespace, ConfigMap, Deployment, Service, PVC)
- **kustomization.yaml** - Kustomize manifest for base resources

## Architecture

```
┌─────────────────────────────────────────────┐
│          CAHA API Gateway                   │
│      (queries NDFA via SPARQL)              │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│        Fuseki Service (ClusterIP)           │
│            fuseki:3030                      │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│       Fuseki Deployment (2 replicas)        │
│  - Config: /fuseki/config.ttl               │
│  - Data: /fuseki/databases (PVC)            │
└─────────────────────────────────────────────┘
```

## Configuration

### Fuseki Config (config.ttl)

```turtle
@prefix fuseki:  <http://jena.apache.org/fuseki#> .
@prefix tdb:     <http://jena.hpl.hp.com/2008/tdb#> .

<#service> rdf:type fuseki:Service ;
    fuseki:name "infranet" ;
    fuseki:serviceQuery "sparql" ;
    fuseki:serviceUpdate "update" ;
    fuseki:dataset <#dataset> .

<#dataset> rdf:type tdb:DatasetTDB ;
    tdb:location "/fuseki/databases/infranet" .
```

### Resource Limits

- **Requests**: 2GB RAM, 1 CPU
- **Limits**: 4GB RAM, 2 CPU
- **Storage**: 50GB PVC (ReadWriteOnce)

## Deployment

### Via Kustomize

```bash
# Deploy base manifests
kubectl apply -k .

# Verify deployment
kubectl get all -n pcs-a -l component=ndfa
```

### Via Argo CD

See `../../gitops/argo/app-dev.yaml` for GitOps deployment.

## Access Patterns

### Internal (from cluster)

```bash
# SPARQL Query endpoint
http://fuseki.pcs-a.svc.cluster.local:3030/infranet/sparql

# SPARQL Update endpoint
http://fuseki.pcs-a.svc.cluster.local:3030/infranet/update

# Management UI
http://fuseki.pcs-a.svc.cluster.local:3030/
```

### External (via port-forward)

```bash
# Forward Fuseki port
kubectl port-forward -n pcs-a svc/fuseki 3030:3030

# Query via curl
curl -X POST http://localhost:3030/infranet/sparql \
  -H "Content-Type: application/sparql-query" \
  --data 'SELECT * WHERE { ?s ?p ?o } LIMIT 10'

# Access UI
open http://localhost:3030/
```

## SPARQL Examples

### Query Shipments

```sparql
PREFIX rlg: <https://infranet.example/retail-logistics#>
PREFIX utcs: <https://utcs.example/ns#>

SELECT ?shipment ?order ?status WHERE {
  ?shipment a rlg:Shipment ;
            rlg:hasOrder ?order ;
            rlg:status ?status ;
            utcs:id ?utcsId .
  FILTER (?status = "IN_TRANSIT")
}
```

### Query EPCIS Events

```sparql
PREFIX epcis: <https://ns.gs1.org/epcis#>
PREFIX rlg: <https://infranet.example/retail-logistics#>

SELECT ?event ?bizStep ?location WHERE {
  ?event a epcis:EPCISEvent ;
         epcis:bizStep ?bizStep ;
         epcis:bizLocation ?location .
  FILTER (CONTAINS(STR(?bizStep), "shipping"))
}
```

## Monitoring

### Health Checks

```bash
# Liveness probe
curl http://fuseki:3030/$/ping

# Readiness probe
curl http://fuseki:3030/$/ping

# Pod status
kubectl get pods -n pcs-a -l app=fuseki
```

### Metrics

```bash
# Dataset stats
curl http://fuseki:3030/$/stats/infranet

# Server stats
curl http://fuseki:3030/$/stats
```

## Backup & Restore

### Backup

```bash
# Backup TDB2 database
kubectl exec -n pcs-a deployment/fuseki -- tar czf /tmp/backup.tar.gz /fuseki/databases/infranet

# Copy to local
kubectl cp pcs-a/fuseki-xxx:/tmp/backup.tar.gz ./fuseki-backup-$(date +%Y%m%d).tar.gz
```

### Restore

```bash
# Copy backup to pod
kubectl cp ./fuseki-backup.tar.gz pcs-a/fuseki-xxx:/tmp/backup.tar.gz

# Restore
kubectl exec -n pcs-a deployment/fuseki -- tar xzf /tmp/backup.tar.gz -C /
```

## Scaling

```bash
# Scale replicas (read-only workloads only)
kubectl scale deployment fuseki -n pcs-a --replicas=3

# For write workloads, use single replica to avoid conflicts
```

## Troubleshooting

### Pod CrashLoopBackOff

```bash
# Check logs
kubectl logs -n pcs-a deployment/fuseki

# Common issues:
# - PVC not bound (check storage class)
# - Config syntax error (validate config.ttl)
# - Memory limit too low (increase limits)
```

### Slow Queries

```bash
# Enable query logging
kubectl set env deployment/fuseki -n pcs-a JAVA_OPTIONS="-Xmx3g -Dlog4j.configuration=file:/fuseki/log4j.properties"

# Add indexes to TDB2 (see Fuseki docs)
```

## Security

- **Authentication**: Admin password from Secret (see kustomization.yaml)
- **Authorization**: Network policies restrict access to CAHA only
- **Encryption**: TLS termination at Ingress (if exposed)

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
