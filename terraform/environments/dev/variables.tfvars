# terraform/modules/podcast-converter/variables.tf
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "node_group_min_size" {
  description = "Minimum size of the node group"
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum size of the node group"
  type        = number
}

variable "node_group_desired_size" {
  description = "Desired size of the node group"
  type        = number
}
