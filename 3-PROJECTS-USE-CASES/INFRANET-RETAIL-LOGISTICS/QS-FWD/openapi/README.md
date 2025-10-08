# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# OpenAPI Specifications

This directory contains OpenAPI 3.1.0 specifications for the CAHA (Common Abstraction & Harmonization API) layer.

## Purpose

OpenAPI specifications define:
- **REST API endpoints**: EPCIS queries, OSLC resources
- **Request/response schemas**: JSON structures, validation rules
- **Security requirements**: OIDC, SPIFFE authentication
- **CloudEvents integration**: Event-driven state changes

## Files

- **caha-api.yaml** - Main CAHA API specification (EPCIS/OSLC facades)
- **cloudevents-schema.md** - CloudEvents 1.0 schemas for state changes

## API Overview

### Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/v1/epcis/events` | GET | Query EPCIS 2.0 events |
| `/v1/oslc/shipments/{utcsId}` | GET | Get shipment metadata |
| `/v1/oslc/orders/{utcsId}` | GET | Get order metadata |
| `/health` | GET | Health check |

### Authentication

- **OIDC**: User authentication with JWT tokens
- **SPIFFE**: Workload identity with X.509 SVIDs

### Response Format

All responses follow JSON:API-like structure:
```json
{
  "data": {...},
  "links": {...},
  "meta": {...}
}
```

## Usage

### View Documentation

```bash
# Install Redoc CLI
npm install -g redoc-cli

# Generate HTML documentation
redoc-cli bundle caha-api.yaml -o caha-api.html

# Serve documentation
npx @redocly/cli preview-docs caha-api.yaml
```

### Validate Specification

```bash
# Install Spectral
npm install -g @stoplight/spectral-cli

# Validate OpenAPI
spectral lint caha-api.yaml

# Custom rules
spectral lint caha-api.yaml --ruleset .spectral.yaml
```

### Generate Client SDK

```bash
# Python client
openapi-generator-cli generate -i caha-api.yaml -g python -o client-python

# TypeScript client
openapi-generator-cli generate -i caha-api.yaml -g typescript-axios -o client-ts

# Go client
openapi-generator-cli generate -i caha-api.yaml -g go -o client-go
```

## API Examples

### Query EPCIS Events

**Request:**
```bash
curl -X GET "https://api.infranet.example/v1/epcis/events?bizStep=shipping&limit=10" \
  -H "Authorization: Bearer <jwt-token>"
```

**Response:**
```json
{
  "events": [
    {
      "eventID": "urn:uuid:...",
      "eventType": "ObjectEvent",
      "eventTime": "2025-02-01T12:00:00Z",
      "bizStep": "shipping",
      "epcList": ["urn:epc:id:sgtin:..."],
      "utcsId": "UTCS-MI:RLG:EVENT:..."
    }
  ],
  "pagination": {
    "total": 42,
    "limit": 10,
    "offset": 0
  }
}
```

### Get Shipment Metadata

**Request:**
```bash
curl -X GET "https://api.infranet.example/v1/oslc/shipments/UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]" \
  -H "Authorization: Bearer <jwt-token>"
```

**Response:**
```json
{
  "utcsId": "UTCS-MI:RLG:SHIP:23-40:SHIPMENT-XYZ:rev[A]",
  "status": "IN_TRANSIT",
  "carrier": "UPS",
  "trackingNumber": "1Z999AA10123456784",
  "oslcLinks": {
    "containsOrders": ["urn:oslc:order:..."],
    "hasEpcisEvents": ["urn:epcis:event:..."]
  }
}
```

## Schema Validation

### Validate Request

```bash
# Install ajv-cli
npm install -g ajv-cli

# Validate request body
echo '{"epc": "urn:epc:id:sgtin:..."}' | \
  ajv validate -s caha-api.yaml#/components/schemas/EpcisEvent
```

### Validate Response

Use contract testing frameworks:
- **Dredd**: API testing framework
- **Pact**: Consumer-driven contract testing
- **Prism**: Mock server with validation

```bash
# Run Prism mock server
prism mock caha-api.yaml

# Test against mock
curl http://localhost:4010/v1/epcis/events
```

## CloudEvents Integration

See `cloudevents-schema.md` for:
- Event types (order.created, shipment.updated, etc.)
- Event schemas
- Event bus configuration (NATS, Kafka)
- Security (JWS signatures, JWE encryption)

## Versioning

API follows semantic versioning:
- **v1.0.0**: Initial release (Bronze conformance)
- **v1.1.0**: Add BPMN integration (Silver conformance)
- **v2.0.0**: Breaking changes (Gold conformance + DLT)

## Testing

### Unit Tests

See `CB-QB/conformance-kit/test_conformance.py::TestOpenApiConformance`

### Integration Tests

```bash
# Install newman (Postman CLI)
npm install -g newman

# Run collection
newman run postman-collection.json -e env-dev.json
```

### Performance Tests

```bash
# Install k6
brew install k6

# Run load test
k6 run load-test.js
```

## Security

### Authentication Flow

1. User obtains JWT from OIDC provider
2. User includes JWT in `Authorization: Bearer <token>` header
3. API Gateway validates JWT signature and claims
4. API Gateway checks OPA for authorization
5. If authorized, request proceeds to backend

### Rate Limiting

```yaml
x-rate-limit:
  per-user: 100 requests/minute
  per-organization: 1000 requests/minute
```

### CORS

```yaml
x-cors:
  allowed-origins:
    - https://app.infranet.example
  allowed-methods:
    - GET
    - POST
  allowed-headers:
    - Authorization
    - Content-Type
```

## Monitoring

### Metrics

- Request rate (requests/sec)
- Error rate (4xx, 5xx)
- Latency (p50, p95, p99)
- Authentication failures

### Logging

All requests logged with:
- Request ID
- User ID
- Endpoint
- Response status
- Latency

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
