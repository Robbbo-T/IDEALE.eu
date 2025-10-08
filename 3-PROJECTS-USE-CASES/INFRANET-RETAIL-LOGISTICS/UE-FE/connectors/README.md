# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Connectors

This directory contains concrete implementations of CAHA SDK connectors for various systems.

## Purpose

Connectors provide:
- **System integration**: Connect to EPCIS, WMS, TMS, IoT, DLT systems
- **Protocol adaptation**: Translate between PCS-A APIs and legacy systems
- **Data transformation**: Convert proprietary formats to OSLC/EPCIS standards
- **UTCS anchoring**: Add traceability identifiers to all resources

## Files

- **epcis2_connector.py** - GS1 EPCIS 2.0 connector implementation

## Connector Types

### EPCIS 2.0 Connector

Connects to GS1 EPCIS 2.0 repositories:
- Query events by EPC, bizStep, location, time
- Emit new events (ObjectEvent, AggregationEvent, etc.)
- UTCS anchoring on all events
- SHA-256 content hashing

### WMS Connector (Future)

Integrates with Warehouse Management Systems:
- Check inventory availability
- Reserve stock for orders
- Execute picking/packing workflows
- Emit EPCIS events for operations

### TMS Connector (Future)

Integrates with Transportation Management Systems:
- Create shipments
- Track shipment status
- Update delivery ETA
- Emit shipment CloudEvents

### IoT Connector (Future)

Integrates with IoT devices (MQTT/OPC UA):
- Subscribe to sensor topics
- Read real-time sensor data
- Publish control commands
- Correlate sensor data with shipments

### DLT Connector (Future)

Integrates with DLT networks (Fabric/Besu):
- Anchor evidence hashes
- Query anchored evidence
- Verify integrity
- Sign transactions

## Usage

### EPCIS 2.0 Connector

```python
from epcis2_connector import Epcis2Connector
from interfaces import BizStep

# Configure
config = {
    "base_url": "https://epcis.example.com/api",
    "api_key": "...",  # From External Secrets
    "timeout": 30,
    "utcs_prefix": "UTCS-MI:RLG:EPCIS"
}

# Create connector
connector = Epcis2Connector(config)

# Connect
if connector.connect():
    # Query events
    events = connector.query_events(
        biz_step=BizStep.SHIPPING,
        limit=10
    )
    
    for event in events:
        print(f"Event: {event.event_id}")
        print(f"  UTCS: {event.utcs_id}")
        print(f"  Time: {event.event_time}")
        print(f"  BizStep: {event.biz_step.value}")
        print(f"  EPCs: {event.epc_list}")
    
    # Disconnect
    connector.disconnect()
```

### Emit EPCIS Event

```python
from uuid import uuid4
from datetime import datetime

# Create event
event = EpcisEvent(
    event_id=f"urn:uuid:{uuid4()}",
    event_type="ObjectEvent",
    event_time=datetime.utcnow(),
    biz_step=BizStep.PICKING,
    biz_location="urn:epc:id:sgln:0614141.00001.0",
    epc_list=["urn:epc:id:sgtin:0614141.107346.2017"],
    utcs_id="UTCS-MI:RLG:PICK:10-20:PICK-001:rev[A]",
    content_hash="sha256:..."
)

# Emit
event_id = connector.emit_event(event)
print(f"Emitted event: {event_id}")
```

## Configuration

### Environment Variables

```bash
# EPCIS Repository
EPCIS_BASE_URL=https://epcis.example.com/api
EPCIS_API_KEY=<from-vault>
EPCIS_TIMEOUT=30

# WMS (future)
WMS_BASE_URL=https://wms.example.com/api
WMS_API_KEY=<from-vault>

# TMS (future)
TMS_BASE_URL=https://tms.example.com/api
TMS_API_KEY=<from-vault>
```

### External Secrets

```yaml
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: connector-secrets
  namespace: pcs-a
spec:
  secretStoreRef:
    name: vault-backend
  target:
    name: connector-secrets
  data:
    - secretKey: epcis-api-key
      remoteRef:
        key: pcs-a/connectors/epcis
        property: api-key
```

## BPMN Integration

Connectors are invoked by BPMN task workers:

```python
from pyzeebe import ZeebeWorker, Job
from epcis2_connector import Epcis2Connector

worker = ZeebeWorker()
connector = Epcis2Connector(config)

@worker.task(task_type="pick-items")
async def pick_items(job: Job):
    order_id = job.variables["orderId"]
    items = job.variables["items"]
    
    # Execute picking (emit EPCIS event)
    event = EpcisEvent(
        event_type="ObjectEvent",
        biz_step=BizStep.PICKING,
        epc_list=[item["epc"] for item in items],
        utcs_id=f"UTCS-MI:RLG:PICK:10-20:{order_id}:rev[A]"
    )
    
    event_id = connector.emit_event(event)
    
    return {"epcisEventId": event_id}
```

## Error Handling

### Retry Strategy

```python
from tenacity import retry, stop_after_attempt, wait_exponential

class ResilientConnector(Epcis2Connector):
    @retry(
        stop=stop_after_attempt(3),
        wait=wait_exponential(multiplier=1, min=2, max=10)
    )
    def query_events(self, **kwargs):
        return super().query_events(**kwargs)
```

### Circuit Breaker

```python
from circuitbreaker import circuit

class CircuitBreakerConnector(Epcis2Connector):
    @circuit(failure_threshold=5, recovery_timeout=60)
    def emit_event(self, event):
        return super().emit_event(event)
```

## Testing

### Unit Tests

```python
import pytest
from epcis2_connector import Epcis2Connector

@pytest.fixture
def connector():
    config = {
        "base_url": "https://test.example.com",
        "api_key": "test-key"
    }
    return Epcis2Connector(config)

def test_query_events(connector, requests_mock):
    # Mock API response
    requests_mock.get(
        "https://test.example.com/events",
        json={"epcisBody": {"eventList": [...]}}
    )
    
    # Query
    events = connector.query_events(limit=1)
    assert len(events) == 1
```

### Integration Tests

```bash
# Run against test EPCIS repository
EPCIS_BASE_URL=https://test-epcis.example.com pytest
```

## Performance

### Caching

```python
from functools import lru_cache

class CachedConnector(Epcis2Connector):
    @lru_cache(maxsize=100)
    def get_metadata(self, resource_id: str):
        return super().get_metadata(resource_id)
```

### Batch Operations

```python
def emit_events_batch(self, events: List[EpcisEvent]):
    # Batch emit for efficiency
    payload = {
        "epcisBody": {
            "eventList": [self._to_epcis_json(e) for e in events]
        }
    }
    response = self.session.post(f"{self.base_url}/capture", json=payload)
    return response.json()
```

## Monitoring

```python
import logging
from prometheus_client import Counter, Histogram

# Metrics
events_queried = Counter('epcis_events_queried_total', 'Total EPCIS events queried')
query_duration = Histogram('epcis_query_duration_seconds', 'EPCIS query duration')

@query_duration.time()
def query_events(self, **kwargs):
    events = super().query_events(**kwargs)
    events_queried.inc(len(events))
    return events
```

## Security

- **API keys**: Never in code; use External Secrets
- **TLS**: Verify certificates (don't disable verification)
- **Timeouts**: Prevent hanging connections
- **Rate limiting**: Respect upstream API limits

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
