# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0
# Notes: Terraform environment configuration for dev

terraform {
  required_version = ">= 1.5.0"
  
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
  
  # Backend configuration (use S3, Azure Blob, or GCS)
  # backend "s3" {
  #   bucket = "pcs-a-infranet-rlg-terraform-state"
  #   key    = "dev/terraform.tfstate"
  #   region = "us-west-2"
  # }
}

# Local variables
locals {
  environment    = "dev"
  cluster_name   = "pcs-a-infranet-rlg-dev"
  region         = "us-west-2"
  
  common_tags = {
    System      = "pcs-a"
    UseCase     = "infranet-rlg"
    Environment = local.environment
    ManagedBy   = "terraform"
    UTCS        = "UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]"
  }
}

# Network module
module "network" {
  source = "../../modules/network"
  
  environment = local.environment
  vpc_cidr    = "10.0.0.0/16"
  tags        = local.common_tags
}

# Kubernetes cluster module
module "k8s" {
  source = "../../modules/k8s"
  
  cluster_name = local.cluster_name
  region       = local.region
  
  node_groups = {
    general = {
      size     = "t3.xlarge"
      min_size = 2
      max_size = 4
    }
    workload = {
      size     = "t3.2xlarge"
      min_size = 1
      max_size = 3
    }
  }
  
  tags = local.common_tags
}

# Outputs
output "cluster_endpoint" {
  description = "Kubernetes API endpoint"
  value       = module.k8s.cluster_endpoint
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "environment" {
  description = "Environment name"
  value       = local.environment
}
