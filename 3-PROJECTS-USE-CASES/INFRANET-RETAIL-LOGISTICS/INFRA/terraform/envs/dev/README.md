# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0

# Terraform - Development Environment

This directory contains Terraform configuration for deploying the INFRANET-RETAIL-LOGISTICS infrastructure in the **development environment**.

## Purpose

This Terraform environment provisions:
- **Network infrastructure**: VPC/VNet, subnets, security groups
- **Kubernetes cluster**: EKS/AKS/GKE or k3s
- **Supporting services**: Load balancers, DNS, storage

## Files

- **main.tf** - Main Terraform configuration calling modules
- **variables.tf** - (optional) Environment-specific variables
- **outputs.tf** - (optional) Output values for downstream consumers

## Configuration

### Backend

State is stored remotely (uncomment in main.tf):
```hcl
terraform {
  backend "s3" {
    bucket = "pcs-a-infranet-rlg-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-west-2"
  }
}
```

Alternatives:
- **Azure Blob**: For Azure deployments
- **GCS**: For Google Cloud deployments
- **Terraform Cloud**: For managed state

### Variables

```hcl
locals {
  environment    = "dev"
  cluster_name   = "pcs-a-infranet-rlg-dev"
  region         = "us-west-2"
  
  common_tags = {
    System      = "pcs-a"
    UseCase     = "infranet-rlg"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
```

## Usage

### Initialize

```bash
# Initialize Terraform
terraform init

# Verify modules
terraform get
```

### Plan

```bash
# Preview changes
terraform plan

# Save plan
terraform plan -out=tfplan
```

### Apply

```bash
# Apply changes
terraform apply

# Or apply saved plan
terraform apply tfplan
```

### Outputs

```bash
# View outputs
terraform output

# Get specific output
terraform output cluster_endpoint
```

## Modules Used

### Network Module

Provisions:
- VPC/VNet with CIDR 10.0.0.0/16
- Private subnets for workloads
- Public subnets for load balancers
- NAT gateway for outbound traffic

### Kubernetes Module

Provisions:
- Managed Kubernetes cluster (EKS/AKS/GKE)
- Node groups with auto-scaling
- Storage classes
- Cluster add-ons

Configuration:
```hcl
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
```

## Cloud Provider Setup

### AWS (EKS)

```bash
# Configure AWS CLI
aws configure

# Verify credentials
aws sts get-caller-identity

# Update modules/k8s/main.tf to use:
# - aws_eks_cluster
# - aws_eks_node_group
```

### Azure (AKS)

```bash
# Login to Azure
az login

# Set subscription
az account set --subscription "subscription-id"

# Update modules/k8s/main.tf to use:
# - azurerm_kubernetes_cluster
```

### Google Cloud (GKE)

```bash
# Authenticate
gcloud auth login

# Set project
gcloud config set project project-id

# Update modules/k8s/main.tf to use:
# - google_container_cluster
```

### On-Premises (k3s)

For on-premises deployment, use k3s provisioner or pre-existing cluster.

## Post-Deployment

### Connect to Cluster

```bash
# AWS EKS
aws eks update-kubeconfig --name pcs-a-infranet-rlg-dev --region us-west-2

# Azure AKS
az aks get-credentials --resource-group pcs-a-rg --name pcs-a-infranet-rlg-dev

# Google GKE
gcloud container clusters get-credentials pcs-a-infranet-rlg-dev --region us-west-2

# Verify
kubectl get nodes
```

### Deploy Workloads

```bash
# Deploy via Argo CD
cd ../../kubernetes/overlays/dev
kubectl apply -k .

# Or via GitOps
kubectl apply -f ../../gitops/argo/app-dev.yaml
```

## Maintenance

### Update Infrastructure

```bash
# Modify main.tf or modules
vim main.tf

# Plan changes
terraform plan

# Apply updates
terraform apply
```

### Upgrade Kubernetes

```bash
# Update cluster version in modules/k8s/main.tf
# version = "1.28" -> "1.29"

# Plan and apply
terraform plan
terraform apply
```

### Scale Node Groups

```bash
# Update node_groups in main.tf
# max_size = 4 -> 6

terraform apply
```

## Troubleshooting

### State Lock

```bash
# If state is locked
terraform force-unlock <lock-id>
```

### Module Errors

```bash
# Reinitialize modules
terraform init -upgrade

# Clean cache
rm -rf .terraform
terraform init
```

### Cluster Not Accessible

```bash
# Verify cluster created
terraform output cluster_endpoint

# Update kubeconfig
<update-kubeconfig-command>

# Check node status
kubectl get nodes
```

## Destruction

### Delete Resources

```bash
# CAUTION: This deletes ALL infrastructure

# Preview deletion
terraform plan -destroy

# Delete resources
terraform destroy

# Confirm with 'yes'
```

### Partial Deletion

```bash
# Remove specific resource
terraform destroy -target=module.k8s

# Keep network, delete cluster only
```

## Cost Optimization (Dev)

- **Node sizes**: Use t3.xlarge instead of larger instances
- **Min replicas**: Keep min_size = 1 for dev workloads
- **Spot instances**: Consider spot/preemptible for non-critical nodes
- **Auto-shutdown**: Schedule cluster shutdown outside work hours

## Security

- **State encryption**: Enable S3 bucket encryption
- **Access control**: Restrict Terraform Cloud/state bucket access
- **Secrets**: Never commit credentials; use AWS IAM, Azure MI, or GCP SA
- **Drift detection**: Run `terraform plan` regularly to detect manual changes

---

**Last Updated**: 2025-02-01  
**Maintained by**: INFRANET-RETAIL-LOGISTICS Team
