# Stage 1 - Terraform (EKS + ECR)

This Terraform creates:

- VPC (public + private subnets)
- EKS cluster (managed node group)
- ECR repository

## Quick start

From repo root:

```bash
cd infra/eks-ecr
terraform init
terraform apply
```

## Variables

- `region` (default: `ap-south-2`)
- `name` (default: `boardgame`)
- `kubernetes_version` (default: `1.29`)
- `ecr_repository_name` (default: `boardgame`)
- `node_instance_types` (default: `["t3.medium"]`)
- `node_desired_size` (default: `2`)

