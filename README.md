# Podcast Converter Infrastructure

Infrastructure as Code (IaC) repository for the Podcast Converter application using Terraform.

## Infrastructure Overview

```
podcast-converter-infra/
├── .github/
│   └── workflows/
│       └── terraform.yml    # Infrastructure CI/CD
├── terraform/
│   ├── environments/        # Environment-specific configs
│   │   ├── dev/
│   │   ├── staging/
│   │   └── prod/
│   ├── modules/            # Reusable modules
│   │   └── podcast-converter/
│   ├── provider.tf
│   ├── variables.tf
│   ├── vpc.tf
│   ├── eks.tf
│   ├── s3.tf
│   ├── iam.tf
│   ├── monitoring.tf
│   └── outputs.tf
└── versions.tf
```

## Prerequisites

- Terraform >= 1.0.0
- AWS CLI configured
- GitHub Actions secrets configured
- AWS account with required permissions

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/your-username/podcast-converter-infra.git
cd podcast-converter-infra
```

2. Initialize Terraform:
```bash
cd terraform/environments/dev  # or staging/prod
terraform init
```

3. Deploy infrastructure:
```bash
terraform plan -var-file="variables.tfvars"
terraform apply -var-file="variables.tfvars"
```

## Environment Configurations

### Development
- Small-scale infrastructure
- Single availability zone
- Cost-optimized resources
- Minimal redundancy

### Staging
- Medium-scale infrastructure
- Two availability zones
- Monitoring enabled
- Test environment for production

### Production
- Full-scale infrastructure
- Three availability zones
- High availability
- Full monitoring and alerting
- Automated backups

## Infrastructure Components

- VPC with public/private subnets
- EKS cluster
- Managed node groups
- S3 buckets
- IAM roles and policies
- Monitoring stack (Prometheus/Grafana)

## CI/CD

The `terraform.yml` workflow:
- Runs on infrastructure changes
- Validates Terraform configurations
- Plans changes on pull requests
- Applies changes when merged to main

## Security

- Encrypted storage
- Private subnets for EKS
- IAM roles with least privilege
- Security group restrictions
- Regular security audits

## Monitoring

- EKS cluster metrics
- Node monitoring
- Application metrics
- Cost monitoring
- Alert management

## Disaster Recovery

- Regular state backups
- Multi-AZ deployment
- Automated snapshots
- Recovery procedures

## Contributing

1. Fork the repository
2. Create feature branch
3. Make changes
4. Test in dev environment
5. Submit pull request

### Branch Protection Rules
- Main branch protected
- Required reviews
- Required status checks
- No direct commits to main

## Cost Management

- Resource tagging
- Cost allocation
- Automated reporting
- Environment-specific optimizations

## Support

For issues:
1. Check existing issues
2. Provide clear description
3. Include logs/errors
4. Tag appropriately

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
