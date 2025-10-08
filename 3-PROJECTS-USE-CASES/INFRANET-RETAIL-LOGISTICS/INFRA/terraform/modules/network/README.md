# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Terraform Module - Network Infrastructure

This Terraform module provisions network infrastructure for the INFRANET-RETAIL-LOGISTICS platform.

## Purpose

This module creates:
- **VPC/VNet**: Virtual private cloud with private IP space
- **Subnets**: Private and public subnets across availability zones
- **Routing**: Route tables, NAT gateways, internet gateways
- **Security**: Security groups, network ACLs

## Features

- **Cloud-agnostic interface**: Same variables across AWS/Azure/GCP
- **Multi-AZ deployment**: High availability across zones
- **Private by default**: Workloads in private subnets
- **NAT gateway**: Outbound internet access for private subnets

## Variables

```hcl
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
```

## Outputs

```hcl
output "vpc_id" {
  description = "VPC ID"
  value       = "vpc-infranet-${var.environment}"
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = var.private_subnets
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = var.public_subnets
}
```

## Usage

### In Environment Configuration

```hcl
module "network" {
  source = "../../modules/network"
  
  environment = "dev"
  vpc_cidr    = "10.0.0.0/16"
  
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  
  tags = {
    System      = "pcs-a"
    Environment = "dev"
  }
}
```

## Implementation

### AWS VPC

```hcl
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = merge(var.tags, {
    Name = "pcs-a-vpc-${var.environment}"
  })
}

# Private subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  
  tags = merge(var.tags, {
    Name = "pcs-a-private-${count.index + 1}"
    Type = "private"
  })
}

# Public subnets
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  
  tags = merge(var.tags, {
    Name = "pcs-a-public-${count.index + 1}"
    Type = "public"
  })
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  
  tags = merge(var.tags, {
    Name = "pcs-a-igw"
  })
}

# NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  tags   = var.tags
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  
  tags = merge(var.tags, {
    Name = "pcs-a-nat"
  })
}

# Route tables
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  
  tags = merge(var.tags, {
    Name = "pcs-a-private-rt"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
  tags = merge(var.tags, {
    Name = "pcs-a-public-rt"
  })
}
```

### Azure VNet

```hcl
resource "azurerm_virtual_network" "main" {
  name                = "pcs-a-vnet-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vpc_cidr]
  
  tags = var.tags
}

resource "azurerm_subnet" "private" {
  count                = length(var.private_subnets)
  name                 = "pcs-a-private-${count.index + 1}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.private_subnets[count.index]]
}

resource "azurerm_subnet" "public" {
  count                = length(var.public_subnets)
  name                 = "pcs-a-public-${count.index + 1}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.public_subnets[count.index]]
}

resource "azurerm_nat_gateway" "main" {
  name                = "pcs-a-nat-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"
  
  tags = var.tags
}
```

### Google VPC

```hcl
resource "google_compute_network" "main" {
  name                    = "pcs-a-vpc-${var.environment}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "private" {
  count         = length(var.private_subnets)
  name          = "pcs-a-private-${count.index + 1}"
  ip_cidr_range = var.private_subnets[count.index]
  region        = var.region
  network       = google_compute_network.main.id
  
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "public" {
  count         = length(var.public_subnets)
  name          = "pcs-a-public-${count.index + 1}"
  ip_cidr_range = var.public_subnets[count.index]
  region        = var.region
  network       = google_compute_network.main.id
}

resource "google_compute_router" "main" {
  name    = "pcs-a-router"
  region  = var.region
  network = google_compute_network.main.id
}

resource "google_compute_router_nat" "main" {
  name                               = "pcs-a-nat"
  router                             = google_compute_router.main.name
  region                             = google_compute_router.main.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
```

## Network Architecture

```
┌─────────────────────────────────────────────────────────┐
│                   VPC/VNet (10.0.0.0/16)                │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────────────────┐           ┌──────────────────┐   │
│  │ Public Subnet 1 │           │ Private Subnet 1 │   │
│  │ 10.0.101.0/24   │◄─────────►│ 10.0.1.0/24      │   │
│  └────────┬────────┘           └─────────┬────────┘   │
│           │                               │            │
│  ┌────────▼────────┐           ┌─────────▼────────┐   │
│  │ Public Subnet 2 │           │ Private Subnet 2 │   │
│  │ 10.0.102.0/24   │           │ 10.0.2.0/24      │   │
│  └────────┬────────┘           └─────────┬────────┘   │
│           │                               │            │
│  ┌────────▼────────┐           ┌─────────▼────────┐   │
│  │ Public Subnet 3 │           │ Private Subnet 3 │   │
│  │ 10.0.103.0/24   │           │ 10.0.3.0/24      │   │
│  └────────┬────────┘           └─────────┬────────┘   │
│           │                               │            │
│      ┌────▼─────┐                    ┌───▼────┐       │
│      │Internet  │                    │  NAT   │       │
│      │Gateway   │                    │Gateway │       │
│      └──────────┘                    └────────┘       │
└─────────────────────────────────────────────────────────┘
           │                                 ▲
           │                                 │
           ▼                                 │
      ┌──────────┐                           │
      │Internet  │───────────────────────────┘
      └──────────┘
```

## Security Groups

### Allow internal traffic

```hcl
resource "aws_security_group" "internal" {
  name        = "pcs-a-internal"
  description = "Allow internal cluster traffic"
  vpc_id      = aws_vpc.main.id
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

## Cost Optimization

- **Single NAT Gateway**: Use one NAT gateway for dev (shared across AZs)
- **VPC Endpoints**: Add VPC endpoints for AWS services to avoid NAT costs
- **Reserved IPs**: Use fewer Elastic IPs

## Monitoring

```bash
# Check VPC status
aws ec2 describe-vpcs --filters "Name=tag:Name,Values=pcs-a-vpc-dev"

# View subnet utilization
aws ec2 describe-subnets --filters "Name=vpc-id,Values=<vpc-id>"

# NAT Gateway metrics
aws cloudwatch get-metric-statistics \
  --namespace AWS/NATGateway \
  --metric-name BytesOutToSource \
  --dimensions Name=NatGatewayId,Value=<nat-id> \
  --start-time 2025-02-01T00:00:00Z \
  --end-time 2025-02-01T23:59:59Z \
  --period 3600 \
  --statistics Sum
```

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
