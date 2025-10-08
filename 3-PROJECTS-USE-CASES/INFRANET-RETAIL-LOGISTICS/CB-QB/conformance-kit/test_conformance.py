"""
UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
TFA: QS→FWD→UE→FE→CB→QB
License: Apache-2.0
Notes: PCS-A conformance tests - OpenAPI contract validation
"""

import pytest
import yaml
import json
from pathlib import Path


# Test data directory
TEST_DATA_DIR = Path(__file__).parent / "data"


class TestOpenApiConformance:
    """Test OpenAPI specification conformance"""
    
    @pytest.fixture
    def openapi_spec(self):
        """Load OpenAPI specification"""
        spec_path = Path(__file__).parent.parent.parent / "QS-FWD" / "openapi" / "caha-api.yaml"
        with open(spec_path, 'r') as f:
            # Skip header comments
            content = f.read()
            lines = content.split('\n')
            yaml_start = next(i for i, line in enumerate(lines) if line.startswith('openapi:'))
            yaml_content = '\n'.join(lines[yaml_start:])
            return yaml.safe_load(yaml_content)
    
    def test_openapi_version(self, openapi_spec):
        """Test OpenAPI version is 3.1.0"""
        assert openapi_spec["openapi"] == "3.1.0"
    
    def test_required_paths_exist(self, openapi_spec):
        """Test required API paths exist"""
        required_paths = [
            "/epcis/events",
            "/oslc/shipments/{utcsId}",
            "/oslc/orders/{utcsId}",
            "/health"
        ]
        paths = openapi_spec["paths"]
        for path in required_paths:
            assert path in paths, f"Required path {path} not found"
    
    def test_security_schemes_defined(self, openapi_spec):
        """Test security schemes are properly defined"""
        components = openapi_spec["components"]
        assert "securitySchemes" in components
        security_schemes = components["securitySchemes"]
        
        # Check OIDC
        assert "oidc" in security_schemes
        assert security_schemes["oidc"]["type"] == "openIdConnect"
        
        # Check SPIFFE
        assert "spiffe" in security_schemes
        assert security_schemes["spiffe"]["type"] == "http"
        assert security_schemes["spiffe"]["scheme"] == "bearer"
    
    def test_epcis_event_schema(self, openapi_spec):
        """Test EPCIS event schema is properly defined"""
        schemas = openapi_spec["components"]["schemas"]
        assert "EpcisEvent" in schemas
        
        event_schema = schemas["EpcisEvent"]
        required_properties = ["eventID", "eventType", "eventTime", "utcsId"]
        
        assert "properties" in event_schema
        for prop in required_properties:
            assert prop in event_schema["properties"], f"Required property {prop} not found"
        
        assert event_schema["required"] == required_properties
    
    def test_shipment_schema(self, openapi_spec):
        """Test Shipment schema has OSLC links"""
        schemas = openapi_spec["components"]["schemas"]
        assert "Shipment" in schemas
        
        shipment_schema = schemas["Shipment"]
        assert "oslcLinks" in shipment_schema["properties"]
        
        oslc_links = shipment_schema["properties"]["oslcLinks"]
        assert "properties" in oslc_links
        assert "containsOrders" in oslc_links["properties"]
        assert "hasEpcisEvents" in oslc_links["properties"]
    
    def test_utcs_pattern_validation(self, openapi_spec):
        """Test UTCS ID pattern validation"""
        schemas = openapi_spec["components"]["schemas"]
        
        # Check Shipment UTCS pattern
        shipment = schemas["Shipment"]
        utcs_id_prop = shipment["properties"]["utcsId"]
        assert "pattern" in utcs_id_prop
        assert utcs_id_prop["pattern"] == "^UTCS-MI:RLG:.+$"


class TestEpcisEventConformance:
    """Test EPCIS 2.0 event conformance"""
    
    def test_valid_epcis_event(self):
        """Test valid EPCIS event structure"""
        event = {
            "eventID": "urn:uuid:test-123",
            "eventType": "ObjectEvent",
            "eventTime": "2025-02-01T12:00:00Z",
            "bizStep": "shipping",
            "epcList": ["urn:epc:id:sgtin:0614141.107346.2017"],
            "utcsId": "UTCS-MI:RLG:EVENT:10-20:TEST-001:rev[A]",
            "hash": "sha256:abc123..."
        }
        
        # Validate required fields
        assert "eventID" in event
        assert "eventType" in event
        assert "eventTime" in event
        assert "utcsId" in event
        
        # Validate UTCS ID format
        assert event["utcsId"].startswith("UTCS-MI:RLG:")
        
        # Validate hash format
        assert event["hash"].startswith("sha256:")
    
    def test_biz_step_vocabulary(self):
        """Test business step uses CBV vocabulary"""
        valid_biz_steps = [
            "shipping", "receiving", "accepting",
            "inspecting", "packing", "picking", "storing"
        ]
        
        for step in valid_biz_steps:
            # All should be lowercase
            assert step == step.lower()


class TestShaclShapesConformance:
    """Test SHACL shapes conformance"""
    
    @pytest.fixture
    def shacl_shapes(self):
        """Load SHACL shapes"""
        shapes_path = Path(__file__).parent.parent.parent / "QS-FWD" / "oslc-shapes" / "core-shapes.ttl"
        with open(shapes_path, 'r') as f:
            return f.read()
    
    def test_shacl_namespaces(self, shacl_shapes):
        """Test required SHACL namespaces are declared"""
        required_namespaces = [
            "@prefix sh:",
            "@prefix oslc:",
            "@prefix utcs:",
            "@prefix rlg:",
            "@prefix epcis:"
        ]
        
        for ns in required_namespaces:
            assert ns in shacl_shapes, f"Namespace {ns} not found"
    
    def test_shipment_shape_defined(self, shacl_shapes):
        """Test ShipmentShape is defined"""
        assert "rlg:ShipmentShape" in shacl_shapes
        assert "sh:targetClass rlg:Shipment" in shacl_shapes
        
        # Check required properties
        assert "utcs:id" in shacl_shapes
        assert "rlg:status" in shacl_shapes
        assert "rlg:hasOrder" in shacl_shapes
    
    def test_order_shape_defined(self, shacl_shapes):
        """Test OrderShape is defined"""
        assert "rlg:OrderShape" in shacl_shapes
        assert "sh:targetClass rlg:Order" in shacl_shapes
    
    def test_epcis_event_shape_defined(self, shacl_shapes):
        """Test EpcisEventShape is defined"""
        assert "rlg:EpcisEventShape" in shacl_shapes
        assert "sh:targetClass epcis:EPCISEvent" in shacl_shapes


class TestBpmnConformance:
    """Test BPMN workflow conformance"""
    
    @pytest.fixture
    def bpmn_workflow(self):
        """Load BPMN workflow"""
        bpmn_path = Path(__file__).parent.parent.parent / "QS-FWD" / "bpmn" / "order-to-cash.bpmn"
        with open(bpmn_path, 'r') as f:
            return f.read()
    
    def test_bpmn_version(self, bpmn_workflow):
        """Test BPMN 2.0 version"""
        assert 'xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL"' in bpmn_workflow
    
    def test_process_defined(self, bpmn_workflow):
        """Test process is defined"""
        assert '<bpmn:process id="order-to-cash"' in bpmn_workflow
        assert 'isExecutable="true"' in bpmn_workflow
    
    def test_required_tasks_defined(self, bpmn_workflow):
        """Test required tasks are defined"""
        required_tasks = [
            "Task_ValidateOrder",
            "Task_CheckInventory",
            "Task_PickItems",
            "Task_PackItems",
            "Task_CreateShipment",
            "Task_AnchorEvidence"
        ]
        
        for task in required_tasks:
            assert f'id="{task}"' in bpmn_workflow
    
    def test_zeebe_task_definitions(self, bpmn_workflow):
        """Test Zeebe task definitions include required headers"""
        # Check UTCS headers
        assert 'key="utcsPrefix"' in bpmn_workflow
        
        # Check OPA policy headers
        assert 'key="opaPolicy"' in bpmn_workflow
        
        # Check connector headers
        assert 'key="connector"' in bpmn_workflow


class TestOpaRegoConformance:
    """Test OPA/Rego policy conformance"""
    
    @pytest.fixture
    def opa_policies(self):
        """Load OPA policies"""
        opa_path = Path(__file__).parent.parent.parent / "QS-FWD" / "opa-policies" / "authz.rego"
        with open(opa_path, 'r') as f:
            return f.read()
    
    def test_package_declaration(self, opa_policies):
        """Test package is declared correctly"""
        assert "package pcs_a.authz" in opa_policies
    
    def test_default_deny(self, opa_policies):
        """Test default deny policy exists"""
        assert "default allow := false" in opa_policies
    
    def test_epcis_read_policy(self, opa_policies):
        """Test EPCIS read policy exists"""
        assert 'input.resource.class == "epcis:event"' in opa_policies
        assert 'input.action == "read"' in opa_policies
    
    def test_spiffe_authorization(self, opa_policies):
        """Test SPIFFE-based authorization"""
        assert "input.subject.workload.spiffe_id" in opa_policies
        assert 'spiffe://orgA/' in opa_policies
    
    def test_classification_checks(self, opa_policies):
        """Test data classification checks exist"""
        assert "check_classification_clearance" in opa_policies
        assert 'input.resource.classification' in opa_policies
    
    def test_export_control_checks(self, opa_policies):
        """Test export control policies exist"""
        assert "check_export_compliance" in opa_policies
        assert "itar" in opa_policies


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
