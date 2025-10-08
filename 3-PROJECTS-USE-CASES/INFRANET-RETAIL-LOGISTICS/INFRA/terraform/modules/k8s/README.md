# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Terraform Module - Kubernetes Cluster

This Terraform module provisions a managed Kubernetes cluster for the INFRANET-RETAIL-LOGISTICS platform.

## Purpose

This module creates:
- **Kubernetes cluster**: Managed control plane (EKS/AKS/GKE)
- **Node groups**: Worker nodes with auto-scaling
- **Networking**: Integration with VPC/VNet
- **Add-ons**: Storage drivers, CNI plugins

## Features

- **Cloud-agnostic interface**: Same variables across AWS/Azure/GCP
- **Auto-scaling**: Node groups scale based on demand
- **High availability**: Multi-AZ deployment
- **Security**: Private API endpoint, encrypted storage

## Variables

```hcl
variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "region" {
  description = "Cloud region for cluster deployment"
  type        = string
  default     = "us-west-2"
}

variable "node_groups" {
  description = "Node group configurations"
  type = map(object({
    size     = string  # Instance type (e.g., t3.xlarge)
    min_size = number  # Minimum nodes
    max_size = number  # Maximum nodes
  }))
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
```

## Outputs

```hcl
output "cluster_id" {
  description = "Kubernetes cluster ID"
  value       = "k8s-${var.cluster_name}"
}

output "cluster_endpoint" {
  description = "Kubernetes API endpoint"
  value       = "https://api.${var.cluster_name}.example.com"
}

output "cluster_ca_cert" {
  description = "Cluster CA certificate"
  value       = "base64-encoded-ca-cert"
  sensitive   = true
}
```

## Usage

### In Environment Configuration

```hcl
module "k8s" {
  source = "../../modules/k8s"
  
  cluster_name = "pcs-a-infranet-rlg-dev"
  region       = "us-west-2"
  
  node_groups = {
    general = {
      size     = "t3.xlarge"
      min_size = 2
      max_size = 6
    }
  }
  
  tags = {
    System      = "pcs-a"
    Environment = "dev"
  }
}
```

## Implementation

### AWS EKS

```hcl
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn
  version  = "1.28"
  
  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }
}

resource "aws_eks_node_group" "main" {
  for_each = var.node_groups
  
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = each.key
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.private_subnet_ids
  
  instance_types = [each.value.size]
  
  scaling_config {
    desired_size = each.value.min_size
    min_size     = each.value.min_size
    max_size     = each.value.max_size
  }
}
```

### Azure AKS

```hcl
resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.region
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name
  kubernetes_version  = "1.28"
  
  default_node_pool {
    name                = "default"
    vm_size             = var.node_groups["general"].size
    enable_auto_scaling = true
    min_count           = var.node_groups["general"].min_size
    max_count           = var.node_groups["general"].max_size
    vnet_subnet_id      = var.subnet_id
  }
  
  identity {
    type = "SystemAssigned"
  }
}
```

### Google GKE

```hcl
resource "google_container_cluster" "main" {
  name     = var.cluster_name
  location = var.region
  
  initial_node_count       = 1
  remove_default_node_pool = true
  
  network    = var.vpc_id
  subnetwork = var.subnet_id
}

resource "google_container_node_pool" "main" {
  for_each = var.node_groups
  
  name       = each.key
  location   = var.region
  cluster    = google_container_cluster.main.name
  node_count = each.value.min_size
  
  autoscaling {
    min_node_count = each.value.min_size
    max_node_count = each.value.max_size
  }
  
  node_config {
    machine_type = each.value.size
  }
}
```

## Node Group Recommendations

### Development
```hcl
general = {
  size     = "t3.xlarge"      # 4 vCPU, 16GB RAM
  min_size = 2
  max_size = 4
}
```

### Stage
```hcl
general = {
  size     = "t3.2xlarge"     # 8 vCPU, 32GB RAM
  min_size = 3
  max_size = 6
}
```

### Production
```hcl
general = {
  size     = "m5.2xlarge"     # 8 vCPU, 32GB RAM
  min_size = 3
  max_size = 10
}
workload = {
  size     = "m5.4xlarge"     # 16 vCPU, 64GB RAM
  min_size = 2
  max_size = 8
}
```

## Add-ons

### EBS CSI Driver (AWS)

```hcl
resource "aws_eks_addon" "ebs_csi" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "aws-ebs-csi-driver"
}
```

### Azure Disk CSI (Azure)

Enabled by default in AKS.

### GCE Persistent Disk (GCP)

Enabled by default in GKE.

## Networking

### CNI Plugin

- **AWS**: Amazon VPC CNI
- **Azure**: Azure CNI or Kubenet
- **GCP**: GKE CNI

### Network Policies

Requires Calico or Cilium:
```hcl
network_policy {
  enabled  = true
  provider = "CALICO"
}
```

## Security

### Private Cluster

```hcl
vpc_config {
  endpoint_private_access = true
  endpoint_public_access  = false  # Production
}
```

### Encryption

```hcl
encryption_config {
  resources = ["secrets"]
  provider {
    key_arn = aws_kms_key.eks.arn
  }
}
```

### IAM Roles (AWS)

```hcl
resource "aws_iam_role" "cluster" {
  name = "${var.cluster_name}-cluster-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_policy" {
  role       = aws_iam_role.cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
```

## Monitoring

### CloudWatch/Azure Monitor/Stackdriver

```hcl
logging {
  cluster_logging {
    enabled_types = ["api", "audit", "authenticator"]
  }
}
```

## Troubleshooting

### Cluster Creation Fails

```bash
# Check Terraform logs
TF_LOG=DEBUG terraform apply

# Verify IAM permissions
aws sts get-caller-identity

# Check network configuration
terraform state show module.network
```

### Nodes Not Joining

```bash
# Check node group status
aws eks describe-nodegroup --cluster-name <name> --nodegroup-name <group>

# View kubelet logs (SSH to node)
journalctl -u kubelet
```

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
