# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# CAHA SDK

This directory contains the Python SDK with abstract interfaces for PCS-A CAHA (Common Abstraction & Harmonization API) connectors.

## Purpose

The SDK provides:
- **Abstract interfaces**: Base classes for connectors
- **Type definitions**: Data models for EPCIS, OSLC, CloudEvents
- **Plug-in architecture**: Easy integration of new systems
- **Standard protocols**: EPCIS 2.0, OSLC Core 2.0, CloudEvents 1.0

## Files

- **interfaces.py** - Abstract base classes and data models

## Architecture

```
┌─────────────────────────────────────────────┐
│           CAHA API Gateway                  │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│        Connector Interfaces (SDK)           │
│  - EpcisConnector                           │
│  - WmsConnector                             │
│  - TmsConnector                             │
│  - IoTConnector                             │
│  - DltConnector                             │
└──────────────────┬──────────────────────────┘
                   │
      ┌────────────┼────────────┐
      ▼            ▼            ▼
┌──────────┐ ┌──────────┐ ┌──────────┐
│EPCIS 2.0 │ │  WMS     │ │  TMS     │
│Repository│ │ System   │ │ System   │
└──────────┘ └──────────┘ └──────────┘
```

## Interfaces

### ConnectorInterface (Base)

All connectors implement:
```python
class ConnectorInterface(ABC):
    @abstractmethod
    def connect(self) -> bool:
        """Establish connection"""
    
    @abstractmethod
    def disconnect(self) -> bool:
        """Close connection"""
    
    @abstractmethod
    def health_check(self) -> bool:
        """Check health"""
    
    @abstractmethod
    def get_metadata(self, resource_id: str) -> Optional[OslcResource]:
        """Retrieve OSLC metadata"""
```

### EpcisConnector

GS1 EPCIS 2.0 integration:
```python
class EpcisConnector(ConnectorInterface):
    @abstractmethod
    def query_events(
        self,
        epc: Optional[str] = None,
        biz_step: Optional[BizStep] = None,
        ...
    ) -> List[EpcisEvent]:
        """Query EPCIS events"""
    
    @abstractmethod
    def emit_event(self, event: EpcisEvent) -> str:
        """Emit EPCIS event"""
```

### WmsConnector

Warehouse Management System integration:
```python
class WmsConnector(ConnectorInterface):
    @abstractmethod
    def check_inventory(self, sku: str, location: str) -> Dict[str, Any]:
        """Check stock availability"""
    
    @abstractmethod
    def pick_items(self, order_id: str) -> List[str]:
        """Execute picking"""
```

### TmsConnector

Transportation Management System integration:
```python
class TmsConnector(ConnectorInterface):
    @abstractmethod
    def create_shipment(
        self,
        order_id: str,
        origin: str,
        destination: str,
        carrier: str
    ) -> Dict[str, Any]:
        """Create shipment"""
    
    @abstractmethod
    def track_shipment(self, tracking_number: str) -> Dict[str, Any]:
        """Track shipment status"""
```

### IoTConnector

IoT device integration (MQTT/OPC UA):
```python
class IoTConnector(ConnectorInterface):
    @abstractmethod
    def subscribe_topic(self, topic: str, callback: callable) -> bool:
        """Subscribe to MQTT topic"""
    
    @abstractmethod
    def read_sensor_data(self, sensor_id: str) -> Dict[str, Any]:
        """Read sensor data"""
```

### DltConnector

DLT integration (Fabric/Besu):
```python
class DltConnector(ConnectorInterface):
    @abstractmethod
    def anchor_evidence(
        self,
        utcs_id: str,
        artifact_uri: str,
        content_hash: str,
        metadata: Dict[str, Any]
    ) -> str:
        """Anchor evidence to DLT"""
```

## Data Models

### EpcisEvent

```python
@dataclass
class EpcisEvent:
    event_id: str
    event_type: str  # ObjectEvent, AggregationEvent, etc.
    event_time: datetime
    biz_step: BizStep
    biz_location: Optional[str]
    epc_list: List[str]
    utcs_id: Optional[str]
    content_hash: Optional[str]
```

### OslcResource

```python
@dataclass
class OslcResource:
    utcs_id: str
    service_provider: str
    created_at: datetime
    updated_at: datetime
    oslc_links: Dict[str, List[str]]
```

### CloudEventData

```python
@dataclass
class CloudEventData:
    specversion: str = "1.0"
    type: str
    source: str
    subject: str
    time: datetime
    datacontenttype: str = "application/json"
    data: Dict[str, Any]
```

## Usage

### Implement Connector

```python
from interfaces import EpcisConnector, EpcisEvent

class MyEpcisConnector(EpcisConnector):
    def __init__(self, config: Dict[str, Any]):
        super().__init__(config)
        self.base_url = config["base_url"]
    
    def connect(self) -> bool:
        # Implementation
        return True
    
    def query_events(self, epc=None, biz_step=None, ...) -> List[EpcisEvent]:
        # Implementation
        events = self._query_api(epc, biz_step)
        return [self._parse_event(e) for e in events]
```

### Use Connector

```python
# Configure connector
config = {
    "base_url": "https://epcis.example.com/api",
    "api_key": "...",  # From External Secrets
    "utcs_prefix": "UTCS-MI:RLG:EPCIS"
}

# Create connector
connector = MyEpcisConnector(config)

# Connect
connector.connect()

# Query events
events = connector.query_events(biz_step=BizStep.SHIPPING, limit=10)

for event in events:
    print(f"Event: {event.event_id} at {event.event_time}")
```

## CloudEvents Emission

```python
from interfaces import CloudEventEmitter

emitter = CloudEventEmitter(source="urn:spiffe://orgA/connector/wms")

# Emit event
event = emitter.emit_event(
    event_type="com.pcs-a.shipment.created",
    subject="UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]",
    data={
        "shipmentId": "SHIPMENT-XYZ",
        "status": "PENDING",
        "trackingNumber": "1Z999AA10123456784"
    },
    destination="nats://pcs-a-shipment"
)
```

## Testing

### Unit Tests

```python
import pytest
from interfaces import EpcisConnector

def test_epcis_connector_interface():
    # Test that custom connector implements interface
    connector = MyEpcisConnector(config)
    assert isinstance(connector, EpcisConnector)
    
    # Test connection
    assert connector.connect() == True
    
    # Test query
    events = connector.query_events(limit=1)
    assert len(events) >= 0
```

### Mock Connector

```python
class MockEpcisConnector(EpcisConnector):
    def query_events(self, **kwargs) -> List[EpcisEvent]:
        return [
            EpcisEvent(
                event_id="urn:uuid:test",
                event_type="ObjectEvent",
                event_time=datetime.utcnow(),
                biz_step=BizStep.SHIPPING,
                epc_list=["urn:epc:id:sgtin:test"],
                utcs_id="UTCS-MI:RLG:TEST:..."
            )
        ]
```

## Type Hints

SDK uses Python type hints for better IDE support:
```python
from typing import List, Dict, Optional, Any
```

## Dependencies

```bash
pip install dataclasses  # Python 3.7+
pip install typing-extensions
```

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
