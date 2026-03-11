# AWS Deployment (ECR + EKS + GitHub Actions)

This repo contains:

- `infra/eks-ecr`: Terraform to create ECR + EKS (and a VPC)
- `board`: Java/Spring Boot app (Maven) + Dockerfile + Kubernetes manifest
- `.github/workflows`: 3-stage GitHub Actions pipeline

## Stage 1: Create ECR + EKS (Terraform)

Run workflow: `Stage 1 - Terraform (ECR + EKS)` (manual `workflow_dispatch`).

## Stage 2: CI (Build + Sonar + Docker + Trivy + Push to ECR)

Runs on `push` to `main` and PRs.

Output image tags:

- `${GITHUB_SHA}` (always)
- `latest` (only on `main`)

## Stage 3: CD (Deploy to EKS)

Runs automatically after Stage 2 succeeds (on `main`), or can be triggered manually.

Deploys `board/k8s/deployment-service.yaml` after replacing `IMAGE_PLACEHOLDER`.

## GitHub Actions configuration

Create these Repository Variables:

- `AWS_REGION` (example: `ap-south-2`)
- `RUNS_ON` (optional JSON) (examples: `"ubuntu-latest"` or `["self-hosted","devops-server"]`)
- `ECR_REPOSITORY` (example: `boardgame`)
- `EKS_CLUSTER_NAME` (example: `boardgame-eks`)

These values can also be set as Repository Secrets (same names) and the workflows will still work.

AWS authentication (choose one):

- Recommended (OIDC): Repository Secret `AWS_ROLE_TO_ASSUME`
- Alternative (access keys): Repository Secrets `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`
- Self-hosted EC2 option: attach an IAM Role (instance profile) to the runner EC2 and leave AWS secrets empty

SonarQube (optional):

- Repository Secret `SONAR_HOST_URL` (example: `http://x.x.x.x:9000`)
- Repository Secret `SONAR_TOKEN`
  - If you already created `SONAR_HOST_URI`, workflows accept that too.
