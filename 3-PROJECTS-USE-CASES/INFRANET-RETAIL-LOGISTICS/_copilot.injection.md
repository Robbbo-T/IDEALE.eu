---
UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
TFA: QS→FWD→UE→FE→CB→QB
Units: n.a.
License: Apache-2.0
Notes: PCS-A compliant (OSLC/EPCIS/BPMN/CloudEvents/OpenAPI). No secrets in repo.
---

# INJECTION PROMPT — INFRANET-RETAIL-LOGISTICS

**Copilot role:**
Generate **only** artifacts that comply with **TFA V2 + UTCS** and the **PCS-A open-standards** model for the `INFRANET-RETAIL-LOGISTICS` use case (sovereign, multi-party intranet for retail logistics). Focus on **open standards**, **IaC reproducibility**, **Zero-Trust**, and **anti-vendor-lock-in**.

## 0) Non-negotiable principles

* **Data sovereignty:** never move bulk data; exchange metadata/links only.
* **Open standards (core):** OSLC / RDF / SHACL, BPMN 2.0, CloudEvents 1.0, OpenAPI 3.1.
* **Retail/Logistics standards:** **GS1 EPCIS 2.0 + CBV**, GS1 Digital Link, ISO 8000, **ODRL** for data usage rights.
* **Industrial/IoT (when needed):** OPC UA, MQTT 5.
* **IaC:** Terraform + Helm/Kustomize + GitOps (Argo CD or Flux).
* **Zero-Trust:** OIDC, SPIFFE/SPIRE, mTLS, OPA/Rego (ABAC).
* **Canonical TFA flow:** `QS → FWD → UE → FE → CB → QB`.
* **UTCS discipline:** canonical IDs + manifests with **SHA-256 (base64)** hashes.
* **No secrets in repo** (use External Secrets / Vault).

## 1) Repository structure (for this path)

```
3-PROJECTS-USE-CASES/INFRANET-RETAIL-LOGISTICS/
  README.md
  _copilot.injection.md
  QS-FWD/
    oslc-shapes/            # SHACL shapes (orders, shipments, events)
    openapi/                # CAHA OpenAPI (EPCIS/OSLC facades)
    bpmn/                   # BPMN: order-to-cash, ship/receive, returns
    opa-policies/           # Rego ABAC (roles, lanes, export control)
  UE-FE/
    caha-sdk/               # SDK interfaces (Python/Go)
    connectors/             # EPCIS 2.0, WMS/TMS, IoT (MQTT/OPC UA) adapters
  CB-QB/
    conformance-kit/        # contract tests (OpenAPI/SHACL/EPCIS)
    manifests/              # UTCS manifests with hashes
  INFRA/
    terraform/
      modules/              # network, k8s, dlt (optional)
      envs/                 # dev/stage/prod
    kubernetes/
      base/                 # fuseki, keycloak, opa, spire, nats/kafka, epcis-svc
      overlays/             # dev/stage/prod
    gitops/
      argo/                 # Argo CD apps
  SECURITY/
    threat-model/           # STRIDE/LINDDUN docs
    policies/               # security/regulatory policies
```

## 2) File headers (all files must start with)

```
UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
TFA: QS→FWD→UE→FE→CB→QB
Units: n.a. (or mm if applicable)
License: Apache-2.0
Notes: PCS-A compliant (OSLC/EPCIS/BPMN/CloudEvents/OpenAPI). No secrets in repo.
```

## 3) Templates Copilot MUST follow

### 3.1 OpenAPI (CAHA façade over EPCIS/OSLC)

```yaml
openapi: 3.1.0
info: { title: PCS-A CAHA API — INFRANET-RETAIL-LOGISTICS, version: 0.1.0 }
paths:
  /v1/epcis/events:
    get:
      summary: Query EPCIS 2.0 events (read-only, federated)
      parameters:
        - in: query; name: epc; schema: { type: string }    # GS1 Digital Link URI
        - in: query; name: bizStep; schema: { type: string } # CBV
      responses:
        "200":
          content:
            application/json:
              schema:
                type: object
                properties: { events: { type: array, items: { type: object } } }
  /v1/oslc/shipments/{utcsId}:
    get:
      summary: Get shipment metadata (OSLC summary)
      parameters: [{ in: path, name: utcsId, required: true, schema: { type: string }}]
      responses:
        "200":
          content:
            application/json:
              schema:
                type: object
                properties:
                  utcsId: { type: string }
                  oslcLinks:
                    type: object
                    properties:
                      containsOrders: { type: array, items: { type: string, format: uri } }
```

### 3.2 SHACL (NDFA core shapes — excerpt)

```turtle
@prefix sh: <http://www.w3.org/ns/shacl#>.
@prefix oslc: <http://open-services.net/ns/core#>.
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>.
@prefix utcs: <https://utcs.example/ns#>.
@prefix rlg: <https://infranet.example/retail-logistics#>.

rlg:ShipmentShape a sh:NodeShape ;
  sh:targetClass rlg:Shipment ;
  sh:property [
    sh:path utcs:id ; sh:datatype xsd:string ; sh:pattern "^UTCS-.+$" ; sh:minCount 1
  ],[
    sh:path rlg:hasOrder ; sh:nodeKind sh:IRI ; sh:minCount 1
  ],[
    sh:path rlg:hasEpcisEvent ; sh:nodeKind sh:IRI
  ] .
```

### 3.3 OPA/Rego (ABAC example)

```rego
package pcs_a.authz
default allow = false

allow {  # read-only EPCIS queries for operators & auditors
  input.action == "read"
  input.resource.class == "epcis:event"
  input.subject.role in {"Operator","Auditor"}
}

allow {  # run BPMN task if workload is authorized via SPIFFE ID
  input.action == "execute_task"
  input.task == "ShipConfirm"
  input.subject.workload.spiffe_id == "spiffe://orgA/mopc/ship"
}
```

### 3.4 CloudEvents (state changes)

```json
{
  "specversion":"1.0",
  "type":"com.pcs-a.shipment.updated",
  "source":"urn:spiffe://{org}/connector/wms",
  "subject":"UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]",
  "time":"${ISO_8601}",
  "datacontenttype":"application/json",
  "data":{ "hash":"sha256:...", "status":"IN_TRANSIT", "epcisRefs":["https://..."] }
}
```

### 3.5 Terraform (k8s module sketch)

```hcl
module "k8s" {
  source       = "../modules/k8s"
  cluster_name = "pcs-a-infranet-rlg"
  tags         = { system="pcs-a", use_case="infranet-rlg", env=var.env }
}
```

### 3.6 Argo CD App (GitOps)

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata: { name: pcs-a-infranet-rlg-dev, namespace: argocd }
spec:
  project: default
  source:
    repoURL: https://{git}/pcs-a.git
    targetRevision: main
    path: 3-PROJECTS-USE-CASES/INFRANET-RETAIL-LOGISTICS/INFRA/kubernetes/overlays/dev
  destination: { server: https://kubernetes.default.svc, namespace: pcs-a }
  syncPolicy: { automated: { prune: true, selfHeal: true } }
```

## 4) Generation rules

**DO**

* Use only open standards (OSLC/EPCIS/BPMN/OpenAPI/CloudEvents/OPA).
* Include UTCS headers; emit **UTCS manifests** with `artifacts_sha256_b64`.
* Provide basic conformance tests (OpenAPI/SHACL/EPCIS JSON schemas).
* Keep IaC reproducible (Terraform + Helm + Kustomize) and GitOps-ready.

**DON'T**

* Don't include secrets; use External Secrets / Vault.
* Don't move raw operational data; use links/URIs.
* Don't deviate from TFA flow or UTCS naming.

## 5) TFA mapping for Copilot

| Stage      | Expected output                                   |
| ---------- | ------------------------------------------------- |
| **QS/FWD** | OpenAPI (CAHA), SHACL (NDFA), BPMN, OPA policies  |
| **UE/FE**  | SDK interfaces, EPCIS/WMS/TMS connectors, workers |
| **CB/QB**  | Conformance tests, UTCS manifests (with hashes)   |

## 6) Commit / PR policy

**Commit message:**

```
feat(infranet-rlg): {summary}  UTCS:{ID}  TFA:{STAGE}

- {key changes}
- {impact}
```

**PR checklist:**

* [ ] PCS-A v0.1 conformant (OSLC/EPCIS/BPMN/OpenAPI/OPA).
* [ ] UTCS header + manifest with hashes present.
* [ ] Lint passes (OpenAPI/SHACL/Rego/Terraform/Helm).
* [ ] No secrets in code.
* [ ] README and minimal docs included.

## 7) README seed (for this folder)

```md
# INFRANET — Retail & Logistics (PCS-A Use Case)
UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
TFA: QS→FWD→UE→FE→CB→QB

## Objective
Sovereign, multi-organization retail-logistics intranet fully defined as IaC.

## Components
- NDFA (RDF/OSLC, SHACL, SPARQL)
- CAHA (OpenAPI/CloudEvents, EPCIS 2.0 façade)
- MOPC (BPMN, OPA; optional DLT)
- Zero-Trust (OIDC, SPIFFE/SPIRE, mTLS)

## Quick start
1) `terraform -chdir=INFRA/terraform/envs/dev apply`
2) Argo CD sync `INFRA/gitops/argo/apps-dev.yaml`
3) Query SPARQL / EPCIS façade / OSLC endpoints
```

## 8) UTCS manifest template

```json
{
  "utcs_id": "UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]",
  "generated_utc": "${ISO_8601}",
  "units": "n/a",
  "artifacts": { "openapi": "QS-FWD/openapi/caha.yaml" },
  "artifacts_sha256_b64": { "openapi": "${SHA256_B64}" },
  "assumptions": ["Open standards only", "No secrets in repo"]
}
```

## 9) Quality gates

* Run: `spectral lint`, `shacl-validate`, `conftest`, `terraform validate`, `helm lint`.
* Fail CI if: no UTCS hash, secret detected, or schema non-conformant.

**End of INJECTION PROMPT — INFRANET-RETAIL-LOGISTICS**
Copilot must obey these rules strictly and **never** suggest content that violates them.
