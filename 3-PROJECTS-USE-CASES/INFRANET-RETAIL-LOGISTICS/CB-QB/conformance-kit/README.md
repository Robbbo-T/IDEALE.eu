# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0
# Notes: README for conformance test kit

# Conformance Kit — INFRANET-RETAIL-LOGISTICS

This directory contains conformance tests for validating PCS-A v0.1 compliance.

## Test Coverage

### 1. OpenAPI Conformance (`test_conformance.py::TestOpenApiConformance`)

- ✅ OpenAPI version 3.1.0
- ✅ Required paths exist (`/epcis/events`, `/oslc/shipments`, etc.)
- ✅ Security schemes defined (OIDC, SPIFFE)
- ✅ EPCIS event schema validation
- ✅ Shipment schema with OSLC links
- ✅ UTCS ID pattern validation

### 2. EPCIS Event Conformance (`test_conformance.py::TestEpcisEventConformance`)

- ✅ Valid EPCIS 2.0 event structure
- ✅ Business step vocabulary (CBV)
- ✅ Required fields (eventID, eventType, eventTime, utcsId)
- ✅ Hash format validation

### 3. SHACL Shapes Conformance (`test_conformance.py::TestShaclShapesConformance`)

- ✅ Required namespaces declared
- ✅ ShipmentShape defined with constraints
- ✅ OrderShape defined
- ✅ EpcisEventShape defined

### 4. BPMN Workflow Conformance (`test_conformance.py::TestBpmnConformance`)

- ✅ BPMN 2.0 version
- ✅ Process is executable
- ✅ Required tasks defined (ValidateOrder, CheckInventory, etc.)
- ✅ Zeebe task definitions with UTCS/OPA headers

### 5. OPA Policy Conformance (`test_conformance.py::TestOpaRegoConformance`)

- ✅ Package declaration
- ✅ Default deny policy
- ✅ EPCIS read authorization
- ✅ SPIFFE-based authorization
- ✅ Data classification checks
- ✅ Export control policies

## Running Tests

### Prerequisites

```bash
pip install pytest pyyaml jsonschema
```

### Run All Tests

```bash
cd CB-QB/conformance-kit
pytest test_conformance.py -v
```

### Run Specific Test Class

```bash
pytest test_conformance.py::TestOpenApiConformance -v
```

### Generate Test Report

```bash
pytest test_conformance.py --html=report.html --self-contained-html
```

## Conformance Levels

### Bronze (Read-Only)

**Requirements:**
- ✅ OpenAPI 3.1.0 compliant API
- ✅ SHACL shapes for OSLC resources
- ✅ Read-only EPCIS 2.0 queries
- ✅ UTCS ID anchors on all resources

**Tests:** All `TestOpenApiConformance` and `TestShaclShapesConformance` must pass.

### Silver (BPMN + OPA)

**Requirements:**
- ✅ All Bronze requirements
- ✅ BPMN 2.0 workflows
- ✅ OPA/Rego ABAC policies
- ✅ CloudEvents 1.0 emission

**Tests:** All Bronze tests + `TestBpmnConformance` and `TestOpaRegoConformance` must pass.

### Gold (DLT + VC/TEE)

**Requirements:**
- ✅ All Silver requirements
- ✅ DLT evidence anchoring
- ✅ W3C Verifiable Credentials (optional)
- ✅ TEE for confidential compute (optional)

**Tests:** All Silver tests + DLT integration tests (not yet implemented).

## Integration Tests (Future)

- [ ] End-to-end SPARQL query (< 5s)
- [ ] EPCIS event emission and query
- [ ] BPMN workflow execution
- [ ] OPA policy enforcement
- [ ] DLT evidence anchoring
- [ ] CloudEvents publish/subscribe

## CI/CD Integration

Add to GitHub Actions / GitLab CI:

```yaml
- name: Run conformance tests
  run: |
    cd 3-PROJECTS-USE-CASES/INFRANET-RETAIL-LOGISTICS/CB-QB/conformance-kit
    pytest test_conformance.py -v --junitxml=junit.xml
```

## Contract Testing

These tests serve as **contract tests** between:
- API consumers ↔ CAHA API
- NDFA ↔ SHACL shapes
- MOPC ↔ BPMN workflows
- Services ↔ OPA policies

Breaking changes to these contracts require version bumps and migration plans.

---

**Maintained by**: INFRANET-RETAIL-LOGISTICS Team  
**Last Updated**: 2025-02-01
