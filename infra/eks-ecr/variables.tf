variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-2"
}

variable "name" {
  type        = string
  description = "Project/name prefix"
  default     = "boardgame"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "kubernetes_version" {
  type        = string
  description = "EKS Kubernetes version"
  default     = "1.29"
}

variable "node_instance_types" {
  type        = list(string)
  description = "EKS managed node group instance types"
  default     = ["t3.medium"]
}

variable "node_min_size" {
  type        = number
  description = "Min nodes"
  default     = 1
}

variable "node_max_size" {
  type        = number
  description = "Max nodes"
  default     = 3
}

variable "node_desired_size" {
  type        = number
  description = "Desired nodes"
  default     = 2
}

variable "ecr_repository_name" {
  type        = string
  description = "ECR repository name"
  default     = "boardgame"
}

