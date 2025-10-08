# INFRANET — Retail & Logistics (PCS-A Use Case)

**UTCS:** UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]  
**TFA:** QS→FWD→UE→FE→CB→QB  
**License:** Apache-2.0

## Objective

Sovereign, multi-organization retail-logistics intranet fully defined as **Infrastructure as Code (IaC)**, compliant with **PCS-A v0.1** open standards. Enables federated, read-only metadata exchange with Zero-Trust security, zero vendor lock-in, and optional DLT anchoring.

## Mission

Optimize supply chain and inventory with blockchain provenance, enabling transparent and verifiable tracking of goods throughout the distribution network without moving bulk data.

## PCS-A Architecture

### Components

- **NDFA (Neural Data Federation Architecture)**: RDF/OSLC + SHACL for metadata/links; SPARQL for traces. Raw data stays at origin.
- **CAHA (Common Abstraction & Harmonization API)**: REST/GraphQL + OSLC API; CloudEvents 1.0 for state changes; plug-in connectors.
- **MOPC (Multi-Organization Process Coordination)**: BPMN 2.0 (Zeebe/Flowable) + OPA/Rego (ABAC) + optional DLT (Fabric/Besu) for evidence.
- **Zero-Trust**: OIDC (persons), SPIFFE/SPIRE (services), mTLS E2E, OPA policies.

### Standards Compliance

- **Core:** OSLC Core 2.0, RDF 1.1, SHACL, BPMN 2.0, CloudEvents 1.0, OpenAPI 3.1
- **Retail/Logistics:** **GS1 EPCIS 2.0 + CBV**, GS1 Digital Link, ISO 8000, ODRL
- **Industrial/IoT:** OPC UA, MQTT 5 (when needed)
- **Security:** OIDC/OAuth2, DID/VC, SPIFFE/SPIRE, mTLS, OPA
- **Auditing:** Hyperledger (hashes, signatures, claims)

### Conformance Levels

- **Bronze**: Read-only OSLC/EPCIS access
- **Silver**: BPMN + OPA execution
- **Gold**: DLT + VC/TEE bidirectional

## Quick Start

### 1. Infrastructure Deployment

```bash
# Deploy infrastructure (Terraform)
cd INFRA/terraform/envs/dev
terraform init
terraform plan
terraform apply

# Deploy Kubernetes workloads (GitOps)
kubectl apply -f ../../gitops/argo/app-dev.yaml

# Verify deployment
kubectl get all -n pcs-a
```

### 2. Query SPARQL Endpoint

```bash
# Forward Fuseki port
kubectl port-forward -n pcs-a svc/fuseki 3030:3030

# Query SPARQL
curl -X POST http://localhost:3030/infranet/sparql \
  -H "Content-Type: application/sparql-query" \
  --data 'SELECT ?shipment ?order WHERE { ?shipment rlg:hasOrder ?order }'
```

### 3. Query EPCIS Events

```bash
# Query EPCIS events via CAHA API
curl -X GET "https://api.infranet.example/v1/epcis/events?bizStep=shipping&limit=10" \
  -H "Authorization: Bearer $TOKEN"
```

## Repository Structure

```
INFRANET-RETAIL-LOGISTICS/
├─ _copilot.injection.md           # Copilot generation rules
├─ README.md                        # This file
├─ QS-FWD/                          # QS→FWD layer (specifications)
│  ├─ oslc-shapes/                  # SHACL shapes (orders, shipments, events)
│  ├─ openapi/                      # CAHA OpenAPI + CloudEvents schemas
│  ├─ bpmn/                         # BPMN workflows (order-to-cash, etc.)
│  └─ opa-policies/                 # OPA/Rego ABAC policies
├─ UE-FE/                           # UE→FE layer (execution)
│  ├─ caha-sdk/                     # SDK interfaces (Python/Go)
│  └─ connectors/                   # EPCIS, WMS/TMS, IoT adapters
├─ CB-QB/                           # CB→QB layer (verification)
│  ├─ conformance-kit/              # Contract tests (OpenAPI/SHACL/EPCIS)
│  └─ manifests/                    # UTCS manifests with SHA-256 hashes
├─ INFRA/                           # Infrastructure as Code
│  ├─ terraform/                    # Terraform modules (network, k8s, dlt)
│  ├─ kubernetes/                   # Kubernetes manifests (base, overlays)
│  └─ gitops/                       # Argo CD / Flux apps
└─ SECURITY/                        # Security documentation
   ├─ threat-model/                 # STRIDE/LINDDUN analysis
   └─ policies/                     # Security/regulatory policies
```

## Domain Emphasis

- **LIB** (Logistics, Inventory, Blockchain): Blockchain integration for provenance
- **IIF** (Industrial Infrastructure, Facilities): Warehouse and facility optimization
- **EER** (Environmental, Emissions, Remediation): ESG compliance reporting

## TFA Mapping

| Stage      | Artifacts                                           |
| ---------- | --------------------------------------------------- |
| **QS/FWD** | OpenAPI, SHACL, BPMN, OPA policies, CloudEvents     |
| **UE/FE**  | SDK interfaces, EPCIS/WMS/TMS connectors, workers   |
| **CB/QB**  | Conformance tests, UTCS manifests (with hashes)     |

## Key Design Principles

1. **Data Sovereignty**: Never move bulk data; exchange metadata/links only
2. **Open Standards**: No proprietary formats; OSLC/EPCIS/BPMN/OpenAPI/CloudEvents
3. **IaC Reproducibility**: Terraform + Helm/Kustomize + GitOps
4. **Zero-Trust**: OIDC + SPIFFE/SPIRE + mTLS + OPA by default
5. **No Secrets in Repo**: Use External Secrets Operator / Vault

## Testing & Validation

```bash
# Run conformance tests
cd CB-QB/conformance-kit
pytest test_conformance.py -v

# Validate OpenAPI
npx @stoplight/spectral-cli lint QS-FWD/openapi/caha-api.yaml

# Validate Terraform
terraform -chdir=INFRA/terraform/envs/dev validate

# Validate Kubernetes manifests
kubectl apply --dry-run=client -k INFRA/kubernetes/overlays/dev
```

## Security

- **Threat Model**: See `SECURITY/threat-model/STRIDE-analysis.md`
- **Authentication**: OIDC (users), SPIFFE/SPIRE (workloads)
- **Authorization**: OPA/Rego ABAC with classification labels
- **Encryption**: TLS 1.3 (transit), AES-256 (rest)
- **Auditing**: Immutable logs, DLT anchoring for critical evidence

## Contributing

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for contribution guidelines.

All contributions MUST:
- Follow PCS-A v0.1 standards
- Include UTCS headers
- Update manifests with SHA-256 hashes
- Pass conformance tests
- Include no secrets

## License

Apache-2.0. See [LICENSE](../../LICENSE).

---

**Maintained by**: INFRANET-RETAIL-LOGISTICS Team  
**Last Updated**: 2025-02-01  
**PCS-A Version**: 0.1.0
