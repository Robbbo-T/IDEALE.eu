"""
UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
TFA: QS→FWD→UE→FE→CB→QB
License: Apache-2.0
Notes: PCS-A compliant SDK interfaces for CAHA connectors
"""

from abc import ABC, abstractmethod
from typing import List, Dict, Optional, Any
from datetime import datetime
from dataclasses import dataclass
from enum import Enum


class BizStep(Enum):
    """GS1 CBV Business Steps"""
    SHIPPING = "shipping"
    RECEIVING = "receiving"
    ACCEPTING = "accepting"
    INSPECTING = "inspecting"
    PACKING = "packing"
    PICKING = "picking"
    STORING = "storing"


@dataclass
class EpcisEvent:
    """GS1 EPCIS 2.0 Event"""
    event_id: str
    event_type: str  # ObjectEvent, AggregationEvent, etc.
    event_time: datetime
    biz_step: BizStep
    biz_location: Optional[str] = None
    epc_list: List[str] = None
    utcs_id: Optional[str] = None
    content_hash: Optional[str] = None
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization"""
        return {
            "eventID": self.event_id,
            "eventType": self.event_type,
            "eventTime": self.event_time.isoformat(),
            "bizStep": self.biz_step.value,
            "bizLocation": self.biz_location,
            "epcList": self.epc_list or [],
            "utcsId": self.utcs_id,
            "hash": self.content_hash
        }


@dataclass
class OslcResource:
    """Base OSLC Resource"""
    utcs_id: str
    service_provider: str
    created_at: datetime
    updated_at: datetime
    oslc_links: Dict[str, List[str]] = None
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization"""
        return {
            "utcsId": self.utcs_id,
            "serviceProvider": self.service_provider,
            "createdAt": self.created_at.isoformat(),
            "updatedAt": self.updated_at.isoformat(),
            "oslcLinks": self.oslc_links or {}
        }


@dataclass
class CloudEventData:
    """CloudEvents 1.0 wrapper"""
    specversion: str = "1.0"
    type: str = ""
    source: str = ""
    subject: str = ""
    time: datetime = None
    datacontenttype: str = "application/json"
    data: Dict[str, Any] = None
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert to CloudEvents JSON format"""
        return {
            "specversion": self.specversion,
            "type": self.type,
            "source": self.source,
            "subject": self.subject,
            "time": self.time.isoformat() if self.time else datetime.utcnow().isoformat(),
            "datacontenttype": self.datacontenttype,
            "data": self.data or {}
        }


class ConnectorInterface(ABC):
    """Base interface for all PCS-A connectors"""
    
    def __init__(self, config: Dict[str, Any]):
        self.config = config
        self.utcs_prefix = config.get("utcs_prefix", "UTCS-MI:RLG")
    
    @abstractmethod
    def connect(self) -> bool:
        """Establish connection to the target system"""
        pass
    
    @abstractmethod
    def disconnect(self) -> bool:
        """Close connection to the target system"""
        pass
    
    @abstractmethod
    def health_check(self) -> bool:
        """Check if connector is healthy"""
        pass
    
    @abstractmethod
    def get_metadata(self, resource_id: str) -> Optional[OslcResource]:
        """Retrieve OSLC metadata for a resource"""
        pass


class EpcisConnector(ConnectorInterface):
    """Connector interface for GS1 EPCIS 2.0 systems"""
    
    @abstractmethod
    def query_events(
        self,
        epc: Optional[str] = None,
        biz_step: Optional[BizStep] = None,
        biz_location: Optional[str] = None,
        event_time_start: Optional[datetime] = None,
        event_time_end: Optional[datetime] = None,
        limit: int = 20
    ) -> List[EpcisEvent]:
        """Query EPCIS events with filters"""
        pass
    
    @abstractmethod
    def emit_event(self, event: EpcisEvent) -> str:
        """Emit a new EPCIS event and return event ID"""
        pass


class WmsConnector(ConnectorInterface):
    """Connector interface for Warehouse Management Systems"""
    
    @abstractmethod
    def check_inventory(self, sku: str, location: str) -> Dict[str, Any]:
        """
        Check inventory availability
        Returns: {"available": bool, "quantity": int, "location": str}
        """
        pass
    
    @abstractmethod
    def reserve_inventory(self, sku: str, quantity: int, order_id: str) -> bool:
        """Reserve inventory for an order"""
        pass
    
    @abstractmethod
    def pick_items(self, order_id: str) -> List[str]:
        """
        Execute picking process
        Returns: List of EPC URIs for picked items
        """
        pass
    
    @abstractmethod
    def pack_items(self, order_id: str) -> str:
        """
        Execute packing process
        Returns: Shipment container ID
        """
        pass


class TmsConnector(ConnectorInterface):
    """Connector interface for Transportation Management Systems"""
    
    @abstractmethod
    def create_shipment(
        self,
        order_id: str,
        origin: str,
        destination: str,
        carrier: str
    ) -> Dict[str, Any]:
        """
        Create a new shipment
        Returns: {"shipment_id": str, "tracking_number": str, "utcs_id": str}
        """
        pass
    
    @abstractmethod
    def track_shipment(self, tracking_number: str) -> Dict[str, Any]:
        """
        Track shipment status
        Returns: {"status": str, "location": str, "eta": datetime}
        """
        pass
    
    @abstractmethod
    def update_shipment_status(self, shipment_id: str, status: str) -> bool:
        """Update shipment status"""
        pass


class IoTConnector(ConnectorInterface):
    """Connector interface for IoT devices (MQTT/OPC UA)"""
    
    @abstractmethod
    def subscribe_topic(self, topic: str, callback: callable) -> bool:
        """Subscribe to MQTT topic or OPC UA node"""
        pass
    
    @abstractmethod
    def publish_message(self, topic: str, message: Dict[str, Any]) -> bool:
        """Publish message to MQTT topic or OPC UA node"""
        pass
    
    @abstractmethod
    def read_sensor_data(self, sensor_id: str) -> Dict[str, Any]:
        """
        Read current sensor data
        Returns: {"sensor_id": str, "value": Any, "timestamp": datetime, "unit": str}
        """
        pass


class DltConnector(ConnectorInterface):
    """Connector interface for DLT (Fabric/Besu)"""
    
    @abstractmethod
    def anchor_evidence(
        self,
        utcs_id: str,
        artifact_uri: str,
        content_hash: str,
        metadata: Dict[str, Any]
    ) -> str:
        """
        Anchor evidence to DLT
        Returns: Transaction ID
        """
        pass
    
    @abstractmethod
    def query_evidence(self, utcs_id: str) -> List[Dict[str, Any]]:
        """
        Query evidence records from DLT
        Returns: List of evidence records
        """
        pass
    
    @abstractmethod
    def verify_integrity(self, utcs_id: str, content_hash: str) -> bool:
        """Verify integrity of anchored evidence"""
        pass


class CloudEventEmitter:
    """Utility for emitting CloudEvents 1.0"""
    
    def __init__(self, source: str):
        self.source = source
    
    def emit_event(
        self,
        event_type: str,
        subject: str,
        data: Dict[str, Any],
        destination: Optional[str] = None
    ) -> CloudEventData:
        """
        Emit a CloudEvent
        
        Args:
            event_type: Event type (e.g., "com.pcs-a.shipment.updated")
            subject: UTCS ID of the subject resource
            data: Event payload
            destination: Optional destination (NATS topic, Kafka topic, etc.)
        """
        event = CloudEventData(
            type=event_type,
            source=self.source,
            subject=subject,
            time=datetime.utcnow(),
            data=data
        )
        
        if destination:
            # Publish to event bus (implementation-specific)
            self._publish(destination, event)
        
        return event
    
    def _publish(self, destination: str, event: CloudEventData):
        """Publish to event bus - override in implementation"""
        pass
