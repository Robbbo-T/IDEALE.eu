# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0
# Notes: Terraform module for network provisioning

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

# Private subnets for workloads
variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# Public subnets for load balancers
variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

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

# NOTE: Skeleton for cloud-agnostic network provisioning
# Actual implementation would create VPC/VNet, subnets, route tables, NAT, etc.
