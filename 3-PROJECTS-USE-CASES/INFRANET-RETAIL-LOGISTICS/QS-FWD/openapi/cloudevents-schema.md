# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0
# Notes: CloudEvents 1.0 schema definitions for PCS-A

# CloudEvents Schemas — INFRANET-RETAIL-LOGISTICS

This document defines CloudEvents 1.0 schemas for state changes in the retail logistics platform.

## Base CloudEvent Structure

All events MUST conform to CloudEvents 1.0 specification.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.{domain}.{action}",
  "source": "urn:spiffe://{org}/connector/{system}",
  "subject": "{UTCS_ID}",
  "id": "{UUID}",
  "time": "{ISO_8601_TIMESTAMP}",
  "datacontenttype": "application/json",
  "data": {}
}
```

## Event Types

### 1. Order Events

#### com.pcs-a.order.created

Emitted when a new order is created.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.order.created",
  "source": "urn:spiffe://retailer-a/connector/oms",
  "subject": "UTCS-MI:RLG:ORD:10-20:ORDER-12345:rev[A]",
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "time": "2025-02-01T12:00:00Z",
  "datacontenttype": "application/json",
  "data": {
    "orderNumber": "ORDER-12345",
    "customer": "urn:customer:cust-001",
    "status": "PENDING",
    "itemCount": 5,
    "hash": "sha256:abc123..."
  }
}
```

#### com.pcs-a.order.confirmed

Emitted when order is confirmed after validation.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.order.confirmed",
  "source": "urn:spiffe://retailer-a/mopc/validator",
  "subject": "UTCS-MI:RLG:ORD:10-20:ORDER-12345:rev[A]",
  "id": "...",
  "time": "2025-02-01T12:05:00Z",
  "datacontenttype": "application/json",
  "data": {
    "orderNumber": "ORDER-12345",
    "status": "CONFIRMED",
    "validatedBy": "system",
    "inventoryReserved": true
  }
}
```

#### com.pcs-a.order.cancelled

Emitted when order is cancelled.

### 2. Shipment Events

#### com.pcs-a.shipment.created

Emitted when a shipment is created.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.shipment.created",
  "source": "urn:spiffe://warehouse-a/connector/tms",
  "subject": "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]",
  "id": "...",
  "time": "2025-02-01T14:00:00Z",
  "datacontenttype": "application/json",
  "data": {
    "shipmentId": "SHIPMENT-XYZ",
    "trackingNumber": "1Z999AA10123456784",
    "carrier": "UPS",
    "origin": "urn:sgln:warehouse-a",
    "destination": "urn:sgln:warehouse-b",
    "orders": ["UTCS-MI:RLG:ORD:10-20:ORDER-12345:rev[A]"],
    "hash": "sha256:def456..."
  }
}
```

#### com.pcs-a.shipment.updated

Emitted when shipment status changes.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.shipment.updated",
  "source": "urn:spiffe://carrier-ups/connector/tracking",
  "subject": "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]",
  "id": "...",
  "time": "2025-02-01T16:30:00Z",
  "datacontenttype": "application/json",
  "data": {
    "shipmentId": "SHIPMENT-XYZ",
    "status": "IN_TRANSIT",
    "location": "urn:sgln:hub-chicago",
    "eta": "2025-02-02T10:00:00Z",
    "hash": "sha256:ghi789..."
  }
}
```

#### com.pcs-a.shipment.delivered

Emitted when shipment is delivered.

### 3. EPCIS Events

#### com.pcs-a.epcis.object-event

Emitted for GS1 EPCIS ObjectEvent.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.epcis.object-event",
  "source": "urn:spiffe://warehouse-a/connector/epcis",
  "subject": "UTCS-MI:RLG:EPCIS:30-50:EVENT-001:rev[A]",
  "id": "...",
  "time": "2025-02-01T12:30:00Z",
  "datacontenttype": "application/json",
  "data": {
    "eventType": "ObjectEvent",
    "eventID": "urn:uuid:...",
    "bizStep": "picking",
    "bizLocation": "urn:epc:id:sgln:0614141.00001.0",
    "epcList": [
      "urn:epc:id:sgtin:0614141.107346.2017",
      "urn:epc:id:sgtin:0614141.107346.2018"
    ],
    "hash": "sha256:jkl012..."
  }
}
```

### 4. Evidence Events

#### com.pcs-a.evidence.anchored

Emitted when evidence is anchored to DLT.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.evidence.anchored",
  "source": "urn:spiffe://org-a/mopc/anchor",
  "subject": "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]",
  "id": "...",
  "time": "2025-02-01T14:05:00Z",
  "datacontenttype": "application/json",
  "data": {
    "utcsId": "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]",
    "artifactUri": "s3://warehouse-a/shipments/SHIPMENT-XYZ.json",
    "contentHash": "sha256:def456...",
    "dltNetwork": "fabric",
    "transactionId": "tx-abc123...",
    "blockNumber": 12345,
    "signedBy": "did:org-a:svc:mopc"
  }
}
```

### 5. Policy Events

#### com.pcs-a.policy.denied

Emitted when OPA denies an action.

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.policy.denied",
  "source": "urn:spiffe://org-a/ztrust/opa",
  "subject": "N/A",
  "id": "...",
  "time": "2025-02-01T15:00:00Z",
  "datacontenttype": "application/json",
  "data": {
    "decision": "deny",
    "policy": "pcs_a.authz",
    "action": "read",
    "resource": {
      "class": "epcis:event",
      "id": "EVENT-001"
    },
    "subject": {
      "id": "user-123",
      "role": "Partner"
    },
    "reason": "Insufficient clearance for CONFIDENTIAL resource"
  }
}
```

## Event Bus Configuration

Events are published to:
- **NATS JetStream** (recommended for distributed systems)
- **Kafka** (alternative for high-throughput scenarios)
- **Azure Event Grid** (for Azure deployments)
- **AWS EventBridge** (for AWS deployments)

### NATS Subjects

```
pcs-a.order.*
pcs-a.shipment.*
pcs-a.epcis.*
pcs-a.evidence.*
pcs-a.policy.*
```

### Kafka Topics

```
pcs-a-order
pcs-a-shipment
pcs-a-epcis
pcs-a-evidence
pcs-a-policy
```

## Schema Validation

All CloudEvents MUST be validated against:
1. CloudEvents 1.0 JSON Schema
2. Event-specific data payload schema (JSON Schema)

## Security

- Events MUST be signed (JWS) when crossing trust boundaries
- Events containing PII MUST be encrypted (JWE)
- All events MUST include UTCS anchor for traceability

## Examples

See `examples/` directory for:
- Sample events
- Validation scripts
- Event producers/consumers

---

**Specification Version:** 1.0  
**CloudEvents Version:** 1.0  
**Last Updated:** 2025-02-01
