# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# OSLC SHACL Shapes

This directory contains SHACL (Shapes Constraint Language) shapes for validating RDF/OSLC resources in the NDFA.

## Purpose

SHACL shapes enforce:
- **Data quality**: Required properties, data types, cardinality
- **OSLC compliance**: OSLC Core 2.0 resource patterns
- **UTCS anchors**: Canonical identifiers on all resources
- **Semantic validation**: RDF graph constraints

## Files

- **core-shapes.ttl** - Main SHACL shapes (Shipment, Order, EPCIS Event, etc.)

## Shape Overview

### Shipment Shape

Validates shipment resources:
```turtle
rlg:ShipmentShape a sh:NodeShape ;
  sh:targetClass rlg:Shipment ;
  sh:property [
    sh:path utcs:id ;
    sh:pattern "^UTCS-MI:RLG:.+$" ;
    sh:minCount 1
  ] ,
  [
    sh:path rlg:hasOrder ;
    sh:nodeKind sh:IRI ;
    sh:minCount 1
  ] .
```

### Order Shape

Validates order resources with items:
```turtle
rlg:OrderShape a sh:NodeShape ;
  sh:targetClass rlg:Order ;
  sh:property [
    sh:path rlg:orderNumber ;
    sh:datatype xsd:string ;
    sh:minCount 1
  ] .
```

### EPCIS Event Shape

Validates GS1 EPCIS 2.0 events:
```turtle
rlg:EpcisEventShape a sh:NodeShape ;
  sh:targetClass epcis:EPCISEvent ;
  sh:property [
    sh:path epcis:eventTime ;
    sh:datatype xsd:dateTime ;
    sh:minCount 1
  ] .
```

## Validation

### Local Validation

```bash
# Install Apache Jena
brew install jena

# Validate RDF data
shacl validate --shapes core-shapes.ttl --data sample-data.ttl

# Or using Python pySHACL
pip install pyshacl
python -m pyshacl.cli -s core-shapes.ttl sample-data.ttl
```

### Server-side Validation

Fuseki validates on insert/update:
```sparql
INSERT DATA {
  <urn:shipment:001> a rlg:Shipment ;
    utcs:id "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-001:rev[A]" ;
    rlg:hasOrder <urn:order:001> ;
    rlg:status "PENDING" .
}
```

If validation fails, insert is rejected.

## Sample Data

### Valid Shipment

```turtle
@prefix rlg: <https://infranet.example/retail-logistics#> .
@prefix utcs: <https://utcs.example/ns#> .

<urn:shipment:001> a rlg:Shipment ;
  utcs:id "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-001:rev[A]" ;
  rlg:status "IN_TRANSIT" ;
  rlg:carrier "UPS" ;
  rlg:trackingNumber "1Z999AA10123456784" ;
  rlg:hasOrder <urn:order:001> ;
  rlg:hasEpcisEvent <urn:epcis:event:001> ;
  oslc:serviceProvider <https://orgA/oslc/provider> .
```

### Invalid Shipment (missing UTCS ID)

```turtle
<urn:shipment:002> a rlg:Shipment ;
  rlg:status "PENDING" ;
  rlg:hasOrder <urn:order:002> .
```

**Validation error:**
```
Validation Report
Conforms: False
Results (1):
  Constraint Violation in MinCountConstraintComponent:
    Message: Value does not have at least 1 values
    Path: utcs:id
```

## Testing

### Unit Tests

See `CB-QB/conformance-kit/test_conformance.py::TestShaclShapesConformance`

### Integration Tests

```bash
# Load shapes into Fuseki
curl -X POST http://fuseki:3030/infranet/data \
  -H "Content-Type: text/turtle" \
  --data-binary @core-shapes.ttl

# Try invalid insert
curl -X POST http://fuseki:3030/infranet/update \
  -H "Content-Type: application/sparql-update" \
  --data 'INSERT DATA { <urn:invalid> a rlg:Shipment . }'

# Should fail with validation error
```

## Namespaces

```turtle
@prefix sh: <http://www.w3.org/ns/shacl#> .
@prefix oslc: <http://open-services.net/ns/core#> .
@prefix oslc_rm: <http://open-services.net/ns/rm#> .
@prefix oslc_cm: <http://open-services.net/ns/cm#> .
@prefix oslc_qm: <http://open-services.net/ns/qm#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix utcs: <https://utcs.example/ns#> .
@prefix rlg: <https://infranet.example/retail-logistics#> .
@prefix epcis: <https://ns.gs1.org/epcis#> .
```

## Constraint Types

### Property Constraints

- **sh:minCount / sh:maxCount**: Cardinality
- **sh:datatype**: Data type (xsd:string, xsd:integer, etc.)
- **sh:pattern**: Regex pattern
- **sh:nodeKind**: IRI, Literal, BlankNode
- **sh:in**: Enumeration of allowed values

### Node Constraints

- **sh:targetClass**: Apply to instances of class
- **sh:targetNode**: Apply to specific node
- **sh:node**: Nested shape validation

## Extending Shapes

### Add Custom Shape

```turtle
rlg:CustomFieldShape a sh:NodeShape ;
  sh:targetClass rlg:Shipment ;
  sh:property [
    sh:path rlg:customField ;
    sh:datatype xsd:string ;
    sh:maxLength 100
  ] .
```

### Override Shape

```turtle
rlg:StrictShipmentShape a sh:NodeShape ;
  sh:targetClass rlg:Shipment ;
  sh:property [
    sh:path rlg:status ;
    sh:in ( "PENDING" "IN_TRANSIT" "DELIVERED" )  # Strict enum
  ] .
```

## Performance

- **Validation cost**: ~10ms per resource
- **Caching**: Fuseki caches validated shapes
- **Batch validation**: Validate before bulk insert

## Troubleshooting

### Shape Not Applied

1. Check targetClass matches resource type
2. Verify shape loaded into Fuseki
3. Check SHACL engine enabled

### Validation Too Strict

1. Review shape constraints
2. Use sh:severity (Violation, Warning, Info)
3. Add conditional constraints with sh:if

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
