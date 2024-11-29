# Podcast Converter Infrastructure

This repository contains the Terraform configurations for the Podcast Converter application infrastructure on AWS.

## Infrastructure Overview

```
terraform/
├── environments/           # Environment-specific configurations
│   ├── dev/               # Development environment
│   │   ├── main.tf        # Main configuration file
│   │   └── variables.tfvars # Environment variables
│   ├── staging/           # Staging environment
│   │   ├── main.tf
│   │   └── variables.tfvars
│   └── prod/              # Production environment
│       ├── main.tf
│       └── variables.tfvars
├── modules/               # Reusable infrastructure modules
│   └── podcast-converter/ # Main application module
│       ├── main.tf       # Module configuration
│       ├── variables.tf  # Module variables
│       └── outputs.tf    # Module outputs
├── provider.tf           # Provider configurations
├── variables.tf          # Common variables
├── vpc.tf               # VPC configuration
├── eks.tf               # EKS configuration
├── s3.tf                # S3 configuration
├── iam.tf               # IAM roles and policies
├── monitoring.tf        # Monitoring setup
└── outputs.tf           # Output configurations
```

## Prerequisites

- Terraform >= 1.0.0
- AWS CLI configured with appropriate credentials
- kubectl installed for Kubernetes operations
- AWS account with necessary permissions

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/your-organization/podcast-converter-infrastructure.git
cd podcast-converter-infrastructure
```

2. Initialize Terraform:
```bash
cd terraform/environments/dev  # or staging/prod
terraform init
```

3. Review the plan:
```bash
terraform plan -var-file="variables.tfvars"
```

4. Apply the configuration:
```bash
terraform apply -var-file="variables.tfvars"
```

## Environment Configurations

### Development
- VPC CIDR: 10.0.0.0/16
- Node Group: 2-3 nodes
- Instance Type: t3.medium
- Single NAT Gateway

### Staging
- VPC CIDR: 10.1.0.0/16
- Node Group: 2-4 nodes
- Instance Type: t3.medium
- Single NAT Gateway

### Production
- VPC CIDR: 10.2.0.0/16
- Node Group: 3-10 nodes
- Instance Type: t3.medium
- Multiple NAT Gateways (one per AZ)
- Enhanced monitoring
- Multi-AZ deployment

## Module Usage

```hcl
module "podcast_converter" {
  source = "../../modules/podcast-converter"

  environment = "dev"
  aws_region = var.aws_region
  cluster_name = "podcast-converter-dev"
  
  vpc_cidr = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  
  node_group_min_size = 2
  node_group_max_size = 3
  node_group_desired_size = 2
}
```

## Resource Management

### Created Resources
- VPC with public and private subnets
- EKS cluster with managed node groups
- S3 bucket for audio storage
- IAM roles and policies
- Monitoring stack (Prometheus & Grafana)
- Security groups and networking rules

### Destroying Resources
```bash
terraform destroy -var-file="variables.tfvars"
```

## Monitoring and Maintenance

### Accessing Monitoring
```bash
kubectl port-forward svc/grafana 3000:3000 -n monitoring
```

### Updating Infrastructure
1. Make changes to relevant .tf files
2. Run terraform plan to review changes
3. Apply changes after review
4. Verify infrastructure status

## Security

- All sensitive data stored in AWS Secrets Manager
- Private subnets for EKS nodes
- Security groups limiting access
- IAM roles following principle of least privilege

## Cost Management

- Dev/Staging environments use single NAT Gateway
- Auto-scaling configured based on environment
- Cost allocation tags applied to all resources

## Troubleshooting

Common issues and solutions:

1. EKS Cluster Creation Fails
```bash
aws eks describe-cluster --name cluster-name --region region
```

2. VPC Subnet Issues
```bash
aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-id"
```

## Contributing

1. Create a new branch
2. Make your changes
3. Test in dev environment
4. Submit pull request

## Backup and Disaster Recovery

- EKS cluster snapshots
- S3 bucket versioning
- Multi-AZ deployment in production
- Regular terraform state backups

For support, please contact the infrastructure team or create an issue in the repository.

