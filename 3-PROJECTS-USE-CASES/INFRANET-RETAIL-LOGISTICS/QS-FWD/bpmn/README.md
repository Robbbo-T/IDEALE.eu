# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# BPMN Workflows

This directory contains BPMN 2.0 workflow definitions for the INFRANET-RETAIL-LOGISTICS platform.

## Purpose

BPMN workflows orchestrate:
- **Order fulfillment**: Order-to-cash process
- **Shipment management**: Create, track, deliver shipments
- **Returns processing**: Handle customer returns
- **Evidence anchoring**: DLT integration for critical events

## Files

- **order-to-cash.bpmn** - Complete order fulfillment workflow

## Workflow Overview

### Order-to-Cash Flow

```
Start → Validate Order → Check Inventory → Pick Items 
  → Pack Items → Create Shipment → Anchor Evidence → Complete Order → End
  
Alternative paths:
  → Invalid Order → Reject Order → End
  → No Stock → Handle Backorder → End
```

## BPMN Elements

### Service Tasks

Automated tasks executed by connectors:
- **validate-order**: Check order validity (OPA policy)
- **check-inventory**: Query WMS for stock availability
- **pick-items**: Execute picking process (emit EPCIS event)
- **pack-items**: Execute packing process (emit EPCIS event)
- **create-shipment**: Create shipment record (TMS connector)
- **anchor-evidence**: Anchor evidence to DLT (optional)

### User Tasks

Manual tasks requiring human approval:
- **handle-backorder**: Decide on backorder strategy

### Gateways

Decision points:
- **Order Valid?**: Routes to inventory check or rejection
- **Stock Available?**: Routes to picking or backorder

## Task Configuration

Each service task includes Zeebe/Flowable headers:

```xml
<zeebe:taskHeaders>
  <zeebe:header key="utcsPrefix" value="UTCS-MI:RLG:ORD" />
  <zeebe:header key="opaPolicy" value="pcs_a.authz.order.validate" />
  <zeebe:header key="connector" value="wms-adapter" />
  <zeebe:header key="bizStep" value="picking" />
  <zeebe:header key="emitEpcis" value="true" />
</zeebe:taskHeaders>
```

## Deployment

### Zeebe

```bash
# Deploy workflow
zbctl deploy order-to-cash.bpmn

# List deployed workflows
zbctl list workflows

# Start workflow instance
zbctl create instance order-to-cash \
  --variables '{"orderId": "ORDER-12345", "customerId": "CUST-001"}'
```

### Flowable

```bash
# Deploy via REST API
curl -X POST http://flowable:8080/flowable-rest/service/repository/deployments \
  -F "file=@order-to-cash.bpmn"

# Start process instance
curl -X POST http://flowable:8080/flowable-rest/service/runtime/process-instances \
  -H "Content-Type: application/json" \
  -d '{
    "processDefinitionKey": "order-to-cash",
    "variables": [
      {"name": "orderId", "value": "ORDER-12345"}
    ]
  }'
```

## Variables

### Input Variables

```json
{
  "orderId": "ORDER-12345",
  "orderNumber": "ORD-2025-001",
  "customerId": "CUST-001",
  "items": [
    {"sku": "PROD-001", "quantity": 5}
  ],
  "shippingAddress": {
    "street": "123 Main St",
    "city": "Seattle",
    "state": "WA",
    "zip": "98101"
  }
}
```

### Process Variables (set during execution)

```json
{
  "orderValid": true,
  "stockAvailable": true,
  "shipmentId": "SHIPMENT-XYZ",
  "trackingNumber": "1Z999AA10123456784",
  "epcisEventIds": ["urn:uuid:..."],
  "dltTransactionId": "tx-abc123..."
}
```

## Task Workers

### Python Worker Example

```python
from pyzeebe import ZeebeWorker, Job

@worker.task(task_type="validate-order")
async def validate_order(job: Job):
    order_id = job.variables["orderId"]
    
    # Validate order logic
    is_valid = check_order_validity(order_id)
    
    # Check OPA policy
    opa_allowed = check_opa_policy(
        action="validate",
        resource={"type": "order", "id": order_id},
        subject=job.custom_headers["subject"]
    )
    
    return {
        "orderValid": is_valid and opa_allowed
    }

@worker.task(task_type="check-inventory")
async def check_inventory(job: Job):
    items = job.variables["items"]
    
    # Query WMS connector
    stock_available = wms_connector.check_inventory(items)
    
    return {
        "stockAvailable": stock_available
    }
```

## Monitoring

### Zeebe Operate

```bash
# Access Zeebe Operate UI
kubectl port-forward -n pcs-a svc/zeebe-operate 8080:80
open http://localhost:8080
```

### Flowable UI

```bash
# Access Flowable UI
kubectl port-forward -n pcs-a svc/flowable 8080:8080
open http://localhost:8080/flowable-ui
```

### Metrics

```bash
# View process instance metrics
curl http://flowable:8080/flowable-rest/service/management/engine

# Active process instances
curl http://flowable:8080/flowable-rest/service/runtime/process-instances
```

## EPCIS Integration

Workflows emit EPCIS events at key steps:

### Picking Event (ObjectEvent)

```json
{
  "eventType": "ObjectEvent",
  "eventTime": "2025-02-01T12:30:00Z",
  "bizStep": "picking",
  "bizLocation": "urn:epc:id:sgln:0614141.00001.0",
  "epcList": ["urn:epc:id:sgtin:0614141.107346.2017"],
  "utcsId": "UTCS-MI:RLG:PICK:10-20:PICK-001:rev[A]"
}
```

### Shipping Event

```json
{
  "eventType": "ObjectEvent",
  "eventTime": "2025-02-01T14:00:00Z",
  "bizStep": "shipping",
  "bizLocation": "urn:epc:id:sgln:0614141.00001.0",
  "epcList": ["urn:epc:id:sgtin:0614141.107346.2017"],
  "disposition": "in_transit",
  "utcsId": "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]"
}
```

## CloudEvents

Workflows emit CloudEvents for state changes:

```json
{
  "specversion": "1.0",
  "type": "com.pcs-a.order.completed",
  "source": "urn:spiffe://orgA/mopc/zeebe",
  "subject": "UTCS-MI:RLG:ORD:10-20:ORDER-12345:rev[A]",
  "time": "2025-02-01T15:00:00Z",
  "data": {
    "orderId": "ORDER-12345",
    "status": "COMPLETED",
    "shipmentId": "SHIPMENT-XYZ",
    "completedAt": "2025-02-01T15:00:00Z"
  }
}
```

## Error Handling

### Retry Strategy

```xml
<zeebe:taskDefinition type="check-inventory" retries="3" />
```

### Escalation

If tasks fail after retries, escalate to human operator:
```xml
<bpmn:errorEventDefinition errorRef="Error_InventoryUnavailable" />
```

## Testing

### Unit Tests

Test workflow logic with mock data:
```bash
# Validate BPMN
bpmn-js validate order-to-cash.bpmn

# Simulate execution
zeebe-simple-monitor test order-to-cash
```

### Integration Tests

See `CB-QB/conformance-kit/test_conformance.py::TestBpmnConformance`

## Versioning

Workflows are versioned:
```xml
<bpmn:process id="order-to-cash" name="Order to Cash Flow" 
              versionTag="1.0.0" isExecutable="true">
```

Deploy new versions without breaking running instances.

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
