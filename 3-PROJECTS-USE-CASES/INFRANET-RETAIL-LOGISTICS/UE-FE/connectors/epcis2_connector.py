"""
UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
TFA: QS→FWD→UE→FE→CB→QB
License: Apache-2.0
Notes: Sample EPCIS 2.0 connector implementation for PCS-A
"""

import json
import hashlib
import requests
from typing import List, Dict, Optional, Any
from datetime import datetime
from uuid import uuid4

from interfaces import EpcisConnector, EpcisEvent, BizStep, OslcResource


class Epcis2Connector(EpcisConnector):
    """
    Sample EPCIS 2.0 Connector implementation
    Connects to GS1 EPCIS 2.0 compliant repositories
    """
    
    def __init__(self, config: Dict[str, Any]):
        super().__init__(config)
        self.base_url = config.get("base_url", "")
        self.api_key = config.get("api_key", "")
        self.timeout = config.get("timeout", 30)
        self.session = None
    
    def connect(self) -> bool:
        """Establish connection to EPCIS repository"""
        try:
            self.session = requests.Session()
            self.session.headers.update({
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization": f"Bearer {self.api_key}"
            })
            
            # Test connection
            response = self.session.get(
                f"{self.base_url}/health",
                timeout=self.timeout
            )
            return response.status_code == 200
        except Exception as e:
            print(f"Connection failed: {e}")
            return False
    
    def disconnect(self) -> bool:
        """Close connection"""
        if self.session:
            self.session.close()
            self.session = None
        return True
    
    def health_check(self) -> bool:
        """Check if connector is healthy"""
        if not self.session:
            return False
        try:
            response = self.session.get(
                f"{self.base_url}/health",
                timeout=5
            )
            return response.status_code == 200
        except:
            return False
    
    def get_metadata(self, resource_id: str) -> Optional[OslcResource]:
        """Retrieve OSLC metadata for an EPCIS event"""
        try:
            response = self.session.get(
                f"{self.base_url}/events/{resource_id}",
                timeout=self.timeout
            )
            if response.status_code != 200:
                return None
            
            data = response.json()
            return OslcResource(
                utcs_id=data.get("utcsId", f"{self.utcs_prefix}:EVENT:{resource_id}"),
                service_provider=self.base_url,
                created_at=datetime.fromisoformat(data.get("eventTime")),
                updated_at=datetime.utcnow(),
                oslc_links={
                    "epcis:epcList": data.get("epcList", [])
                }
            )
        except Exception as e:
            print(f"Error retrieving metadata: {e}")
            return None
    
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
        if not self.session:
            raise RuntimeError("Not connected. Call connect() first.")
        
        # Build query parameters
        params = {"perPage": limit}
        if epc:
            params["EPC"] = epc
        if biz_step:
            params["bizStep"] = f"urn:epcglobal:cbv:bizstep:{biz_step.value}"
        if biz_location:
            params["bizLocation"] = biz_location
        if event_time_start:
            params["GE_eventTime"] = event_time_start.isoformat()
        if event_time_end:
            params["LE_eventTime"] = event_time_end.isoformat()
        
        try:
            response = self.session.get(
                f"{self.base_url}/events",
                params=params,
                timeout=self.timeout
            )
            response.raise_for_status()
            
            data = response.json()
            events = []
            
            for event_data in data.get("epcisBody", {}).get("eventList", []):
                event = self._parse_event(event_data)
                if event:
                    events.append(event)
            
            return events
        except Exception as e:
            print(f"Error querying events: {e}")
            return []
    
    def emit_event(self, event: EpcisEvent) -> str:
        """Emit a new EPCIS event"""
        if not self.session:
            raise RuntimeError("Not connected. Call connect() first.")
        
        # Convert event to EPCIS 2.0 JSON format
        epcis_payload = {
            "@context": [
                "https://ref.gs1.org/standards/epcis/2.0.0/epcis-context.jsonld"
            ],
            "type": "EPCISDocument",
            "schemaVersion": "2.0",
            "creationDate": datetime.utcnow().isoformat(),
            "epcisBody": {
                "eventList": [
                    {
                        "type": event.event_type,
                        "eventTime": event.event_time.isoformat(),
                        "eventTimeZoneOffset": "+00:00",
                        "eventID": event.event_id,
                        "bizStep": f"urn:epcglobal:cbv:bizstep:{event.biz_step.value}",
                        "epcList": event.epc_list or [],
                        "action": "OBSERVE",
                        "bizLocation": {
                            "id": event.biz_location
                        } if event.biz_location else None,
                        # Custom extension for UTCS
                        "utcs:id": event.utcs_id,
                        "utcs:contentHash": event.content_hash
                    }
                ]
            }
        }
        
        try:
            response = self.session.post(
                f"{self.base_url}/capture",
                json=epcis_payload,
                timeout=self.timeout
            )
            response.raise_for_status()
            
            # Return event ID
            location = response.headers.get("Location", "")
            return location.split("/")[-1] if location else event.event_id
        except Exception as e:
            print(f"Error emitting event: {e}")
            raise
    
    def _parse_event(self, event_data: Dict[str, Any]) -> Optional[EpcisEvent]:
        """Parse EPCIS JSON to EpcisEvent object"""
        try:
            # Extract bizStep and convert to BizStep enum
            biz_step_urn = event_data.get("bizStep", "")
            biz_step_value = biz_step_urn.split(":")[-1]
            biz_step = BizStep(biz_step_value) if biz_step_value in [e.value for e in BizStep] else BizStep.STORING
            
            # Compute content hash
            event_json = json.dumps(event_data, sort_keys=True)
            content_hash = f"sha256:{hashlib.sha256(event_json.encode()).hexdigest()}"
            
            return EpcisEvent(
                event_id=event_data.get("eventID", str(uuid4())),
                event_type=event_data.get("type", "ObjectEvent"),
                event_time=datetime.fromisoformat(event_data.get("eventTime").replace("Z", "+00:00")),
                biz_step=biz_step,
                biz_location=event_data.get("bizLocation", {}).get("id"),
                epc_list=event_data.get("epcList", []),
                utcs_id=event_data.get("utcs:id"),
                content_hash=content_hash
            )
        except Exception as e:
            print(f"Error parsing event: {e}")
            return None


# Example usage
if __name__ == "__main__":
    # Configuration
    config = {
        "base_url": "https://epcis.example.com/api",
        "api_key": "dummy-api-key",  # Use External Secrets in production
        "utcs_prefix": "UTCS-MI:RLG:EPCIS"
    }
    
    # Create connector
    connector = Epcis2Connector(config)
    
    # Connect
    if connector.connect():
        print("✓ Connected to EPCIS repository")
        
        # Query events
        events = connector.query_events(
            biz_step=BizStep.SHIPPING,
            limit=10
        )
        print(f"✓ Found {len(events)} shipping events")
        
        # Emit a new event
        new_event = EpcisEvent(
            event_id=f"urn:uuid:{uuid4()}",
            event_type="ObjectEvent",
            event_time=datetime.utcnow(),
            biz_step=BizStep.PICKING,
            biz_location="urn:epc:id:sgln:0614141.00001.0",
            epc_list=["urn:epc:id:sgtin:0614141.107346.2017"],
            utcs_id="UTCS-MI:RLG:PICK:10-20:PICK-001:rev[A]",
            content_hash="sha256:placeholder"
        )
        
        event_id = connector.emit_event(new_event)
        print(f"✓ Emitted event: {event_id}")
        
        # Disconnect
        connector.disconnect()
        print("✓ Disconnected")
    else:
        print("✗ Connection failed")
